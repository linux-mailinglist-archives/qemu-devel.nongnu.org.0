Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B0016C338
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 15:04:37 +0100 (CET)
Received: from localhost ([::1]:56948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6apA-0005jc-BK
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 09:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37559)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1j6a2w-0008I1-Qf
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:14:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1j6a2s-0002BT-SZ
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:14:46 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:57256)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1j6a2m-00022u-MM; Tue, 25 Feb 2020 08:14:37 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 611BC96F53;
 Tue, 25 Feb 2020 13:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1582636468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HBdezKQlElS6Poj9kARTllYO42WnV/QmAowvM6zuyh0=;
 b=f1EsQ/Sw1Q5k5Vz8r+0biIdVRmitHVZIN13xSaAluYwbGe0GmaQEaQRw74U6cGOdK3okIe
 vnWlSicumkwnZ7voqYWlcht24N7a8Om6YX487UEtcRShrT8Wikop4LSS6oJPspwKJm0gDM
 ltLYIIGeF+oORJlBIJRazZJTzJX2Als=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 5/9] docs/clocks: add device's clock documentation
Date: Tue, 25 Feb 2020 14:14:18 +0100
Message-Id: <20200225131422.53368-6-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200225131422.53368-1-damien.hedde@greensocs.com>
References: <20200225131422.53368-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1582636468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HBdezKQlElS6Poj9kARTllYO42WnV/QmAowvM6zuyh0=;
 b=xi2I88jl09uSfCl8QyHnxIDOqdR+bQos6d3zlpZLwX4w2um+VNJsdTHrxOVZmCZrqGqCnf
 oJrTQesf9zgp9U1XaIq93mbBQomNsK8HXxVpaQ2D7ZHQFXEr4bWAbt9zSWes/yLKywwtU9
 OfSFv/KDd/y8Okey3IbLQ2TeAi4MUnI=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1582636468; a=rsa-sha256; cv=none;
 b=TiJXcmxHuiayB9MB5BiiKo9+xLWeHstZWGAm2Yj2mLC78AjHxlUYGhOBZeAe8vMFxQkhk+
 N+4Keokc6UcEn6/yN34eLDEHbqGWgG3SAJrV8NDnbd1ZzZ8Delbz7Tb7I1alsBDty6PE23
 rE1KrfwPgRqmW6MBHK1BJsLejmaI+EU=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, ehabkost@redhat.com, pbonzini@redhat.com,
 alistair@alistair23.me, mark.burton@greensocs.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, edgar.iglesias@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the documentation about the clock inputs and outputs in devices.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

v8:
 + fix list indentation
 + reduce title size

v7:
 + update ClockIn/Out types
 + switch to rst format
