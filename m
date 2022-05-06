Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0141251D9A4
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 15:53:55 +0200 (CEST)
Received: from localhost ([::1]:50042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmyP4-000255-3k
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 09:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmyKe-0005uN-Bu
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:49:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:60735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmyKa-0005qN-O4
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651844956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rc4WgCyHZXq4RAj+fNzYqnWUjsIWyN8ELMZ+4y8siXI=;
 b=dQ9lmaAJKo4K0uuQ8Wti6biBWa8pW7OWYy3B0p6Kfr4MbsMKVzGeYOliJA8kEkf+6KjerW
 5ubH6begG+H8yezc3N1SPUh1BO3hcMTt1M5eJqdS0Kp5uXxonQ3VqGwDlt8cUzrytaA4k5
 jwSiy5mqf4/KRsKM5NvXNPYPlDmbPIE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-wmFRNUfrPSqjy6t4KFSVAg-1; Fri, 06 May 2022 09:49:14 -0400
X-MC-Unique: wmFRNUfrPSqjy6t4KFSVAg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B5243810D30
 for <qemu-devel@nongnu.org>; Fri,  6 May 2022 13:49:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1BF7416157
 for <qemu-devel@nongnu.org>; Fri,  6 May 2022 13:49:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B5CD421E68BC; Fri,  6 May 2022 15:49:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] Clean up decorations and whitespace around header guards
Date: Fri,  6 May 2022 15:49:11 +0200
Message-Id: <20220506134911.2856099-5-armbru@redhat.com>
In-Reply-To: <20220506134911.2856099-1-armbru@redhat.com>
References: <20220506134911.2856099-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.74; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cleaned up with scripts/clean-header-guards.pl.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 bsd-user/arm/target.h                      | 2 +-
 bsd-user/x86_64/target.h                   | 2 +-
 chardev/chardev-internal.h                 | 3 ++-
 include/block/block_int-global-state.h     | 3 ++-
 include/exec/translator.h                  | 2 +-
 include/fpu/softfloat-helpers.h            | 2 +-
 include/hw/gpio/aspeed_gpio.h              | 2 +-
 include/hw/intc/rx_icu.h                   | 2 +-
 include/hw/misc/aspeed_hace.h              | 2 +-
 include/hw/misc/aspeed_lpc.h               | 2 +-
 include/hw/misc/aspeed_sbc.h               | 2 +-
 include/hw/net/allwinner-sun8i-emac.h      | 2 +-
 include/hw/rtc/m48t59.h                    | 2 +-
 include/hw/rtc/mc146818rtc.h               | 2 +-
 include/qemu/plugin-memory.h               | 2 +-
 include/qemu/selfmap.h                     | 2 +-
 include/user/syscall-trace.h               | 2 +-
 linux-user/hexagon/target_signal.h         | 2 +-
 target/avr/cpu.h                           | 2 +-
 target/hexagon/attribs.h                   | 2 +-
 target/xtensa/core-de233_fpu/core-matmap.h | 4 +---
 target/xtensa/core-dsp3400/core-matmap.h   | 4 +---
 22 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/bsd-user/arm/target.h b/bsd-user/arm/target.h
index 419c039b68..7c423ec575 100644
--- a/bsd-user/arm/target.h
+++ b/bsd-user/arm/target.h
@@ -17,5 +17,5 @@ static inline bool regpairs_aligned(void *cpu_env)
     return true;
 }
 
-#endif /* ! TARGET_H */
+#endif /* TARGET_H */
 
diff --git a/bsd-user/x86_64/target.h b/bsd-user/x86_64/target.h
index 8956631db1..0cf0e2a14a 100644
--- a/bsd-user/x86_64/target.h
+++ b/bsd-user/x86_64/target.h
@@ -17,5 +17,5 @@ static inline bool regpairs_aligned(void *cpu_env)
     return false;
 }
 
-#endif /* ! TARGET_H */
+#endif /* TARGET_H */
 
diff --git a/chardev/chardev-internal.h b/chardev/chardev-internal.h
index aba0240759..4e03af3147 100644
--- a/chardev/chardev-internal.h
+++ b/chardev/chardev-internal.h
@@ -21,6 +21,7 @@
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
+
 #ifndef CHARDEV_INTERNAL_H
 #define CHARDEV_INTERNAL_H
 
@@ -64,4 +65,4 @@ void mux_chr_send_all_event(Chardev *chr, QEMUChrEvent event);
 
 Object *get_chardevs_root(void);
 
-#endif /* CHAR_MUX_H */
+#endif /* CHARDEV_INTERNAL_H */
diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
index 8b2e95f5ff..b49f4eb35b 100644
--- a/include/block/block_int-global-state.h
+++ b/include/block/block_int-global-state.h
@@ -21,6 +21,7 @@
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
+
 #ifndef BLOCK_INT_GLOBAL_STATE_H
 #define BLOCK_INT_GLOBAL_STATE_H
 
