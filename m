Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAB2A8377
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 15:17:16 +0200 (CEST)
Received: from localhost ([::1]:57698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5V9v-0006g4-5d
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 09:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53743)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1i5Uph-0006ct-Ey
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 08:56:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1i5Upf-0005dW-Dp
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 08:56:21 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:45970)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1i5UpZ-0005YT-Jo; Wed, 04 Sep 2019 08:56:13 -0400
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 2E23E96F6C;
 Wed,  4 Sep 2019 12:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1567601772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TALlTq4Hby/4+HqsOnAnIF2pH1v+JAWkyFTp6VC39dg=;
 b=d4spiVFj1KLJEYgRvsIfZ1umh6Kj7GAp8cvyhBp89GHqgUGBBdr67C2gG1ivh7PNdAZXrq
 I+JzHZ5IiWDiTFhMM6N6Q3VXes67gzFE0hw/bAtmsh2PakUiop+v6exiJxalP9dcydIkNI
 Jf4nbf+m53GdK2+YfMww2tINOntnySc=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 14:55:28 +0200
Message-Id: <20190904125531.27545-7-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904125531.27545-1-damien.hedde@greensocs.com>
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1567601772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TALlTq4Hby/4+HqsOnAnIF2pH1v+JAWkyFTp6VC39dg=;
 b=QXjrESdfthLnDxB/VuzDG6ySS9kha/x+DxhXn38eY8allh9Th4SfrwWiChGyma9y3QFHRl
 2o90e10YgC2FfIdempM2f1oyZhkn1ICOAecqP3S0C3vnGOg05d5IlXZ/f2ojp+PDELUY/P
 V4jBPtHRZzh2NKt4T7SoVTzQB2EgihM=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1567601772; a=rsa-sha256; cv=none;
 b=LMdpQZN1yvRWUyDImbm04VIcDFepl3oCGRHUQ0qEpBw/GWtq2sGnL1rTSOQOGlQfJ8eVRK
 0pmWC2mH3OGYukY195pgye4l3mOI+9V6ewV9zbBcMqd44g39u+jO6PYCLLbP3W/xsszzlm
 cZFjZPCDb1iVNG1nJQwr2UGsgNIl78c=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-devel] [PATCH v6 6/9] docs/clocks: add device's clock
 documentation
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
 berrange@redhat.com, ehabkost@redhat.com, alistair@alistair23.me,
 mark.burton@greensocs.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, edgar.iglesias@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the documentation about the clock inputs and outputs in devices.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 docs/devel/clock.txt | 246 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 246 insertions(+)
 create mode 100644 docs/devel/clock.txt

diff --git a/docs/devel/clock.txt b/docs/devel/clock.txt
new file mode 100644
index 0000000000..18f79922d0
--- /dev/null
+++ b/docs/devel/clock.txt
@@ -0,0 +1,246 @@
+
+What are clocks
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Clocks are objects representing input and output clocks of objects. They=
 are
+QOM objects developed for the purpose of modeling the distribution of cl=
ocks in
+QEMU.
+
+This allows us to model the clock distribution of a platform and detect
+configuration errors in the clock tree such as badly configured PLL, clo=
ck
+source selection or disabled clock.
+
+The objects are ClockIn for the input and ClockOut for the output. The Q=
OM
+names are respectively CLOCK_IN and CLOCK_OUT.
+
+CLOCK_IN and CLOCK_OUT are typically child of some device and created in=
 a
+similar way as gpios. ClockIn and ClockOut of different devices can be
+connected together. It is possible to create a clock which is not relate=
d
+to a device; for example to model a clock source of a machine.
+
+Here is an example of devices with clocks:
+
+                             +-------------------+     +----------------=
----+
+                             |      Device B     |     |      Device C  =
    |
+  +--------------------+     |           +-----+ |     | +-----+        =
    |
+  |      Device A      |     |           |Clock|>>----->>|Clock|        =
    |
+  |            +-----+ |     | +-----+   |Out 3| |     | |In  5|        =
    |
+  |            |Clock|>>--+-->>|Clock|   +-----+ |     | +-----+        =
    |
