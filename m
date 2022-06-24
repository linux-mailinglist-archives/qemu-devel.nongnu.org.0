Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F4559D70
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:38:11 +0200 (CEST)
Received: from localhost ([::1]:57206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lNq-00011J-Pd
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1o4lFx-0001QY-VL
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:30:07 -0400
Received: from mail-108-mta163.mxroute.com ([136.175.108.163]:44567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1o4lFw-0006nn-5F
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:30:01 -0400
Received: from filter006.mxroute.com ([140.82.40.27] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta163.mxroute.com (ZoneMTA) with ESMTPSA id
 181965584fe00028a7.002 for <qemu-devel@nongnu.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Fri, 24 Jun 2022 15:29:55 +0000
X-Zone-Loop: 52f4a36c54376147bc758100411fcd25b96cb12feae3
X-Originating-IP: [140.82.40.27]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mkfssion.com; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EqNlKr6yIv9MTP6XJewjMRBR6Y+N7XbK9fI0jnMDGvY=; b=dR8ALRFhWZcQAyE4Guc2FuaoaM
 Xz+YX1W59zSB2cbDoahwIhKCYJVwNr+0mGvE7WnYwd2uV6tmT2N86vhEgKbW85vifDh4OuXTYyscu
 mACZ8LiYV3f7sVo+3voOdrvxzcvfcykJGP5Jc8Xm/F7p+ItggbrqhvEloH5Bb4mP1K5wWOL3Tetu9
 ZqT1b3D+f6rOl7ie0govMENqUe48nRvn9hMgT/RgZ/AKoyWnsl2bu9qGEts0017EbIBFT/piuEAi7
 VWjmuCi8v3jETwn/1KfIp1PPmS8qAJ2Z/9DBGx7Y32jxFWUNfHmfovDzoAFtCTqzBMugg61Os6724
 +vSeykjg==;
From: MkfsSion <mkfssion@mkfssion.com>
To: qemu-devel@nongnu.org
Cc: MkfsSion <mkfssion@mkfssion.com>, Hongren Zheng <i@zenithal.me>,
 "Canokeys.org" <contact@canokeys.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 1/2] hw: canokey: Remove HS support as not compliant to the
 spec
Date: Fri, 24 Jun 2022 23:29:39 +0800
Message-Id: <20220624152940.11756-1-mkfssion@mkfssion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: mkfssion@mkfssion.com
Received-SPF: pass client-ip=136.175.108.163;
 envelope-from=mkfssion@mkfssion.com; helo=mail-108-mta163.mxroute.com
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


