Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FA73501E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 21:04:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYEjY-0003XF-Hp
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 15:04:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hYEgs-0002Gp-SE
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 15:01:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hYEgr-0007kL-Uc
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 15:01:46 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:54794
	helo=mail.default.ilande.uk0.bigv.io)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hYEgr-0007hd-O3; Tue, 04 Jun 2019 15:01:45 -0400
Received: from host81-158-188-206.range81-158.btcentralplus.com
	([81.158.188.206] helo=kentang.home)
	by mail.default.ilande.uk0.bigv.io with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hYEfw-00013x-L1; Tue, 04 Jun 2019 20:00:49 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-stable@nongnu.org,
	david@gibson.dropbear.id.au
Date: Tue,  4 Jun 2019 20:01:10 +0100
Message-Id: <20190604190115.8053-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.11.0
X-SA-Exim-Connect-IP: 81.158.188.206
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: [Qemu-devel] [PATCH for-stable 0/5] target/ppc: VSX/xvxsigdp fixes
 for 4.0 stable
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nothing to see here - just Anton's patches fixing several issues with the
VSX native endian conversion patches from 4.0, plus a related bug in xvxsigdp
queued for 4.0 stable.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Anton Blanchard (5):
  target/ppc: Fix xvabs[sd]p, xvnabs[sd]p, xvneg[sd]p, xvcpsgn[sd]p
  target/ppc: Fix xvxsigdp
  target/ppc: Fix xxbrq, xxbrw
  target/ppc: Fix vsum2sws
  target/ppc: Fix lxvw4x, lxvh8x and lxvb16x

 target/ppc/int_helper.c             |  2 +-
 target/ppc/translate/vsx-impl.inc.c | 23 ++++++++++++-----------
 2 files changed, 13 insertions(+), 12 deletions(-)

-- 
2.11.0