+  |            |Out 1| |  |  | |In 2 |   +-----+ |     | +-----+        =
    |
+  |            +-----+ |  |  | +-----+   |Clock|>>----->>|Clock|        =
    |
+  +--------------------+  |  |           |Out 4| |     | |In  6|        =
    |
+                          |  |           +-----+ |     | +-----+        =
    |
+                          |  +-------------------+     +----------------=
----+
+                          |
+                          |  +--------------------+
+                          |  |      Device D      |
+                          |  | +-----+            |
+                          +-->>|Clock|            |
+                             | |In  7|            |
+                             | +-----+            |
+                             +--------------------+
+
+Clocks are defined in include/hw/clock.h header and device related funct=
ions
+are defined in hw/qdev-clock.h header.
+
+The clock state
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The state of a clock is its frequency; it is stored as an integer repres=
enting
+it in Hertz. The special value of 0 is used to represent the clock being
+inactive or gated. The clocks do not model the signal itself (pin toggli=
ng)
+or other properties such as the duty cycle.
+
+Only the CLOCK_IN object keeps the value of a clock; this allows a devic=
e to
+fetch the current input frequency at any time. When an output is updated=
, the
+value is immediately propagated to all connected CLOCK_IN.
+
+Adding clocks to a device
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+Adding clocks to a device must be done during the init method of the Dev=
ice
+instance.
+
+To add an input clock to a device, the function qdev_init_clock_in must =
be used.
+It takes the name, a callback, and an opaque parameter for the clock.
+Output is more simple, only the name is required. Typically:
+qdev_init_clock_in(DEVICE(dev), "clk_in", clk_in_callback, dev);
+qdev_init_clock_out(DEVICE(dev), "clk_out");
+
+Both functions return the created ClockIn/ClockOut pointer, which should=
 be saved
+in the device's state structure for further use.
+
+These objects will be automatically deleted by the QOM reference mechani=
sm.
+
+Note that it is possible to create a static array describing clock input=
s and
+outputs. The function qdev_init_clocks() must be called with the array a=
s
+parameter to initialize the clocks: it has the same behaviour as calling=
 the
+qdev_init_clock_in/out() for each clock in the array. To ease the array
+construction, some macros are defined in include/hw/qdev-clock.h.
+As an example, the following creates 2 clocks to a device: 1 input and 1
+output.
+
+/* device structure containing pointer to the clock objects */
+typedef struct MyDeviceState {
+    DeviceState parent_obj;
+    ClockIn *clk_in;
+    ClockOut *clk_out;
+} MyDeviceState;
+
+/*
+ * callback for the input clock (see "Callback on input clock change" se=
ction
+ * below for more information).
+ */
+static void clk_in_callback(void *opaque);
+
+/*
+ * static array describing clocks:
+ * + a clock input named "clk_in", whose pointer is stored in clk_in
+ *   field of a MyDeviceState structure with callback clk_in_callback.
+ * + a clock output named "clk_out" whose pointer is stored in clk_out
+ *   field of a MyDeviceState structure.
+ */
+static const ClockPortInitArray mydev_clocks =3D {
+    QDEV_CLOCK_IN(MyDeviceState, clk_in, clk_in_callback),
+    QDEV_CLOCK_OUT(MyDeviceState, clk_out),
+    QDEV_CLOCK_END
+};
+
+/* device initialization function */
+static void mydev_init(Object *obj)
+{
+    /* cast to MyDeviceState */
+    MyDeviceState *mydev =3D MYDEVICE(obj);
+    /* create and fill the pointer fields in the MyDeviceState */
+    qdev_init_clocks(mydev, mydev_clocks);
+    [...]
+}
+
+Connecting two clocks together
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+
+Let's say we have 2 devices A and B. A has an output clock named "clk_ou=
t" and
+B has an input clock named "clk_in".
+
+The clocks are connected together using the function qdev_connect_clock:
+qdev_connect_clock(B, "clk_in", A, "clk_out", &error_abort);
+The device which has the input must be the first argument.
+
+It is possible to connect several input clocks to the same output. Every
+input callback will be called when the output changes.
+
+It is not possible to disconnect a clock or to change the clock connecti=
on
+after it is done.
+
+Unconnected input clocks
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+A newly created input clock has a stored frequency value of 0. It means =
the
+clock will be considered as disabled until one sets a new frequency to t=
he
+output clock it is connected to. If the clock remains unconnected it wil=
l
+always keep its initial value of 0.
+If this is not the wanted behaviour, clock_init_frequency should be call=
ed
+on the ClockIn object during device instance init.
+For example:
+clk =3D qdev_init_clock_in(DEVICE(dev), "clk-in", clk_in_callback, dev);
+clock_init_frequency(clk, 100 * 1000 * 1000); // default value is 100Mhz
+
+Using clock input frequency
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+A device can get the current frequency of an input using the
+clock_get_frequency(). It returns the last set frequency (or the init va=
lue).
+
+It is also possible to register a callback on input clock frequency chan=
ges.
+Here is an example:
+void clock_callback(void *opaque) {
+    MyDeviceState *s =3D (MyDeviceState *) opaque;
+    /*
+     * opaque may not be the device state pointer, but most probably it =
is.
+     * (It depends on what is given to the qdev_init_clock_in function)
+     */
+
+    /* do something with the new frequency */
+    fprintf(stdout, "device new frequency is %" PRIu64 "Hz\n",
+                    clock_get_frequency(dev->my_clk_input));
+}
+
+Changing a clock output
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+A device can change its outputs using the clock_set_frequency function. =
It
+will trigger updates on every connected inputs.
+
+For example, let's say that we have an output clock "clkout" and we have=
 a
