Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BDE6D55D4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 03:22:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjVMm-0001ou-FJ; Mon, 03 Apr 2023 21:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pjVMe-0001oI-PY
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 21:21:37 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pjVLU-0004iR-Gi
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 21:21:36 -0400
Received: by mail-qt1-x82d.google.com with SMTP id ga7so30213690qtb.2
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 18:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680571215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iTKDDiUy80Ti37D9kZvE6ootyzIEn8USjIbLDE4phNw=;
 b=eh8g+XU5aLFsQptlhniwtqpN6TVwYpwT4+qINfXVgA6E590SArfJ4RH1kGTA4kDUg1
 11rrEnWW+aCE+3quTHI9zl/CdImP8aYVN766pa7AWVNCnMX0OGNhHMM9Msl5eJbIYZcd
 5aroeKv1u0A/n8KkMu3vtunH61sXFPCmj9Fp8wcvjkEc4rYkCqeVHOhPVyGNibpBx3pI
 5QVFNOtBCDjpV4mX5ulNgF38uA4msOI1Y764aXH3zCbnkxEAECfGUui2j2Kl0GsYg7p2
 sQQt4DmRNIuuCcUCtZkldT23lrsMy92SGZRV8vvbE2jhCJUqM/TkJN6wbuv66VittTRJ
 pdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iTKDDiUy80Ti37D9kZvE6ootyzIEn8USjIbLDE4phNw=;
 b=z+agQkBnzNph5zaj0Z7cpt6fkz14PkAinl7LMWe2Wx6C9yh8S9F4sfbd9IOum8VWXN
 bEYpoCq2gReqbed6vssnH7hsgPWBHwVSC/GsI5UapB7+eG2OTcQ7+C7aaVun4+Yq4hzZ
 QMjKCEN2mRqF3IYSPeLxGRxqvWengRcZSooILBuufmEa0DcaVb7Ojm1z6B+iR7P8brfR
 9dHFxCn9RBW34NodvZVpwK3g88TW/HR3MfWz2sewIt+Q1VETE/Q/h4Rgrcb6uZjeBzdI
 hplt4dbecuKg+0WTJGVjJgTu+fW0/WG6Ag4aIToguuCv7mvV+0EXH3CwqahPY0jWNLeR
 SVfw==
X-Gm-Message-State: AAQBX9fgz9iMpY/peaJsgFBLOookb5xy/6CBoHOviS0Dj3EHoMLe1Oak
 arJs9+mjBplJqsuKgb7hoSYniQNYQ0Dv+w==
X-Google-Smtp-Source: AKy350YmhLbn7mPGN/mLNlO5F1jU8yslI/oy7ECKa1+zD6qBNyHDIFOyyQL4LGEZLJeFqGGVunuuKg==
X-Received: by 2002:ac8:7d0d:0:b0:3e6:2e95:b90c with SMTP id
 g13-20020ac87d0d000000b003e62e95b90cmr1027534qtb.8.1680571215483; 
 Mon, 03 Apr 2023 18:20:15 -0700 (PDT)
Received: from debian.hsd1.ma.comcast.net ([2601:182:cc00:77b0::3e69])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a05620a248400b0074865a9cb34sm3229909qkn.28.2023.04.03.18.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:20:14 -0700 (PDT)
From: Dinah Baum <dinahbaum123@gmail.com>
To: qemu-devel@nongnu.org
Cc: Dinah Baum <dinahbaum123@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 1/3] qapi/machine-target: refactor machine-target
Date: Mon,  3 Apr 2023 21:19:54 -0400
Message-Id: <20230404011956.90375-2-dinahbaum123@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404011956.90375-1-dinahbaum123@gmail.com>
References: <20230404011956.90375-1-dinahbaum123@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=dinahbaum123@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Moved architecture agnostic data types to their own
file to avoid "attempt to use poisoned TARGET_*"
error that results when including qapi header
with commands that aren't defined for all architectures.
Required to implement enabling `query-cpu-model-expansion`
on all architectures

Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                     |  1 +
 qapi/machine-target-common.json | 79 +++++++++++++++++++++++++++++++++
 qapi/machine-target.json        | 73 +-----------------------------
 qapi/meson.build                |  1 +
 4 files changed, 82 insertions(+), 72 deletions(-)
 create mode 100644 qapi/machine-target-common.json

diff --git a/MAINTAINERS b/MAINTAINERS
index ef45b5e71e..fbc4d7be66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1751,6 +1751,7 @@ F: hw/core/numa.c
 F: hw/cpu/cluster.c
 F: qapi/machine.json
 F: qapi/machine-target.json
+F: qapi/machine-target-common.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
 F: include/hw/cpu/cluster.h
