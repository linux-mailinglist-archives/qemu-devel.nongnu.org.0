Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97229EC018
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Nov 2019 09:54:57 +0100 (CET)
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQShs-0003Gz-K6
	for lists+qemu-devel@lfdr.de; Fri, 01 Nov 2019 04:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56478)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iQSf0-00014i-Aa
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 04:52:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iQSeq-0008Rv-TR
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 04:51:51 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33723)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iQSeq-0008DB-LR
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 04:51:48 -0400
Received: by mail-wr1-x442.google.com with SMTP id s1so8974601wro.0
 for <qemu-devel@nongnu.org>; Fri, 01 Nov 2019 01:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Srj3F1h/sbNE+Gxum0JG3PdUJ/b0DNEd5OxA7XmhC8o=;
 b=axPUEFLy1NMrpbf3v5yKlm2fXjZMAeI/eJZY4CdQpOzDSeUXrN0DHmNFHUdMDNAb4R
 7Dp1zVe0dlARUlIzbChm+PTlIOjwOY/q16wSPj20+UoFXJ6H/8nor4dT6LKd/hFUQidU
 6/7l+B/1Yv0NNCn9/91MAZXlGtFIOM+JMHv2TZyeSv2WXmI0Xj0mmkZmx6VU1JH7DfKG
 ASMTNOGN6FvCqSUjEPWSFnLRQ3RLSazR4MlO4ISqP3FlJYG0mwxXxBptoIXNfuQl6G6b
 vGRSfFDqDOqiJWlXWG2gRtX+p6s88gTutqEYRp9n2eA4noLWYr0m0rtRzwUtVPgj8yDt
 WoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Srj3F1h/sbNE+Gxum0JG3PdUJ/b0DNEd5OxA7XmhC8o=;
 b=f8BRoJ2lbZGpX2WxU6njid4KjdMh2aSas6/2BYqyciQ/fFH9TrS8bGAZ0/dZMJarwi
 CmJfS6iLlv83rNfkonGmrCQ2XlOJQ3d26oNi6ouNvFrhDUHKDav3FxMQA9L5SwSL7RNy
 pzb3dvRGtGegfssw4zCxMFBx4BFfuGCHndn4NLI+e2g5MqhabM6vHAi4P7yPSqmB5Zkj
 hNvaJ2daLV21SkBmI0mS1wqzsce7Hn5V6cKKCZoEQWUvDPbnBG/yVUHV2yiixZ8yPA2X
 rZloe/vVrmdS8FHgRsbHXaBWXI7IGldJO4v7D6FwMEkrI/Pj22DZx7TqcEPExtHLLTkJ
 g9NA==
X-Gm-Message-State: APjAAAVsFGdq+tH0dyWy4fz2CT6MnDsKlfrTnUc7DgBuQCi6RWGxdATU
 7gDyHAAgzLRLMkZA5dpJ1vuYtrKsQ8M75/PJ
X-Google-Smtp-Source: APXvYqwAvN5NS48uP6OVcW53KUpKqmJu1XbN4lYjrD9UoR47INj6lV989d6d/ZcuN6jLL4AUNFmhAg==
X-Received: by 2002:adf:f945:: with SMTP id q5mr10228597wrr.33.1572598304475; 
 Fri, 01 Nov 2019 01:51:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d20sm8818922wra.4.2019.11.01.01.51.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 01:51:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/11] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
Date: Fri,  1 Nov 2019 08:51:30 +0000
Message-Id: <20191101085140.5205-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191101085140.5205-1-peter.maydell@linaro.org>
References: <20191101085140.5205-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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

From: Andrew Jones <drjones@redhat.com>

Add support for the query-cpu-model-expansion QMP command to Arm. We
do this selectively, only exposing CPU properties which represent
optional CPU features which the user may want to enable/disable.
Additionally we restrict the list of queryable cpu models to 'max',
'host', or the current type when KVM is in use. And, finally, we only
implement expansion type 'full', as Arm does not yet have a "base"
CPU type. More details and example queries are described in a new
document (docs/arm-cpu-features.rst).

