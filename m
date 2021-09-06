Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F414401D93
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:27:22 +0200 (CEST)
Received: from localhost ([::1]:43604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGWn-0006mh-DG
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mNGRO-00051R-PO
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:21:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mNGRM-0001dS-QZ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:21:46 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4E4274011E;
 Mon,  6 Sep 2021 18:21:41 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 2F0FE4C;
 Mon,  6 Sep 2021 18:21:41 +0300 (MSK)
Received: (nullmailer pid 2028363 invoked by uid 1000);
 Mon, 06 Sep 2021 15:21:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Subject: [PULL] qemu-socket unix socket bugfix 2021-09-06
Date: Mon,  6 Sep 2021 18:20:32 +0300
Message-Id: <cover.1630941575.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 935efca6c246c108253b0e4e51cc87648fc7ca10:

  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-09-06' into staging (2021-09-06 12:38:07 +0100)

are available in the Git repository at:

  git://git.corpit.ru/qemu.git tags/patch-fetch

for you to fetch changes up to 118d527f2e4baec5fe8060b22a6212468b8e4d3f:

  qemu-sockets: fix unix socket path copy (again) (2021-09-06 17:18:54 +0300)

----------------------------------------------------------------
qemu-socket unix socket bugfix 2021-09-06

----------------------------------------------------------------
Michael Tokarev (1):
      qemu-sockets: fix unix socket path copy (again)

 util/qemu-sockets.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

