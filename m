Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDBB1A1F0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 18:51:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP8kF-0001hB-Nf
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 12:51:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hP8cz-0004ak-M3
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:44:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hP8cx-0002TU-QY
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:44:09 -0400
Received: from m12-13.163.com ([220.181.12.13]:45776)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hP8cu-0002Pk-2o
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=kxuIpJk2r7Juck7G70
	d+qocmrMBCV3MS7stIkFMR5A4=; b=l/0wIknVPSbCN0rI9HE2lBlB9V90xEPsvr
	c16OfViGgVQkkmvpeusGyX+JTT2OhCC5QIlOu1UzzXpjRNOFlyzJi/RsYoGWeryE
	ZC94rBXplXzajT2j4xmvT25oGhPSXjsawaMYq7QuJ871ev+XHDwFWFemu+lO0S0z
	7/m0vJj/s=
Received: from localhost.localdomain (unknown [183.159.64.133])
	by smtp9 (Coremail) with SMTP id DcCowAB3fTFLqtVcVYWnCg--.3399S2;
	Sat, 11 May 2019 00:43:56 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: pbonzini@redhat.com,
	jslaby@suse.cz
Date: Fri, 10 May 2019 09:43:46 -0700
Message-Id: <20190510164349.81507-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: DcCowAB3fTFLqtVcVYWnCg--.3399S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RKJPEDUUUU
X-Originating-IP: [183.159.64.133]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBZg2wbVaD1aHidAAAsB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.13
Subject: [Qemu-devel] [PATCH v4 0/3] hw: edu: some fixes
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
Cc: liq3ea@gmail.com, philmd@redhat.com, qemu-devel@nongnu.org,
	Li Qiang <liq3ea@163.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recently I am considering write a driver for edu device.
After reading the spec, I found these three small issue.
Two first two related the MMIO access and the third is
related the DMA operation.

Change since v2:
Fix an error in patch 2
Fix some commit message and title.

Change since v1:
Fix format compile error

Li Qiang (3):
  edu: mmio: allow 64-bit access
  edu: mmio: allow 64-bit access in read dispatch
  edu: uses uint64_t in dma operation

 hw/misc/edu.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

-- 
2.17.1