+pointer to it in the device state because we did the following in init p=
hase:
+dev->clkout =3D qdev_init_clock_out(DEVICE(dev), "clkout");
+
+Then at any time (apart from the cases listed below), it is possible to
+change the clock value by doing:
+clock_set_frequency(dev->clkout, 1000 * 1000 * 1000); /* 1Ghz */
+This operation must be done while holding the qemu io lock.
+
+One can change clocks only when it is allowed to have side effects on ot=
her
+objects. In consequence, it is forbidden:
++ during migration,
++ and in the init phase of reset.
+
+Forwarding clocks
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Sometimes, one needs to forward, or inherit, a clock from another device=
.
+Typically, when doing device composition, a device might expose a sub-de=
vice's
+clock without interfering with it.
+The function qdev_pass_clock() can be used to achieve this behaviour. No=
te, that
+it is possible to expose the clock under a different name. This works fo=
r both
+inputs or outputs.
+
+For example, if device B is a child of device A, device_a_instance_init =
may
+do something like this:
+void device_a_instance_init(Object *obj)
+{
+    AState *A =3D DEVICE_A(obj);
+    BState *B;
+    /* create B object as child of A */
+    [...]
+    /* forward B's clock to A */
+    qdev_pass_clock(A, "b_clk", B, "clk");
+    /*
+     * Now A has a clock "b_clk" which forwards to
+     * the "clk" of its child B.
+     */
+}
+
+This function does not return any clock object. It is not possible to ad=
d
+a callback on a forwarded input clock: in the above example, only B can =
use
+the clock.
+
+Migration
+=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Only the ClockIn object has a state. ClockOut is not concerned by migrat=
ion.
+
+In case the frequency of in input clock is needed for a device's migrati=
on,
+this state must be migrated. The VMSTATE_CLOCKIN macro defines an entry =
to
+be added in a vmstate description.
+
+For example, if a device has a clock input and the device state looks li=
ke:
+MyDeviceState {
+    DeviceState parent_obj;
+    ClockIn *clk;
+};
+
+Then, to add the clock frequency to the device's migrated state, the vms=
tate
+description is:
+VMStateDescription my_device_vmstate =3D {
+    .name =3D "my_device",
+    .fields =3D (VMStateField[]) {
+        VMSTATE_CLOCKIN(clk, MyDeviceState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+When adding a input clock support to an existing device, you must care a=
bout
+migration compatibility. To this end, you can use the clock_init_frequen=
cy in
+a pre_load function to setup a default value in case the source vm does =
not
+migrate the frequency.
--=20
2.22.0


