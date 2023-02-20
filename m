Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BEE69D29C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:16:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUAhU-0006X2-Eb; Mon, 20 Feb 2023 13:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUAh1-0006K8-Sb
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:15:20 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUAgz-0007SU-7k
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:15:15 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 82C507457E7;
 Mon, 20 Feb 2023 19:15:03 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5685E745720; Mon, 20 Feb 2023 19:15:03 +0100 (CET)
Message-Id: <cover.1676916639.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 0/7] OHCI changes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <"peter.maydell@linaro.org>, philmd"@linaro.org>
Date: Mon, 20 Feb 2023 19:15:03 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

v2: Address review commnts, add R-b tags and a patch from Philippe to
fix a typo

Regards,
BALATON Zoltan

BALATON Zoltan (7):
  usb/ohci: Code style fix comments
  usb/ohci: Code style fix white space errors
  usb/ohci: Code style fix missing braces and extra parenthesis
  usb/ohci: Move a function next to where it is used
  usb/ohci: Add trace points for register access
  usb/ohci: Implement resume on connection status change
  hw/usb/hcd-ohci: Fix typo

 hw/usb/hcd-ohci.c   | 461 ++++++++++++++++++++++++--------------------
 hw/usb/trace-events |   4 +
 2 files changed, 259 insertions(+), 206 deletions(-)

-- 
2.30.7


