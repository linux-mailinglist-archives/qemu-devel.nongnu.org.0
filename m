Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350C432F34B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:55:01 +0100 (CET)
Received: from localhost ([::1]:33534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFbI-0001tT-9e
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:55:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3FHtCYAgKCh0PNA3HMLA9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--wuhaotsh.bounces.google.com>)
 id 1lIFNB-0006rA-IB
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 13:40:25 -0500
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:50033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3FHtCYAgKCh0PNA3HMLA9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--wuhaotsh.bounces.google.com>)
 id 1lIFN7-000739-M8
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 13:40:25 -0500
Received: by mail-qt1-x84a.google.com with SMTP id b7so2367567qtj.16
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 10:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=3b9oo4rWpN6uQHVswbSKBMmKpeNQ+WG47IsHuO1gi5k=;
 b=q7CXpL/FDWuC1+c8oaml2AbVmH+N04c9/vyfdVCajzmw5TvfPLGIQ8AkTbBLIxvJGc
 PAZM+HaAxsPq7H5PE9EVOge9TTyl2M40ryGD8+yOrdmSzmH8yXuhQayOW2w09fJFCgxE
 ugOlmAijaLTFpn2JgXu1kaaAoXLAbZd+PGE597u/uisSpbr5JpWZ9BEWlPEkce0AxU5/
 nlzWH8t6p0IQs1N37/O8u9awyaU7MYpHHxx98EWtv6/m32ap0pBCn1nV4zV6CbZ8nKxj
 h/PEtSQYbqu6q46acmmlc+1BHMjH0FghGB0lke/2jv6RsazDyN8wtiHD9YpONbQUcqmD
 pceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=3b9oo4rWpN6uQHVswbSKBMmKpeNQ+WG47IsHuO1gi5k=;
 b=ZwDmnDQme+rLSVMGATdI2fPBdIACs3rKWhIRd+ZHiiFxj+yegcU+8MZTMFF9hyZpC2
 sYYTYun6LxX/Dvzke6b61YAYHnKlf+84NVszUNEtF33AqcL8ICO6XDKaXRSqomTmRA/A
 +SgJpU/5ZfsikixJR97KJA//SyiodW5Zhw0nSETI9IVCdJXYU/bTADqIq7tOPcfmuR4B
 Rnz/mdy9rJhwkFPQhBZWw51S4yFb3m0UpTEq22ZHxPEv26wQZzuIChsuRwgU8tJrsq32
 OjlTkYvc+06kjN1POgxFNfEl6MU/95MlIeoff3qJ5Cx9hrwkFIa/bTUoeB1qexGhTRHb
 vXMQ==
X-Gm-Message-State: AOAM532Bon21eNbI36B2r2GJZJhl8HUMHQojwg+RTGUgN9kR2kctH1RZ
 yEPw6QoD9Y40rFfMfYYay9JWss8jtPlwFw==
X-Google-Smtp-Source: ABdhPJxEz8z2ZKFbIkiH3ZZHVJ1agFRQ8yyJ6lQpt8waMxQo8yIysgVaxhx7OpD3hJHOG43ezcGpFF7FKaiBkA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a0c:bd2f:: with SMTP id
 m47mr6323567qvg.53.1614969620233; Fri, 05 Mar 2021 10:40:20 -0800 (PST)
Date: Fri,  5 Mar 2021 10:38:57 -0800
In-Reply-To: <20210305183857.3120188-1-wuhaotsh@google.com>
Message-Id: <20210305183857.3120188-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210305183857.3120188-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [PATCH 4/4] tests/qtest: Test PWM fan RPM using MFT in PWM test
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3FHtCYAgKCh0PNA3HMLA9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--wuhaotsh.bounces.google.com;
 helo=mail-qt1-x84a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From:  Hao Wu via <qemu-devel@nongnu.org>

This patch adds testing of PWM fan RPMs in the existing npcm7xx pwm
test. It tests whether the MFT module can measure correct fan values
for a PWM fan in NPCM7XX boards.

Reviewed-by: Doug Evans <dje@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 tests/qtest/npcm7xx_pwm-test.c | 205 ++++++++++++++++++++++++++++++++-
 1 file changed, 199 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index 3d82654b81..72317f4c81 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -45,6 +45,7 @@
 #define PLL_FBDV(rv)    extract32((rv), 16, 12)
 #define PLL_OTDV1(rv)   extract32((rv), 8, 3)
 #define PLL_OTDV2(rv)   extract32((rv), 13, 3)
