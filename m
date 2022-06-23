Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9584D558A9D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:21:48 +0200 (CEST)
Received: from localhost ([::1]:54838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UGp-0001TB-Mv
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDz-0006Nq-GU; Thu, 23 Jun 2022 17:18:51 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:34495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDx-00046X-SY; Thu, 23 Jun 2022 17:18:51 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id F3D3E3200957;
 Thu, 23 Jun 2022 17:18:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 23 Jun 2022 17:18:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656019127; x=
 1656105527; bh=5AJzH0OZXxYlk0dkZeJQPFlyIp8WXctBx49EIQxU/Zw=; b=A
 EhB+xWdvJeZxLgoz6ZTyYE/IZ8aXOozpMRY+MNZH+JMWh4IquWkHP9z6jnTS1snL
 sD+o2uh3UMTpycZ5CkpowXZmT4V+1kY/fBDPdGa1OtciiT3qqbrnefQ1X4YXuLOI
 rZWTUt0XRwZB6hrB6ErM66CB3nXnWjgZiygQvkTppQCxaEOAhS0WR/X8bJ1zACzo
 iazF+qb8RCe+8+TSuwgQLfSgYFMffeRMxrxR8clXFMt0WVJmlsn5aU4qX91AvZWF
 XtRFq4+QkRpJkyjDU8XlgheEgOKca1p133Xbom7bU7CXiJJxUxRjV7gxWvAr/EuL
 hbtNBzlPT2KXKdAKsC+3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656019127; x=1656105527; bh=5AJzH0OZXxYlk
 0dkZeJQPFlyIp8WXctBx49EIQxU/Zw=; b=aBTMM6YviYLy5qptugnRkhRdkBeGU
 9MfdXyKH0Owvc0lWVivTb1lvfQTfTGfO4Ewf0PLVTMK9d36giyLY08Sr/Sh2iQi8
 DFN/VW6krLoblLaEM4Gd26ip7YKhPzK+mGp8hsaZvXZG8OYhNvdmSvxkZNBawGOc
 N1/NwRu3twX5+yXfz/z55FMt2gqhe5MVNDgAW3yQmLswgVuwuo3NKoj4gQ2AOo/x
 jh+HH/0SSFw+utoklrOZaetopw90+VDXIkwmtn8gurCluzMZOugH8ckR4YgFD67p
 zhpkW/QmaWdTgiZMqpvmPjRaSRhEeL9TyMvY7kfsK/TWJePe0g8u5z4rw==
X-ME-Sender: <xms:t9i0YmjBjFYNpR7SqfVClEkPH1TAV2HWbv8z1XTvUkA0lNvZLYaQpQ>
 <xme:t9i0YnDlhxP-PmVueI2rJXdgbsnfdMYenCQYldmY_rpkjr8PoYvPfKeZ_ngs8b5sK
 nZQtycNrBZJVgdlbg4>
X-ME-Received: <xmr:t9i0YuGonwMu0T2gxEJUTUd_a_9YxjKxQavPdTOCUKzr27Qkt-2ZeA1Cfk3r3jp1t0CyzdqrwowE5yghZNEG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeitdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:t9i0YvR5BA8nIY38pJKGzBzsVfs-8niiBW5NS2skGZyi-FxgJIDJoA>
 <xmx:t9i0YjzprKukRLt283x4SFbpUOcPMnbIkhSsU2ltQZQMUjqU6X5a8g>
 <xmx:t9i0Yt7SYf6vjxVn5TIO7gkE7iBmVpAgj79EiTqAaXs_slTwwx3OLA>
 <xmx:t9i0Yj92Us6S_t61XhutYD7Uh8l9yUPIuOESuyhcopRNO1ERdgegDA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:18:46 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 09/12] hw/nvme: improve cancellation handling in zone reset
Date: Thu, 23 Jun 2022 23:18:18 +0200
Message-Id: <20220623211821.50534-10-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623211821.50534-1-its@irrelevant.dk>
References: <20220623211821.50534-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Klaus Jensen <k.jensen@samsung.com>

If the zone reset operation is cancelled but the block unmap operation
completes normally, the callback will continue resetting the next zone
since it neglects to check iocb->ret which will have been set to
-ECANCELED. Make sure that this is checked and bail out if an error is
present.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 1acf88d9e8c7..9add74753fd8 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3760,14 +3760,8 @@ static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
     int64_t moff;
     int count;
 
-    if (ret < 0) {
-        nvme_zone_reset_cb(iocb, ret);
-        return;
-    }
-
-    if (!ns->lbaf.ms) {
-        nvme_zone_reset_cb(iocb, 0);
-        return;
+    if (ret < 0 || iocb->ret < 0 || !ns->lbaf.ms) {
+        goto out;
     }
 
     moff = nvme_moff(ns, iocb->zone->d.zslba);
@@ -3777,6 +3771,9 @@ static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
                                         BDRV_REQ_MAY_UNMAP,
                                         nvme_zone_reset_cb, iocb);
     return;
+
+out:
+    nvme_zone_reset_cb(iocb, ret);
 }
 
 static void nvme_zone_reset_cb(void *opaque, int ret)
@@ -3788,6 +3785,8 @@ static void nvme_zone_reset_cb(void *opaque, int ret)
     if (ret < 0) {
         iocb->ret = ret;
         goto done;
+    } else if (iocb->ret < 0) {
+        goto done;
     }
 
     if (iocb->zone) {
-- 
2.36.1


