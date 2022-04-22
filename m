Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6895D50BBA6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:25:45 +0200 (CEST)
Received: from localhost ([::1]:35680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhvAG-0003uw-H4
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nhv5m-00056O-A9
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:21:06 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:31645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nhv5i-0002rg-Bx
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:21:04 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3D114746E07;
 Fri, 22 Apr 2022 17:20:59 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 11F35745958; Fri, 22 Apr 2022 17:20:59 +0200 (CEST)
Message-Id: <cover.1650640480.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 0/3] Misc AC97 clean ups
Date: Fri, 22 Apr 2022 17:14:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During trying to implement via-ac97 I did some small clean ups to ac97
which is in this series. The via-ac97 is not working yet so that's not
included but these unrelated clean ups could be merged now.

v2: Added R-b and changes from Peter Maydell

Regards.

BALATON Zoltan (3):
  hw/audio/ac97: Coding style fixes to avoid checkpatch errors
  hw/audio/ac97: Remove unimplemented reset functions
  hw/audio/ac97: Remove unneeded local variables

 hw/audio/ac97.c | 752 +++++++++++++++++++++++-------------------------
 1 file changed, 360 insertions(+), 392 deletions(-)

-- 
2.30.2