+#define APB4CKDIV(rv)   extract32((rv), 30, 2)
 #define APB3CKDIV(rv)   extract32((rv), 28, 2)
 #define CLK2CKDIV(rv)   extract32((rv), 0, 1)
 #define CLK4CKDIV(rv)   extract32((rv), 26, 2)
@@ -52,6 +53,49 @@
 
 #define MAX_DUTY        1000000
 
+/* MFT (PWM fan) related */
+#define MFT_BA(n)       (0xf0180000 + ((n) * 0x1000))
+#define MFT_IRQ(n)      (96 + (n))
+#define MFT_CNT1        0x00
+#define MFT_CRA         0x02
+#define MFT_CRB         0x04
+#define MFT_CNT2        0x06
+#define MFT_PRSC        0x08
+#define MFT_CKC         0x0a
+#define MFT_MCTRL       0x0c
+#define MFT_ICTRL       0x0e
+#define MFT_ICLR        0x10
+#define MFT_IEN         0x12
+#define MFT_CPA         0x14
+#define MFT_CPB         0x16
+#define MFT_CPCFG       0x18
+#define MFT_INASEL      0x1a
+#define MFT_INBSEL      0x1c
+
+#define MFT_MCTRL_ALL   0x64
+#define MFT_ICLR_ALL    0x3f
+#define MFT_IEN_ALL     0x3f
+#define MFT_CPCFG_EQ_MODE 0x44
+
+#define MFT_CKC_C2CSEL  BIT(3)
+#define MFT_CKC_C1CSEL  BIT(0)
+
+#define MFT_ICTRL_TFPND BIT(5)
+#define MFT_ICTRL_TEPND BIT(4)
+#define MFT_ICTRL_TDPND BIT(3)
+#define MFT_ICTRL_TCPND BIT(2)
+#define MFT_ICTRL_TBPND BIT(1)
+#define MFT_ICTRL_TAPND BIT(0)
+
+#define MFT_MAX_CNT     0xffff
+#define MFT_TIMEOUT     0x5000
+
+#define DEFAULT_RPM     19800
+#define DEFAULT_PRSC    255
+#define MFT_PULSE_PER_REVOLUTION 2
+
+#define MAX_ERROR       1
+
 typedef struct PWMModule {
     int irq;
     uint64_t base_addr;
@@ -210,19 +254,36 @@ static uint64_t pwm_get_duty(QTestState *qts, int module_index, int pwm_index)
     return pwm_qom_get(qts, path, name);
 }
 
+static void mft_qom_set(QTestState *qts, int index, const char *name,
+                        uint32_t value)
+{
+    QDict *response;
+    char *path = g_strdup_printf("/machine/soc/mft[%d]", index);
+
+    g_test_message("Setting properties %s of mft[%d] with value %u",
+                   name, index, value);
+    response = qtest_qmp(qts, "{ 'execute': 'qom-set',"
+            " 'arguments': { 'path': %s, "
+            " 'property': %s, 'value': %u}}",
+            path, name, value);
+    /* The qom set message returns successfully. */
+    g_assert_true(qdict_haskey(response, "return"));
+}
+
 static uint32_t get_pll(uint32_t con)
 {
     return REF_HZ * PLL_FBDV(con) / (PLL_INDV(con) * PLL_OTDV1(con)
             * PLL_OTDV2(con));
 }
 
-static uint64_t read_pclk(QTestState *qts)
+static uint64_t read_pclk(QTestState *qts, bool mft)
 {
     uint64_t freq = REF_HZ;
     uint32_t clksel = qtest_readl(qts, CLK_BA + CLKSEL);
     uint32_t pllcon;
     uint32_t clkdiv1 = qtest_readl(qts, CLK_BA + CLKDIV1);
     uint32_t clkdiv2 = qtest_readl(qts, CLK_BA + CLKDIV2);
+    uint32_t apbdiv = mft ? APB4CKDIV(clkdiv2) : APB3CKDIV(clkdiv2);
 
     switch (CPUCKSEL(clksel)) {
     case 0:
@@ -241,7 +302,7 @@ static uint64_t read_pclk(QTestState *qts)
         g_assert_not_reached();
     }
 
-    freq >>= (CLK2CKDIV(clkdiv1) + CLK4CKDIV(clkdiv1) + APB3CKDIV(clkdiv2));
+    freq >>= (CLK2CKDIV(clkdiv1) + CLK4CKDIV(clkdiv1) + apbdiv);
 
     return freq;
 }
