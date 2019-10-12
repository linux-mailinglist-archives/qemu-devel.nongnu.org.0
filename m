Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80DBD4EB6
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Oct 2019 11:46:51 +0200 (CEST)
Received: from localhost ([::1]:59844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJDz8-0006hl-BE
	for lists+qemu-devel@lfdr.de; Sat, 12 Oct 2019 05:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32964)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iJDwU-0005TK-Os
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 05:44:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iJDwT-0003VS-Fm
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 05:44:06 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:33528)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>)
 id 1iJDwS-0003RV-Pu; Sat, 12 Oct 2019 05:44:05 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by
 rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee75da1a04dcc5-4ed06;
 Sat, 12 Oct 2019 17:43:41 +0800 (CST)
X-RM-TRANSID: 2ee75da1a04dcc5-4ed06
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.149])
 by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee75da1a0478f4-669ae;
 Sat, 12 Oct 2019 17:43:41 +0800 (CST)
X-RM-TRANSID: 2ee75da1a0478f4-669ae
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 0/2] use helper when using abstract QOM parent functions
Date: Sat, 12 Oct 2019 17:43:21 +0800
Message-Id: <20191012094323.234788-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.80
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
Cc: eric.auger@redhat.com, hpoussin@reactos.org, f4bug@amsat.org,
 Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe introduced a series of helpers to make the
device class_init() easier to understand when a device
class change the parent hooks, some devices in the
source tree missed helper, so convert it.

Cc: eric.auger@redhat.com
Cc: peter.maydell@linaro.org
Cc: hpoussin@reactos.org
Cc: f4bug@amsat.org

Mao Zhongyi (2):
  arm/smmuv3: use helpers to be more easier to understand when using
    abstract QOM parent functions.
  isa/pc87312: use helpers to be more easier to understand when using
    abstract QOM parent functions.

 hw/arm/smmuv3.c  | 3 +--
 hw/isa/pc87312.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

-- 
2.17.1




