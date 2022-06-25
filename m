Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B332555AAF7
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 16:28:14 +0200 (CEST)
Received: from localhost ([::1]:55154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o56lh-0006Lk-RW
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 10:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1o56kc-0005ZG-T4
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 10:27:06 -0400
Received: from mail-108-mta137.mxroute.com ([136.175.108.137]:41935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1o56kb-0002Rd-7k
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 10:27:06 -0400
Received: from filter006.mxroute.com ([140.82.40.27] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta137.mxroute.com (ZoneMTA) with ESMTPSA id
 1819b4249a600028a7.002 for <qemu-devel@nongnu.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Sat, 25 Jun 2022 14:27:01 +0000
X-Zone-Loop: 1bb50ac1cd74e3e13cb066ab534c7fc6a1170806f281
X-Originating-IP: [140.82.40.27]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mkfssion.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1C39O8rWG6eLQFObN7a4Qv+qxEWH1+LD8l1SeUO/7jQ=; b=R84VqI13gCqHjbewcLOBM9ZEXb
 mcjzldRGm1rgdNJHh26X3kKau29KhA2cXvZJzQRpGXAWfQy0SM8VZHFmfb5HlOrUrWanhumufU7aB
 t1aYsDrcz10jU8FiQAd3QdvZWOiA3vPPMQQnyitplefFFnbZTcESujFe1tk6v79Lv46D/JmaO5KRR
 6cPVcgjOTC1Pzg/NJvoS62MBgxuJdgnUrkYy7uJg+F/PL0tPIdW9rmBUY+6/kuvn9+fbsNQsYgcFC
 5IA4DyMCgAwktLZUzIUM/Z3+0kep0an5LgXSUjLnJYL1uPopD7Hj/L3N+/zZ9y1ybup1qdpdLClwb
 1YE1znYA==;
From: MkfsSion <mkfssion@mkfssion.com>
To: qemu-devel@nongnu.org
Cc: MkfsSion <mkfssion@mkfssion.com>, Hongren Zheng <i@zenithal.me>,
 "Canokeys.org" <contact@canokeys.org>
Subject: [PATCH v4] docs/system/devices/canokey: Document limitations on
 usb-ehci
Date: Sat, 25 Jun 2022 22:26:51 +0800
Message-Id: <20220625142651.19546-1-mkfssion@mkfssion.com>
In-Reply-To: <20220625142138.19363-1-mkfssion@mkfssion.com>
References: <20220625142138.19363-1-mkfssion@mkfssion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: mkfssion@mkfssion.com
Received-SPF: pass client-ip=136.175.108.137;
 envelope-from=mkfssion@mkfssion.com; helo=mail-108-mta137.mxroute.com
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

Suggested-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Signed-off-by: YuanYang Meng <mkfssion@mkfssion.com>
---
  v4:
    Adopt Zenithal's suggestion of repharsing the limitation 

 docs/system/devices/canokey.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/system/devices/canokey.rst b/docs/system/devices/canokey.rst
index 169f99b8eb..db33b59e9a 100644
--- a/docs/system/devices/canokey.rst
+++ b/docs/system/devices/canokey.rst
@@ -156,6 +156,11 @@ to it, for example
 
    |qemu_system| -device piix3-usb-uhci,id=uhci -device canokey,bus=uhci.0
 
+The other limitation is that this device is not compatible with ``usb-ehci``
+since the device only provides the full-speed mode. However, when a
+full-speed device attach to a high-speed port, ``usb-ehci`` would complain
+about speed mismatch.
+
 References
 ==========
 
-- 
2.36.1