diff --git a/qapi/machine-target-common.json b/qapi/machine-target-common.json
new file mode 100644
index 0000000000..1e6da3177d
--- /dev/null
+++ b/qapi/machine-target-common.json
@@ -0,0 +1,79 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+
+##
+# = Common data types for machine target commands
+##
+
+##
+# @CpuModelInfo:
+#
+# Virtual CPU model.
+#
+# A CPU model consists of the name of a CPU definition, to which
+# delta changes are applied (e.g. features added/removed). Most magic values
+# that an architecture might require should be hidden behind the name.
+# However, if required, architectures can expose relevant properties.
+#
+# @name: the name of the CPU definition the model is based on
+# @props: a dictionary of QOM properties to be applied
+#
+# Since: 2.8
+##
+{ 'struct': 'CpuModelInfo',
+'data': { 'name': 'str',
+          '*props': 'any' } }
+
+##
+# @CpuModelExpansionType:
+#
+# An enumeration of CPU model expansion types.
+#
+# @static: Expand to a static CPU model, a combination of a static base
+#          model name and property delta changes. As the static base model will
+#          never change, the expanded CPU model will be the same, independent of
+#          QEMU version, machine type, machine options, and accelerator options.
+#          Therefore, the resulting model can be used by tooling without having
+#          to specify a compatibility machine - e.g. when displaying the "host"
+#          model. The @static CPU models are migration-safe.
+
+# @full: Expand all properties. The produced model is not guaranteed to be
+#        migration-safe, but allows tooling to get an insight and work with
+#        model details.
+#
+# Note: When a non-migration-safe CPU model is expanded in static mode, some
+#       features enabled by the CPU model may be omitted, because they can't be
+#       implemented by a static CPU model definition (e.g. cache info passthrough and
+#       PMU passthrough in x86). If you need an accurate representation of the
+#       features enabled by a non-migration-safe CPU model, use @full. If you need a
+#       static representation that will keep ABI compatibility even when changing QEMU
+#       version or machine-type, use @static (but keep in mind that some features may
+#       be omitted).
+#
+# Since: 2.8
+##
+{ 'enum': 'CpuModelExpansionType',
+  'data': [ 'static', 'full' ] }
+
+##
+# @CpuModelCompareResult:
+#
+# An enumeration of CPU model comparison results. The result is usually
+# calculated using e.g. CPU features or CPU generations.
+#
+# @incompatible: If model A is incompatible to model B, model A is not
+#                guaranteed to run where model B runs and the other way around.
+#
+# @identical: If model A is identical to model B, model A is guaranteed to run
+#             where model B runs and the other way around.
+#
+# @superset: If model A is a superset of model B, model B is guaranteed to run
+#            where model A runs. There are no guarantees about the other way.
+#
+# @subset: If model A is a subset of model B, model A is guaranteed to run
+#          where model B runs. There are no guarantees about the other way.
+#
+# Since: 2.8
+##
+{ 'enum': 'CpuModelCompareResult',
+  'data': [ 'incompatible', 'identical', 'superset', 'subset' ] }
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 2e267fa458..1cacfde88e 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -4,78 +4,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or later.
 # See the COPYING file in the top-level directory.
 
-##
-# @CpuModelInfo:
-#
-# Virtual CPU model.
-#
-# A CPU model consists of the name of a CPU definition, to which
-# delta changes are applied (e.g. features added/removed). Most magic values
-# that an architecture might require should be hidden behind the name.
-# However, if required, architectures can expose relevant properties.
-#
-# @name: the name of the CPU definition the model is based on
-# @props: a dictionary of QOM properties to be applied
-#
-# Since: 2.8
-##
-{ 'struct': 'CpuModelInfo',
-  'data': { 'name': 'str',
-            '*props': 'any' } }
-
-##
-# @CpuModelExpansionType:
-#
-# An enumeration of CPU model expansion types.
-#
-# @static: Expand to a static CPU model, a combination of a static base
-#          model name and property delta changes. As the static base model will
-#          never change, the expanded CPU model will be the same, independent of
-#          QEMU version, machine type, machine options, and accelerator options.
-#          Therefore, the resulting model can be used by tooling without having
-#          to specify a compatibility machine - e.g. when displaying the "host"
-#          model. The @static CPU models are migration-safe.
-
-# @full: Expand all properties. The produced model is not guaranteed to be
-#        migration-safe, but allows tooling to get an insight and work with
-#        model details.
-#
-# Note: When a non-migration-safe CPU model is expanded in static mode, some
-#       features enabled by the CPU model may be omitted, because they can't be
-#       implemented by a static CPU model definition (e.g. cache info passthrough and
-#       PMU passthrough in x86). If you need an accurate representation of the
-#       features enabled by a non-migration-safe CPU model, use @full. If you need a
-#       static representation that will keep ABI compatibility even when changing QEMU
-#       version or machine-type, use @static (but keep in mind that some features may
-#       be omitted).
-#
-# Since: 2.8
-##
-{ 'enum': 'CpuModelExpansionType',
-  'data': [ 'static', 'full' ] }
-
-##
-# @CpuModelCompareResult:
-#
-# An enumeration of CPU model comparison results. The result is usually
-# calculated using e.g. CPU features or CPU generations.
-#
-# @incompatible: If model A is incompatible to model B, model A is not
-#                guaranteed to run where model B runs and the other way around.
-#
-# @identical: If model A is identical to model B, model A is guaranteed to run
-#             where model B runs and the other way around.
-#
-# @superset: If model A is a superset of model B, model B is guaranteed to run
-#            where model A runs. There are no guarantees about the other way.
-#
-# @subset: If model A is a subset of model B, model A is guaranteed to run
-#          where model B runs. There are no guarantees about the other way.
-#
-# Since: 2.8
-##
-{ 'enum': 'CpuModelCompareResult',
-  'data': [ 'incompatible', 'identical', 'superset', 'subset' ] }
+{ 'include': 'machine-target-common.json' }
 
 ##
 # @CpuModelBaselineInfo:
diff --git a/qapi/meson.build b/qapi/meson.build
index 9fd480c4d8..48be47170f 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -38,6 +38,7 @@ qapi_all_modules = [
   'job',
   'machine',
   'machine-target',
+  'machine-target-common',
   'migration',
   'misc',
   'misc-target',
-- 
2.30.2


