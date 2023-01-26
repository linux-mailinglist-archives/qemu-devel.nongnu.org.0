Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B125E67C5C1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 09:31:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKxeQ-0004O5-CP; Thu, 26 Jan 2023 03:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pKsIZ-0007zd-Ga
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 21:47:36 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pKsIW-0002VN-OK
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 21:47:35 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id C23CD11EEC6;
 Thu, 26 Jan 2023 02:47:31 +0000 (UTC)
From: ~gurjeet <gurjeet@git.sr.ht>
Date: Wed, 25 Jan 2023 18:12:05 -0800
Subject: [PATCH qemu 1/1] Remove a stray "@end table" marker
Message-ID: <167470125128.13083.10933855577484761075-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <167470125128.13083.10933855577484761075-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: Gurjeet <gurjeet@singh.im>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 26 Jan 2023 03:30:28 -0500
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
Reply-To: ~gurjeet <gurjeet@singh.im>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Gurjeet Singh <gurjeet@singh.im>

Signed-off-by: Gurjeet Singh <gurjeet@singh.im>
---
 docs/system/cpu-models-x86.rst.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-x86.=
rst.inc
index 7f6368f999..261da6e21d 100644
--- a/docs/system/cpu-models-x86.rst.inc
+++ b/docs/system/cpu-models-x86.rst.inc
@@ -25,7 +25,7 @@ Two ways to configure CPU models with QEMU / KVM
     typically refer to specific generations of hardware released by
     Intel and AMD.  These allow the guest VMs to have a degree of
     isolation from the host CPU, allowing greater flexibility in live
-    migrating between hosts with differing hardware.  @end table
+    migrating between hosts with differing hardware.
=20
 In both cases, it is possible to optionally add or remove individual CPU
 features, to alter what is presented to the guest by default.
--=20
2.34.5

