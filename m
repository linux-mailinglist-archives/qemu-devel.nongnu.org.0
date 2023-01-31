Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ED76836B8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 20:40:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMwSr-0006qu-3j; Tue, 31 Jan 2023 14:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMwSo-0006ov-OI
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:38:42 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMwSm-0003IV-Ng
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:38:42 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 160BA746324;
 Tue, 31 Jan 2023 20:36:11 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D5EA5745712; Tue, 31 Jan 2023 20:36:10 +0100 (CET)
Message-Id: <cover.1675193329.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 0/6] OHCI changes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>
Date: Tue, 31 Jan 2023 20:36:10 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Trying to debug some MacOS versions on mac99 with OHCI I've added some
debug logging that might be useful to get traces from this device and
attempted to implement missing feature. To avoid checkpatch errors
start with updating code style for th ewhole file.

Regards,
BALATON Zoltan

BALATON Zoltan (6):
  usb/ohci: Code style fix comments
  usb/ohci: Code style fix white space errors
  usb/ohci: Code style fix missing braces and extra parenthesis
  usb/ohci: Move a function next to where it is used
  usb/ohci: Add trace points for register access
  usb/ohci: Implement resume on connection status change

 hw/usb/hcd-ohci.c   | 451 ++++++++++++++++++++++++--------------------
 hw/usb/trace-events |   4 +
 2 files changed, 250 insertions(+), 205 deletions(-)

-- 
2.30.6


