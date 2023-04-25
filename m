Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91696EDBB3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 08:37:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCHx-00050A-Ts; Tue, 25 Apr 2023 02:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1prCHJ-0004IA-Ul; Tue, 25 Apr 2023 02:35:54 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1prCHI-0003BK-49; Tue, 25 Apr 2023 02:35:53 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1BEC05C008D;
 Tue, 25 Apr 2023 02:35:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 25 Apr 2023 02:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1682404551; x=
 1682490951; bh=SFxJK+G1nUK+75gA73AgPJQ/+B1jkLruZiTC4j6hJjw=; b=q
 xVgTO2Hb4qj/30fsTEycgmcFc5RRl0oFsmIOc9Cp96dTkIkIVtjo/HI4C5gHNv+5
 QKGjMSoZx8Xls05dx4PT2r3XQD6vX/xwO1WzdfLNrXjIBDWkzppuoCRoFOGROwKF
 qVorMTM1hjWANYrdNktqyocVBSSgIfH+ENZFKO48dPN1cfUwrP+tulGozy2yB690
 rGDIarv5rao58lcMkVDHWiYvsTV0fceSkUG40WIj5raB7/c1f0SVUT2zdwgr5nMV
 AD//ScmjsRBlw6R9DGERXWcm1C5o8YCKn6jN8rCdIh0wND8IF5Tn5u6Rtk2vQpKa
 o1jU63MNZY04wSQd1Ww4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1682404551; x=
 1682490951; bh=SFxJK+G1nUK+75gA73AgPJQ/+B1jkLruZiTC4j6hJjw=; b=Q
 Kytcrn4kOzHADo7XcuT3J9YS6I8234cIUUztBjIt6j8+iWZu+xbDC8GvnYwAUZsL
 ZQxp2stslL0igxVg5oTtI9da1LpGUfcJqVtnArr6GM1u0oFkpYnyhpkrFsj3vQHK
 XIg98E+rdZvAHUPJB1WK2F4zqp8MOxctUacHmlOWNnlC4aN2h37dYGirTd6yNQ9U
 o9cCnAfK6TpdDDcpZNgrEA1QXGHp/U+k8F+WhwZZw2jx7I+a5bBkTTuxOR7UPmsb
 Ck0iaZ7T6k4I2icmjWdooDUbnDvUA1BKHbHCMJ6oTdgzD/gbEVQsF4buUPCZCNQ9
 nLJJnVNWFkAwmopMTyazg==
X-ME-Sender: <xms:xnRHZP6630yRZOcHjbe4TET2F1_upkDWODF8Jxa9ltE4FClxB_vlkQ>
 <xme:xnRHZE7uYKuxaYtUJxKLlVRXauhjIqLXUH5veJqLQCSy-eu7Yt2A-m4KZyIBvyR84
 oSpy6NepsDK9XaclP8>
X-ME-Received: <xmr:xnRHZGfjp1kGb9LmdqXmmySDgce5kHW95_sD1vDTPGXk_GdD4R_0BuOE-XdpzjZ3EUhr87nQF34>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduuddgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:xnRHZALJoTzb-3U7-JCPYBrJxfEHGFMV5hnVGE8zvaqeK1j79Ps4Bw>
 <xmx:xnRHZDImlnHKSEH6qW1_2KwlNAJx9C8bXnTmG7XkyUHFSjNgW6t13Q>
 <xmx:xnRHZJzLPVZzwp0EAdxUW7xZ_isTBXX447rgz76DahZJIZ3ZrU-UBg>
 <xmx:x3RHZCZjs7gkEIL13aEZqYELAJ3FU6VrpgmlqphAPWumKO25YAqa2w>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 02:35:48 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Corey Minyard <cminyard@mvista.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Klaus Jensen <its@irrelevant.dk>, qemu-arm@nongnu.org,
 Peter Delevoryas <peter@pjd.dev>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Lior Weintraub <liorw@pliops.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Matt Johnston <matt@codeconstruct.com.au>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v2 2/3] i2c/mctp: Allow receiving messages to dest eid 0
Date: Tue, 25 Apr 2023 08:35:39 +0200
Message-Id: <20230425063540.46143-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425063540.46143-1-its@irrelevant.dk>
References: <20230425063540.46143-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=922; i=k.jensen@samsung.com;
 h=from:subject; bh=qufOF07ehXobwxN2ep+lKi4IDEQ5mpH4wwvwoV38k1I=;
 b=owJ4nJvAy8zAxej7cL1hrj/vS8bTakkMKe4lu35fL4qbtIj305XCj2eyKhxcHveekrX7JV3lc
 umH0tXtU6s6GY1ZGBi5GGTFFFmCNIxXlT6682yRe9oBmEGsTCBTGLg4BWAiTNns/4N50uoitFs2
 vpn6eL1f/EUPDQlJ1St3hWet4nsdnyoTHu3hfaTBn3m++SqlxUxGp6c7NwTqvj11jTv1mdCk5gT
 BrxtuaCRGJpYsUN3wO796BrPYPOc8foM+aaUZXSVXZSpvKJwUXtDYkaOqHMtvof9Fe7Z74dpjL5
 nKNDm9Vnys/XYyVNJ358yCmQfvbUk8kXlYSudp3jQmDnX2WPboNg3BBf1zLa4Zd3m/XCl9t6t6j
 7RFuP/JRZaB9y1mVgYsf/LYXrX4c6vxXd1LkmIZRzdKnpM9Vm7RUN30idtvDn+Q+5x7nV/eONTE
 1/I6bZM/zfQj0N08aud0X4MT76Zd3uZ2aUXwubWpGwIiTbQA/L6gpA==
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matt Johnston <matt@codeconstruct.com.au>

The Null Destination ID, 0, is used for MCTP control messages when
addressing by physical ID. That is used for Get Endpoint ID and
Set Endpoint ID when querying/assigning an EID to an endpoint.

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
---
 hw/i2c/mctp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/mctp.c b/hw/i2c/mctp.c
index 0f4045d0d685..db42dc72264b 100644
--- a/hw/i2c/mctp.c
+++ b/hw/i2c/mctp.c
@@ -242,7 +242,8 @@ static int i2c_mctp_event_cb(I2CSlave *i2c, enum i2c_event event)
             goto drop;
         }
 
-        if (pkt->mctp.hdr.eid.dest != mctp->my_eid) {
+        if (!(pkt->mctp.hdr.eid.dest == mctp->my_eid ||
+              pkt->mctp.hdr.eid.dest == 0)) {
             trace_i2c_mctp_drop_invalid_eid(pkt->mctp.hdr.eid.dest,
                                             mctp->my_eid);
             goto drop;
-- 
2.40.0