---
 docs/devel/clocks.rst | 360 ++++++++++++++++++++++++++++++++++++++++++
 docs/devel/index.rst  |   1 +
 2 files changed, 361 insertions(+)
 create mode 100644 docs/devel/clocks.rst

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
new file mode 100644
index 0000000000..d3c0146bd2
--- /dev/null
+++ b/docs/devel/clocks.rst
@@ -0,0 +1,360 @@
+Modeling a clock tree in QEMU
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+
+What are clocks
+---------------
+
+Clocks are QOM objects developed for the purpose of modeling the
+distribution of clocks in QEMU.
+
+They allow us to model the clock distribution of a platform and detect
+configuration errors in the clock tree such as badly configured PLL, clo=
ck
+source selection or disabled clock.
+
+The object is *Clock* and its QOM name is ``CLOCK``.
+
+Clocks are typically used with devices where they are used to model inpu=
ts
+and outputs. They are created in a similar way as gpios. Inputs and outp=
uts
+of different devices can be connect together.
+
+In these cases a Clock object is a child of a Device object but this is =
not
+a requirement. Clocks can be independent of devices. For example it is p=
ossible
+to create a clock outside of any device to model the main clock source o=
f a
+machine.
+
+Here is an example of clocks::
+
+    +---------+      +----------------------+   +--------------+
+    | Clock 1 |      |       Device B       |   |   Device C   |
+    |         |      | +-------+  +-------+ |   | +-------+    |
+    |         |>>-+-->>|Clock 2|  |Clock 3|>>--->>|Clock 6|    |
+    +---------+   |  | | (in)  |  | (out) | |   | | (in)  |    |
+                  |  | +-------+  +-------+ |   | +-------+    |
+                  |  |            +-------+ |   +--------------+
+                  |  |            |Clock 4|>>
+                  |  |            | (out) | |   +--------------+
+                  |  |            +-------+ |   |   Device D   |
+                  |  |            +-------+ |   | +-------+    |
+                  |  |            |Clock 5|>>--->>|Clock 7|    |
+                  |  |            | (out) | |   | | (in)  |    |
+                  |  |            +-------+ |   | +-------+    |
+                  |  +----------------------+   |              |
+                  |                             | +-------+    |
+                  +----------------------------->>|Clock 8|    |
+                                                | | (in)  |    |
+                                                | +-------+    |
+                                                +--------------+
+
+Clocks are defined in include/hw/clock.h header and device related funct=
ions
+are defined in include/hw/qdev-clock.h header.
+
+The clock state
+---------------
+
+The state of a clock is its period; it is stored as an integer represent=
ing
+it in 2^-32ns unit. The special value of 0 is used to represent the cloc=
k being
+inactive or gated. The clocks do not model the signal itself (pin toggli=
ng)
+or other properties such as the duty cycle.
+
+All clocks contain this state: outputs as well as inputs. It allows to f=
etch
+the current period of a clock at any time. When a clock is updated, the
+value is immediately propagated to all connected clocks in the tree.
+
+To ease interaction with clocks. Helpers with a unit suffix are defined =
for
+every clock state setter or getter. They are:
+
+- ``_ns`` for handling periods in nanosecond,
+- ``_hz`` for handling frequencies in hertz.
+
+The 0 period value is converted to 0 in hertz and vice versa. 0 always m=
eans
+that the clock is disabled.
+
+Adding a new a clock
+--------------------
+
+Adding clocks to a device must be done during the init method of the Dev=
ice
+instance.
+
+To add an input clock to a device, the function qdev_init_clock_in must =
be used.
+It takes the name, a callback and an opaque parameter for the callback (=
this will
+be explained in a following section below).
+Output is more simple, only the name is required. Typically::
+
+    qdev_init_clock_in(DEVICE(dev), "clk_in", clk_in_callback, dev);
+    qdev_init_clock_out(DEVICE(dev), "clk_out");
+
+Both functions return the created Clock pointer, which should be saved i=
n the
+device's state structure for further use.
+
+These objects will be automatically deleted by the QOM reference mechani=
sm.
+
+Note that it is possible to create a static array describing clock input=
s and
+outputs. The function ``qdev_init_clocks()`` must be called with the arr=
ay as
+parameter to initialize the clocks: it has the same behaviour as calling=
 the
+``qdev_init_clock_in/out()`` for each clock in the array. To ease the ar=
ray
+construction, some macros are defined in include/hw/qdev-clock.h.
+As an example, the following creates 2 clocks to a device: one input and=
 one
+output.
+
+::
+
+    /* device structure containing pointer to the clock objects */
+    typedef struct MyDeviceState {
+        DeviceState parent_obj;
+        Clock *clk_in;
+        Clock *clk_out;
+    } MyDeviceState;
+
+    /*
+     * callback for the input clock (see "Callback on input clock
+     * change" section below for more information).
+     */
+    static void clk_in_callback(void *opaque);
+
+    /*
+     * static array describing clocks:
+     * + a clock input named "clk_in", whose pointer is stored in
+     *   clk_in field of a MyDeviceState structure with callback
+     *   clk_in_callback.
+     * + a clock output named "clk_out" whose pointer is stored in
+     *   clk_out field of a MyDeviceState structure.
+     */
+    static const ClockPortInitArray mydev_clocks =3D {
+        QDEV_CLOCK_IN(MyDeviceState, clk_in, clk_in_callback),
+        QDEV_CLOCK_OUT(MyDeviceState, clk_out),
+        QDEV_CLOCK_END
+    };
+
+    /* device initialization function */
+    static void mydev_init(Object *obj)
+    {
+        /* cast to MyDeviceState */
+        MyDeviceState *mydev =3D MYDEVICE(obj);
+        /* create and fill the pointer fields in the MyDeviceState */
+        qdev_init_clocks(mydev, mydev_clocks);
+        [...]
+    }
+
+An alternative way to create a clock is to simply call
+``object_new(TYPE_CLOCK)``. In that case the clock will neither be an in=
put nor
+an output of a device. After the whole QOM hieracrhy of the clock has be=
en set
+``clock_setup_canonical_path()`` should be called.
+
+At creation, the period of the clock is 0: the clock is disabled. You ca=
n
+change it using ``clock_set[_ns|_hz]()``.
+
+Note that if you are creating a clock with a fixed period which will nev=
er
+change (for example the main clock source of a board), then you'll have
+nothing else to do. This value will be propagated to other clocks when
+connecting the clocks together and devices will fetch the right value du=
ring
+the first reset.
+
+Retrieving clocks from a device
+-------------------------------
+
+``qdev_get_clock_in()`` and ``dev_get_clock_out()`` are available to get=
 the clock inputs or outputs of a device. For example::
