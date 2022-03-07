Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F524CF1DA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 07:25:16 +0100 (CET)
Received: from localhost ([::1]:50002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR6nz-0002hp-1u
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 01:25:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nR6mX-0001zs-KP
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 01:23:45 -0500
Received: from [2607:f8b0:4864:20::102d] (port=39432
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nR6mS-0003G2-JA
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 01:23:42 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 mr24-20020a17090b239800b001bf0a375440so10332631pjb.4
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 22:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KzcFIyCkt6SMItdSi6Wn2JCngHpbUJjEOnlXLlgTh1c=;
 b=b6tO6PWSfYr+VsF54JBSCMp4jQly1fUrDSsppEcLep1RbAB9anaSy3QPcZK19WB508
 QGR9mApAA2rI8/T5kMAveA7fzv3GJE8VYzzzkdvcz1wSZCd/1VbjBQrFrSJno/aiOczr
 fLrooPXg6SO5ZIN3XIDk/JsQrDCle1DLcMlVbVxMogl+0aFz9d48i2GqiqqaX3MbeI7T
 EOygvFRp4hveTlwkYfTVcTpHxnDYalOw+vHO/CCzdpo+PfXnTldGO2cy/LsabpRojupT
 sEJYDp1mgUhustEGMDINEu55z/H3Ted8utbYkEazh/GJeQjUN9qgSUkJIau0HjvYTwZD
 K3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KzcFIyCkt6SMItdSi6Wn2JCngHpbUJjEOnlXLlgTh1c=;
 b=yKm+CoL4LMS8zUfBej2PVS1DMdCGY5XVj7aI0AAbAYdb+Jquq9yERZr10RvpNKMO9U
 pXOPlV+yHRrt/NgIKHxqqfY22HE5Cl4kwD6XYbucqkJYjbz1lFGMg9m2w+XZ0fd1bmdO
 xgfq5O20hfX+EhrcGMmqqSb9cmLqeDsUul/nHjjifl3JSgusSlUf7+yDsOD0sM9ZeACq
 zIsSqXNeGVAm7LOpZJGRavkFMClC15ihuhG4dJyrGYHzyh/VAXkkryLVFenX4V5f9BU2
 7SSYDRKQeX7IVFgH1nNAtfpc/ui/Ck5U8GbgytFnFrwws2RVX2IfLzHXahGm2quepFZT
 cw8Q==
X-Gm-Message-State: AOAM533zTlUI2Y3QH04OmvtAAczAD8tzn0xFXEMcAEXCMelzqpJtCtVJ
 2FW4+RnvklTWsIFbqHMWLpWUSQ==
X-Google-Smtp-Source: ABdhPJx7EsRgDEzEltoLft2dHOmmoVK1Hqa1OJeHqm5qIjco/PYcnvp99fDhl3cGyjIo72B/M1mhQA==
X-Received: by 2002:a17:902:ce08:b0:14f:85c1:773e with SMTP id
 k8-20020a170902ce0800b0014f85c1773emr10575912plg.99.1646634218472; 
 Sun, 06 Mar 2022 22:23:38 -0800 (PST)
Received: from always-x1.bytedance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a17090a450900b001b9b5ca299esm17424620pjg.54.2022.03.06.22.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 22:23:37 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: philippe.mathieu.daude@gmail.com,
	michael.roth@amd.com
Subject: [PATCH v2 RESEND] qga: Introduce disk smart
Date: Mon,  7 Mar 2022 14:20:41 +0800
Message-Id: <20220307062041.1376177-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, armbru@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After assigning a NVMe/SCSI controller to guest by VFIO, we lose
everything on the host side. A guest uses these devices exclusively,
we usually don't care the actions on these devices. But there is a
low probability that hitting physical hardware warning, we need a
chance to get the basic smart log info.

Introduce disk smart, and implement NVMe smart on linux.

CC: Keith Busch <kbusch@kernel.org>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 qga/commands-posix.c | 78 ++++++++++++++++++++++++++++++++++++++++++++
 qga/qapi-schema.json | 50 +++++++++++++++++++++++++++-
 2 files changed, 127 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 4ec83bbfbc..1fa089e9c8 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -27,6 +27,7 @@
 #include "qemu/base64.h"
 #include "qemu/cutils.h"
 #include "commands-common.h"
+#include "block/nvme.h"
 
 #ifdef HAVE_UTMPX
 #include <utmpx.h>
@@ -49,6 +50,7 @@ extern char **environ;
 #include <sys/socket.h>
 #include <net/if.h>
 #include <sys/statvfs.h>
+#include <linux/nvme_ioctl.h>
 
 #ifdef CONFIG_LIBUDEV
 #include <libudev.h>
@@ -1390,6 +1392,81 @@ static GuestDiskInfoList *get_disk_partitions(
     return ret;
 }
 
+static void get_disk_smart(GuestDiskInfo *disk)
+{
+    if (disk->has_address
+        && (disk->address->bus_type == GUEST_DISK_BUS_TYPE_NVME)) {
+        int fd;
+        GuestDiskSmart *smart;
+        NvmeSmartLog log = {0};
+        struct nvme_admin_cmd cmd = {
+            .opcode = NVME_ADM_CMD_GET_LOG_PAGE,
+            .nsid = NVME_NSID_BROADCAST,
+            .addr = (uint64_t)&log,
+            .data_len = sizeof(log),
+            .cdw10 = NVME_LOG_SMART_INFO | (1 << 15) /* RAE bit */
+                     | (((sizeof(log) >> 2) - 1) << 16)
+        };
+
+        fd = qemu_open_old(disk->name, O_RDONLY);
+        if (fd == -1) {
+            g_debug("Failed to open device: %s", disk->name);
+            return;
+        }
+        if (ioctl(fd, NVME_IOCTL_ADMIN_CMD, &cmd)) {
+            g_debug("Failed to get smart: %s", disk->name);
+            close(fd);
+            return;
+        }
+
+        smart = g_new0(GuestDiskSmart, 1);
+        smart->type = GUEST_DISK_BUS_TYPE_NVME;
+        smart->u.nvme.critical_warning = log.critical_warning;
+        /* unaligned 'temperature' field */
+        smart->u.nvme.temperature = lduw_le_p(&log.temperature);
+        smart->u.nvme.available_spare = log.available_spare;
+        smart->u.nvme.available_spare_threshold = log.available_spare_threshold;
+        smart->u.nvme.percentage_used = log.percentage_used;
+        smart->u.nvme.data_units_read_lo = le64_to_cpu(log.data_units_read[0]);
+        smart->u.nvme.data_units_read_hi = le64_to_cpu(log.data_units_read[1]);
+        smart->u.nvme.data_units_written_lo =
+            le64_to_cpu(log.data_units_written[0]);
+        smart->u.nvme.data_units_written_hi =
+            le64_to_cpu(log.data_units_written[1]);
+        smart->u.nvme.host_read_commands_lo =
+            le64_to_cpu(log.host_read_commands[0]);
+        smart->u.nvme.host_read_commands_hi =
+            le64_to_cpu(log.host_read_commands[1]);
+        smart->u.nvme.host_write_commands_lo =
+            le64_to_cpu(log.host_write_commands[0]);
+        smart->u.nvme.host_write_commands_hi =
+            le64_to_cpu(log.host_write_commands[1]);
+        smart->u.nvme.controller_busy_time_lo =
+            le64_to_cpu(log.controller_busy_time[0]);
+        smart->u.nvme.controller_busy_time_hi =
+            le64_to_cpu(log.controller_busy_time[1]);
+        smart->u.nvme.power_cycles_lo = le64_to_cpu(log.power_cycles[0]);
+        smart->u.nvme.power_cycles_hi = le64_to_cpu(log.power_cycles[1]);
+        smart->u.nvme.power_on_hours_lo = le64_to_cpu(log.power_on_hours[0]);
+        smart->u.nvme.power_on_hours_hi = le64_to_cpu(log.power_on_hours[1]);
+        smart->u.nvme.unsafe_shutdowns_lo =
+            le64_to_cpu(log.unsafe_shutdowns[0]);
+        smart->u.nvme.unsafe_shutdowns_hi =
+            le64_to_cpu(log.unsafe_shutdowns[1]);
+        smart->u.nvme.media_errors_lo = le64_to_cpu(log.media_errors[0]);
+        smart->u.nvme.media_errors_hi = le64_to_cpu(log.media_errors[1]);
+        smart->u.nvme.number_of_error_log_entries_lo =
+            le64_to_cpu(log.number_of_error_log_entries[0]);
+        smart->u.nvme.number_of_error_log_entries_hi =
+            le64_to_cpu(log.number_of_error_log_entries[1]);
+
+        disk->has_smart = true;
+        disk->smart = smart;
+
+        close(fd);
+    }
+}
+
 GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
 {
     GuestDiskInfoList *ret = NULL;
@@ -1463,6 +1540,7 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
         }
 
         get_disk_deps(disk_dir, disk);
+        get_disk_smart(disk);
         ret = get_disk_partitions(ret, de->d_name, disk_dir, dev_name);
     }
 
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 8f73770210..8bb8731ce4 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -888,6 +888,53 @@
            '*serial': 'str', '*dev': 'str',
            '*ccw-address': 'GuestCCWAddress'} }
 
