Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397EB4439B5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:28:48 +0100 (CET)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi3Cx-0001rK-BO
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mi36s-0006B3-VI; Tue, 02 Nov 2021 19:22:30 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:36219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mi36q-0006NM-OK; Tue, 02 Nov 2021 19:22:30 -0400
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M6YEz-1moNpu1SqP-006xdk; Wed, 03
 Nov 2021 00:22:15 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] hw/core/machine: Add the missing delimiter in
 cpu_slot_to_string()
Date: Wed,  3 Nov 2021 00:22:10 +0100
Message-Id: <20211102232212.2911638-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102232212.2911638-1-laurent@vivier.eu>
References: <20211102232212.2911638-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5FXlvVb3/zzi+MOmf9tLnjbW3xIQ5WTPKKqmY9fkazwz2S6RpOT
 UCFo6Z+ZX6kDBhepqp7k6U7O0sh13wVBXiQrWnhc2/tcBdIxw2PVR20xntNq74R5NZRGRRe
 /8H+IGXhSdnqOmtLSZrBuZmXPeFrvjLMctdThqeT8WG3j72xNWzsFQO59iy41/Vhyob9saC
 onu1sa8jeRqXJ9kMV9zHA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p7XltI9PD00=:2hN4eQqHqb7Bc6BspdnyRj
 92VsyesoYq+3WmKhR0KoODrHrsr9RL1UMIpZqVm59bHvXS1HAvQKt1QilyJCwKm6ONU/k3I0K
 gadUMfhv8cO0T2g0kQY/yMJ6xviLP1f4ecq5ktb90P0DhM8hMc7lp0GtnzdcE7lsDyXF4kgGN
 TpfsDbwX6DINiZbqAXvs5EmcmROobHKNVesq+/J7nxohPIU7az5GUE8MzMFjhm/wRfmxvb5tN
 WGw/1run8CEsZHlutk0giWKojm6fSm99UDgfF2DHmxl+Nv0Dk1fpPYwVAiAZsHu0SLU9Z1ENP
 +Q0pDknbLt0bMae4uDB62EfGc2ufpyee2HrBmoitYaiDWM13JfugOsM9MVWkYY5hpaXP/Ryxn
 VN36V+Ifu5q3G/r9jzOHT5DbiPrTEIsKqyhkRYTf5O+RSAYaIV6ZFSsXAU3B0P9rs5xaopmGl
 oPpfgndMgxXDaqB9S4bLCikiLRshNwnIKlzZAYEd0CqMUuSoJlUJ6Ou33K3nsXfNngwddYksQ
 3btz/AKseMtaWbd7day9Mz5EC9ctxNHi43958JForbJAsR2K2nujW4py8dLwsMpvhkHoysK8z
 RuYGemaeg5R+u2XCeljaqRpPo6ZKM5kiLn12ApM6++V+5u4zT03+5MkYBC2spKPoQEa7rTStD
 V9FM5fMhpVY+ar8/e0zJLGVl4VsFCBSs6pHzMjiUO+DKrxYrEsjxcAHfiZ2l1pATVYR0=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

The expected output string from cpu_slot_to_string() ought to be
like "socket-id: *, die-id: *, core-id: *, thread-id: *", so add
the missing ", " before "die-id". This affects the readability
of the error message.

Fixes: 176d2cda0d ("i386/cpu: Consolidate die-id validity in smp context")
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211008075040.18028-1-wangyanan55@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/core/machine.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index b8d95eec32d4..0a23ae310606 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1157,6 +1157,9 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
         g_string_append_printf(s, "socket-id: %"PRId64, cpu->props.socket_id);
     }
     if (cpu->props.has_die_id) {
+        if (s->len) {
+            g_string_append_printf(s, ", ");
+        }
         g_string_append_printf(s, "die-id: %"PRId64, cpu->props.die_id);
     }
     if (cpu->props.has_core_id) {
-- 
2.31.1