@@ -326,4 +327,4 @@ static inline void assert_bdrv_graph_writable(BlockDriverState *bs)
     assert(qemu_in_main_thread());
 }
 
-#endif /* BLOCK_INT_GLOBAL_STATE */
+#endif /* BLOCK_INT_GLOBAL_STATE_H */
diff --git a/include/exec/translator.h b/include/exec/translator.h
index 31d3fa76ff..7db6845535 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -187,4 +187,4 @@ FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
 
 #undef GEN_TRANSLATOR_LD
 
-#endif  /* EXEC__TRANSLATOR_H */
+#endif /* EXEC__TRANSLATOR_H */
diff --git a/include/fpu/softfloat-helpers.h b/include/fpu/softfloat-helpers.h
index a98d759cd3..94cbe073ec 100644
--- a/include/fpu/softfloat-helpers.h
+++ b/include/fpu/softfloat-helpers.h
@@ -141,4 +141,4 @@ static inline bool get_default_nan_mode(float_status *status)
     return status->default_nan_mode;
 }
 
-#endif /* _SOFTFLOAT_HELPERS_H_ */
+#endif /* SOFTFLOAT_HELPERS_H */
diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
index 801846befb..6dee3cd438 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -93,4 +93,4 @@ struct AspeedGPIOState {
     } sets[ASPEED_GPIO_MAX_NR_SETS];
 };
 
-#endif /* _ASPEED_GPIO_H_ */
+#endif /* ASPEED_GPIO_H */
diff --git a/include/hw/intc/rx_icu.h b/include/hw/intc/rx_icu.h
index 7f5889b36f..b23504f3dd 100644
--- a/include/hw/intc/rx_icu.h
+++ b/include/hw/intc/rx_icu.h
@@ -73,4 +73,4 @@ struct RXICUState {
 #define TYPE_RX_ICU "rx-icu"
 OBJECT_DECLARE_SIMPLE_TYPE(RXICUState, RX_ICU)
 
-#endif /* RX_ICU_H */
+#endif /* HW_INTC_RX_ICU_H */
diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
index 4f9ce179bf..ecb1b67de8 100644
--- a/include/hw/misc/aspeed_hace.h
+++ b/include/hw/misc/aspeed_hace.h
@@ -47,4 +47,4 @@ struct AspeedHACEClass {
     uint32_t hash_mask;
 };
 
-#endif /* _ASPEED_HACE_H_ */
+#endif /* ASPEED_HACE_H */
diff --git a/include/hw/misc/aspeed_lpc.h b/include/hw/misc/aspeed_lpc.h
index df418cfcd3..fd228731d2 100644
--- a/include/hw/misc/aspeed_lpc.h
+++ b/include/hw/misc/aspeed_lpc.h
@@ -44,4 +44,4 @@ typedef struct AspeedLPCState {
     uint32_t hicr7;
 } AspeedLPCState;
 
-#endif /* _ASPEED_LPC_H_ */
+#endif /* ASPEED_LPC_H */
diff --git a/include/hw/misc/aspeed_sbc.h b/include/hw/misc/aspeed_sbc.h
index 651747e28f..67e43b53ec 100644
--- a/include/hw/misc/aspeed_sbc.h
+++ b/include/hw/misc/aspeed_sbc.h
@@ -29,4 +29,4 @@ struct AspeedSBCClass {
     SysBusDeviceClass parent_class;
 };
 
-#endif /* _ASPEED_SBC_H_ */
+#endif /* ASPEED_SBC_H */
diff --git a/include/hw/net/allwinner-sun8i-emac.h b/include/hw/net/allwinner-sun8i-emac.h
index 460a58f1ca..185895f4e1 100644
--- a/include/hw/net/allwinner-sun8i-emac.h
+++ b/include/hw/net/allwinner-sun8i-emac.h
@@ -101,4 +101,4 @@ struct AwSun8iEmacState {
 
 };
 
-#endif /* HW_NET_ALLWINNER_SUN8I_H */
+#endif /* HW_NET_ALLWINNER_SUN8I_EMAC_H */
diff --git a/include/hw/rtc/m48t59.h b/include/hw/rtc/m48t59.h
index d9b45eb161..c14937476c 100644
--- a/include/hw/rtc/m48t59.h
+++ b/include/hw/rtc/m48t59.h
@@ -47,4 +47,4 @@ struct NvramClass {
     void (*toggle_lock)(Nvram *obj, int lock);
 };
 
-#endif /* HW_M48T59_H */
+#endif /* HW_RTC_M48T59_H */
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index deef93f89a..33d85753c0 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -56,4 +56,4 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
 void rtc_set_memory(ISADevice *dev, int addr, int val);
 int rtc_get_memory(ISADevice *dev, int addr);
 
-#endif /* MC146818RTC_H */
+#endif /* HW_RTC_MC146818RTC_H */
diff --git a/include/qemu/plugin-memory.h b/include/qemu/plugin-memory.h
index 0f59226727..8ad13c110c 100644
--- a/include/qemu/plugin-memory.h
+++ b/include/qemu/plugin-memory.h
@@ -37,4 +37,4 @@ struct qemu_plugin_hwaddr {
 bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
                        bool is_store, struct qemu_plugin_hwaddr *data);
 
-#endif /* _PLUGIN_MEMORY_H_ */
+#endif /* PLUGIN_MEMORY_H */
diff --git a/include/qemu/selfmap.h b/include/qemu/selfmap.h
index 80cf920fba..3479a2a618 100644
--- a/include/qemu/selfmap.h
+++ b/include/qemu/selfmap.h
@@ -41,4 +41,4 @@ GSList *read_self_maps(void);
  */
 void free_self_maps(GSList *info);
 
-#endif /* _SELFMAP_H_ */
+#endif /* SELFMAP_H */
diff --git a/include/user/syscall-trace.h b/include/user/syscall-trace.h
index 614cfacfa5..b4e53d3870 100644
--- a/include/user/syscall-trace.h
+++ b/include/user/syscall-trace.h
@@ -39,4 +39,4 @@ static inline void record_syscall_return(void *cpu, int num, abi_long ret)
 }
 
 