@@ -267,7 +328,7 @@ static uint32_t pwm_selector(uint32_t csr)
 static uint64_t pwm_compute_freq(QTestState *qts, uint32_t ppr, uint32_t csr,
         uint32_t cnr)
 {
-    return read_pclk(qts) / ((ppr + 1) * pwm_selector(csr) * (cnr + 1));
+    return read_pclk(qts, false) / ((ppr + 1) * pwm_selector(csr) * (cnr + 1));
 }
 
 static uint64_t pwm_compute_duty(uint32_t cnr, uint32_t cmr, bool inverted)
@@ -301,6 +362,28 @@ static void pwm_write(QTestState *qts, const TestData *td, unsigned offset,
     qtest_writel(qts, td->module->base_addr + offset, value);
 }
 
+static uint8_t mft_readb(QTestState *qts, int index, unsigned offset)
+{
+    return qtest_readb(qts, MFT_BA(index) + offset);
+}
+
+static uint16_t mft_readw(QTestState *qts, int index, unsigned offset)
+{
+    return qtest_readw(qts, MFT_BA(index) + offset);
+}
+
+static void mft_writeb(QTestState *qts, int index, unsigned offset,
+                        uint8_t value)
+{
+    qtest_writeb(qts, MFT_BA(index) + offset, value);
+}
+
+static void mft_writew(QTestState *qts, int index, unsigned offset,
+                        uint16_t value)
+{
+    return qtest_writew(qts, MFT_BA(index) + offset, value);
+}
+
 static uint32_t pwm_read_ppr(QTestState *qts, const TestData *td)
 {
     return extract32(pwm_read(qts, td, PPR), ppr_base[pwm_index(td->pwm)], 8);
@@ -351,11 +434,116 @@ static void pwm_write_cmr(QTestState *qts, const TestData *td, uint32_t value)
     pwm_write(qts, td, td->pwm->cmr_offset, value);
 }
 
