Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F012E2407
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 04:21:57 +0100 (CET)
Received: from localhost ([::1]:47946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksHCO-0004Mw-F3
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 22:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH9I-0001js-P4
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:45 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:42719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH9F-0003gu-50
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:44 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 74C0158037F;
 Wed, 23 Dec 2020 22:18:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 23 Dec 2020 22:18:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 gRq/lWzmDb1ZoTgIPUIUxeQUs3mr1jtWNyEoDlXS4o8=; b=vBOSIKNr3Tmc2gVh
 4SCdfyCZit4umfhebTnO4hmUbpUcL7p3awWbrVDwrlbaN8z68vPLYxxoLzLd/mRA
 Vbn2Tc/yGJyf1T4t6cZUIICSoi+5a/vRLnz2Sl6tXs7bc4pf7N24CoB2f8kbSsZb
 6QAwB1vMl0ZCRAYNEAyUM7gHAKKUgd0OsFB5mlEcESZPiiHJWa5QWit3OyJ7L93y
 siXo3Yysc87BnRh1rFvms+HkOm51Jfi4mi3B9Uuaazap7P/zgiuxi4wXg7DZBgjW
 gVnd8lvPZgpeE3aPZQN9/IdRZ/RxNv0edJXUFclNGEH/Stlz8kgDDk88kIevXzAZ
 FPSejg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=gRq/lWzmDb1ZoTgIPUIUxeQUs3mr1jtWNyEoDlXS4
 o8=; b=N5axCj8mkRfn0rbTwzOV/CXtSJlBkzAwd2aPGNiA6qKIpr3msI3un+MDY
 kKGOcvi5DrXvZwXmokvis6HnWnQzhWdGZr4yup6ceBMAybs5e87ukBspFjoj7D0J
 iLoPP7+s0r85U8VOjNg6dIcLEz//1Gj5mUF6Oiovmr/2kOigS9pqdo49Ma6Pjw36
 jP5kdm1w8mEtI1Mkyin6CjaJ2nJ5LrvyzXt2mqbMsnqYSs/1v9n03fzHzmU+kwOx
 4MIX0A7yfmJBensr+kMgTG90uaKN3nmspC67xxXsGOx4mVyujiVU2Zlb99ezKoaf
 9/Cz8w+RkwDJLdlwsrRV82975UznQ==
X-ME-Sender: <xms:jwjkX6YNcAHpomwIsQYfPp2Qefqzw6HeRuL-ey9AIU4mDVlZjp1ytQ>
 <xme:jwjkX9YP9xnBp_tEcm_L9V7shRiHYZfeo5RcPouKyDmjIwYerK-BwtPLEvV6hjZFb
 TwvVcmC9ky_T5lkQ6s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtkedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeehuddvtedtleehhefggeevteekkefhjedvjedtgfeugfekjedt
 vdevueejveekleenucfkphepvddvfedruddtgedrvdduvddrheelnecuvehluhhsthgvrh
 fuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:jwjkX09aFCsjTrftk0mZ8KaosCmT2CPvBc-6LmjbK12NvT4ZKT3Mfg>
 <xmx:jwjkX8rZhKjOH-AoCNnWD8VEfEt3-bq-6rdl2-XTgUt7-j6cGqX2KQ>
 <xmx:jwjkX1r7t0ojM-gzLgdZt2swCaOfhej0ezbJsG6zMRqgN5N9yxC84g>
 <xmx:kAjkX2noj6nxwioeLZp1gBJ9Kuv3gyYzStLdiPg9T4KS8PjCuTSHhV4weGQ>
Received: from localhost.localdomain (unknown [223.104.212.59])
 by mail.messagingengine.com (Postfix) with ESMTPA id BA4031080059;
 Wed, 23 Dec 2020 22:18:35 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/8] hw/mips/fuloong2e: Correct cpuclock env
Date: Thu, 24 Dec 2020 11:17:48 +0800
Message-Id: <20201224031750.52146-7-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
References: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=66.111.4.229;
 envelope-from=jiaxun.yang@flygoat.com; helo=new3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was missed in 3ca7639ff00 ("hw/mips/fuloong2e:
Set CPU frequency to 533 MHz"), we need to tell kernel
correct clocks.

Fixes: 3ca7639ff00 ("hw/mips/fuloong2e: Set CPU frequency to 533 MHz").
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/fuloong2e.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index c4843dd15e..2744b211fd 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -100,7 +100,7 @@ static void GCC_FMT_ATTR(3, 4) prom_set(uint32_t *prom_buf, int index,
     va_end(ap);
 }
 
-static uint64_t load_kernel(CPUMIPSState *env)
+static uint64_t load_kernel(MIPSCPU *cpu)
 {
     uint64_t kernel_entry, kernel_high, initrd_size;
     int index = 0;
@@ -159,7 +159,7 @@ static uint64_t load_kernel(CPUMIPSState *env)
     }
 
     /* Setup minimum environment variables */
-    prom_set(prom_buf, index++, "cpuclock=100000000");
+    prom_set(prom_buf, index++, "cpuclock=%u", clock_get_hz(cpu->clock));
     prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_size / MiB);
     prom_set(prom_buf, index++, NULL);
 
@@ -304,7 +304,7 @@ static void mips_fuloong2e_init(MachineState *machine)
         loaderparams.kernel_filename = kernel_filename;
         loaderparams.kernel_cmdline = kernel_cmdline;
         loaderparams.initrd_filename = initrd_filename;
-        kernel_entry = load_kernel(env);
+        kernel_entry = load_kernel(cpu);
         write_bootloader(env, memory_region_get_ram_ptr(bios), kernel_entry);
     } else {
         filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
-- 
2.29.2


