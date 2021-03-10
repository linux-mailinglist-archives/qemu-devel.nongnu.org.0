Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81AD334A1F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 22:50:56 +0100 (CET)
Received: from localhost ([::1]:59996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6jH-0001Bd-QQ
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 16:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dr-000344-74; Wed, 10 Mar 2021 16:45:19 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:56341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6do-0004Jn-3m; Wed, 10 Mar 2021 16:45:18 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M1IRY-1lIRwt35je-002log; Wed, 10 Mar 2021 22:45:10 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/22] Various spelling fixes
Date: Wed, 10 Mar 2021 22:44:43 +0100
Message-Id: <20210310214504.1183162-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:arrOCt4FoApu72GQ/IP+zBdhMl76OX6myfWEP3/YPQjk38XEBm1
 Cb3QirKe8lNZwdzN/w+gMTTcEyi4S1ioj/5FY+bCP4wspdP2hshrJayhRAjImGjkTE3t0xj
 08w4r/klD1idKPBI5ypCwlMwo2ZDPC//kokW+5+2dFG5+4GXHCps/45fAN37daIq7gmGKm+
 cHZjKMrRXiR/Y0wfq2dvw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nZ232gMtGsY=:3/tR98DwHwiHYGTvyW5Iv6
 QAReHkmzUfJYrbpn99EvoDxvRqynCxroJb2MgV0Z4D1Gm8FDEgSEnWB8TT/mZHcegCXLiKUWX
 0GHwEOhXwBdGCLxesx6scDv4b0ZLK1A88EMlyfjgpj97AJzpqrZhgVyKDn+3eG6fYMfRxCYKr
 9EAHK/N7TEBcfDm5gOb4e/MUMVlhZhwridt8NCu9VKScjJ9VH4F4EElIDO+7UYHTx5iuxcsEg
 QFLGzZOC23a/RNGkLAwLlfKhU6xTvXCKkIyr9qYXOzGC3WdGcaS/USXeKs+/SSyJSGZnsUju2
 esGO+ZAISGe4vALXSHaBDV5Wqc+bhmdDA0S9a6hCKju13g0smpAdQy1AjkheTfijMedJJmgEC
 5SOMt9yIGkCpxXodnmwiedgZNKbaQgj7jzJdD3wyABF9Hq0qG1gZzLmm4bjJuS+tRnZ3zXKHa
 uw9puwt0fA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Tokarev <mjt@tls.msk.ru>

An assorted set of spelling fixes in various places.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210309111510.79495-1-mjt@msgid.tls.msk.ru>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 disas/nanomips.cpp            | 2 +-
 hw/misc/trace-events          | 2 +-
 hw/net/allwinner-sun8i-emac.c | 2 +-
 hw/ppc/pnv_bmc.c              | 2 +-
 hw/usb/ccid-card-emulated.c   | 2 +-
 hw/usb/hcd-ohci.c             | 2 +-
 hw/virtio/vhost.c             | 2 +-
 include/hw/s390x/css.h        | 2 +-
 qemu-options.hx               | 4 ++--
 target/i386/cpu.c             | 2 +-
 target/i386/machine.c         | 2 +-
 target/m68k/op_helper.c       | 2 +-
 target/riscv/cpu.c            | 2 +-
 13 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 90e63b836746..2b0965527194 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -837,7 +837,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
                                  * an ASE attribute and the requested version
                                  * not having that attribute
                                  */
-                                dis = "ASE attribute missmatch";
+                                dis = "ASE attribute mismatch";
                                 return -5;
                             }
                             disassembly_function dis_fn = table[i].disassembly;
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index d626b9d7a7c6..ef0a4de39d50 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -127,7 +127,7 @@ npcm7xx_pwm_update_freq(const char *id, uint8_t index, uint32_t old_value, uint3
 npcm7xx_pwm_update_duty(const char *id, uint8_t index, uint32_t old_value, uint32_t new_value) "%s pwm[%u] Update Duty: old_duty: %u, new_duty: %u"
 
 # stm32f4xx_syscfg.c
-stm32f4xx_syscfg_set_irq(int gpio, int line, int level) "Interupt: GPIO: %d, Line: %d; Level: %d"
+stm32f4xx_syscfg_set_irq(int gpio, int line, int level) "Interrupt: GPIO: %d, Line: %d; Level: %d"
 stm32f4xx_pulse_exti(int irq) "Pulse EXTI: %d"
 stm32f4xx_syscfg_read(uint64_t addr) "reg read: addr: 0x%" PRIx64 " "
 stm32f4xx_syscfg_write(uint64_t addr, uint64_t data) "reg write: addr: 0x%" PRIx64 " val: 0x%" PRIx64 ""
diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
index 042768922c97..bf91803d65a8 100644
--- a/hw/net/allwinner-sun8i-emac.c
+++ b/hw/net/allwinner-sun8i-emac.c
@@ -579,7 +579,7 @@ static uint64_t allwinner_sun8i_emac_read(void *opaque, hwaddr offset,
     case REG_INT_STA:           /* Interrupt Status */
         value = s->int_sta;
         break;
-    case REG_INT_EN:            /* Interupt Enable */
+    case REG_INT_EN:            /* Interrupt Enable */
         value = s->int_en;
         break;
     case REG_TX_CTL_0:          /* Transmit Control 0 */
diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
index b9bf5735ea0f..75a22ce50b11 100644
--- a/hw/ppc/pnv_bmc.c
+++ b/hw/ppc/pnv_bmc.c
@@ -233,7 +233,7 @@ static void hiomap_cmd(IPMIBmcSim *ibs, uint8_t *cmd, unsigned int cmd_len,
     case HIOMAP_C_RESET:
     case HIOMAP_C_LOCK:
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "HIOMAP: unknow command %02X\n", cmd[2]);
+        qemu_log_mask(LOG_GUEST_ERROR, "HIOMAP: unknown command %02X\n", cmd[2]);
         break;
     }
 }
diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index 2d566f7db104..5c76bed77aa0 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -301,7 +301,7 @@ static void *event_thread(void *arg)
             } else {
                 if (event->reader != card->reader) {
                     fprintf(stderr,
-                        "ERROR: wrong reader: quiting event_thread\n");
+                        "ERROR: wrong reader: quitting event_thread\n");
                     break;
                 }
             }
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index f8c64c8b95bb..1cf2816772c5 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1126,7 +1126,7 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
                 OHCI_SET_BM(td.flags, TD_EC, 3);
                 break;
             }
-            /* An error occured so we have to clear the interrupt counter. See
+            /* An error occurred so we have to clear the interrupt counter. See
              * spec at 6.4.4 on page 104 */
             ohci->done_count = 0;
         }
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 2a01662b0882..e2163a0d63ed 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -909,7 +909,7 @@ check_dev_state:
         r = 0;
     }
     if (r) {
-        /* An error is occured. */
+        /* An error occurred. */
         dev->log_enabled = false;
     }
 
diff --git a/include/hw/s390x/css.h b/include/hw/s390x/css.h
index 08c869ab0afc..7901ab276ce9 100644
--- a/include/hw/s390x/css.h
+++ b/include/hw/s390x/css.h
@@ -133,7 +133,7 @@ struct SubchDev {
     bool ccw_fmt_1;
     bool thinint_active;
     uint8_t ccw_no_data_cnt;
-    uint16_t migrated_schid; /* used for missmatch detection */
+    uint16_t migrated_schid; /* used for mismatch detection */
     CcwDataStream cds;
     /* transport-provided data: */
     int (*ccw_cb) (SubchDev *, CCW1);
diff --git a/qemu-options.hx b/qemu-options.hx
index 90801286c6e2..c324633fcaad 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -176,7 +176,7 @@ SRST
 
     ``thread=single|multi``
         Controls number of TCG threads. When the TCG is multi-threaded
-        there will be one thread per vCPU therefor taking advantage of
+        there will be one thread per vCPU therefore taking advantage of
         additional host cores. The default is to enable multi-threading
         where both the back-end and front-ends support it and no
         incompatible TCG features have been enabled (e.g.
@@ -2445,7 +2445,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                use 'vhostfd=h' to connect to an already opened vhost net device\n"
     "                use 'vhostfds=x:y:...:z to connect to multiple already opened vhost net devices\n"
     "                use 'queues=n' to specify the number of queues to be created for multiqueue TAP\n"
-    "                use 'poll-us=n' to speciy the maximum number of microseconds that could be\n"
+    "                use 'poll-us=n' to specify the maximum number of microseconds that could be\n"
     "                spent on busy polling for vhost net\n"
     "-netdev bridge,id=str[,br=bridge][,helper=helper]\n"
     "                configure a host TAP network backend with ID 'str' that is\n"
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 50008431c356..ae9fd9f31d68 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7081,7 +7081,7 @@ static void x86_cpu_get_crash_info_qom(Object *obj, Visitor *v,
     GuestPanicInformation *panic_info;
 
     if (!cs->crash_occurred) {
-        error_setg(errp, "No crash occured");
+        error_setg(errp, "No crash occurred");
         return;
     }
 
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 3768a753affb..3967dfc25763 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1173,7 +1173,7 @@ static int nested_state_post_load(void *opaque, int version_id)
         return -EINVAL;
     }
     if (nested_state->size > max_nested_state_len) {
-        error_report("Recieved unsupported nested state size: "
+        error_report("Received unsupported nested state size: "
                      "nested_state->size=%d, max=%d",
                      nested_state->size, max_nested_state_len);
         return -EINVAL;
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 202498deb51a..579a66373a86 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -117,7 +117,7 @@ static const char *m68k_exception_name(int index)
     case EXCP_FORMAT:
         return "Format Error";
     case EXCP_UNINITIALIZED:
-        return "Unitialized Interruot";
+        return "Uninitialized Interrupt";
     case EXCP_SPURIOUS:
         return "Spurious Interrupt";
     case EXCP_INT_LEVEL_1:
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddea8fbeeb39..2a990f6253e0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -506,7 +506,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                     return;
                 }
             } else {
-                qemu_log("vector verison is not specified, "
+                qemu_log("vector version is not specified, "
                         "use the default value v0.7.1\n");
             }
             set_vext_version(env, vext_version);
-- 
2.29.2


