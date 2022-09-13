Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B354A5B76CB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 18:54:46 +0200 (CEST)
Received: from localhost ([::1]:36798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY9BN-00075Y-AT
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 12:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linus@sphalerite.org>)
 id 1oY996-0005cQ-Rs
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 12:52:25 -0400
Received: from sosiego.soundray.org ([116.203.207.114]:57142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linus@sphalerite.org>)
 id 1oY994-0001XM-2V
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 12:52:23 -0400
From: Linus Heckemann <git@sphalerite.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sphalerite.org;
 s=sosiego; t=1663087937;
 bh=yKiNR1T11SXzfWP/D6GpgA44Msd/1CYy7EnJNkyijqU=;
 h=From:To:Cc:Subject:Date;
 b=ieA+xA4OPYY9e0v9DMjE48W4DBtX/ukPIW2axSpz8SU49u8Lk4aGN7vuejqzIPMce
 sxQDH97PIfTGZnL7iWMntmTs5iaSObA9jI2WaZB9TyWfwQcE2ZOBPsaP51GyP36lQn
 TOq5q/RHrGaIi+zn6iQAjODk4BCsPv/NJ2GYQvWI=
To: qemu-devel@nongnu.org
Cc: Linus Heckemann <git@sphalerite.org>
Subject: [PATCH] docs/devel: remove incorrect claim about git send-email
Date: Tue, 13 Sep 2022 18:52:14 +0200
Message-Id: <20220913165214.97241-1-git@sphalerite.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=116.203.207.114;
 envelope-from=linus@sphalerite.org; helo=sosiego.soundray.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

While it's unclear to me what git send-email actually does with the
-v2 parameter (it is not documented, but also not rejected), it does
not add a v2 tag to the email's subject, which is what led to the
mishap in [1].

[1]: https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg00679.html
---
 docs/devel/submitting-a-patch.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index fec33ce148..be2c428b93 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -456,8 +456,7 @@ patch need not say "v1", just [PATCH] is sufficient.) For patch series,
 the version applies to the whole series -- even if you only change one
 patch, you resend the entire series and mark it as "v2". Don't try to
 track versions of different patches in the series separately.  `git
-format-patch <http://git-scm.com/docs/git-format-patch>`__ and `git
-send-email <http://git-scm.com/docs/git-send-email>`__ both understand
+format-patch <http://git-scm.com/docs/git-format-patch>`__ understands
 the ``-v2`` option to make this easier. Send each new revision as a new
 top-level thread, rather than burying it in-reply-to an earlier
 revision, as many reviewers are not looking inside deep threads for new
-- 
2.36.2


