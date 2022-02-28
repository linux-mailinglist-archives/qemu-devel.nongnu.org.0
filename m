Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA25C4C6F26
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:18:05 +0100 (CET)
Received: from localhost ([::1]:49910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgqi-0000EZ-U6
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:18:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1nOaVH-00021I-Mh
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:31:31 -0500
Received: from mail-b.sr.ht ([173.195.146.151]:58208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1nOaVF-0003pM-D3
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:31:31 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 8C9CC11EE9A;
 Mon, 28 Feb 2022 07:31:26 +0000 (UTC)
From: ~ubzeme <ubzeme@git.sr.ht>
Date: Mon, 28 Feb 2022 15:22:41 +0800
Subject: [PATCH qemu-web] move 'clear: both;' in #footer from
 'style-desktop.css' to 'style.css'
Message-ID: <164603348631.2878.220047881399749656-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Feb 2022 09:07:40 -0500
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
Reply-To: ~ubzeme <ubzeme@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yan-Jie Wang <ubzeme@gmail.com>

This fixes the mobile version of the website.

Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/5
Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 assets/css/style-desktop.css | 9 ---------
 assets/css/style.css         | 1 +
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/assets/css/style-desktop.css b/assets/css/style-desktop.css
index 90a154d..241d835 100644
--- a/assets/css/style-desktop.css
+++ b/assets/css/style-desktop.css
@@ -98,15 +98,6 @@
 		margin-top: -0.2em;
 	}
=20
-/***************************************************************************=
******/
-/* Footer                                                                   =
     */
-/***************************************************************************=
******/
-
-	#footer
-	{
-		clear: both;
-	}
-
 /***************************************************************************=
******/
 /* Featured                                                                 =
     */
 /***************************************************************************=
******/
diff --git a/assets/css/style.css b/assets/css/style.css
index aede79a..779b111 100644
--- a/assets/css/style.css
+++ b/assets/css/style.css
@@ -504,6 +504,7 @@
 	#footer
 	{
 		position: relative;
+		clear: both;
 	}
=20
 	#footer a
--=20
2.34.1

