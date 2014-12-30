#ifndef MANAGEMENT_H
#define MANAGEMENT_H

#include <vector>

#include <QObject>
#include <QQmlApplicationEngine>

#include "boid.h"
#include "kdtree.h"

using namespace std;

/**
 * @brief The management class brigdes the gap between the UI
 * and the main logic.
 */
class management : public QObject {

private:
    /**
     * @brief vector of boid pointers.
     *
     * This is used to iterate over all the boids and call their respective
     * boid::Update functions.
     */
    static vector<boid*> objList;
    /**
     * @brief Two-dimensional kd-tree that holds the boids.
     *
     * This is used for finding the n nearest neighbors efficiently so that
     * flocking, avoidance and collision detection can be realized in an
     * efficient manner
     */
    static kdtree *tree;
    /**
     * @brief Holds the height of the canvas object.
     */
    static double canvasHeight;
    /**
     * @brief Holds the width of the canvas object.
     */
    static double canvasWidth;
    /**
     * @brief Factor by which every boid movement is multiplied.
     */
    static double speed;
    static uint size;

    static void addBoid();
    static void removeBoid();

    void prepareTree();

    Q_OBJECT
public:

    explicit management(QQmlApplicationEngine *engine, QObject *canvas);

    Q_INVOKABLE void init(uint count, uint size);
    Q_INVOKABLE void run();
    Q_INVOKABLE void clear();
    Q_INVOKABLE void setCanvasHeight(double height);
    Q_INVOKABLE void setCanvasWidth(double width);
    Q_INVOKABLE void setSpeed(double speed);
};

#endif // MANAGEMENT_H
