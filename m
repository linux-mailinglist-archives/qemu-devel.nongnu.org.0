Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DE46BB4A5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 14:30:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcRCB-0007aI-4t; Wed, 15 Mar 2023 09:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlmgr@proulx.com>) id 1pcQE6-0005QZ-DH
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 08:27:30 -0400
Received: from havoc.proulx.com ([96.88.95.61])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlmgr@proulx.com>) id 1pcQE3-0005UF-9M
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 08:27:29 -0400
Received: by havoc.proulx.com (Postfix, from userid 1027)
 id 3B1385F1; Wed, 15 Mar 2023 06:27:26 -0600 (MDT)
Resent-From: Mailing List Manager <mlmgr@proulx.com>
Resent-Date: Wed, 15 Mar 2023 06:27:26 -0600
Resent-Message-ID: <ZBG5rrYam0Wt0h6M@havoc.proulx.com>
Resent-To: qemu-devel@nongnu.org
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pcFyQ-0006Kr-Ty
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 21:30:39 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pcFyO-0004A5-7N
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 21:30:37 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id EDCC111F0FA
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 01:30:34 +0000 (UTC)
From: ~titilola <titilola@git.sr.ht>
Date: Wed, 08 Mar 2023 11:35:04 +0100
Subject: [PATCH sr.ht-doc 1/1] terms.md: correct style issues
Message-ID: <167884383472.9850.12127047301168078603-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <167884383472.9850.12127047301168078603-0@git.sr.ht>
To: QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_action: no action
X-Listhelper-Id: 20230314193108-23988
X-Bogosity: Spam, tests=bogofilter, spamicity=1.000000, version=1.2.5
X-CRM114-Status: SPAM  (  -5.64  )
Received-SPF: pass client-ip=96.88.95.61; envelope-from=mlmgr@proulx.com;
 helo=havoc.proulx.com
X-Spam_score_int: 28
X-Spam_score: 2.8
X-Spam_bar: ++
X-Spam_report: (2.8 / 5.0 requ) BAYES_05=-0.5, FREEMAIL_FORGED_REPLYTO=2.095,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, HK_RANDOM_ENVFROM=0.999,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Mar 2023 09:29:31 -0400
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
Reply-To: ~titilola <oluwafunhmi@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Drew DeVault <sir@cmpwn.com>

Does not change the semantic or legal meaning of the terms.
---
 terms.md | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/terms.md b/terms.md
index d47de99..3d51afe 100644
--- a/terms.md
+++ b/terms.md
@@ -85,7 +85,7 @@ When uploading content to SourceHut, you must have the righ=
t to do so. You grant
 SourceHut sufficient rights for the operation of the services in relation to
 your content, such as the right to display the content on the website. These
 rights are revoked upon the removal of your content from our services. We may
-retain your content in system (e.g. for backups) for up to six weeks, but it
+retain your content in our system (e.g. for backups) for up to six weeks, bu=
t it
 will not displayed on our website during this period.
=20
 If you own the copyright for the content you upload, these rights are granted
@@ -97,9 +97,9 @@ have not received a suitable license.
 *"Free software" and "open source" licenses (defined respectively by the Free
 Software Foundation and the Open Source Initiative) provide for these rights=
, as
 well as all Creative Commons licenses. Other licenses may or may not provide
-these rights, and it is your responsibility to check.
+these rights, and it is your responsibility to check.*
=20
-You are encouraged to add a free software license to your project. [Read our
+*You are encouraged to add a free software license to your project. [Read our
 recommendations here](https://man.sr.ht/license.md).*
=20
 You may request an archive of all of your content on the service by writing =
an
--=20
2.34.7