Note, certainly more features may be added to the list of advertised
features, e.g. 'vfp' and 'neon'. The only requirement is that we can
detect invalid configurations and emit failures at QMP query time.
For 'vfp' and 'neon' this will require some refactoring to share a
validation function between the QMP query and the CPU realize
functions.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Beata Michalska <beata.michalska@linaro.org>
Message-id: 20191031142734.8590-2-drjones@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 qapi/machine-target.json  |   6 +-
 target/arm/monitor.c      | 146 ++++++++++++++++++++++++++++++++++++++
 docs/arm-cpu-features.rst | 137 +++++++++++++++++++++++++++++++++++
 3 files changed, 286 insertions(+), 3 deletions(-)
 create mode 100644 docs/arm-cpu-features.rst

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 55310a6aa22..04623224720 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -212,7 +212,7 @@
 ##
 { 'struct': 'CpuModelExpansionInfo',
   'data': { 'model': 'CpuModelInfo' },
-  'if': 'defined(TARGET_S390X) || defined(TARGET_I386)' }
+  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_ARM)' }
 
 ##
 # @query-cpu-model-expansion:
@@ -237,7 +237,7 @@
 #   query-cpu-model-expansion while using these is not advised.
 #
 # Some architectures may not support all expansion types. s390x supports
-# "full" and "static".
+# "full" and "static". Arm only supports "full".
 #
 # Returns: a CpuModelExpansionInfo. Returns an error if expanding CPU models is
 #          not supported, if the model cannot be expanded, if the model contains
@@ -251,7 +251,7 @@
   'data': { 'type': 'CpuModelExpansionType',
             'model': 'CpuModelInfo' },
   'returns': 'CpuModelExpansionInfo',
-  'if': 'defined(TARGET_S390X) || defined(TARGET_I386)' }
+  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_ARM)' }
 
 ##
 # @CpuDefinitionInfo:
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 6457c3c87f7..560970de7f5 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -21,8 +21,16 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/boards.h"
 #include "kvm_arm.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qapi-commands-machine-target.h"
 #include "qapi/qapi-commands-misc-target.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/qmp/qdict.h"
+#include "qom/qom-qobject.h"
 
 static GICCapability *gic_cap_new(int version)
 {
@@ -81,3 +89,141 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
 
     return head;
 }