+static int mft_compute_index(const TestData *td)
+{
+    int index = pwm_module_index(td->module) * ARRAY_SIZE(pwm_list) +
+                pwm_index(td->pwm);
+
+    g_assert_cmpint(index, <,
+                    ARRAY_SIZE(pwm_module_list) * ARRAY_SIZE(pwm_list));
+
+    return index;
+}
+
+static void mft_reset_counters(QTestState *qts, int index)
+{
+    mft_writew(qts, index, MFT_CNT1, MFT_MAX_CNT);
+    mft_writew(qts, index, MFT_CNT2, MFT_MAX_CNT);
+    mft_writew(qts, index, MFT_CRA, MFT_MAX_CNT);
+    mft_writew(qts, index, MFT_CRB, MFT_MAX_CNT);
+    mft_writew(qts, index, MFT_CPA, MFT_MAX_CNT - MFT_TIMEOUT);
+    mft_writew(qts, index, MFT_CPB, MFT_MAX_CNT - MFT_TIMEOUT);
+}
+
+static void mft_init(QTestState *qts, const TestData *td)
+{
+    int index = mft_compute_index(td);
+
+    /* Enable everything */
+    mft_writeb(qts, index, MFT_CKC, 0);
+    mft_writeb(qts, index, MFT_ICLR, MFT_ICLR_ALL);
+    mft_writeb(qts, index, MFT_MCTRL, MFT_MCTRL_ALL);
+    mft_writeb(qts, index, MFT_IEN, MFT_IEN_ALL);
+    mft_writeb(qts, index, MFT_INASEL, 0);
+    mft_writeb(qts, index, MFT_INBSEL, 0);
+
+    /* Set cpcfg to use EQ mode, same as kernel driver */
+    mft_writeb(qts, index, MFT_CPCFG, MFT_CPCFG_EQ_MODE);
+
+    /* Write default counters, timeout and prescaler */
+    mft_reset_counters(qts, index);
+    mft_writeb(qts, index, MFT_PRSC, DEFAULT_PRSC);
+
+    /* Write default max rpm via QMP */
+    mft_qom_set(qts, index, "max_rpm[0]", DEFAULT_RPM);
+    mft_qom_set(qts, index, "max_rpm[1]", DEFAULT_RPM);
+}
+
+static int32_t mft_compute_cnt(uint32_t rpm, uint64_t clk)
+{
+    uint64_t cnt;
+
+    if (rpm == 0) {
+        return -1;
+    }
+
+    cnt = clk * 60 / ((DEFAULT_PRSC + 1) * rpm * MFT_PULSE_PER_REVOLUTION);
+    if (cnt >= MFT_TIMEOUT) {
+        return -1;
+    }
+    return MFT_MAX_CNT - cnt;
+}
+
+static void mft_verify_rpm(QTestState *qts, const TestData *td, uint64_t duty)
+{
+    int index = mft_compute_index(td);
+    uint16_t cnt, cr;
+    uint32_t rpm = DEFAULT_RPM * duty / MAX_DUTY;
+    uint64_t clk = read_pclk(qts, true);
+    int32_t expected_cnt = mft_compute_cnt(rpm, clk);
+
+    qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
+    g_test_message(
+        "verifying rpm for mft[%d]: clk: %lu, duty: %lu, rpm: %u, cnt: %d",
+        index, clk, duty, rpm, expected_cnt);
+
+    /* Verify rpm for fan A */
+    /* Stop capture */
+    mft_writeb(qts, index, MFT_CKC, 0);
+    mft_writeb(qts, index, MFT_ICLR, MFT_ICLR_ALL);
+    mft_reset_counters(qts, index);
+    g_assert_cmphex(mft_readw(qts, index, MFT_CNT1), ==, MFT_MAX_CNT);
+    g_assert_cmphex(mft_readw(qts, index, MFT_CRA), ==, MFT_MAX_CNT);
+    g_assert_cmphex(mft_readw(qts, index, MFT_CPA), ==,
+                    MFT_MAX_CNT - MFT_TIMEOUT);
+    /* Start capture */
+    mft_writeb(qts, index, MFT_CKC, MFT_CKC_C1CSEL);
+    g_assert_true(qtest_get_irq(qts, MFT_IRQ(index)));
+    if (expected_cnt == -1) {
+        g_assert_cmphex(mft_readb(qts, index, MFT_ICTRL), ==, MFT_ICTRL_TEPND);
+    } else {
+        g_assert_cmphex(mft_readb(qts, index, MFT_ICTRL), ==, MFT_ICTRL_TAPND);
+        cnt = mft_readw(qts, index, MFT_CNT1);
+        /*
+         * Due to error in clock measurement and rounding, we might have a small
+         * error in measuring RPM.
+         */
+        g_assert_cmphex(cnt + MAX_ERROR, >=, expected_cnt);
+        g_assert_cmphex(cnt, <=, expected_cnt + MAX_ERROR);
+        cr = mft_readw(qts, index, MFT_CRA);
+        g_assert_cmphex(cnt, ==, cr);
+    }
+
+    /* Verify rpm for fan B */
+
+    qtest_irq_intercept_out(qts, "/machine/soc/a9mpcore/gic");
+}
+
 /* Check pwm registers can be reset to default value */
 static void test_init(gconstpointer test_data)
 {
     const TestData *td = test_data;
-    QTestState *qts = qtest_init("-machine quanta-gsj");
+    QTestState *qts = qtest_init("-machine npcm750-evb");
     int module = pwm_module_index(td->module);
     int pwm = pwm_index(td->pwm);
 
@@ -369,7 +557,7 @@ static void test_init(gconstpointer test_data)
 static void test_oneshot(gconstpointer test_data)
 {
     const TestData *td = test_data;
-    QTestState *qts = qtest_init("-machine quanta-gsj");
+    QTestState *qts = qtest_init("-machine npcm750-evb");
     int module = pwm_module_index(td->module);
     int pwm = pwm_index(td->pwm);
     uint32_t ppr, csr, pcr;
@@ -400,13 +588,15 @@ static void test_oneshot(gconstpointer test_data)
 static void test_toggle(gconstpointer test_data)
 {
     const TestData *td = test_data;
-    QTestState *qts = qtest_init("-machine quanta-gsj");
+    QTestState *qts = qtest_init("-machine npcm750-evb");
     int module = pwm_module_index(td->module);
     int pwm = pwm_index(td->pwm);
     uint32_t ppr, csr, pcr, cnr, cmr;
     int i, j, k, l;
     uint64_t expected_freq, expected_duty;
 
+    mft_init(qts, td);
+
     pcr = CH_EN | CH_MOD;
     for (i = 0; i < ARRAY_SIZE(ppr_list); ++i) {
         ppr = ppr_list[i];
@@ -440,6 +630,9 @@ static void test_toggle(gconstpointer test_data)
                                 ==, expected_freq);
                     }
 
+                    /* Test MFT's RPM is correct. */
+                    mft_verify_rpm(qts, td, expected_duty);
+
                     /* Test inverted mode */
                     expected_duty = pwm_compute_duty(cnr, cmr, true);
                     pwm_write_pcr(qts, td, pcr | CH_INV);
-- 
2.30.1.766.gb4fecdf3b7-goog


