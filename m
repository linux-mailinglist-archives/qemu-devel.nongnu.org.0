Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 029465DE56
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 08:57:53 +0200 (CEST)
Received: from localhost ([::1]:33196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiZDD-0004vD-Jh
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 02:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54963)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hiZBj-0003pU-OA
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 02:56:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hiZBi-0007IW-MM
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 02:56:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33984)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hiZBi-0007Hu-H6
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 02:56:18 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B377BC057F3E
 for <qemu-devel@nongnu.org>; Wed,  3 Jul 2019 06:56:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98F3C60BF3;
 Wed,  3 Jul 2019 06:56:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2902E11AA3; Wed,  3 Jul 2019 08:56:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jul 2019 08:55:59 +0200
Message-Id: <20190703065600.13535-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 03 Jul 2019 06:56:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/1] Audio 20190703 patches
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde:

  Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-2019' into staging (2019-06-21 15:40:50 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/audio-20190703-pull-request

for you to fetch changes up to 58c15e523af3e70149248e8a2a9dab0fefb4ce91:

  fix microphone lag with PA (2019-07-03 08:50:56 +0200)

----------------------------------------------------------------
audio: pulse bugfix

----------------------------------------------------------------

Martin Schrodt (1):
  fix microphone lag with PA

 audio/paaudio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.18.1


