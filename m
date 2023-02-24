Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC536A15E5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 05:31:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVPjC-000765-Pu; Thu, 23 Feb 2023 23:30:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVM3C-00067P-LC
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:35:02 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVM3A-0003mP-OS
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:35:02 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1D9175C01B5;
 Thu, 23 Feb 2023 19:35:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 23 Feb 2023 19:35:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1677198900; x=1677285300; bh=mh
 PfI2B83HcaOVUPGacb7vOqA72CJmYkLPX8XYkeom4=; b=ZMLweERl4UwvNHxyP3
 kBSCzJZDP1kkCJIexh8DM+3mqcy0puLtQ1k3bJFKKHViYi2Fxuw8nqSmrHYC2gfr
 zA52o9DU7QoMz3cndW5+LgkGVhoABz79SqXg/xYhse2PhUo1JPmUiS1ZvIS2t3K+
 OLBzZtwXGJ42LY4IOvYVOM/FBe3o9QSLgOCuT9ztToizAMHUUyurHH01hBsrTE8+
 BB4O1YI3Wcn+bPvcugNbCqRBV2Cvta/XUhmRM5ddLaLm41WI8gDA7k0OS2g/ga1A
 c8vf2YejWqbNg02WtE/UPCWt/SQYudiIowOV0uKBS38F1pVMIXbTvzZedkDnOYI0
 kU1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1677198900; x=1677285300; bh=mhPfI2B83HcaO
 VUPGacb7vOqA72CJmYkLPX8XYkeom4=; b=d72HPIIdKBc6djtXICyFz0ZSVPCHP
 MVrzn/FBn2KwllMcyRdlV5e11Zax43xvsXieepJiM6WDW9JweTR1ksmyta1ZIB5X
 Wu14yUM0uSvT0l1iepgJnmzsUQvXcymO4C23g4CpoxgvVy2wpuQTFUZkT3ZMgGgk
 DqVBWSnSsFw/ID3nDdlHdZqXEmCaG2dTLKtBEenYG/sROWZI9BmrvQXzPNL+DFgs
 2/SqHsuy27H/pbkQpyixgEEohxnImbg8UziAQHnRi31LRR0pGsCufX7DnPmkl+/5
 NwltQJIgbKPv7d4uqJKuHMEErQo+GblKSS2nDAsM8iG3WLgrz3yiLuBPw==
X-ME-Sender: <xms:Mwb4Y4RYx7qQFHyLw9GvWtMvbkAafj02RUvD6GrGxgn9qGftPNexoQ>
 <xme:Mwb4Y1xkDfoQ6yaCD9IwUZgtQNl82gGVqVQHuoskoV1QDUR4CoBFvmUUqLXOjHQQR
 usQnTUfn9lzgzno4Q>
X-ME-Received: <xmr:Mwb4Y127DsSjwX86o1obYfJNgufCYoPlHHJxtLxZeJ48WOZoPRk5dXfluaXNYaiPxkGZWUSQunNF5EBdV5hLFyaxtrxEqFkjoroaIcRpeUs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekvddgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghnihgvlhcuighuuceo
 ugiguhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepgfefgfegjefhudeike
 dvueetffelieefuedvhfehjeeljeejkefgffeghfdttdetnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:NAb4Y8DAOltdWLcdmG8dxCbtU2tQb1HYUN7dZ4pR-qSHPiiRecylTA>
 <xmx:NAb4YxhWdA4w2MKHGs2bftKmkhE83qE-fs3NzgR52RqczT_cLvjvCg>
 <xmx:NAb4Y4rU6FsFTmFfu6cFnem1xR1XsteuxW10lM982eXLhr52yUoCxg>
 <xmx:NAb4YxYkYXcjuQGM-uzGjQZQFQ5FQFTsEQmhWWw1uTl1ePqDLh2tXw>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 19:34:59 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: michael.roth@amd.com,
	kkostiuk@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH 1/3] qga: test: Use absolute path to test data
Date: Thu, 23 Feb 2023 17:34:33 -0700
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
X-Mailman-Approved-At: Thu, 23 Feb 2023 23:30:30 -0500
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


