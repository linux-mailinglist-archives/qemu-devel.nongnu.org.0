Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94BA50B884
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:31:58 +0200 (CEST)
Received: from localhost ([::1]:35166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtO5-0000i3-D5
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nhtGq-0001Vw-4E
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:24:24 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nhtGl-0008V7-4p
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:24:23 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5320E74763D;
 Fri, 22 Apr 2022 15:24:16 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5B325746381; Fri, 22 Apr 2022 15:24:15 +0200 (CEST)
Message-Id: <b9bd112c673eaecaf9ec42bc8240efbb0bc1ac4b.1650633281.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1650633281.git.balaton@eik.bme.hu>
References: <cover.1650633281.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 1/3] hw/audio/ac97: Coding style fixes to avoid checkpatch
 errors
Date: Fri, 22 Apr 2022 15:14:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/audio/ac97.c | 727 ++++++++++++++++++++++++------------------------
 1 file changed, 357 insertions(+), 370 deletions(-)

diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index 3cb8131060..0b1d8ce9c6 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -87,39 +87,39 @@ enum {
 #define GC_CR    2              /* rw */
 #define GC_VALID_MASK ((1 << 6) - 1)
 
-#define GS_MD3   (1<<17)        /* rw */
-#define GS_AD3   (1<<16)        /* rw */
-#define GS_RCS   (1<<15)        /* rwc */
-#define GS_B3S12 (1<<14)        /* ro */
-#define GS_B2S12 (1<<13)        /* ro */
-#define GS_B1S12 (1<<12)        /* ro */
-#define GS_S1R1  (1<<11)        /* rwc */
-#define GS_S0R1  (1<<10)        /* rwc */
-#define GS_S1CR  (1<<9)         /* ro */
-#define GS_S0CR  (1<<8)         /* ro */
-#define GS_MINT  (1<<7)         /* ro */
-#define GS_POINT (1<<6)         /* ro */
-#define GS_PIINT (1<<5)         /* ro */
-#define GS_RSRVD ((1<<4)|(1<<3))
-#define GS_MOINT (1<<2)         /* ro */
-#define GS_MIINT (1<<1)         /* ro */
+#define GS_MD3   (1 << 17)        /* rw */
+#define GS_AD3   (1 << 16)        /* rw */
+#define GS_RCS   (1 << 15)        /* rwc */
+#define GS_B3S12 (1 << 14)        /* ro */
+#define GS_B2S12 (1 << 13)        /* ro */
+#define GS_B1S12 (1 << 12)        /* ro */
+#define GS_S1R1  (1 << 11)        /* rwc */
+#define GS_S0R1  (1 << 10)        /* rwc */
+#define GS_S1CR  (1 << 9)         /* ro */
+#define GS_S0CR  (1 << 8)         /* ro */
+#define GS_MINT  (1 << 7)         /* ro */
+#define GS_POINT (1 << 6)         /* ro */
+#define GS_PIINT (1 << 5)         /* ro */
+#define GS_RSRVD ((1 << 4) | (1 << 3))
+#define GS_MOINT (1 << 2)         /* ro */
+#define GS_MIINT (1 << 1)         /* ro */
 #define GS_GSCI  1              /* rwc */
-#define GS_RO_MASK (GS_B3S12|                   \
-                    GS_B2S12|                   \
-                    GS_B1S12|                   \
-                    GS_S1CR|                    \
-                    GS_S0CR|                    \
-                    GS_MINT|                    \
-                    GS_POINT|                   \
-                    GS_PIINT|                   \
-                    GS_RSRVD|                   \
-                    GS_MOINT|                   \
+#define GS_RO_MASK (GS_B3S12 | \
+                    GS_B2S12 | \
+                    GS_B1S12 | \
+                    GS_S1CR  | \
+                    GS_S0CR  | \
+                    GS_MINT  | \
+                    GS_POINT | \
+                    GS_PIINT | \
+                    GS_RSRVD | \
+                    GS_MOINT | \
                     GS_MIINT)
 #define GS_VALID_MASK ((1 << 18) - 1)
-#define GS_WCLEAR_MASK (GS_RCS|GS_S1R1|GS_S0R1|GS_GSCI)
+#define GS_WCLEAR_MASK (GS_RCS | GS_S1R1 | GS_S0R1 | GS_GSCI)
 
-#define BD_IOC (1<<31)
-#define BD_BUP (1<<30)
+#define BD_IOC (1 << 31)
+#define BD_BUP (1 << 30)
 
 #define EACS_VRA 1
 #define EACS_VRM 8
@@ -183,7 +183,7 @@ enum {
 };
 
 #ifdef DEBUG_AC97
-#define dolog(...) AUD_log ("ac97", __VA_ARGS__)
+#define dolog(...) AUD_log("ac97", __VA_ARGS__)
 #else
 #define dolog(...)
 #endif
@@ -206,9 +206,9 @@ enum {
     LAST_INDEX
 };
 
