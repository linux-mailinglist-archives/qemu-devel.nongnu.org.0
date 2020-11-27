Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB80C2C6BCC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:06:40 +0100 (CET)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kij4p-0006J3-LZ
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@metux.net>) id 1kiiUn-0007KV-EE
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:29:25 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:51291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@metux.net>) id 1kiiUl-00073i-Dc
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:29:25 -0500
Received: from orion.localdomain ([95.114.158.11]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MFL8J-1kxtpf2qtd-00FnTi; Fri, 27 Nov 2020 19:29:18 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: mst@redhat.com, ehabkost@redhat.com, crosa@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH 3/5] backends: gpio: dummy builtin backend
Date: Fri, 27 Nov 2020 19:29:15 +0100
Message-Id: <20201127182917.2387-3-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201127182917.2387-1-info@metux.net>
References: <20201127182917.2387-1-info@metux.net>
X-Provags-ID: V03:K1:IqH5M+EEtNsD5+wLkNcbaGHTddTKpYFrNlqKUcU+BzMqo1pGsmI
 kBvNdW7cLsKpyH4IejrSBKVAlqBrudKjZSoRTUf+CxpHfClcFWbhBS3qUj3d1pOUcAgU2Ao
 Ei+FVEKJKYS3mwSltZ7u+T9mCq6UYCyus5LJ/muttr6vQbwmCVoqJSaEPMljsJNBCm6/ZZG
 sWPmoIUhQtMNCWo4lXncw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kKrjzB1mbY4=:zPsb4KLaYhsc8Ll6FTO5tN
 oo2EdLro8AP3Jpm6evmKC/B/l3u/Wty2E3ZRnge+TfA00qSQdpKip3WdL4lb4YUA7QTvjH1+V
 9a1gqr1oBXVZw0zqqSb8VNJ1jydZDBQ3t4+/WDvXKgnwNKR6P4rEZ2uqKVehLHPd9ySxv5eHV
 AKDjgjD9IXqLxBSmubL/8sp/o9yYIVQChlze99heqmAANxkqwYWCOMLPDrtDr0scPE6UgUnnI
 vrkZsyWOcC3DeWkYvGrNF44aR2LJq0GELHSu2eBb/qjlLZtPpG8EuM9PaieC+jVaSzzvfngrk
 nK6SptSHQbnRSf7BazV9fd2rgRfWvh9ACgv7Wq72hSomiZsmzQoDzk8blZaq7wn0v5M70hV0f
 p098jLaVmQoUL+Dz33iJA1es9azkI7vWVJ/zLXZegI02ThVD9n+6Z/whkYSPq
Received-SPF: none client-ip=217.72.192.73; envelope-from=info@metux.net;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Nov 2020 14:04:07 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding a dummy GPIO backend driver. Essentially stores the states
in memory and gives some debug output. The current state can be
accessed as a string property.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 MAINTAINERS             |   1 +
 backends/Kconfig        |   5 ++
 backends/gpio-builtin.c | 137 ++++++++++++++++++++++++++++++++++++++++++++++++
 backends/meson.build    |   1 +
 include/sysemu/gpio.h   |   2 +
 5 files changed, 146 insertions(+)
 create mode 100644 backends/gpio-builtin.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bfa29a4560..d3873121e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2292,6 +2292,7 @@ GPIO Backend API
 M: Enrico Weigelt, metux IT consult <info@metux.net>
 S: Supported
 F: backends/gpio.c
+F: backends/gpio-builtin.c
 F: include/sysemu/gpio.h
 
 Memory API
diff --git a/backends/Kconfig b/backends/Kconfig
index 2f17189472..1c8a462b57 100644
--- a/backends/Kconfig
+++ b/backends/Kconfig
@@ -3,3 +3,8 @@ source tpm/Kconfig
 config BACKEND_GPIO
     bool "Enable GPIO backends"
     default y
