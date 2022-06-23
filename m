Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AADB0557D82
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 16:07:53 +0200 (CEST)
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4NUu-0005Jb-Pp
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 10:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1o4NSB-0003kD-0k
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:05:03 -0400
Received: from mail-108-mta16.mxroute.com ([136.175.108.16]:32905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1o4NS9-0003dZ-B5
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:05:02 -0400
Received: from filter006.mxroute.com ([140.82.40.27] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta16.mxroute.com (ZoneMTA) with ESMTPSA id 18190dca23f00028a7.002
 for <qemu-devel@nongnu.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Thu, 23 Jun 2022 13:59:47 +0000
X-Zone-Loop: 113fa24b431f6c5298429d93a6c2d2bcd34ea1a9cb70
X-Originating-IP: [140.82.40.27]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mkfssion.com; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s/GrKG3NXjfaxoAPWoe52WcIhsoAKc1/IIL9dgv8LCI=; b=r8oG5SS17nWe3NiHjQFIrwgTwi
 ry5zaWsRwYje1k8UuQSV7wlqM/tWaJVFLgPZzKRcSS2T6lfiams9QlpmxoDR4VMRwJMfotGthl5IX
 JExJenNWr+lvVyH9pbtQ+xzk0rTjTq3VxZxgVKvEVPLWWb35lxAj5Z0WczTWvutnTWCC/gKGO9A31
 so3BZOoPw68wpTaO41B+34Ad0sybx6VEn4vWkxLzxaHmKaXriQrhP8ujMJ5B8oc8NQ7fnhke/il+9
 T3L4zSpnyDiQ8qXWTbst2I254kVI9+KtM5PeonKIRGLuTfSD/kLAbKjAhE64ZScS+fMpIhfe21orF
 owonnWqg==;
From: MkfsSion <mkfssion@mkfssion.com>
To: qemu-devel@nongnu.org
Cc: MkfsSion <mkfssion@mkfssion.com>, Hongren Zheng <i@zenithal.me>,
 "Canokeys.org" <contact@canokeys.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] hw: canokey: Don't run the device in high-speed
Date: Thu, 23 Jun 2022 21:58:43 +0800
Message-Id: <20220623135843.236803-1-mkfssion@mkfssion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: mkfssion@mkfssion.com
Received-SPF: pass client-ip=136.175.108.16;
 envelope-from=mkfssion@mkfssion.com; helo=mail-108-mta16.mxroute.com
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

* Canokey core currently using 16 bytes as maximum packet size for
* EP, but to run the device in full-speed a 64 bytes maximum size is
* required according to USB 2.0 specification. Since we don't acutally
* need to run the device in high-speed, simply don't assign high member
* in USBDesc.

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


