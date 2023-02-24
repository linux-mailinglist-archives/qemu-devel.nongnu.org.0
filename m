Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2EA6A15E7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 05:31:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVPiz-00074C-Tv; Thu, 23 Feb 2023 23:30:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVLqT-0005RF-RH
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:21:53 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVLqS-0000Cl-9F
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:21:53 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 70C5E5C01AE;
 Thu, 23 Feb 2023 19:21:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 23 Feb 2023 19:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1677198109; x=1677284509; bh=mh
 PfI2B83HcaOVUPGacb7vOqA72CJmYkLPX8XYkeom4=; b=GElvW12r+wdX1fhn47
 TSSX9I8dcBhKc4vbkLf654lV0VIRfFP7pONmqGKad6SnQXXmD9F35yTHhL5XuIIP
 qpkbv9xJjPwzBYIu16HpAO2jGMdTu9hc0xdiTFICHTnnB+0uQxThJr/beRX1u9V3
 Zr4p4AByezG2sswZGtn54nLwYjO/zgED2/mRJduI0wNj+LsI5FK+lhAA2HYGiJg+
 6FqnS1sB3fbeV+EwoGLEolb5UszYsiIk5Gh3lhDR/l0ZoVDPQTMt9GGFkgGkaapc
 tI9eG14R0vvFp/W9MAESRfCvdJYhnx/BQbe3TtUYOCpCXKVQBw5Q8dbWusoZ+EuT
 /ouw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1677198109; x=1677284509; bh=mhPfI2B83HcaO
 VUPGacb7vOqA72CJmYkLPX8XYkeom4=; b=gImZQdmFrMmqv32F0P4w9otoeX43k
 ZyoIM4SeZpBqDYW28YOuqUlsZ9HcPZhgOqbMSSpGU7cT+YluC+YXd92ACfzrnJ4t
 nFSH3PxzG6YDSnqEzJuX+lEaa8Jz1uDtX7KvJDk/Q6NIN/cgZykkX/LQ0deuIB5q
 /HpiwE8ZHOi+0KBzaNz2OKrpkqvbP2u5BSSITqtrWtBmsaerEZhakwrbup1kJAph
 NQfv3yupfROZZng2kpRia5wiqi0piZJ4T+SX+/Q2o71zU4LBE88PEZC3eh3kDU2x
 viODvbGZneQ8qW+VPgc+VnwWfDHEwNBcD53k6cYDr/4kDpE+ejE6WUCZQ==
X-ME-Sender: <xms:HQP4Y3rzVB1m2GIhw1-V3b06zekQiy9dSpy81x__GvXyEL6NsFlyaw>
 <xme:HQP4YxpjWVhhRWyit4Di3Upu9YIxveUp_ElU3usV0I4ZRczCoC0CH50_DqG3ZGDo5
 efulqDd5t_KyOpk_w>
X-ME-Received: <xmr:HQP4Y0PmcMyskWy37PV7HcetHyNiZKHZ95wJvaYpPp1GiOJdpz8yvRmkPriPSfTm366i-tTb2kEYZ-NoAKchbM8Vk0UW-fd5l5FQN6juoMo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekvddgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredt
 tdenucfhrhhomhepffgrnhhivghlucgiuhcuoegugihusegugihuuhhurdighiiiqeenuc
 ggtffrrghtthgvrhhnpefgkeduleekhfetvefhgefgvdegfeejfefguedvuddthffggffh
 hedtueeuteefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:HQP4Y66omR80fUNm8vrWSkoYLG9mOPO993jiR7emX2wwBcdHAB0qCg>
 <xmx:HQP4Y27qpCIoHa5xqJgNrjFVS03kYY91Uywhwjg8dDWomYoaH8nqZQ>
 <xmx:HQP4YyhBJe3ki9ieoWuZBS552DPd0iWr2_1Q3cCw2wQWYsvHK52OMw>
 <xmx:HQP4Y8TbDxHM-QraQ6_lNsEbjdyexBmbZovBesTSkZIhGGzR_los9w>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 19:21:48 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH 1/3] qga: test: Use absolute path to test data
Date: Thu, 23 Feb 2023 17:21:30 -0700
Message-Id: <d4b8f60e02ae9f6fd12f2d05feae3c903cfe9e82.1677197937.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677197937.git.dxu@dxuuu.xyz>
References: <cover.1677197937.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=dxu@dxuuu.xyz;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Feb 2023 23:30:19 -0500
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

It looks like qga's working directory is in a tempdir. So the relative
path that the test case gives qga through the QGA_OS_RELEASE=
env variable does not resolve correctly.

Fix by doing a poor man's path canonicalization of the test data file.

Note we cannot use g_canonicalize_filename() b/c that helper was only
introduced in glib 2.58 and the current GLIB_VERSION_MAX_ALLOWED is
pinned to 2.56.

Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
---
 tests/unit/test-qga.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index b4e0a14573..9d8e1d1cd3 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -881,13 +881,16 @@ static void test_qga_guest_get_osinfo(gconstpointer data)
 {
     TestFixture fixture;
     const gchar *str;
+    g_autofree const gchar *cwd;
     g_autoptr(QDict) ret = NULL;
     char *env[2];
     QDict *val;
 
+    cwd = g_get_current_dir();
     env[0] = g_strdup_printf(
-        "QGA_OS_RELEASE=%s%c..%cdata%ctest-qga-os-release",
-        g_test_get_dir(G_TEST_DIST), G_DIR_SEPARATOR, G_DIR_SEPARATOR, G_DIR_SEPARATOR);
+        "QGA_OS_RELEASE=%s%c%s%c..%cdata%ctest-qga-os-release",
+        cwd, G_DIR_SEPARATOR, g_test_get_dir(G_TEST_DIST), G_DIR_SEPARATOR,
+        G_DIR_SEPARATOR, G_DIR_SEPARATOR);
     env[1] = NULL;
     fixture_setup(&fixture, NULL, env);
 
-- 
2.39.1