-#endif /* _SYSCALL_TRACE_H_ */
+#endif /* SYSCALL_TRACE_H */
diff --git a/linux-user/hexagon/target_signal.h b/linux-user/hexagon/target_signal.h
index 193abac340..68fb71312e 100644
--- a/linux-user/hexagon/target_signal.h
+++ b/linux-user/hexagon/target_signal.h
@@ -22,4 +22,4 @@
 
 #define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
 
-#endif /* TARGET_SIGNAL_H */
+#endif /* HEXAGON_TARGET_SIGNAL_H */
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 55497f851d..d304f33301 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -247,4 +247,4 @@ bool avr_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #include "exec/cpu-all.h"
 
-#endif /* !defined (QEMU_AVR_CPU_H) */
+#endif /* QEMU_AVR_CPU_H */
diff --git a/target/hexagon/attribs.h b/target/hexagon/attribs.h
index 54576f4143..d51bb4f732 100644
--- a/target/hexagon/attribs.h
+++ b/target/hexagon/attribs.h
@@ -32,4 +32,4 @@ extern DECLARE_BITMAP(opcode_attribs[XX_LAST_OPCODE], A_ZZ_LASTATTRIB);
 #define GET_ATTRIB(opcode, attrib) \
     test_bit(attrib, opcode_attribs[opcode])
 
-#endif /* ATTRIBS_H */
+#endif /* HEXAGON_ATTRIBS_H */
diff --git a/target/xtensa/core-de233_fpu/core-matmap.h b/target/xtensa/core-de233_fpu/core-matmap.h
index cca51c7af1..e99e7d3123 100644
--- a/target/xtensa/core-de233_fpu/core-matmap.h
+++ b/target/xtensa/core-de233_fpu/core-matmap.h
@@ -43,11 +43,9 @@
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
 
-
 #ifndef XTENSA_CONFIG_CORE_MATMAP_H
 #define XTENSA_CONFIG_CORE_MATMAP_H
 
-
 /*----------------------------------------------------------------------
 			CACHE (MEMORY ACCESS) ATTRIBUTES
   ----------------------------------------------------------------------*/
@@ -713,5 +711,5 @@
 
 
 
-#endif /*XTENSA_CONFIG_CORE_MATMAP_H*/
+#endif /* XTENSA_CONFIG_CORE_MATMAP_H */
 
diff --git a/target/xtensa/core-dsp3400/core-matmap.h b/target/xtensa/core-dsp3400/core-matmap.h
index 8d1aa8336e..692012f9f4 100644
--- a/target/xtensa/core-dsp3400/core-matmap.h
+++ b/target/xtensa/core-dsp3400/core-matmap.h
@@ -43,11 +43,9 @@
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
 
-
 #ifndef XTENSA_CONFIG_CORE_MATMAP_H
 #define XTENSA_CONFIG_CORE_MATMAP_H
 
-
 /*----------------------------------------------------------------------
 			CACHE (MEMORY ACCESS) ATTRIBUTES
   ----------------------------------------------------------------------*/
@@ -308,5 +306,5 @@
 
 
 
-#endif /*XTENSA_CONFIG_CORE_MATMAP_H*/
+#endif /* XTENSA_CONFIG_CORE_MATMAP_H */
 
-- 
2.35.1


