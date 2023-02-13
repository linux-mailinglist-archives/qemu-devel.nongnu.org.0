Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A88694788
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:57:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZK0-0003MM-N3; Mon, 13 Feb 2023 08:56:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@dahe.fr>)
 id 1pRWSe-0004EV-Ho
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:53:28 -0500
Received: from mail-4323.proton.ch ([185.70.43.23])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@dahe.fr>)
 id 1pRWSb-0002d2-3k
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:53:28 -0500
Date: Mon, 13 Feb 2023 10:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dahe.fr;
 s=protonmail; t=1676285600; x=1676544800;
 bh=G+jplAZGAjsOERWV8UdXOQn/9rBgtdjwi2z2GnVgdZA=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=gwC7YDHI4VW+DXylP1YHXlT7waqDIYajg6Wcq5wYBgbH7GCNTgDIFkDlC0hL8rrh1
 sW2hoZfzDm4ziQ+xKtEYVg8hXm9nktRIQhO7BE+iwNiYvn01nbLQWkr+yn6dTC9636
 3DUHKvIpDN5xd7FzuYxx06r8RSsrdXFC0aHCU0v1+x4xTCz+nEMvq8ymsUUv6LNCbM
 9MkyP8yQRPjAPHRiEtllaD9Xh2qnk46ukGg+aeipWtCgADzLtDpKVrDb42SD9J+fzS
 4cAkUTVV2Ce2NVWfXZvp7HBnkL7cnSmPzq34qSl1W8zNwBewp/jjoin7n5R83Fc+j/
 ViF2EeVDz5zqA==
To: qemu-devel@nongnu.org
From: Damien Hedde <damien.hedde@dahe.fr>
Cc: luc@lmichel.fr, mark.burton@qti.qualcomm.com, philmd@linaro.org,
 Damien Hedde <damien.hedde@dahe.fr>
Subject: [PATCH] MAINTAINERS: update my email address for the clock framework
Message-ID: <20230213105227.2357-1-damien.hedde@dahe.fr>
Feedback-ID: 67097399:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.23; envelope-from=damien.hedde@dahe.fr;
 helo=mail-4323.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Feb 2023 08:56:37 -0500
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

Also update mailmap

Signed-off-by: Damien Hedde <damien.hedde@dahe.fr>
---
 MAINTAINERS | 2 +-
 .mailmap    | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96e25f62ac..ceeda49d49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3321,7 +3321,7 @@ F: .gitlab-ci.d/opensbi/

 Clock framework
 M: Luc Michel <luc@lmichel.fr>
-R: Damien Hedde <damien.hedde@greensocs.com>
+R: Damien Hedde <damien.hedde@dahe.fr>
 S: Maintained
 F: include/hw/clock.h
 F: include/hw/qdev-clock.h
diff --git a/.mailmap b/.mailmap
index fad2aff5aa..7677047950 100644
--- a/.mailmap
+++ b/.mailmap
@@ -56,6 +56,7 @@ Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <aleksan=
dar.rikalo@rt-rk.com>
 Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
 Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.c=
om>
 Christian Borntraeger <borntraeger@linux.ibm.com> <borntraeger@de.ibm.com>
+Damien Hedde <damien.hedde@dahe.fr> <damien.hedde@greensocs.com>
 Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
 Frederic Konrad <konrad.frederic@yahoo.fr> <fred.konrad@greensocs.com>
 Frederic Konrad <konrad.frederic@yahoo.fr> <konrad@adacore.com>
--
2.37.0