+
+config BACKEND_GPIO_BUILTIN
+    bool "Dummy GPIO backend"
+    depends on BACKEND_GPIO
+    default y
diff --git a/backends/gpio-builtin.c b/backends/gpio-builtin.c
new file mode 100644
index 0000000000..ac89a88092
--- /dev/null
+++ b/backends/gpio-builtin.c
@@ -0,0 +1,137 @@
+/*
+ * QEMU GPIO Backend - builtin (dummy)
+ *
+ * Copyright 2020 Enrico Weigelt, metux IT consult <info@metux.net>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/gpio.h"
+#include "qemu/main-loop.h"
+#include "qemu/guest-random.h"
+#include "qom/object.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+
+#define MAX_GPIO                256
+
+#define WARN(...)               warn_report("gpio-builtin: " __VA_ARGS__)
+
+#define OP_HEAD(name) \
+    GpioBuiltin *gpio = GPIO_BUILTIN(obj); \
+    if (id >= gpio->num_gpio) { \
+        WARN("%s: gpio id %d out of range", name, id); \
+        return -ERANGE; \
+    }
+
+#define FLAG_DIRECTION_INPUT    1
+#define FLAG_LINE_ACTIVE        2
+
+OBJECT_DECLARE_SIMPLE_TYPE(GpioBuiltin, GPIO_BUILTIN)
+
+struct GpioBuiltin {
+    GpioBackend parent;
+    char *states;
+    int num_gpio;
+};
+
+static int gpio_builtin_request(GpioBackend *obj, int id)
+{
+    OP_HEAD("request");
+    return 0;
+}
+
+static int gpio_builtin_set_value(GpioBackend *obj, int id, int state)
+{
+    OP_HEAD("set");
+    if (state & QEMU_GPIO_LINE_ACTIVE) {
+        gpio->states[id] |= FLAG_LINE_ACTIVE;
+    } else {
+        gpio->states[id] &= ~FLAG_LINE_ACTIVE;
+    }
+    return 0;
+}
+
+static int gpio_builtin_direction_input(GpioBackend *obj, int id)
+{
+    OP_HEAD("direction-input");
+    gpio->states[id] |= FLAG_DIRECTION_INPUT;
+    return gpio_builtin_set_value(obj, id, 0);
+}
+
+static int gpio_builtin_direction_output(GpioBackend *obj, int id, int state)
+{
+    OP_HEAD("direction-output");
+    gpio->states[id] &= ~FLAG_DIRECTION_INPUT;
+    return gpio_builtin_set_value(obj, id, state);
+}
+
+static int gpio_builtin_get_direction(GpioBackend *obj, int id)
+{
+    OP_HEAD("get-direction");
+    return (gpio->states[id] & FLAG_DIRECTION_INPUT ?
+            QEMU_GPIO_DIRECTION_INPUT : QEMU_GPIO_DIRECTION_OUTPUT);
+}
+
+static int gpio_builtin_get_value(GpioBackend *obj, int id)
+{
+    OP_HEAD("get");
+    return (gpio->states[id] & FLAG_LINE_ACTIVE ?
+            QEMU_GPIO_LINE_ACTIVE : QEMU_GPIO_LINE_INACTIVE);
+}
+
+static void gpio_builtin_instance_init(Object *obj)
+{
+    GpioBuiltin *gpio = GPIO_BUILTIN(obj);
+
+    gpio->num_gpio = MAX_GPIO;
+    gpio->states = g_malloc(gpio->num_gpio + 1);
+    memset(gpio->states, 'i', gpio->num_gpio);
+    gpio->states[gpio->num_gpio] = 0;
+    gpio_backend_register(&gpio->parent);
+}
+
+static void gpio_builtin_instance_finalize(Object *obj)
+{
+    GpioBuiltin *gpio = GPIO_BUILTIN(obj);
+    gpio_backend_unregister(&gpio->parent);
+    g_free(gpio->states);
+}
+
+static int gpio_builtin_get_ngpio(GpioBackend *obj)
+{
+    GpioBuiltin *gpio = GPIO_BUILTIN(obj);
+    return gpio->num_gpio;
+}
+
+static void gpio_builtin_class_init(ObjectClass *klass, void *data)
+{
+    GpioBackendClass *gpio = GPIO_BACKEND_CLASS(klass);
+
+    gpio->name             = g_strdup("gpio-builtin");
+    gpio->get_value        = gpio_builtin_get_value;
+    gpio->set_value        = gpio_builtin_set_value;
+    gpio->get_direction    = gpio_builtin_get_direction;
+    gpio->direction_input  = gpio_builtin_direction_input;
+    gpio->direction_output = gpio_builtin_direction_output;
+    gpio->request          = gpio_builtin_request;
+    gpio->get_ngpio        = gpio_builtin_get_ngpio;
+}
+
+static const TypeInfo gpio_builtin_info = {
+    .name = TYPE_GPIO_BUILTIN,
+    .parent = TYPE_GPIO_BACKEND,
+    .instance_size = sizeof(GpioBuiltin),
+    .instance_init = gpio_builtin_instance_init,
+    .instance_finalize = gpio_builtin_instance_finalize,
+    .class_init = gpio_builtin_class_init,
+};
+
+static void register_types(void)
+{
+    type_register_static(&gpio_builtin_info);
+}
+
+type_init(register_types);
diff --git a/backends/meson.build b/backends/meson.build
index 332ad7379a..efba675fa7 100644
--- a/backends/meson.build
+++ b/backends/meson.build
@@ -16,5 +16,6 @@ softmmu_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('cryptodev-vhost.c')
 softmmu_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VHOST_CRYPTO'], if_true: files('cryptodev-vhost-user.c'))
 softmmu_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus-vmstate.c'), gio])
 softmmu_ss.add(when: 'CONFIG_BACKEND_GPIO', if_true: files('gpio.c'))
+softmmu_ss.add(when: 'CONFIG_BACKEND_GPIO_BUILTIN', if_true: files('gpio-builtin.c'))
 
 subdir('tpm')
diff --git a/include/sysemu/gpio.h b/include/sysemu/gpio.h
index 0cfd62b192..374630ee49 100644
--- a/include/sysemu/gpio.h
+++ b/include/sysemu/gpio.h
@@ -15,6 +15,8 @@
 #define TYPE_GPIO_BACKEND "gpio-backend"
 OBJECT_DECLARE_TYPE(GpioBackend, GpioBackendClass, GPIO_BACKEND)
 
+#define TYPE_GPIO_BUILTIN "gpio-builtin"
+
 /* dont change them - drivers rely on these values */
 #define QEMU_GPIO_DIRECTION_OUTPUT  0
 #define QEMU_GPIO_DIRECTION_INPUT   1
-- 
2.11.0


