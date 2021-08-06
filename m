Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3E13E2CEB
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:47:01 +0200 (CEST)
Received: from localhost ([::1]:41360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC17k-0003De-Et
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qyliss@x220.qyliss.net>)
 id 1mC16l-0001tG-37; Fri, 06 Aug 2021 10:45:59 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:43821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qyliss@x220.qyliss.net>)
 id 1mC16j-0007sa-3V; Fri, 06 Aug 2021 10:45:58 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 311503200903;
 Fri,  6 Aug 2021 10:39:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 06 Aug 2021 10:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=B8f8367Kl5huY/JD0v77kydlYI
 oQ4fZ4yUiqomeQ2Hs=; b=DbrR9JwIbPsgI9UTh5IviihY5UAbs5Jv6xq1o9NLkt
 zoh/p6uCIepf6EMUO9Nz16JIaSFdWH0iMs3p8euJfeowi74ooIYC8uWOevak4lpm
 LSzFTg7CigkOGcN/SaoAtS5qT76c/MH9VTVoqclcpD1kaAF/E3IH4g56W3QxBJPT
 PXvD9oS2ktXLSb2JXw8PSlQ6/QcLKWPnGBOYQkBmUSNuorOji3vXicXwSHP/xq5H
 C81e53tUgizp8N0IzGeoi4/M1FrLh3B6ysOgymw0ArTtKPGCTP+caCX+Cq//Ac36
 2pq7ccasxDVUYWHYK1scxjaWfwBWIaR8oqv21+Qdjdcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=B8f8367Kl5huY/JD0
 v77kydlYIoQ4fZ4yUiqomeQ2Hs=; b=WePrGuUAS0gavo0Z7he+eMqoTfztwj0EN
 9TqlHpTYubnrR5ThEsq/Lzt/ysFx0F54Zi6XnSqCw0IzXBjXECm48d8qG3UAFM66
 zJxGpigU0GSbuOkpZ9TGVNY2Q0PYHcMVaUxOZRNV2S0NfKE0RH9wqUNSYyaIH/BV
 +Mts0KSzlPmYFWvGlZzfMyz/MYpeao2blUXRmKLxjvN4bJxX2fhvP9BV4Fk3/pTU
 3MszKOveFH9dSm/QswEvg5Z62odRbdZDwYmsZfRrJA5g01sKEpReczmMVD+Jd5Pn
 nWkk8KReFePurKVF/Loz6prQtDWZhHuqB2/3b3vWV90lcPcxXvHbg==
X-ME-Sender: <xms:qUkNYS77ASzWZbAwHlKD-UGjbizXtl5o0x43ZlOTm_wdW-SbiEtnTw>
 <xme:qUkNYb5i4T7dP6SPFTyBi4fPfe-NO2w4mpmSP1L8Nlb8S_STr3f-NXOJ4fuqbqogK
 ie03mgZrEbLWrBqAg>
X-ME-Received: <xmr:qUkNYRcXNgdzUvigUq2uE7PFDH0iuWxWLivDDz522v2XsDkV8E3Y7gdvfvG7_Li6HZ5lPpOedhQ4bul0hzXf3t7F8tNhr9k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjedugdejjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetlhihshhsrgcutfhoshhsuceohhhisegrlhihshhsrgdrihhsqeen
 ucggtffrrghtthgvrhhnpeehvdffgffhteeijefgteeftdfghfdvheeuhedvjedugfeggf
 eljefgleefvefgfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehqhihlihhsshesgidvvddtrdhqhihlihhsshdrnhgvth
X-ME-Proxy: <xmx:qUkNYfLq3So3Fn3JpO2fnk7sCxrwp6NsH88APC-wAmY53bVqb7_T7Q>
 <xmx:qUkNYWI57lB_WMnC5hX0iNFd0bQXb_dg_Cm5CTJLEnzHpP3ijUOjbw>
 <xmx:qUkNYQwXO-AsPtkea2yQ_thSHfNCUO8m0cg41UjbW_Un_PozSEXFaQ>
 <xmx:qUkNYYii2Ln48RNviqIAHXyY_qBI0WMqdaVz48B2dV-k91G-SUjlSA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Aug 2021 10:39:37 -0400 (EDT)
Received: by x220.qyliss.net (Postfix, from userid 1000)
 id A1050233; Fri,  6 Aug 2021 14:39:34 +0000 (UTC)
From: Alyssa Ross <hi@alyssa.is>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost-user: add missing space in error message
Date: Fri,  6 Aug 2021 14:39:26 +0000
Message-Id: <20210806143926.315725-1-hi@alyssa.is>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=64.147.123.20;
 envelope-from=qyliss@x220.qyliss.net; helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This would previously give error messages like

> Received unexpected msg type.Expected 0 received 1

Signed-off-by: Alyssa Ross <hi@alyssa.is>
---
 hw/virtio/vhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 29ea2b4fce..ad9fc40271 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -429,7 +429,7 @@ static int process_message_reply(struct vhost_dev *dev,
     }
 
     if (msg_reply.hdr.request != msg->hdr.request) {
-        error_report("Received unexpected msg type."
+        error_report("Received unexpected msg type. "
                      "Expected %d received %d",
                      msg->hdr.request, msg_reply.hdr.request);
         return -1;

base-commit: bccabb3a5d60182645c7749e89f21a9ff307a9eb
-- 
2.32.0