+##
+# @GuestNVMeSmart:
+#
+# NVMe smart informations, base on NVMe specification
+#
+# Since: 7.0
+##
+{ 'struct': 'GuestNVMeSmart',
+  'data': {'critical-warning': 'int',
+           'temperature': 'int',
+           'available-spare': 'int',
+           'available-spare-threshold': 'int',
+           'percentage-used': 'int',
+           'data-units-read-lo': 'uint64',
+           'data-units-read-hi': 'uint64',
+           'data-units-written-lo': 'uint64',
+           'data-units-written-hi': 'uint64',
+           'host-read-commands-lo': 'uint64',
+           'host-read-commands-hi': 'uint64',
+           'host-write-commands-lo': 'uint64',
+           'host-write-commands-hi': 'uint64',
+           'controller-busy-time-lo': 'uint64',
+           'controller-busy-time-hi': 'uint64',
+           'power-cycles-lo': 'uint64',
+           'power-cycles-hi': 'uint64',
+           'power-on-hours-lo': 'uint64',
+           'power-on-hours-hi': 'uint64',
+           'unsafe-shutdowns-lo': 'uint64',
+           'unsafe-shutdowns-hi': 'uint64',
+           'media-errors-lo': 'uint64',
+           'media-errors-hi': 'uint64',
+           'number-of-error-log-entries-lo': 'uint64',
+           'number-of-error-log-entries-hi': 'uint64' } }
+
+##
+# @GuestDiskSmart:
+#
+# Smart of disk
+# - @nvme: NVMe disk smart
+#
+# Since: 7.0
+##
+{ 'union': 'GuestDiskSmart',
+  'base': { 'type': 'GuestDiskBusType' },
+  'discriminator': 'type',
+  'data': { 'nvme': 'GuestNVMeSmart' } }
+
 ##
 # @GuestDiskInfo:
 #
@@ -904,7 +951,8 @@
 ##
 { 'struct': 'GuestDiskInfo',
   'data': {'name': 'str', 'partition': 'bool', '*dependencies': ['str'],
-           '*address': 'GuestDiskAddress', '*alias': 'str'} }
+           '*address': 'GuestDiskAddress', '*alias': 'str',
+           '*smart': 'GuestDiskSmart'} }
 
 ##
 # @guest-get-disks:
-- 
2.20.1