+
+    Clock *clk =3D qdev_get_clock_in(DEVICE(mydev), "clk_in");
+
+or::
+
+    Clock *clk =3D qdev_get_clock_out(DEVICE(mydev), "clk_out");
+
+Connecting two clocks together
+------------------------------
+
+To connect two clocks together, use the ``clock_set_source()`` function.
+Given two clocks ``clk1``, and ``clk2``, ``clock_set_source(clk2, clk1);=
``
+configure ``clk2`` to follow the ``clk1`` period changes. Every time ``c=
lk1``
+is updated, ``clk2`` will be updated too.
+
+When connecting clock between devices, prefer using the
+``qdev_connect_clock_in()`` function set the source of an input device c=
lock.
+For example, to connect the input clock ``clk2`` of ``devB`` to the outp=
ut
+clock ``clk1`` of ``devA``, do::
+
+    qdev_connect_clock_in(devB, "clk2", qdev_get_clock_out(devA, "clk1")=
)
+
+We used ``qdev_get_clock_out()`` above, but any clock can drive an input=
 clock,
+even another input clock. The following diagram shows some
+examples of connections. Note also that a clock can drive several other =
clocks.
+
+::
+
+  +------------+  +--------------------------------------------------+
+  |  Device A  |  |                   Device B                       |
+  |            |  |               +---------------------+            |
+  |            |  |               |       Device C      |            |
+  |  +-------+ |  | +-------+     | +-------+ +-------+ |  +-------+ |
+  |  |Clock 1|>>-->>|Clock 2|>>+-->>|Clock 3| |Clock 5|>>>>|Clock 6|>>
+  |  | (out) | |  | | (in)  |  |  | | (in)  | | (out) | |  | (out) | |
+  |  +-------+ |  | +-------+  |  | +-------+ +-------+ |  +-------+ |
+  +------------+  |            |  +---------------------+            |
+                  |            |                                     |
+                  |            |  +--------------+                   |
+                  |            |  |   Device D   |                   |
+                  |            |  | +-------+    |                   |
+                  |            +-->>|Clock 4|    |                   |
+                  |               | | (in)  |    |                   |
+                  |               | +-------+    |                   |
+                  |               +--------------+                   |
+                  +--------------------------------------------------+
+
+In the above example, when *Clock 1* is updated by *Device A*, three clo=
cks gets the new clock period value: *Clock 2*, Clock 3* and *Clock 4*.
+
+It is not possible to disconnect a clock or to change the clock connecti=
on
+after it is done.
+
+Unconnected input clocks
+------------------------
+
+A newly created input clock is disabled (period of 0). It means the cloc=
k will
+be considered as disabled until the period is updated. If the clock rema=
ins
+unconnected it will always keep its initial value of 0. If this is not t=
he
+wanted behaviour, ``clock_set()``, ``clock_set_ns()`` or ``clock_set_hz(=
)``
+should be called on the Clock object during device instance init. For ex=
ample::
+
+    clk =3D qdev_init_clock_in(DEVICE(dev), "clk-in", clk_in_callback,
+                             dev);
+    /* set initial value to 10ns / 100MHz */
+    clock_set_ns(clk, 10);
+
+Fetching clock frequency/period
+-------------------------------
+
+To get the current state of a clock, the function ``clock_get()``,
+``clock_get_ns()`` or ``clock_get_hz()`` must be used.
+
+It is also possible to register a callback on clock frequency changes.
+Here is an example::
+
+    void clock_callback(void *opaque) {
+        MyDeviceState *s =3D (MyDeviceState *) opaque;
+        /*
+         * opaque may not be the device state pointer, but most
+         * probably it is. (It depends on what is given to the
+         * qdev_init_clock_in function)
+         */
+
+        /* do something with the new period */
+        fprintf(stdout, "device new period is %" PRIu64 "ns\n",
+                        clock_get_ns(dev->my_clk_input));
+    }
+
+Changing a clock period
+-----------------------
+
+A device can change its outputs using the ``clock_update()``,
+``clock_update_ns()`` or ``clock_update_hz()`` function. It will trigger
+updates on every connected input.
+
+For example, let's say that we have an output clock *clkout* and we have=
 a
