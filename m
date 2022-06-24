Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AC5559D5E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:31:19 +0200 (CEST)
Received: from localhost ([::1]:44846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lHC-0000vf-Ux
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1o4lDQ-00048H-Tv
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:27:24 -0400
Received: from mail-108-mta0.mxroute.com ([136.175.108.0]:46487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1o4lDP-0006en-3N
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:27:24 -0400
Received: from filter006.mxroute.com ([140.82.40.27] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta0.mxroute.com (ZoneMTA) with ESMTPSA id 1819653230500028a7.002
 for <qemu-devel@nongnu.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Fri, 24 Jun 2022 15:27:19 +0000
X-Zone-Loop: 872a4eab8dd1b4dff377a70685c94e77e937553f303b
X-Originating-IP: [140.82.40.27]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mkfssion.com; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EqNlKr6yIv9MTP6XJewjMRBR6Y+N7XbK9fI0jnMDGvY=; b=s6gcQDCn+NwKv0RRVIbZyLsMAV
 O1eSo09f3+bswbql3TYmKCBqS87xEgHurTAK8y4ELETL99SsHLlKc4q33u5TZscZXux3eA1l61qGp
 IexbB/fkfXxIAPYSmRCVQoDywG7IBqByjCSkgmILeDzmbaD72ibYelUrBw4sZEv/VlGKm/sI0Nqfo
 A0yd2CaOiNFy8N4g0bXSYqhZVOefZsfVvKb+Q8DM876AIebLg41HgYrXP76NI0LuV+VA+xMs2ekfE
 Zrukl/4gNKI60lJ31mtDLBCrJHx95QiYR3d108ktPUjY0KI+ajn3nszNkprmymJXWsguCXVT22FAt
 RfVubYsg==;
From: MkfsSion <mkfssion@mkfssion.com>
To: qemu-devel@nongnu.org
Cc: MkfsSion <mkfssion@mkfssion.com>, Hongren Zheng <i@zenithal.me>,
 "Canokeys.org" <contact@canokeys.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 1/2] hw: canokey: Remove HS support as not compliant to the
 spec
Date: Fri, 24 Jun 2022 23:26:25 +0800
Message-Id: <20220624152626.11565-1-mkfssion@mkfssion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: mkfssion@mkfssion.com
Received-SPF: pass client-ip=136.175.108.0; envelope-from=mkfssion@mkfssion.com;
 helo=mail-108-mta0.mxroute.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Canokey core currently using 16 bytes as maximum packet size for
control endpoint, but to run the device in high-speed a 64 bytes
maximum packet size is required according to USB 2.0 specification.
Since we don't acutally need to run the device in high-speed, simply
don't assign high member in USBDesc.

When canokey-qemu is used with xhci, xhci would drive canokey
in high speed mode, since the bcdUSB in canokey-core is 2.1,
yet canokey-core set bMaxPacketSize0 to be 16, this is out
of the spec as the spec said that ``The allowable maximum
control transfer data payload sizes...for high-speed devices,
it is 64 bytes''.

In this case, usb device validation in Windows 10 LTSC 2021
as the guest would fail. It would complain
USB\DEVICE_DESCRIPTOR_VALIDATION_FAILURE.

Note that bcdUSB only identifies the spec version the device
complies, but it has no indication of its speed. So it is
allowed for the device to run in FS but comply the 2.1 spec.

To solve the issue we decided to just drop the high
speed support. This only affects usb-ehci as usb-ehci would
complain speed mismatch when FS device is attached to a HS port.
That's why the .high member was initialized in the first place.
Meanwhile, xhci is not affected as it works well with FS device.
Since everyone is now using xhci, it does no harm to most users.

Suggested-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Signed-off-by: YuanYang Meng <mkfssion@mkfssion.com>
---
 hw/usb/canokey.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
index 4a08b1cbd7..6a7ab965a5 100644
--- a/hw/usb/canokey.c
+++ b/hw/usb/canokey.c
@@ -56,7 +56,6 @@ static const USBDesc desc_canokey = {
         .iSerialNumber     = STR_SERIALNUMBER,
     },
     .full = &desc_device_canokey,
-    .high = &desc_device_canokey,
     .str  = desc_strings,
 };
 
-- 
2.36.1


