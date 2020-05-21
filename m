Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C71DD7A8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 21:55:23 +0200 (CEST)
Received: from localhost ([::1]:52706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbrHm-0003pz-Tx
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 15:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jbrGO-0002D4-Sa
 for qemu-devel@nongnu.org; Thu, 21 May 2020 15:53:56 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:30243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jbrGN-0007ad-1d
 for qemu-devel@nongnu.org; Thu, 21 May 2020 15:53:56 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6DD1F748DD1;
 Thu, 21 May 2020 21:53:43 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 50D22745702; Thu, 21 May 2020 21:53:43 +0200 (CEST)
Message-Id: <cover.1590089984.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 0/7] Misc display/sm501 clean ups and fixes
Date: Thu, 21 May 2020 21:39:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sebastian Bauer <mail@sebastianbauer.info>,
 Magnus Damm <magnus.damm@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Second try of clean ups and changes to hopefully improve 2D engine
performance and fix a security bug in it. This one actually works with
AmigaOS handling overlapping blits, fixes the overflow checks and adds
Reviewed-by tags. Unless some problems are found this should be OK to
merge.

Regards,
BALATON Zoltan


BALATON Zoltan (7):
  sm501: Convert printf + abort to qemu_log_mask
  sm501: Shorten long variable names in sm501_2d_operation
  sm501: Use BIT(x) macro to shorten constant
  sm501: Clean up local variables in sm501_2d_operation
  sm501: Replace hand written implementation with pixman where possible
  sm501: Optimize small overlapping blits
  sm501: Remove obsolete changelog and todo comment

 hw/display/sm501.c | 311 ++++++++++++++++++++++++---------------------
 1 file changed, 164 insertions(+), 147 deletions(-)

-- 
2.21.3