-MKREGS (PI, PI_INDEX * 16);
-MKREGS (PO, PO_INDEX * 16);
-MKREGS (MC, MC_INDEX * 16);
+MKREGS(PI, PI_INDEX * 16);
+MKREGS(PO, PO_INDEX * 16);
+MKREGS(MC, MC_INDEX * 16);
 
 enum {
     GLOB_CNT = 0x2c,
@@ -218,36 +218,35 @@ enum {
 
 #define GET_BM(index) (((index) >> 4) & 3)
 
-static void po_callback (void *opaque, int free);
-static void pi_callback (void *opaque, int avail);
-static void mc_callback (void *opaque, int avail);
+static void po_callback(void *opaque, int free);
+static void pi_callback(void *opaque, int avail);
+static void mc_callback(void *opaque, int avail);
 
-static void warm_reset (AC97LinkState *s)
+static void warm_reset(AC97LinkState *s)
 {
-    (void) s;
+    (void)s;
 }
 
-static void cold_reset (AC97LinkState * s)
+static void cold_reset(AC97LinkState *s)
 {
-    (void) s;
+    (void)s;
 }
 
-static void fetch_bd (AC97LinkState *s, AC97BusMasterRegs *r)
+static void fetch_bd(AC97LinkState *s, AC97BusMasterRegs *r)
 {
     uint8_t b[8];
 
-    pci_dma_read (&s->dev, r->bdbar + r->civ * 8, b, 8);
+    pci_dma_read(&s->dev, r->bdbar + r->civ * 8, b, 8);
     r->bd_valid = 1;
-    r->bd.addr = le32_to_cpu (*(uint32_t *) &b[0]) & ~3;
-    r->bd.ctl_len = le32_to_cpu (*(uint32_t *) &b[4]);
+    r->bd.addr = le32_to_cpu(*(uint32_t *) &b[0]) & ~3;
+    r->bd.ctl_len = le32_to_cpu(*(uint32_t *) &b[4]);
     r->picb = r->bd.ctl_len & 0xffff;
-    dolog ("bd %2d addr=%#x ctl=%#06x len=%#x(%d bytes)\n",
-           r->civ, r->bd.addr, r->bd.ctl_len >> 16,
-           r->bd.ctl_len & 0xffff,
-           (r->bd.ctl_len & 0xffff) << 1);
+    dolog("bd %2d addr=0x%x ctl=0x%06x len=0x%x(%d bytes)\n",
+          r->civ, r->bd.addr, r->bd.ctl_len >> 16,
+          r->bd.ctl_len & 0xffff, (r->bd.ctl_len & 0xffff) << 1);
 }
 
-static void update_sr (AC97LinkState *s, AC97BusMasterRegs *r, uint32_t new_sr)
+static void update_sr(AC97LinkState *s, AC97BusMasterRegs *r, uint32_t new_sr)
 {
     int event = 0;
     int level = 0;
@@ -260,8 +259,7 @@ static void update_sr (AC97LinkState *s, AC97BusMasterRegs *r, uint32_t new_sr)
         if (!new_mask) {
             event = 1;
             level = 0;
-        }
-        else {
+        } else {
             if ((new_mask & SR_LVBCI) && (r->cr & CR_LVBIE)) {
                 event = 1;
                 level = 1;
@@ -275,69 +273,67 @@ static void update_sr (AC97LinkState *s, AC97BusMasterRegs *r, uint32_t new_sr)
 
     r->sr = new_sr;
 
-    dolog ("IOC%d LVB%d sr=%#x event=%d level=%d\n",
-           r->sr & SR_BCIS, r->sr & SR_LVBCI,
-           r->sr,
-           event, level);
+    dolog("IOC%d LVB%d sr=0x%x event=%d level=%d\n",
+          r->sr & SR_BCIS, r->sr & SR_LVBCI, r->sr, event, level);
 
-    if (!event)
+    if (!event) {
         return;
+    }
 
     if (level) {
         s->glob_sta |= masks[r - s->bm_regs];
-        dolog ("set irq level=1\n");
+        dolog("set irq level=1\n");
         pci_irq_assert(&s->dev);
-    }
-    else {
+    } else {
         s->glob_sta &= ~masks[r - s->bm_regs];
-        dolog ("set irq level=0\n");
+        dolog("set irq level=0\n");
         pci_irq_deassert(&s->dev);
     }
 }
 
-static void voice_set_active (AC97LinkState *s, int bm_index, int on)
+static void voice_set_active(AC97LinkState *s, int bm_index, int on)
 {
     switch (bm_index) {
     case PI_INDEX:
-        AUD_set_active_in (s->voice_pi, on);
+        AUD_set_active_in(s->voice_pi, on);
         break;
 
     case PO_INDEX:
-        AUD_set_active_out (s->voice_po, on);
+        AUD_set_active_out(s->voice_po, on);
         break;
 
     case MC_INDEX:
-        AUD_set_active_in (s->voice_mc, on);
+        AUD_set_active_in(s->voice_mc, on);
         break;
 
     default:
-        AUD_log ("ac97", "invalid bm_index(%d) in voice_set_active", bm_index);
+        AUD_log("ac97", "invalid bm_index(%d) in voice_set_active", bm_index);
         break;
     }
 }
 
-static void reset_bm_regs (AC97LinkState *s, AC97BusMasterRegs *r)
+static void reset_bm_regs(AC97LinkState *s, AC97BusMasterRegs *r)
 {
-    dolog ("reset_bm_regs\n");
+    dolog("reset_bm_regs\n");
     r->bdbar = 0;
     r->civ = 0;
     r->lvi = 0;
     /** todo do we need to do that? */
-    update_sr (s, r, SR_DCH);
+    update_sr(s, r, SR_DCH);
     r->picb = 0;
     r->piv = 0;
     r->cr = r->cr & CR_DONT_CLEAR_MASK;
     r->bd_valid = 0;
 
-    voice_set_active (s, r - s->bm_regs, 0);
-    memset (s->silence, 0, sizeof (s->silence));
+    voice_set_active(s, r - s->bm_regs, 0);
+    memset(s->silence, 0, sizeof(s->silence));
 }
 
-static void mixer_store (AC97LinkState *s, uint32_t i, uint16_t v)
+static void mixer_store(AC97LinkState *s, uint32_t i, uint16_t v)
 {
-    if (i + 2 > sizeof (s->mixer_data)) {
-        dolog ("mixer_store: index %d out of bounds %zd\n",
-               i, sizeof (s->mixer_data));
+    if (i + 2 > sizeof(s->mixer_data)) {
+        dolog("mixer_store: index %d out of bounds %zd\n",
+              i, sizeof(s->mixer_data));
         return;
     }
 
@@ -345,22 +341,21 @@ static void mixer_store (AC97LinkState *s, uint32_t i, uint16_t v)
     s->mixer_data[i + 1] = v >> 8;
 }
 
-static uint16_t mixer_load (AC97LinkState *s, uint32_t i)
+static uint16_t mixer_load(AC97LinkState *s, uint32_t i)
 {
     uint16_t val = 0xffff;
 
-    if (i + 2 > sizeof (s->mixer_data)) {
-        dolog ("mixer_load: index %d out of bounds %zd\n",
-               i, sizeof (s->mixer_data));
-    }
-    else {
+    if (i + 2 > sizeof(s->mixer_data)) {
+        dolog("mixer_load: index %d out of bounds %zd\n",
+              i, sizeof(s->mixer_data));
+    } else {
         val = s->mixer_data[i + 0] | (s->mixer_data[i + 1] << 8);
     }
 
     return val;
 }
 
-static void open_voice (AC97LinkState *s, int index, int freq)
+static void open_voice(AC97LinkState *s, int index, int freq)
 {
     struct audsettings as;
 
@@ -373,7 +368,7 @@ static void open_voice (AC97LinkState *s, int index, int freq)
         s->invalid_freq[index] = 0;
         switch (index) {
         case PI_INDEX:
-            s->voice_pi = AUD_open_in (
+            s->voice_pi = AUD_open_in(
                 &s->card,
                 s->voice_pi,
                 "ac97.pi",
@@ -384,7 +379,7 @@ static void open_voice (AC97LinkState *s, int index, int freq)
             break;
 
         case PO_INDEX:
-            s->voice_po = AUD_open_out (
+            s->voice_po = AUD_open_out(
                 &s->card,
                 s->voice_po,
                 "ac97.po",
@@ -395,7 +390,7 @@ static void open_voice (AC97LinkState *s, int index, int freq)
             break;
 
         case MC_INDEX:
-            s->voice_mc = AUD_open_in (
+            s->voice_mc = AUD_open_in(
                 &s->card,
                 s->voice_mc,
                 "ac97.mc",
@@ -405,47 +400,46 @@ static void open_voice (AC97LinkState *s, int index, int freq)
                 );
             break;
         }
-    }
-    else {
+    } else {
         s->invalid_freq[index] = freq;
         switch (index) {
         case PI_INDEX:
-            AUD_close_in (&s->card, s->voice_pi);
+            AUD_close_in(&s->card, s->voice_pi);
             s->voice_pi = NULL;
             break;
 
         case PO_INDEX:
-            AUD_close_out (&s->card, s->voice_po);
+            AUD_close_out(&s->card, s->voice_po);
             s->voice_po = NULL;
             break;
 
         case MC_INDEX:
-            AUD_close_in (&s->card, s->voice_mc);
+            AUD_close_in(&s->card, s->voice_mc);
             s->voice_mc = NULL;
             break;
         }
     }
 }
 
-static void reset_voices (AC97LinkState *s, uint8_t active[LAST_INDEX])
+static void reset_voices(AC97LinkState *s, uint8_t active[LAST_INDEX])
 {
     uint16_t freq;
 
-    freq = mixer_load (s, AC97_PCM_LR_ADC_Rate);
-    open_voice (s, PI_INDEX, freq);
-    AUD_set_active_in (s->voice_pi, active[PI_INDEX]);
+    freq = mixer_load(s, AC97_PCM_LR_ADC_Rate);
+    open_voice(s, PI_INDEX, freq);
+    AUD_set_active_in(s->voice_pi, active[PI_INDEX]);
 
-    freq = mixer_load (s, AC97_PCM_Front_DAC_Rate);
-    open_voice (s, PO_INDEX, freq);
-    AUD_set_active_out (s->voice_po, active[PO_INDEX]);
+    freq = mixer_load(s, AC97_PCM_Front_DAC_Rate);
+    open_voice(s, PO_INDEX, freq);
+    AUD_set_active_out(s->voice_po, active[PO_INDEX]);
 
-    freq = mixer_load (s, AC97_MIC_ADC_Rate);
-    open_voice (s, MC_INDEX, freq);
-    AUD_set_active_in (s->voice_mc, active[MC_INDEX]);
+    freq = mixer_load(s, AC97_MIC_ADC_Rate);
+    open_voice(s, MC_INDEX, freq);
+    AUD_set_active_in(s->voice_mc, active[MC_INDEX]);
 }
 
-static void get_volume (uint16_t vol, uint16_t mask, int inverse,
-                        int *mute, uint8_t *lvol, uint8_t *rvol)
+static void get_volume(uint16_t vol, uint16_t mask, int inverse,
+                       int *mute, uint8_t *lvol, uint8_t *rvol)
 {
     *mute = (vol >> MUTE_SHIFT) & 1;
     *rvol = (255 * (vol & mask)) / mask;
@@ -457,120 +451,120 @@ static void get_volume (uint16_t vol, uint16_t mask, int inverse,
     }
 }
 
-static void update_combined_volume_out (AC97LinkState *s)
+static void update_combined_volume_out(AC97LinkState *s)
 {
     uint8_t lvol, rvol, plvol, prvol;
     int mute, pmute;
 
-    get_volume (mixer_load (s, AC97_Master_Volume_Mute), 0x3f, 1,
-                &mute, &lvol, &rvol);
-    get_volume (mixer_load (s, AC97_PCM_Out_Volume_Mute), 0x1f, 1,
-                &pmute, &plvol, &prvol);
+    get_volume(mixer_load(s, AC97_Master_Volume_Mute), 0x3f, 1,
+               &mute, &lvol, &rvol);
+    get_volume(mixer_load(s, AC97_PCM_Out_Volume_Mute), 0x1f, 1,
+               &pmute, &plvol, &prvol);
 
     mute = mute | pmute;
     lvol = (lvol * plvol) / 255;
     rvol = (rvol * prvol) / 255;
 
-    AUD_set_volume_out (s->voice_po, mute, lvol, rvol);
+    AUD_set_volume_out(s->voice_po, mute, lvol, rvol);
 }
 
-static void update_volume_in (AC97LinkState *s)
+static void update_volume_in(AC97LinkState *s)
 {
     uint8_t lvol, rvol;
     int mute;
 
-    get_volume (mixer_load (s, AC97_Record_Gain_Mute), 0x0f, 0,
-                &mute, &lvol, &rvol);
+    get_volume(mixer_load(s, AC97_Record_Gain_Mute), 0x0f, 0,
+               &mute, &lvol, &rvol);
 
-    AUD_set_volume_in (s->voice_pi, mute, lvol, rvol);
+    AUD_set_volume_in(s->voice_pi, mute, lvol, rvol);
 }
 
-static void set_volume (AC97LinkState *s, int index, uint32_t val)
+static void set_volume(AC97LinkState *s, int index, uint32_t val)
 {
     switch (index) {
     case AC97_Master_Volume_Mute:
         val &= 0xbf3f;
-        mixer_store (s, index, val);
-        update_combined_volume_out (s);
+        mixer_store(s, index, val);
+        update_combined_volume_out(s);
         break;
     case AC97_PCM_Out_Volume_Mute:
         val &= 0x9f1f;
-        mixer_store (s, index, val);
-        update_combined_volume_out (s);
+        mixer_store(s, index, val);
+        update_combined_volume_out(s);
         break;
     case AC97_Record_Gain_Mute:
         val &= 0x8f0f;
-        mixer_store (s, index, val);
-        update_volume_in (s);
+        mixer_store(s, index, val);
+        update_volume_in(s);
         break;
     }
 }
 
-static void record_select (AC97LinkState *s, uint32_t val)
+static void record_select(AC97LinkState *s, uint32_t val)
 {
     uint8_t rs = val & REC_MASK;
     uint8_t ls = (val >> 8) & REC_MASK;
-    mixer_store (s, AC97_Record_Select, rs | (ls << 8));
+    mixer_store(s, AC97_Record_Select, rs | (ls << 8));
 }
 
-static void mixer_reset (AC97LinkState *s)
+static void mixer_reset(AC97LinkState *s)
 {
     uint8_t active[LAST_INDEX];
 
-    dolog ("mixer_reset\n");
-    memset (s->mixer_data, 0, sizeof (s->mixer_data));
-    memset (active, 0, sizeof (active));
-    mixer_store (s, AC97_Reset                   , 0x0000); /* 6940 */
-    mixer_store (s, AC97_Headphone_Volume_Mute   , 0x0000);
-    mixer_store (s, AC97_Master_Volume_Mono_Mute , 0x0000);
-    mixer_store (s, AC97_Master_Tone_RL,           0x0000);
-    mixer_store (s, AC97_PC_BEEP_Volume_Mute     , 0x0000);
-    mixer_store (s, AC97_Phone_Volume_Mute       , 0x0000);
-    mixer_store (s, AC97_Mic_Volume_Mute         , 0x0000);
-    mixer_store (s, AC97_Line_In_Volume_Mute     , 0x0000);
-    mixer_store (s, AC97_CD_Volume_Mute          , 0x0000);
-    mixer_store (s, AC97_Video_Volume_Mute       , 0x0000);
-    mixer_store (s, AC97_Aux_Volume_Mute         , 0x0000);
-    mixer_store (s, AC97_Record_Gain_Mic_Mute    , 0x0000);
-    mixer_store (s, AC97_General_Purpose         , 0x0000);
-    mixer_store (s, AC97_3D_Control              , 0x0000);
-    mixer_store (s, AC97_Powerdown_Ctrl_Stat     , 0x000f);
+    dolog("mixer_reset\n");
+    memset(s->mixer_data, 0, sizeof(s->mixer_data));
+    memset(active, 0, sizeof(active));
+    mixer_store(s, AC97_Reset                   , 0x0000); /* 6940 */
+    mixer_store(s, AC97_Headphone_Volume_Mute   , 0x0000);
+    mixer_store(s, AC97_Master_Volume_Mono_Mute , 0x0000);
+    mixer_store(s, AC97_Master_Tone_RL,           0x0000);
+    mixer_store(s, AC97_PC_BEEP_Volume_Mute     , 0x0000);
+    mixer_store(s, AC97_Phone_Volume_Mute       , 0x0000);
+    mixer_store(s, AC97_Mic_Volume_Mute         , 0x0000);
+    mixer_store(s, AC97_Line_In_Volume_Mute     , 0x0000);
+    mixer_store(s, AC97_CD_Volume_Mute          , 0x0000);
+    mixer_store(s, AC97_Video_Volume_Mute       , 0x0000);
+    mixer_store(s, AC97_Aux_Volume_Mute         , 0x0000);
+    mixer_store(s, AC97_Record_Gain_Mic_Mute    , 0x0000);
+    mixer_store(s, AC97_General_Purpose         , 0x0000);
+    mixer_store(s, AC97_3D_Control              , 0x0000);
+    mixer_store(s, AC97_Powerdown_Ctrl_Stat     , 0x000f);
 
     /*
      * Sigmatel 9700 (STAC9700)
      */
-    mixer_store (s, AC97_Vendor_ID1              , 0x8384);
-    mixer_store (s, AC97_Vendor_ID2              , 0x7600); /* 7608 */
-
-    mixer_store (s, AC97_Extended_Audio_ID       , 0x0809);
-    mixer_store (s, AC97_Extended_Audio_Ctrl_Stat, 0x0009);
-    mixer_store (s, AC97_PCM_Front_DAC_Rate      , 0xbb80);
-    mixer_store (s, AC97_PCM_Surround_DAC_Rate   , 0xbb80);
-    mixer_store (s, AC97_PCM_LFE_DAC_Rate        , 0xbb80);
-    mixer_store (s, AC97_PCM_LR_ADC_Rate         , 0xbb80);
-    mixer_store (s, AC97_MIC_ADC_Rate            , 0xbb80);
-
-    record_select (s, 0);
-    set_volume (s, AC97_Master_Volume_Mute, 0x8000);
-    set_volume (s, AC97_PCM_Out_Volume_Mute, 0x8808);
-    set_volume (s, AC97_Record_Gain_Mute, 0x8808);
-
-    reset_voices (s, active);
+    mixer_store(s, AC97_Vendor_ID1              , 0x8384);
+    mixer_store(s, AC97_Vendor_ID2              , 0x7600); /* 7608 */
+
+    mixer_store(s, AC97_Extended_Audio_ID       , 0x0809);
+    mixer_store(s, AC97_Extended_Audio_Ctrl_Stat, 0x0009);
+    mixer_store(s, AC97_PCM_Front_DAC_Rate      , 0xbb80);
+    mixer_store(s, AC97_PCM_Surround_DAC_Rate   , 0xbb80);
+    mixer_store(s, AC97_PCM_LFE_DAC_Rate        , 0xbb80);
+    mixer_store(s, AC97_PCM_LR_ADC_Rate         , 0xbb80);
+    mixer_store(s, AC97_MIC_ADC_Rate            , 0xbb80);
+
+    record_select(s, 0);
+    set_volume(s, AC97_Master_Volume_Mute, 0x8000);
+    set_volume(s, AC97_PCM_Out_Volume_Mute, 0x8808);
+    set_volume(s, AC97_Record_Gain_Mute, 0x8808);
+
+    reset_voices(s, active);
 }
 
 /**
  * Native audio mixer
  * I/O Reads
  */
-static uint32_t nam_readb (void *opaque, uint32_t addr)
+static uint32_t nam_readb(void *opaque, uint32_t addr)
 {
     AC97LinkState *s = opaque;
-    dolog ("U nam readb %#x\n", addr);
+    dolog("U nam readb 0x%x\n", addr);
     s->cas = 0;
     return ~0U;
 }
 
-static uint32_t nam_readw (void *opaque, uint32_t addr)
+static uint32_t nam_readw(void *opaque, uint32_t addr)
 {
     AC97LinkState *s = opaque;
     uint32_t index = addr;
@@ -578,10 +572,10 @@ static uint32_t nam_readw (void *opaque, uint32_t addr)
     return mixer_load(s, index);
 }
 
-static uint32_t nam_readl (void *opaque, uint32_t addr)
+static uint32_t nam_readl(void *opaque, uint32_t addr)
 {
     AC97LinkState *s = opaque;
-    dolog ("U nam readl %#x\n", addr);
+    dolog("U nam readl 0x%x\n", addr);
     s->cas = 0;
     return ~0U;
 }
@@ -590,89 +584,84 @@ static uint32_t nam_readl (void *opaque, uint32_t addr)
  * Native audio mixer
  * I/O Writes
  */
-static void nam_writeb (void *opaque, uint32_t addr, uint32_t val)
+static void nam_writeb(void *opaque, uint32_t addr, uint32_t val)
 {
     AC97LinkState *s = opaque;
-    dolog ("U nam writeb %#x <- %#x\n", addr, val);
+    dolog("U nam writeb 0x%x <- 0x%x\n", addr, val);
     s->cas = 0;
 }
 
-static void nam_writew (void *opaque, uint32_t addr, uint32_t val)
+static void nam_writew(void *opaque, uint32_t addr, uint32_t val)
 {
     AC97LinkState *s = opaque;
     uint32_t index = addr;
     s->cas = 0;
     switch (index) {
     case AC97_Reset:
-        mixer_reset (s);
+        mixer_reset(s);
         break;
     case AC97_Powerdown_Ctrl_Stat:
         val &= ~0x800f;
-        val |= mixer_load (s, index) & 0xf;
-        mixer_store (s, index, val);
+        val |= mixer_load(s, index) & 0xf;
+        mixer_store(s, index, val);
         break;
     case AC97_PCM_Out_Volume_Mute:
     case AC97_Master_Volume_Mute:
     case AC97_Record_Gain_Mute:
-        set_volume (s, index, val);
+        set_volume(s, index, val);
         break;
     case AC97_Record_Select:
-        record_select (s, val);
+        record_select(s, val);
         break;
     case AC97_Vendor_ID1:
     case AC97_Vendor_ID2:
-        dolog ("Attempt to write vendor ID to %#x\n", val);
+        dolog("Attempt to write vendor ID to 0x%x\n", val);
         break;
     case AC97_Extended_Audio_ID:
-        dolog ("Attempt to write extended audio ID to %#x\n", val);
+        dolog("Attempt to write extended audio ID to 0x%x\n", val);
         break;
     case AC97_Extended_Audio_Ctrl_Stat:
         if (!(val & EACS_VRA)) {
-            mixer_store (s, AC97_PCM_Front_DAC_Rate, 0xbb80);
-            mixer_store (s, AC97_PCM_LR_ADC_Rate,    0xbb80);
-            open_voice (s, PI_INDEX, 48000);
-            open_voice (s, PO_INDEX, 48000);
+            mixer_store(s, AC97_PCM_Front_DAC_Rate, 0xbb80);
+            mixer_store(s, AC97_PCM_LR_ADC_Rate,    0xbb80);
+            open_voice(s, PI_INDEX, 48000);
+            open_voice(s, PO_INDEX, 48000);
         }
         if (!(val & EACS_VRM)) {
-            mixer_store (s, AC97_MIC_ADC_Rate, 0xbb80);
-            open_voice (s, MC_INDEX, 48000);
+            mixer_store(s, AC97_MIC_ADC_Rate, 0xbb80);
+            open_voice(s, MC_INDEX, 48000);
         }
-        dolog ("Setting extended audio control to %#x\n", val);
-        mixer_store (s, AC97_Extended_Audio_Ctrl_Stat, val);
+        dolog("Setting extended audio control to 0x%x\n", val);
+        mixer_store(s, AC97_Extended_Audio_Ctrl_Stat, val);
         break;
     case AC97_PCM_Front_DAC_Rate:
-        if (mixer_load (s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRA) {
-            mixer_store (s, index, val);
-            dolog ("Set front DAC rate to %d\n", val);
-            open_voice (s, PO_INDEX, val);
-        }
-        else {
-            dolog ("Attempt to set front DAC rate to %d, "
-                   "but VRA is not set\n",
-                   val);
+        if (mixer_load(s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRA) {
+            mixer_store(s, index, val);
+            dolog("Set front DAC rate to %d\n", val);
+            open_voice(s, PO_INDEX, val);
+        } else {
+            dolog("Attempt to set front DAC rate to %d, but VRA is not set\n",
+                  val);
         }
         break;
     case AC97_MIC_ADC_Rate:
-        if (mixer_load (s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRM) {
-            mixer_store (s, index, val);
-            dolog ("Set MIC ADC rate to %d\n", val);
-            open_voice (s, MC_INDEX, val);
-        }
-        else {
-            dolog ("Attempt to set MIC ADC rate to %d, "
-                   "but VRM is not set\n",
-                   val);
+        if (mixer_load(s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRM) {
+            mixer_store(s, index, val);
+            dolog("Set MIC ADC rate to %d\n", val);
+            open_voice(s, MC_INDEX, val);
+        } else {
+            dolog("Attempt to set MIC ADC rate to %d, but VRM is not set\n",
+                  val);
         }
         break;
     case AC97_PCM_LR_ADC_Rate:
-        if (mixer_load (s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRA) {
-            mixer_store (s, index, val);
-            dolog ("Set front LR ADC rate to %d\n", val);
-            open_voice (s, PI_INDEX, val);
-        }
-        else {
-            dolog ("Attempt to set LR ADC rate to %d, but VRA is not set\n",
-                    val);
+        if (mixer_load(s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRA) {
+            mixer_store(s, index, val);
+            dolog("Set front LR ADC rate to %d\n", val);
+            open_voice(s, PI_INDEX, val);
+        } else {
+            dolog("Attempt to set LR ADC rate to %d, but VRA is not set\n",
+                  val);
         }
         break;
     case AC97_Headphone_Volume_Mute:
@@ -693,16 +682,16 @@ static void nam_writew (void *opaque, uint32_t addr, uint32_t val)
         /* None of the features in these regs are emulated, so they are RO */
         break;
     default:
-        dolog ("U nam writew %#x <- %#x\n", addr, val);
-        mixer_store (s, index, val);
+        dolog("U nam writew 0x%x <- 0x%x\n", addr, val);
+        mixer_store(s, index, val);
         break;
     }
 }
 
-static void nam_writel (void *opaque, uint32_t addr, uint32_t val)
+static void nam_writel(void *opaque, uint32_t addr, uint32_t val)
 {
     AC97LinkState *s = opaque;
-    dolog ("U nam writel %#x <- %#x\n", addr, val);
+    dolog("U nam writel 0x%x <- 0x%x\n", addr, val);
     s->cas = 0;
 }
 
@@ -710,7 +699,7 @@ static void nam_writel (void *opaque, uint32_t addr, uint32_t val)
  * Native audio bus master
  * I/O Reads
  */
-static uint32_t nabm_readb (void *opaque, uint32_t addr)
+static uint32_t nabm_readb(void *opaque, uint32_t addr)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
@@ -719,53 +708,53 @@ static uint32_t nabm_readb (void *opaque, uint32_t addr)
 
     switch (index) {
     case CAS:
-        dolog ("CAS %d\n", s->cas);
+        dolog("CAS %d\n", s->cas);
         val = s->cas;
         s->cas = 1;
         break;
     case PI_CIV:
     case PO_CIV:
     case MC_CIV:
-        r = &s->bm_regs[GET_BM (index)];
+        r = &s->bm_regs[GET_BM(index)];
         val = r->civ;
-        dolog ("CIV[%d] -> %#x\n", GET_BM (index), val);
+        dolog("CIV[%d] -> 0x%x\n", GET_BM(index), val);
         break;
     case PI_LVI:
     case PO_LVI:
     case MC_LVI:
-        r = &s->bm_regs[GET_BM (index)];
+        r = &s->bm_regs[GET_BM(index)];
         val = r->lvi;
-        dolog ("LVI[%d] -> %#x\n", GET_BM (index), val);
+        dolog("LVI[%d] -> 0x%x\n", GET_BM(index), val);
         break;
     case PI_PIV:
     case PO_PIV:
     case MC_PIV:
-        r = &s->bm_regs[GET_BM (index)];
+        r = &s->bm_regs[GET_BM(index)];
         val = r->piv;
-        dolog ("PIV[%d] -> %#x\n", GET_BM (index), val);
+        dolog("PIV[%d] -> 0x%x\n", GET_BM(index), val);
         break;
     case PI_CR:
     case PO_CR:
     case MC_CR:
-        r = &s->bm_regs[GET_BM (index)];
+        r = &s->bm_regs[GET_BM(index)];
         val = r->cr;
-        dolog ("CR[%d] -> %#x\n", GET_BM (index), val);
+        dolog("CR[%d] -> 0x%x\n", GET_BM(index), val);
         break;
     case PI_SR:
     case PO_SR:
     case MC_SR:
-        r = &s->bm_regs[GET_BM (index)];
+        r = &s->bm_regs[GET_BM(index)];
         val = r->sr & 0xff;
-        dolog ("SRb[%d] -> %#x\n", GET_BM (index), val);
+        dolog("SRb[%d] -> 0x%x\n", GET_BM(index), val);
         break;
     default:
-        dolog ("U nabm readb %#x -> %#x\n", addr, val);
+        dolog("U nabm readb 0x%x -> 0x%x\n", addr, val);
         break;
     }
     return val;
 }
 
-static uint32_t nabm_readw (void *opaque, uint32_t addr)
+static uint32_t nabm_readw(void *opaque, uint32_t addr)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
@@ -776,25 +765,25 @@ static uint32_t nabm_readw (void *opaque, uint32_t addr)
     case PI_SR:
     case PO_SR:
     case MC_SR:
-        r = &s->bm_regs[GET_BM (index)];
+        r = &s->bm_regs[GET_BM(index)];
         val = r->sr;
-        dolog ("SR[%d] -> %#x\n", GET_BM (index), val);
+        dolog("SR[%d] -> 0x%x\n", GET_BM(index), val);
         break;
     case PI_PICB:
     case PO_PICB:
     case MC_PICB:
-        r = &s->bm_regs[GET_BM (index)];
+        r = &s->bm_regs[GET_BM(index)];
         val = r->picb;
-        dolog ("PICB[%d] -> %#x\n", GET_BM (index), val);
+        dolog("PICB[%d] -> 0x%x\n", GET_BM(index), val);
         break;
     default:
-        dolog ("U nabm readw %#x -> %#x\n", addr, val);
+        dolog("U nabm readw 0x%x -> 0x%x\n", addr, val);
         break;
     }
     return val;
 }
 
-static uint32_t nabm_readl (void *opaque, uint32_t addr)
+static uint32_t nabm_readl(void *opaque, uint32_t addr)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
@@ -805,36 +794,36 @@ static uint32_t nabm_readl (void *opaque, uint32_t addr)
     case PI_BDBAR:
     case PO_BDBAR:
     case MC_BDBAR:
-        r = &s->bm_regs[GET_BM (index)];
+        r = &s->bm_regs[GET_BM(index)];
         val = r->bdbar;
-        dolog ("BMADDR[%d] -> %#x\n", GET_BM (index), val);
+        dolog("BMADDR[%d] -> 0x%x\n", GET_BM(index), val);
         break;
     case PI_CIV:
     case PO_CIV:
     case MC_CIV:
-        r = &s->bm_regs[GET_BM (index)];
+        r = &s->bm_regs[GET_BM(index)];
         val = r->civ | (r->lvi << 8) | (r->sr << 16);
-        dolog ("CIV LVI SR[%d] -> %#x, %#x, %#x\n", GET_BM (index),
+        dolog("CIV LVI SR[%d] -> 0x%x, 0x%x, 0x%x\n", GET_BM(index),
                r->civ, r->lvi, r->sr);
         break;
     case PI_PICB:
     case PO_PICB:
     case MC_PICB:
-        r = &s->bm_regs[GET_BM (index)];
+        r = &s->bm_regs[GET_BM(index)];
         val = r->picb | (r->piv << 16) | (r->cr << 24);
-        dolog ("PICB PIV CR[%d] -> %#x %#x %#x %#x\n", GET_BM (index),
+        dolog("PICB PIV CR[%d] -> 0x%x 0x%x 0x%x 0x%x\n", GET_BM(index),
                val, r->picb, r->piv, r->cr);
         break;
     case GLOB_CNT:
         val = s->glob_cnt;
-        dolog ("glob_cnt -> %#x\n", val);
+        dolog("glob_cnt -> 0x%x\n", val);
         break;
     case GLOB_STA:
         val = s->glob_sta | GS_S0CR;
-        dolog ("glob_sta -> %#x\n", val);
+        dolog("glob_sta -> 0x%x\n", val);
         break;
     default:
-        dolog ("U nabm readl %#x -> %#x\n", addr, val);
+        dolog("U nabm readl 0x%x -> 0x%x\n", addr, val);
         break;
     }
     return val;
@@ -844,7 +833,7 @@ static uint32_t nabm_readl (void *opaque, uint32_t addr)
  * Native audio bus master
  * I/O Writes
  */
-static void nabm_writeb (void *opaque, uint32_t addr, uint32_t val)
+static void nabm_writeb(void *opaque, uint32_t addr, uint32_t val)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
@@ -853,54 +842,52 @@ static void nabm_writeb (void *opaque, uint32_t addr, uint32_t val)
     case PI_LVI:
     case PO_LVI:
     case MC_LVI:
-        r = &s->bm_regs[GET_BM (index)];
+        r = &s->bm_regs[GET_BM(index)];
         if ((r->cr & CR_RPBM) && (r->sr & SR_DCH)) {
             r->sr &= ~(SR_DCH | SR_CELV);
             r->civ = r->piv;
             r->piv = (r->piv + 1) % 32;
-            fetch_bd (s, r);
+            fetch_bd(s, r);
         }
         r->lvi = val % 32;
-        dolog ("LVI[%d] <- %#x\n", GET_BM (index), val);
+        dolog("LVI[%d] <- 0x%x\n", GET_BM(index), val);
         break;
     case PI_CR:
     case PO_CR:
     case MC_CR:
-        r = &s->bm_regs[GET_BM (index)];
+        r = &s->bm_regs[GET_BM(index)];
         if (val & CR_RR) {
-            reset_bm_regs (s, r);
-        }
-        else {
+            reset_bm_regs(s, r);
+        } else {
             r->cr = val & CR_VALID_MASK;
             if (!(r->cr & CR_RPBM)) {
-                voice_set_active (s, r - s->bm_regs, 0);
+                voice_set_active(s, r - s->bm_regs, 0);
                 r->sr |= SR_DCH;
-            }
-            else {
+            } else {
                 r->civ = r->piv;
                 r->piv = (r->piv + 1) % 32;
-                fetch_bd (s, r);
+                fetch_bd(s, r);
                 r->sr &= ~SR_DCH;
-                voice_set_active (s, r - s->bm_regs, 1);
+                voice_set_active(s, r - s->bm_regs, 1);
             }
         }
-        dolog ("CR[%d] <- %#x (cr %#x)\n", GET_BM (index), val, r->cr);
+        dolog("CR[%d] <- 0x%x (cr 0x%x)\n", GET_BM(index), val, r->cr);
         break;
     case PI_SR:
     case PO_SR:
     case MC_SR:
-        r = &s->bm_regs[GET_BM (index)];
+        r = &s->bm_regs[GET_BM(index)];
         r->sr |= val & ~(SR_RO_MASK | SR_WCLEAR_MASK);
-        update_sr (s, r, r->sr & ~(val & SR_WCLEAR_MASK));
-        dolog ("SR[%d] <- %#x (sr %#x)\n", GET_BM (index), val, r->sr);
+        update_sr(s, r, r->sr & ~(val & SR_WCLEAR_MASK));
+        dolog("SR[%d] <- 0x%x (sr 0x%x)\n", GET_BM(index), val, r->sr);
         break;
     default:
-        dolog ("U nabm writeb %#x <- %#x\n", addr, val);
+        dolog("U nabm writeb 0x%x <- 0x%x\n", addr, val);
         break;
     }
 }
 
-static void nabm_writew (void *opaque, uint32_t addr, uint32_t val)
+static void nabm_writew(void *opaque, uint32_t addr, uint32_t val)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
@@ -909,18 +896,18 @@ static void nabm_writew (void *opaque, uint32_t addr, uint32_t val)
     case PI_SR:
     case PO_SR:
     case MC_SR:
-        r = &s->bm_regs[GET_BM (index)];
+        r = &s->bm_regs[GET_BM(index)];
         r->sr |= val & ~(SR_RO_MASK | SR_WCLEAR_MASK);
-        update_sr (s, r, r->sr & ~(val & SR_WCLEAR_MASK));
-        dolog ("SR[%d] <- %#x (sr %#x)\n", GET_BM (index), val, r->sr);
+        update_sr(s, r, r->sr & ~(val & SR_WCLEAR_MASK));
+        dolog("SR[%d] <- 0x%x (sr 0x%x)\n", GET_BM(index), val, r->sr);
         break;
     default:
-        dolog ("U nabm writew %#x <- %#x\n", addr, val);
+        dolog("U nabm writew 0x%x <- 0x%x\n", addr, val);
         break;
     }
 }
 
-static void nabm_writel (void *opaque, uint32_t addr, uint32_t val)
+static void nabm_writel(void *opaque, uint32_t addr, uint32_t val)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
@@ -929,40 +916,42 @@ static void nabm_writel (void *opaque, uint32_t addr, uint32_t val)
     case PI_BDBAR:
     case PO_BDBAR:
     case MC_BDBAR:
-        r = &s->bm_regs[GET_BM (index)];
+        r = &s->bm_regs[GET_BM(index)];
         r->bdbar = val & ~3;
-        dolog ("BDBAR[%d] <- %#x (bdbar %#x)\n",
-               GET_BM (index), val, r->bdbar);
+        dolog("BDBAR[%d] <- 0x%x (bdbar 0x%x)\n", GET_BM(index), val, r->bdbar);
         break;
     case GLOB_CNT:
-        if (val & GC_WR)
-            warm_reset (s);
-        if (val & GC_CR)
-            cold_reset (s);
-        if (!(val & (GC_WR | GC_CR)))
+        if (val & GC_WR) {
+            warm_reset(s);
+        }
+        if (val & GC_CR) {
+            cold_reset(s);
+        }
+        if (!(val & (GC_WR | GC_CR))) {
             s->glob_cnt = val & GC_VALID_MASK;
-        dolog ("glob_cnt <- %#x (glob_cnt %#x)\n", val, s->glob_cnt);
+        }
+        dolog("glob_cnt <- 0x%x (glob_cnt 0x%x)\n", val, s->glob_cnt);
         break;
     case GLOB_STA:
         s->glob_sta &= ~(val & GS_WCLEAR_MASK);
         s->glob_sta |= (val & ~(GS_WCLEAR_MASK | GS_RO_MASK)) & GS_VALID_MASK;
-        dolog ("glob_sta <- %#x (glob_sta %#x)\n", val, s->glob_sta);
+        dolog("glob_sta <- 0x%x (glob_sta 0x%x)\n", val, s->glob_sta);
         break;
     default:
-        dolog ("U nabm writel %#x <- %#x\n", addr, val);
+        dolog("U nabm writel 0x%x <- 0x%x\n", addr, val);
         break;
     }
 }
 
-static int write_audio (AC97LinkState *s, AC97BusMasterRegs *r,
-                        int max, int *stop)
+static int write_audio(AC97LinkState *s, AC97BusMasterRegs *r,
+                       int max, int *stop)
 {
     uint8_t tmpbuf[4096];
     uint32_t addr = r->bd.addr;
     uint32_t temp = r->picb << 1;
     uint32_t written = 0;
     int to_copy = 0;
-    temp = MIN (temp, max);
+    temp = MIN(temp, max);
 
     if (!temp) {
         *stop = 1;
@@ -971,11 +960,11 @@ static int write_audio (AC97LinkState *s, AC97BusMasterRegs *r,
 
     while (temp) {
         int copied;
-        to_copy = MIN (temp, sizeof (tmpbuf));
-        pci_dma_read (&s->dev, addr, tmpbuf, to_copy);
-        copied = AUD_write (s->voice_po, tmpbuf, to_copy);
-        dolog ("write_audio max=%x to_copy=%x copied=%x\n",
-               max, to_copy, copied);
+        to_copy = MIN(temp, sizeof(tmpbuf));
+        pci_dma_read(&s->dev, addr, tmpbuf, to_copy);
+        copied = AUD_write(s->voice_po, tmpbuf, to_copy);
+        dolog("write_audio max=%x to_copy=%x copied=%x\n",
+              max, to_copy, copied);
         if (!copied) {
             *stop = 1;
             break;
@@ -987,11 +976,10 @@ static int write_audio (AC97LinkState *s, AC97BusMasterRegs *r,
 
     if (!temp) {
         if (to_copy < 4) {
-            dolog ("whoops\n");
+            dolog("whoops\n");
             s->last_samp = 0;
-        }
-        else {
-            s->last_samp = *(uint32_t *) &tmpbuf[to_copy - 4];
+        } else {
+            s->last_samp = *(uint32_t *)&tmpbuf[to_copy - 4];
         }
     }
 
@@ -999,37 +987,37 @@ static int write_audio (AC97LinkState *s, AC97BusMasterRegs *r,
     return written;
 }
 
-static void write_bup (AC97LinkState *s, int elapsed)
+static void write_bup(AC97LinkState *s, int elapsed)
 {
-    dolog ("write_bup\n");
+    dolog("write_bup\n");
     if (!(s->bup_flag & BUP_SET)) {
         if (s->bup_flag & BUP_LAST) {
             int i;
             uint8_t *p = s->silence;
-            for (i = 0; i < sizeof (s->silence) / 4; i++, p += 4) {
+            for (i = 0; i < sizeof(s->silence) / 4; i++, p += 4) {
                 *(uint32_t *) p = s->last_samp;
             }
-        }
-        else {
-            memset (s->silence, 0, sizeof (s->silence));
+        } else {
+            memset(s->silence, 0, sizeof(s->silence));
         }
         s->bup_flag |= BUP_SET;
     }
 
     while (elapsed) {
-        int temp = MIN (elapsed, sizeof (s->silence));
+        int temp = MIN(elapsed, sizeof(s->silence));
         while (temp) {
-            int copied = AUD_write (s->voice_po, s->silence, temp);
-            if (!copied)
+            int copied = AUD_write(s->voice_po, s->silence, temp);
+            if (!copied) {
                 return;
+            }
             temp -= copied;
             elapsed -= copied;
         }
     }
 }
 
-static int read_audio (AC97LinkState *s, AC97BusMasterRegs *r,
-                       int max, int *stop)
+static int read_audio(AC97LinkState *s, AC97BusMasterRegs *r,
+                      int max, int *stop)
 {
     uint8_t tmpbuf[4096];
     uint32_t addr = r->bd.addr;
@@ -1038,7 +1026,7 @@ static int read_audio (AC97LinkState *s, AC97BusMasterRegs *r,
     int to_copy = 0;
     SWVoiceIn *voice = (r - s->bm_regs) == MC_INDEX ? s->voice_mc : s->voice_pi;
 
-    temp = MIN (temp, max);
+    temp = MIN(temp, max);
 
     if (!temp) {
         *stop = 1;
@@ -1047,13 +1035,13 @@ static int read_audio (AC97LinkState *s, AC97BusMasterRegs *r,
 
     while (temp) {
         int acquired;
-        to_copy = MIN (temp, sizeof (tmpbuf));
-        acquired = AUD_read (voice, tmpbuf, to_copy);
+        to_copy = MIN(temp, sizeof(tmpbuf));
+        acquired = AUD_read(voice, tmpbuf, to_copy);
         if (!acquired) {
             *stop = 1;
             break;
         }
-        pci_dma_write (&s->dev, addr, tmpbuf, acquired);
+        pci_dma_write(&s->dev, addr, tmpbuf, acquired);
         temp -= acquired;
         addr += acquired;
         nread += acquired;
@@ -1063,14 +1051,14 @@ static int read_audio (AC97LinkState *s, AC97BusMasterRegs *r,
     return nread;
 }
 
-static void transfer_audio (AC97LinkState *s, int index, int elapsed)
+static void transfer_audio(AC97LinkState *s, int index, int elapsed)
 {
     AC97BusMasterRegs *r = &s->bm_regs[index];
     int stop = 0;
 
     if (s->invalid_freq[index]) {
-        AUD_log ("ac97", "attempt to use voice %d with invalid frequency %d\n",
-                 index, s->invalid_freq[index]);
+        AUD_log("ac97", "attempt to use voice %d with invalid frequency %d\n",
+                index, s->invalid_freq[index]);
         return;
     }
 
@@ -1078,7 +1066,7 @@ static void transfer_audio (AC97LinkState *s, int index, int elapsed)
         if (r->cr & CR_RPBM) {
             switch (index) {
             case PO_INDEX:
-                write_bup (s, elapsed);
+                write_bup(s, elapsed);
                 break;
             }
         }
@@ -1089,13 +1077,13 @@ static void transfer_audio (AC97LinkState *s, int index, int elapsed)
         int temp;
 
         if (!r->bd_valid) {
-            dolog ("invalid bd\n");
-            fetch_bd (s, r);
+            dolog("invalid bd\n");
+            fetch_bd(s, r);
         }
 
         if (!r->picb) {
-            dolog ("fresh bd %d is empty %#x %#x\n",
-                   r->civ, r->bd.addr, r->bd.ctl_len);
+            dolog("fresh bd %d is empty 0x%x 0x%x\n",
+                  r->civ, r->bd.addr, r->bd.ctl_len);
             if (r->civ == r->lvi) {
                 r->sr |= SR_DCH; /* CELV? */
                 s->bup_flag = 0;
@@ -1104,20 +1092,20 @@ static void transfer_audio (AC97LinkState *s, int index, int elapsed)
             r->sr &= ~SR_CELV;
             r->civ = r->piv;
             r->piv = (r->piv + 1) % 32;
-            fetch_bd (s, r);
+            fetch_bd(s, r);
             return;
         }
 
         switch (index) {
         case PO_INDEX:
-            temp = write_audio (s, r, elapsed, &stop);
+            temp = write_audio(s, r, elapsed, &stop);
             elapsed -= temp;
             r->picb -= (temp >> 1);
             break;
 
         case PI_INDEX:
         case MC_INDEX:
-            temp = read_audio (s, r, elapsed, &stop);
+            temp = read_audio(s, r, elapsed, &stop);
             elapsed -= temp;
             r->picb -= (temp >> 1);
             break;
@@ -1131,36 +1119,35 @@ static void transfer_audio (AC97LinkState *s, int index, int elapsed)
             }
 
             if (r->civ == r->lvi) {
-                dolog ("Underrun civ (%d) == lvi (%d)\n", r->civ, r->lvi);
+                dolog("Underrun civ (%d) == lvi (%d)\n", r->civ, r->lvi);
 
                 new_sr |= SR_LVBCI | SR_DCH | SR_CELV;
                 stop = 1;
                 s->bup_flag = (r->bd.ctl_len & BD_BUP) ? BUP_LAST : 0;
-            }
-            else {
+            } else {
                 r->civ = r->piv;
                 r->piv = (r->piv + 1) % 32;
-                fetch_bd (s, r);
+                fetch_bd(s, r);
             }
 
-            update_sr (s, r, new_sr);
+            update_sr(s, r, new_sr);
         }
     }
 }
 
-static void pi_callback (void *opaque, int avail)
+static void pi_callback(void *opaque, int avail)
 {
-    transfer_audio (opaque, PI_INDEX, avail);
+    transfer_audio(opaque, PI_INDEX, avail);
 }
 
-static void mc_callback (void *opaque, int avail)
+static void mc_callback(void *opaque, int avail)
 {
-    transfer_audio (opaque, MC_INDEX, avail);
+    transfer_audio(opaque, MC_INDEX, avail);
 }
 
-static void po_callback (void *opaque, int free)
+static void po_callback(void *opaque, int free)
 {
-    transfer_audio (opaque, PO_INDEX, free);
+    transfer_audio(opaque, PO_INDEX, free);
 }
 
 static const VMStateDescription vmstate_ac97_bm_regs = {
@@ -1168,44 +1155,44 @@ static const VMStateDescription vmstate_ac97_bm_regs = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT32 (bdbar, AC97BusMasterRegs),
-        VMSTATE_UINT8 (civ, AC97BusMasterRegs),
-        VMSTATE_UINT8 (lvi, AC97BusMasterRegs),
-        VMSTATE_UINT16 (sr, AC97BusMasterRegs),
-        VMSTATE_UINT16 (picb, AC97BusMasterRegs),
-        VMSTATE_UINT8 (piv, AC97BusMasterRegs),
-        VMSTATE_UINT8 (cr, AC97BusMasterRegs),
-        VMSTATE_UINT32 (bd_valid, AC97BusMasterRegs),
-        VMSTATE_UINT32 (bd.addr, AC97BusMasterRegs),
-        VMSTATE_UINT32 (bd.ctl_len, AC97BusMasterRegs),
-        VMSTATE_END_OF_LIST ()
+        VMSTATE_UINT32(bdbar, AC97BusMasterRegs),
+        VMSTATE_UINT8(civ, AC97BusMasterRegs),
+        VMSTATE_UINT8(lvi, AC97BusMasterRegs),
+        VMSTATE_UINT16(sr, AC97BusMasterRegs),
+        VMSTATE_UINT16(picb, AC97BusMasterRegs),
+        VMSTATE_UINT8(piv, AC97BusMasterRegs),
+        VMSTATE_UINT8(cr, AC97BusMasterRegs),
+        VMSTATE_UINT32(bd_valid, AC97BusMasterRegs),
+        VMSTATE_UINT32(bd.addr, AC97BusMasterRegs),
+        VMSTATE_UINT32(bd.ctl_len, AC97BusMasterRegs),
+        VMSTATE_END_OF_LIST()
     }
 };
 
-static int ac97_post_load (void *opaque, int version_id)
+static int ac97_post_load(void *opaque, int version_id)
 {
     uint8_t active[LAST_INDEX];
     AC97LinkState *s = opaque;
 
-    record_select (s, mixer_load (s, AC97_Record_Select));
-    set_volume (s, AC97_Master_Volume_Mute,
-                mixer_load (s, AC97_Master_Volume_Mute));
-    set_volume (s, AC97_PCM_Out_Volume_Mute,
-                mixer_load (s, AC97_PCM_Out_Volume_Mute));
-    set_volume (s, AC97_Record_Gain_Mute,
-                mixer_load (s, AC97_Record_Gain_Mute));
+    record_select(s, mixer_load(s, AC97_Record_Select));
+    set_volume(s, AC97_Master_Volume_Mute,
+                mixer_load(s, AC97_Master_Volume_Mute));
+    set_volume(s, AC97_PCM_Out_Volume_Mute,
+                mixer_load(s, AC97_PCM_Out_Volume_Mute));
+    set_volume(s, AC97_Record_Gain_Mute,
+                mixer_load(s, AC97_Record_Gain_Mute));
 
     active[PI_INDEX] = !!(s->bm_regs[PI_INDEX].cr & CR_RPBM);
     active[PO_INDEX] = !!(s->bm_regs[PO_INDEX].cr & CR_RPBM);
     active[MC_INDEX] = !!(s->bm_regs[MC_INDEX].cr & CR_RPBM);
-    reset_voices (s, active);
+    reset_voices(s, active);
 
     s->bup_flag = 0;
     s->last_samp = 0;
     return 0;
 }
 
-static bool is_version_2 (void *opaque, int version_id)
+static bool is_version_2(void *opaque, int version_id)
 {
     return version_id == 2;
 }
@@ -1216,15 +1203,15 @@ static const VMStateDescription vmstate_ac97 = {
     .minimum_version_id = 2,
     .post_load = ac97_post_load,
     .fields = (VMStateField[]) {
-        VMSTATE_PCI_DEVICE (dev, AC97LinkState),
-        VMSTATE_UINT32 (glob_cnt, AC97LinkState),
-        VMSTATE_UINT32 (glob_sta, AC97LinkState),
-        VMSTATE_UINT32 (cas, AC97LinkState),
-        VMSTATE_STRUCT_ARRAY (bm_regs, AC97LinkState, 3, 1,
+        VMSTATE_PCI_DEVICE(dev, AC97LinkState),
+        VMSTATE_UINT32(glob_cnt, AC97LinkState),
+        VMSTATE_UINT32(glob_sta, AC97LinkState),
+        VMSTATE_UINT32(cas, AC97LinkState),
+        VMSTATE_STRUCT_ARRAY(bm_regs, AC97LinkState, 3, 1,
                               vmstate_ac97_bm_regs, AC97BusMasterRegs),
-        VMSTATE_BUFFER (mixer_data, AC97LinkState),
-        VMSTATE_UNUSED_TEST (is_version_2, 3),
-        VMSTATE_END_OF_LIST ()
+        VMSTATE_BUFFER(mixer_data, AC97LinkState),
+        VMSTATE_UNUSED_TEST(is_version_2, 3),
+        VMSTATE_END_OF_LIST()
     }
 };
 
@@ -1295,7 +1282,7 @@ static uint64_t nabm_read(void *opaque, hwaddr addr, unsigned size)
 }
 
 static void nabm_write(void *opaque, hwaddr addr, uint64_t val,
-                      unsigned size)
+                       unsigned size)
 {
     if ((addr / size) > 64) {
         return;
@@ -1325,20 +1312,20 @@ static const MemoryRegionOps ac97_io_nabm_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
-static void ac97_on_reset (DeviceState *dev)
+static void ac97_on_reset(DeviceState *dev)
 {
     AC97LinkState *s = container_of(dev, AC97LinkState, dev.qdev);
 
-    reset_bm_regs (s, &s->bm_regs[0]);
-    reset_bm_regs (s, &s->bm_regs[1]);
-    reset_bm_regs (s, &s->bm_regs[2]);
+    reset_bm_regs(s, &s->bm_regs[0]);
+    reset_bm_regs(s, &s->bm_regs[1]);
+    reset_bm_regs(s, &s->bm_regs[2]);
 
     /*
      * Reset the mixer too. The Windows XP driver seems to rely on
      * this. At least it wants to read the vendor id before it resets
      * the codec manually.
      */
-    mixer_reset (s);
+    mixer_reset(s);
 }
 
 static void ac97_realize(PCIDevice *dev, Error **errp)
@@ -1373,13 +1360,13 @@ static void ac97_realize(PCIDevice *dev, Error **errp)
     c[PCI_INTERRUPT_LINE] = 0x00;      /* intr_ln interrupt line rw */
     c[PCI_INTERRUPT_PIN] = 0x01;      /* intr_pn interrupt pin ro */
 
-    memory_region_init_io (&s->io_nam, OBJECT(s), &ac97_io_nam_ops, s,
+    memory_region_init_io(&s->io_nam, OBJECT(s), &ac97_io_nam_ops, s,
                            "ac97-nam", 1024);
-    memory_region_init_io (&s->io_nabm, OBJECT(s), &ac97_io_nabm_ops, s,
+    memory_region_init_io(&s->io_nabm, OBJECT(s), &ac97_io_nabm_ops, s,
                            "ac97-nabm", 256);
-    pci_register_bar (&s->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->io_nam);
-    pci_register_bar (&s->dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &s->io_nabm);
-    AUD_register_card ("ac97", &s->card);
+    pci_register_bar(&s->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->io_nam);
+    pci_register_bar(&s->dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &s->io_nabm);
+    AUD_register_card("ac97", &s->card);
     ac97_on_reset(DEVICE(s));
 }
 
@@ -1395,13 +1382,13 @@ static void ac97_exit(PCIDevice *dev)
 
 static Property ac97_properties[] = {
     DEFINE_AUDIO_PROPERTIES(AC97LinkState, card),
-    DEFINE_PROP_END_OF_LIST (),
+    DEFINE_PROP_END_OF_LIST(),
 };
 
-static void ac97_class_init (ObjectClass *klass, void *data)
+static void ac97_class_init(ObjectClass *klass, void *data)
 {
-    DeviceClass *dc = DEVICE_CLASS (klass);
-    PCIDeviceClass *k = PCI_DEVICE_CLASS (klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->realize = ac97_realize;
     k->exit = ac97_exit;
@@ -1419,7 +1406,7 @@ static void ac97_class_init (ObjectClass *klass, void *data)
 static const TypeInfo ac97_info = {
     .name          = TYPE_AC97,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof (AC97LinkState),
+    .instance_size = sizeof(AC97LinkState),
     .class_init    = ac97_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -1427,11 +1414,11 @@ static const TypeInfo ac97_info = {
     },
 };
 
-static void ac97_register_types (void)
+static void ac97_register_types(void)
 {
-    type_register_static (&ac97_info);
+    type_register_static(&ac97_info);
     deprecated_register_soundhw("ac97", "Intel 82801AA AC97 Audio",
                                 0, TYPE_AC97);
 }
 
-type_init (ac97_register_types)
+type_init(ac97_register_types)
-- 
2.30.2


