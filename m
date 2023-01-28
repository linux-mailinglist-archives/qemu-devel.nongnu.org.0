Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C2967F524
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 07:06:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLeLg-0002MK-4y; Sat, 28 Jan 2023 01:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pLeLe-0002LP-Ab; Sat, 28 Jan 2023 01:05:58 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pLeLc-0007WH-MH; Sat, 28 Jan 2023 01:05:58 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 83FCF5C0113;
 Sat, 28 Jan 2023 01:05:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sat, 28 Jan 2023 01:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674885955; x=
 1674972355; bh=NP/ZhOqWE80vJNTYapWYBX2e580uJYMFdH8GQpi9ub4=; b=y
 2cH+sHRQY8mlQWI9uO5qu+yzgIaApjc1UPH8EtoQDmgfOL5enE2SEx8e0UpuU4B7
 0HUPpReHScgerZOqbtrFVL8ej8VWC4Abau+9QYr/139Ef5ARBOmeHdt/AFfOX1DA
 BImjt421yeHH3ahvqaidqsAVVWl6HaMxHRXF/nLbJCuvGtbMgiVFmr5tmEkFXEOQ
 bncZW/6B8csqFIKTcZacOpV8Zv9CFwJNzogYYiLialhv3P4usagM6454iufUuwGs
 0oZIXeROabiD9BoZfuUBmz9+yz7W9cLdc74M37bVWRl+tKZ8Ta0GU/IXUbxvOdUg
 fj7epv8w++/gZ3T2jDslQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674885955; x=
 1674972355; bh=NP/ZhOqWE80vJNTYapWYBX2e580uJYMFdH8GQpi9ub4=; b=Y
 6g8+i+wsp3nTmsVFefT6g8NdcZuJKtGSI9UaouOv+wc+IsnRFUiye+UIZ62n/RTp
 hEmDfF3it6Efda6dDMXmd6XGW6oDzDBu4AqBWamSq1oogQKDE0imeDpiZ+gTn2Dn
 oU9rHUVnWnKRSBs/njz07MZB0MTiaUUxQvEW3oMS8ooOhzwyxGMEz+eyE8NDRnmH
 d2nbz7MkdqVniUz6xStS9wh6jShqTHSjz84DgzZ4UuFv+jjzpIDvHMfjXhYqUEsm
 6F3J5Bp+8NsQeNa2RHC+m3RAwpsonsLPME9oYdR6pBKZCTzaOOr1RH2NEqxtZ8sb
 bqN0+6eKejuSNAizPV6+Q==
X-ME-Sender: <xms:Q7vUY7mvHEhlI2B-NmNEo1x0aCgEhQk3ONM0eUC5kTs7qyjeNlV49g>
 <xme:Q7vUY-0jmS7MbiVmwqwZoDvc0vmtEBKLzcv2WqySQrJsRUjldQ8a-QCSFzeS6_ctT
 YKLe_3bHJNg1E8GAqo>
X-ME-Received: <xmr:Q7vUYxqSVwlap4_QY_LOuzZdJ4fBOK_xSntOCT2YpBMzXHFciYRfyRAaL5I5vwFbSOf-HKhcJ6ypSim5AVTFAwhb93d4GnFyUwp-eiqGiCE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvjedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhggtgfgseht
 keertdertdejnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvg
 hrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpedvhfevvefhtddvueevudelvedt
 ieehvdejjeeuvedtudegjeeileetheekgfeggeenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:Q7vUYzn9Zygp0EN0eRKiTzxPf_wqAbX6fSjYE3kpfuLKksK1LqvB9A>
 <xmx:Q7vUY53Ll7wngsNs4_-TVenTTIq7Qq1LZfxoGfQOwCtuQp7DTVmYqA>
 <xmx:Q7vUYytcMwkZPVtNBxFgZNEH98YuQAxZLGU8Ucbv1n45TM3zZk8GLg>
 <xmx:Q7vUYzzeSk10o0yluaWoex2ZOZ1VMjOy6gPmpJHwLMKHEjU3ybCdJQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Jan 2023 01:05:54 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org,
 cminyard@mvista.com
Subject: [PATCH v5 5/5] hw/nvram/eeprom_at24c: Make reset behavior more like
 hardware
Date: Fri, 27 Jan 2023 22:05:43 -0800
Message-Id: <20230128060543.95582-6-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230128060543.95582-1-peter@pjd.dev>
References: <20230128060543.95582-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=peter@pjd.dev;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

EEPROM's are a form of non-volatile memory. After power-cycling an EEPROM,
I would expect the I2C state machine to be reset to default values, but I
wouldn't really expect the memory to change at all.

The current implementation of the at24c EEPROM resets its internal memory on
reset. This matches the specification in docs/devel/reset.rst:

  Cold reset is supported by every resettable object. In QEMU, it means we reset
  to the initial state corresponding to the start of QEMU; this might differ
  from what is a real hardware cold reset. It differs from other resets (like
  warm or bus resets) which may keep certain parts untouched.

But differs from my intuition. For example, if someone writes some information
to an EEPROM, then AC power cycles their board, they would expect the EEPROM to
retain that information. It's very useful to be able to test things like this
in QEMU as well, to verify software instrumentation like determining the cause
of a reboot.

Fixes: 5d8424dbd3e8 ("nvram: add AT24Cx i2c eeprom")
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
---
 hw/nvram/eeprom_at24c.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 05598699dc2b..3328c3281435 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -184,18 +184,6 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
     }
 
     ee->mem = g_malloc0(ee->rsize);
-
-}
-
-static
-void at24c_eeprom_reset(DeviceState *state)
-{
-    EEPROMState *ee = AT24C_EE(state);
-
-    ee->changed = false;
-    ee->cur = 0;
-    ee->haveaddr = 0;
-
     memset(ee->mem, 0, ee->rsize);
 
     if (ee->init_rom) {
@@ -213,6 +201,16 @@ void at24c_eeprom_reset(DeviceState *state)
     }
 }
 
+static
+void at24c_eeprom_reset(DeviceState *state)
+{
+    EEPROMState *ee = AT24C_EE(state);
+
+    ee->changed = false;
+    ee->cur = 0;
+    ee->haveaddr = 0;
+}
+
 static Property at24c_eeprom_props[] = {
     DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
     DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
-- 
2.39.0