+
+/*
+ * These are cpu model features we want to advertise. The order here
+ * matters as this is the order in which qmp_query_cpu_model_expansion
+ * will attempt to set them. If there are dependencies between features,
+ * then the order that considers those dependencies must be used.
+ */
+static const char *cpu_model_advertised_features[] = {
+    "aarch64", "pmu",
+    NULL
+};
+
+CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
+                                                     CpuModelInfo *model,
+                                                     Error **errp)
+{
+    CpuModelExpansionInfo *expansion_info;
+    const QDict *qdict_in = NULL;
+    QDict *qdict_out;
+    ObjectClass *oc;
+    Object *obj;
+    const char *name;
+    int i;
+
+    if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
+        error_setg(errp, "The requested expansion type is not supported");
+        return NULL;
+    }
+
+    if (!kvm_enabled() && !strcmp(model->name, "host")) {
+        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
+        return NULL;
+    }
+
+    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
+    if (!oc) {
+        error_setg(errp, "The CPU type '%s' is not a recognized ARM CPU type",
+                   model->name);
+        return NULL;
+    }
+
+    if (kvm_enabled()) {
+        const char *cpu_type = current_machine->cpu_type;
+        int len = strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
+        bool supported = false;
+
+        if (!strcmp(model->name, "host") || !strcmp(model->name, "max")) {
+            /* These are kvmarm's recommended cpu types */
+            supported = true;
+        } else if (strlen(model->name) == len &&
+                   !strncmp(model->name, cpu_type, len)) {
+            /* KVM is enabled and we're using this type, so it works. */
+            supported = true;
+        }
+        if (!supported) {
+            error_setg(errp, "We cannot guarantee the CPU type '%s' works "
+                             "with KVM on this host", model->name);
+            return NULL;
+        }
+    }
+
+    if (model->props) {
+        qdict_in = qobject_to(QDict, model->props);
+        if (!qdict_in) {
+            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict");
+            return NULL;
+        }
+    }
+
+    obj = object_new(object_class_get_name(oc));
+
+    if (qdict_in) {
+        Visitor *visitor;
+        Error *err = NULL;
+
+        visitor = qobject_input_visitor_new(model->props);
+        visit_start_struct(visitor, NULL, NULL, 0, &err);
+        if (err) {
+            visit_free(visitor);
+            object_unref(obj);
+            error_propagate(errp, err);
+            return NULL;
+        }
+
+        i = 0;
+        while ((name = cpu_model_advertised_features[i++]) != NULL) {
+            if (qdict_get(qdict_in, name)) {
+                object_property_set(obj, visitor, name, &err);
+                if (err) {
+                    break;
+                }
+            }
+        }
+
+        if (!err) {
+            visit_check_struct(visitor, &err);
+        }
+        visit_end_struct(visitor, NULL);
+        visit_free(visitor);
+        if (err) {
+            object_unref(obj);
+            error_propagate(errp, err);
+            return NULL;
+        }
+    }
+
+    expansion_info = g_new0(CpuModelExpansionInfo, 1);
+    expansion_info->model = g_malloc0(sizeof(*expansion_info->model));
+    expansion_info->model->name = g_strdup(model->name);
+
+    qdict_out = qdict_new();
+
+    i = 0;
+    while ((name = cpu_model_advertised_features[i++]) != NULL) {
+        ObjectProperty *prop = object_property_find(obj, name, NULL);
+        if (prop) {
+            Error *err = NULL;
+            QObject *value;
+
+            assert(prop->get);
+            value = object_property_get_qobject(obj, name, &err);
+            assert(!err);
+
+            qdict_put_obj(qdict_out, name, value);
+        }
+    }
+
+    if (!qdict_size(qdict_out)) {
+        qobject_unref(qdict_out);
+    } else {
+        expansion_info->model->props = QOBJECT(qdict_out);
+        expansion_info->model->has_props = true;
+    }
+
+    object_unref(obj);
+
+    return expansion_info;
+}
diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
new file mode 100644
index 00000000000..c79dcffb555
--- /dev/null
+++ b/docs/arm-cpu-features.rst
@@ -0,0 +1,137 @@
+================
+ARM CPU Features
+================
+
+Examples of probing and using ARM CPU features
+
+Introduction
+============
+
+CPU features are optional features that a CPU of supporting type may
+choose to implement or not.  In QEMU, optional CPU features have
+corresponding boolean CPU proprieties that, when enabled, indicate
+that the feature is implemented, and, conversely, when disabled,
+indicate that it is not implemented. An example of an ARM CPU feature
+is the Performance Monitoring Unit (PMU).  CPU types such as the
+Cortex-A15 and the Cortex-A57, which respectively implement ARM
+architecture reference manuals ARMv7-A and ARMv8-A, may both optionally
+implement PMUs.  For example, if a user wants to use a Cortex-A15 without
+a PMU, then the `-cpu` parameter should contain `pmu=off` on the QEMU
+command line, i.e. `-cpu cortex-a15,pmu=off`.
+
+As not all CPU types support all optional CPU features, then whether or
+not a CPU property exists depends on the CPU type.  For example, CPUs
+that implement the ARMv8-A architecture reference manual may optionally
+support the AArch32 CPU feature, which may be enabled by disabling the
+`aarch64` CPU property.  A CPU type such as the Cortex-A15, which does
+not implement ARMv8-A, will not have the `aarch64` CPU property.
+
+QEMU's support may be limited for some CPU features, only partially
+supporting the feature or only supporting the feature under certain
+configurations.  For example, the `aarch64` CPU feature, which, when
+disabled, enables the optional AArch32 CPU feature, is only supported
+when using the KVM accelerator and when running on a host CPU type that
+supports the feature.
+
+CPU Feature Probing
+===================
+
+Determining which CPU features are available and functional for a given
+CPU type is possible with the `query-cpu-model-expansion` QMP command.
+Below are some examples where `scripts/qmp/qmp-shell` (see the top comment
+block in the script for usage) is used to issue the QMP commands.
+
+(1) Determine which CPU features are available for the `max` CPU type
+    (Note, we started QEMU with qemu-system-aarch64, so `max` is
+     implementing the ARMv8-A reference manual in this case)::
+
+      (QEMU) query-cpu-model-expansion type=full model={"name":"max"}
+      { "return": {
+        "model": { "name": "max", "props": {
+        "pmu": true, "aarch64": true
+      }}}}
+
+We see that the `max` CPU type has the `pmu` and `aarch64` CPU features.
+We also see that the CPU features are enabled, as they are all `true`.
+
+(2) Let's try to disable the PMU::
+
+      (QEMU) query-cpu-model-expansion type=full model={"name":"max","props":{"pmu":false}}
+      { "return": {
+        "model": { "name": "max", "props": {
+        "pmu": false, "aarch64": true
+      }}}}
+
+We see it worked, as `pmu` is now `false`.
+
+(3) Let's try to disable `aarch64`, which enables the AArch32 CPU feature::
+
+      (QEMU) query-cpu-model-expansion type=full model={"name":"max","props":{"aarch64":false}}
+      {"error": {
+       "class": "GenericError", "desc":
+       "'aarch64' feature cannot be disabled unless KVM is enabled and 32-bit EL1 is supported"
+      }}
+
+It looks like this feature is limited to a configuration we do not
+currently have.
+
+(4) Let's try probing CPU features for the Cortex-A15 CPU type::
+
+      (QEMU) query-cpu-model-expansion type=full model={"name":"cortex-a15"}
+      {"return": {"model": {"name": "cortex-a15", "props": {"pmu": true}}}}
+
+Only the `pmu` CPU feature is available.
+
+A note about CPU feature dependencies
+-------------------------------------
+
+It's possible for features to have dependencies on other features. I.e.
+it may be possible to change one feature at a time without error, but
+when attempting to change all features at once an error could occur
+depending on the order they are processed.  It's also possible changing
+all at once doesn't generate an error, because a feature's dependencies
+are satisfied with other features, but the same feature cannot be changed
+independently without error.  For these reasons callers should always
+attempt to make their desired changes all at once in order to ensure the
+collection is valid.
+
+A note about CPU models and KVM
+-------------------------------
+
+Named CPU models generally do not work with KVM.  There are a few cases
+that do work, e.g. using the named CPU model `cortex-a57` with KVM on a
+seattle host, but mostly if KVM is enabled the `host` CPU type must be
+used.  This means the guest is provided all the same CPU features as the
+host CPU type has.  And, for this reason, the `host` CPU type should
+enable all CPU features that the host has by default.  Indeed it's even
+a bit strange to allow disabling CPU features that the host has when using
+the `host` CPU type, but in the absence of CPU models it's the best we can
+do if we want to launch guests without all the host's CPU features enabled.
+
+Enabling KVM also affects the `query-cpu-model-expansion` QMP command.  The
+affect is not only limited to specific features, as pointed out in example
+(3) of "CPU Feature Probing", but also to which CPU types may be expanded.
+When KVM is enabled, only the `max`, `host`, and current CPU type may be
+expanded.  This restriction is necessary as it's not possible to know all
+CPU types that may work with KVM, but it does impose a small risk of users
+experiencing unexpected errors.  For example on a seattle, as mentioned
+above, the `cortex-a57` CPU type is also valid when KVM is enabled.
+Therefore a user could use the `host` CPU type for the current type, but
+then attempt to query `cortex-a57`, however that query will fail with our
+restrictions.  This shouldn't be an issue though as management layers and
+users have been preferring the `host` CPU type for use with KVM for quite
+some time.  Additionally, if the KVM-enabled QEMU instance running on a
+seattle host is using the `cortex-a57` CPU type, then querying `cortex-a57`
+will work.
+
+Using CPU Features
+==================
+
+After determining which CPU features are available and supported for a
+given CPU type, then they may be selectively enabled or disabled on the
+QEMU command line with that CPU type::
+
+  $ qemu-system-aarch64 -M virt -cpu max,pmu=off
+
+The example above disables the PMU for the `max` CPU type.
+
-- 
2.20.1


