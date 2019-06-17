Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4112F486A5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 17:10:18 +0200 (CEST)
Received: from localhost ([::1]:48326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hctGz-0001Y3-D4
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 11:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47168)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1hcsjd-0004c1-Re
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:35:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1hcsjc-0000XK-Sl
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:35:49 -0400
Received: from telepax.uni-paderborn.de ([131.234.189.14]:35454)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1hcsjc-0000VR-MM
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:35:48 -0400
Received: from pova.uni-paderborn.de ([131.234.189.23]
 helo=localhost.localdomain)
 by mail.uni-paderborn.de with esmtp (Exim 4.89 telepax)
 id 1hcsjZ-0003zo-4M; Mon, 17 Jun 2019 16:35:45 +0200
Received: from mail.uni-paderborn.de by pova with queue id 3426980-2;
 Mon, 17 Jun 2019 14:35:44 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 16:35:30 +0200
Message-Id: <20190617143533.15013-1-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2019.6.17.142717, AntiVirus-Engine: 5.63.0,
 AntiVirus-Data: 2019.6.4.5630002
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 131.234.189.14
Subject: [Qemu-devel] [PATCH 0/3] tricore: Convert to translate_loop
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
Cc: kbastian@mail.uni-paderborn.de, david.brenken@efs-auto.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I finally came around to port TriCore to the "new" translate_loop
infrastructure. This is neccessary such that TriCore can be used in the upcoming
plugin API [1]. 

Cheers,
Bastian

[1] (https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg03165.html)


Bastian Koppelmann (3):
  target/tricore: Use DisasContextBase API
  target-tricore: Make env a member of DisasContext
  target/tricore: Use translate_loop

 target/tricore/translate.c | 527 +++++++++++++++++++------------------
 1 file changed, 272 insertions(+), 255 deletions(-)

-- 
2.22.0


