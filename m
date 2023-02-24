Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84896A15E8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 05:31:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVPjH-00077G-Fx; Thu, 23 Feb 2023 23:30:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVNSq-0001qQ-2J
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 21:05:36 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVNSo-0007Ot-3r
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 21:05:35 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C13955C019D;
 Thu, 23 Feb 2023 21:05:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 23 Feb 2023 21:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1677204332; x=1677290732; bh=mh
 PfI2B83HcaOVUPGacb7vOqA72CJmYkLPX8XYkeom4=; b=jaPZy10UFMUPZcZYAR
 ozlAi1KNQoBXHAxlgRe6hVeY4gNwbLDYNrfpwUfXlsXtJc49MbU7pZf4TF+hap3W
 WNq8zA+0gOH4CtErpihOtvNyWQjhcirJ5fMcKIlHRbRTKFIZPG6F/kwwVdB0+gSW
 nMEba0wLE075mqWzoXHyr1vgGfBCdQ/UodQlNM4pSHx5WGcgePu72xTV8NRYtsvJ
 8BjBBjU+xoD3ipowtGU0LtAh00zx16ZlHZ6dMtW+FDedoHQfELEi6YK9NwJ01KbC
 lopn40/zJHlkeqShgzkKRuv17DIs+k4FlkDolsLngMYz3m5nXMKD5wQez2XIILLP
 FWHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1677204332; x=1677290732; bh=mhPfI2B83HcaO
 VUPGacb7vOqA72CJmYkLPX8XYkeom4=; b=rH0NwMxR+uHxEPmtP9AZ02GHJA6qW
 60ganFYDcyAdwL4+thLyUT011wtAwhCZCyNjvDElyqRLD/+ZOjgp1NksbpmXneKi
 Qv9oGDEsq47bSw6IRhPgcbbgEil/DzmxNWj6cbT0o80YJM8pRMPDvFgEnD2uuKtf
 HukrCxNJY1iFvB0Sd+O2+impBHBLlx2UECxSfVrLOZ4qrdyggTp3m9yzcGAorwPD
 1QM7uji6T7/s8afZA1le7ha+oKfCQhkNSK2cSA7LMaEh+0jUdWPNAAFbT1i7QTN3
 8G7gLa3/+lLh5Dqs7U+dKWUuITMy2CtLowaGFK5MW0Kd7SGZK2FHHwoWg==
X-ME-Sender: <xms:bBv4Y53FyGNsvjSyaju7WQt_GTvxMKOBPq_SdC1lbHPK5Ax1jHTsow>
 <xme:bBv4YwFOuXhrQDryAw06QOdpsRrnBYpyw7de2Y1g1WiPu_fa6mPONDdRFQtgWgosI
 LB1kcY9Ohlo7XgKpA>
X-ME-Received: <xmr:bBv4Y550R6EWZp_Hdq3xBCZLs1ADgQEg4Jo6Jcpt8ctY4qQj194aPyoK6Y5XQREWUbDt5lwoPEN9AVfG4Zy5bwETA_60jY74VAS4CTx4xlE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekvddgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghnihgvlhcuighuuceo
 ugiguhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepgfefgfegjefhudeike
 dvueetffelieefuedvhfehjeeljeejkefgffeghfdttdetnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:bBv4Y20Hvqj7ZIRDsBLHQqZXVSqYnatVO4wq5OLenYB1I7mwLUgUXg>
 <xmx:bBv4Y8HbVC4o4TlgvXBVJHOjDJPxridxOu-Dseq3l20YwP0lHdKipw>
 <xmx:bBv4Y3-TY2y3dGItLlefxW6FZk_ROcIC9JucI1K2R6NXDVB8oZMacQ>
 <xmx:bBv4YxRAHQxC_vNlUaNEui7A2DfPvO_beaDQS2KqHlvMP2ifFZ2P9w>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 21:05:32 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: michael.roth@amd.com,
	kkostiuk@redhat.com
Cc: qemu-devel@nongnu.org,
	dxu@dxuuu.xyz
Subject: [PATCH 1/3] qga: test: Use absolute path to test data
Date: Thu, 23 Feb 2023 19:05:13 -0700
Message-Id: <d4b8f60e02ae9f6fd12f2d05feae3c903cfe9e82.1677197937.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677197937.git.dxu@dxuuu.xyz>
References: <cover.1677197937.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=dxu@dxuuu.xyz;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Feb 2023 23:30:41 -0500
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


