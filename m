Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6960E58A149
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 21:33:36 +0200 (CEST)
Received: from localhost ([::1]:32944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJgb9-0002Qi-4r
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 15:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJgQZ-0006UH-QO; Thu, 04 Aug 2022 15:22:40 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:57981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJgQJ-0002iE-B0; Thu, 04 Aug 2022 15:22:39 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MhULz-1nppmr20qB-00eai2; Thu, 04
 Aug 2022 21:22:18 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 1/5] README.rst: fix link formatting
Date: Thu,  4 Aug 2022 21:22:12 +0200
Message-Id: <20220804192216.1958922-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220804192216.1958922-1-laurent@vivier.eu>
References: <20220804192216.1958922-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hpDY0PSgfw/G9x95zyzQtAUkmrxRSENPt5WYREAuQQDqI5y+54M
 9zRKMxEt2R88Vn5Na1HRIdvVMLwBfV7fDcjU7DjDpAz5NXk3lfNyXBYcElB/2Un4+iudA/S
 1/pB6U+6v5yfI6ern2iMMrF1V5iuhQVTPWlcDUOitEyCGQxi6y8nvLGSR5WOojplNL1oISg
 2ONfZJQCf6KcYoXW7Tg4A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AeuhumDlzJc=:orVx78OHAOSVNLnaNvB1Cx
 us9BpWCc/3YmXbiPFFMnYYnXrviWASPFaU3a3YnP0CM4/E0TE1mg4yiFNv5gBqEBwmZrysn+1
 RwGZfwqgM9202dhvrRtaKN6TkO1aCvXoFtT/BzJJIVEKwr6uaV/XpThElEwY9IEoFc066/i8l
 iPWcSTRuk/dJGRq2qNGMHseyenUhs95Z5xDv0nGzJ4UeLTQ83xkZOsjUUEWz/ancZIynoNW5j
 6XL4QVQ7bhuo7o/p7lR6vBakghwXc/aXHPs+b7W3Ax7sgHQqlnI2ARpRv8Cp/6CnTbGYdpFMs
 weBxHVBxdIgdutXqjvGRxMKR9ueAHlgcEyQ7wOgH4vmweqQsqiGDsiMPR/zi+Oxznj44v4gxN
 XAVc6KT2/06g5pR6+zFs+lM0qJ/O/7RNFaC0HQwdL44RzdgkMCiYcni8+e6xq6FrgUm/tlRFM
 oKdCSfO+O8t+GlD86WcmZWjtrpWcErOCzLpq7HhfNECTdTUiD3tC/w9zCGcR1QpwwcJMd60zo
 HV9G1R1wnpJBLdd2bGC6L/p8arXXHLS6Cn9ktDFbZDGbod8099v4fgLp7Zv9YJTkoza4RxdQ9
 6wmYI+QQrdyQa1+LMvX9xDRPvHvqHvbkPVY3E6LgaIA+qwIM4F9JoeiygPaGQqtKs7QqaoBB1
 bi1CHSgh4JlfMB1KwN4E8jlLwDtU2eMpatHfbXTFTiD7YBuw/GhZtxCM25ZdTbNUgcdOmH9F6
 tCpgBN4VEHWZQERvlj3QjF6bpZ/Gk478ARkXyw==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cornelia Huck <cohuck@redhat.com>

Make the links render correctly.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220803090250.136556-1-cohuck@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 README.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README.rst b/README.rst
index 23795b837740..21df79ef4379 100644
--- a/README.rst
+++ b/README.rst
@@ -39,7 +39,7 @@ Documentation can be found hosted online at
 current development version that is available at
 `<https://www.qemu.org/docs/master/>`_ is generated from the ``docs/``
 folder in the source tree, and is built by `Sphinx
-<https://www.sphinx-doc.org/en/master/>_`.
+<https://www.sphinx-doc.org/en/master/>`_.
 
 
 Building
@@ -78,7 +78,7 @@ format-patch' and/or 'git send-email' to format & send the mail to the
 qemu-devel@nongnu.org mailing list. All patches submitted must contain
 a 'Signed-off-by' line from the author. Patches should follow the
 guidelines set out in the `style section
-<https://www.qemu.org/docs/master/devel/style.html>` of
+<https://www.qemu.org/docs/master/devel/style.html>`_ of
 the Developers Guide.
 
 Additional information on submitting patches can be found online via
-- 
2.37.1