+pointer to it in the device state because we did the following in init p=
hase::
+
+    dev->clkout =3D qdev_init_clock_out(DEVICE(dev), "clkout");
+
+Then at any time (apart from the cases listed below), it is possible to
+change the clock value by doing::
+
+    clock_update_hz(dev->clkout, 1000 * 1000 * 1000); /* 1Ghz */
+
+Because updating a clock may trigger any side effects through connected =
clocks
+and their callbacks, this operation must be done while holding the qemu =
io lock.
+
+For the same reason, one can updates clocks only when it is allowed to h=
ave
+side effects on other objects. In consequence, it is forbidden:
++ during migration,
++ and in the enter phase of reset.
+
+Note that calling ``clock_update[_ns|_hz]()`` is equivalent to call
+``clock_set[_ns|_hz]()`` (with the same arguments) then ``clock_propagat=
e()`` on
+the clock. Thus, setting the clock value can separated from triggering t=
he
+side-effects. This is often required to factorize code to handle reset a=
nd
+migration in devices.
+
+Aliasing clocks
+---------------
+
+Sometimes, one needs to forward, or inherit, a clock from another device=
.
+Typically, when doing device composition, a device might expose a sub-de=
vice's
+clock without interfering with it.
+The function ``qdev_alias_clock()`` can be used to achieve this behaviou=
r. Note
+that it is possible to expose the clock under a different name. This wor=
ks for
+both inputs and outputs.
+
+For example, if device B is a child of device A, ``device_a_instance_ini=
t()``
+may do something like this::
+
+    void device_a_instance_init(Object *obj)
+    {
+        AState *A =3D DEVICE_A(obj);
+        BState *B;
+        /* create B object as child of A */
+        [...]
+        qdev_alias_clock(B, "clk", A, "b_clk");
+        /*
+         * Now A has a clock "b_clk" which is an alias to
+         * the clock "clk" of its child B.
+         */
+    }
+
+This function does not return any clock object. The new clock has the sa=
me
+direction (input or output) as the original one. This function only adds=
 a link
+to the existing clock. In the above example, B object remains the only o=
bject
+allowed to use the clock and device A must not try to change the clock p=
eriod
+or set a callback to the clock. Here follows a diagram describing the ex=
ample
+with an input clock::
+
+    +--------------------------+
+    |        Device A          |
+    |         +--------------+ |
+    |         |   Device B   | |
+    |         | +-------+    | |
+    >>"b_clk">>>| "clk" |    | |
+    |  (in)   | |  (in) |    | |
+    |         | +-------+    | |
+    |         +--------------+ |
+    +--------------------------+
+
+Migration
+---------
+
+Clock state are not migrated automatically. Every device must handle its
+clock migration. Alias clocks must not be migrated.
+
+To ensure clock states are restored correctly during migration, there is=
 two
+solutions.
+
+Clocks states can be migrated by adding an entry into the device
+vmstate description. To this purpose, the ``VMSTATE_CLOCK`` macro define=
s
+such an entry and should be used. This is typically used to migrate an i=
nput
+clock state. The following example describes it::
+
+    MyDeviceState {
+        DeviceState parent_obj;
+        [...] /* some fields */
+        Clock *clk;
+    };
+
+    VMStateDescription my_device_vmstate =3D {
+        .name =3D "my_device",
+        .fields =3D (VMStateField[]) {
+            [...], /* other migrated fields */
+            VMSTATE_CLOCK(clk, MyDeviceState),
+            VMSTATE_END_OF_LIST()
+        }
+    };
+
+The second solution is to restore the clock state using information alre=
ady
+at our disposal. This can be used to restore output clocks states using =
the
+device state. The functions ``clock_set[_ns|_hz]()`` can be used during
+``post_load()`` migration callback.
+
+When adding a clock support to an existing device, if you care about mig=
ration
+compatibility. To this end, you can use ``clock_set()`` in a ``pre_load(=
)``
+function to setup a default value in case the source virtual machine doe=
s not
+send the clock state. You may also need to use a vmstate subsection.
+
+Care should be taken not to use ``clock_update[_ns|_hz]()`` or
+``clock_propagate()`` during the whole migration procedure because it wi=
ll
+trigger side effects to other devices in an unknown state.
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 4dc2ca8d71..f9c8c668ee 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -25,3 +25,4 @@ Contents:
    tcg-plugins
    bitops
    reset
+   clocks
--=20
2.25.1


