Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB32B53D289
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 21:57:27 +0200 (CEST)
Received: from localhost ([::1]:36148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxDQE-0000Fq-Sk
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 15:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNC-0005uh-Sv; Fri, 03 Jun 2022 15:54:18 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:34803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNB-00088e-B2; Fri, 03 Jun 2022 15:54:18 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 7BA9E320094E;
 Fri,  3 Jun 2022 15:54:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 03 Jun 2022 15:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654286053; x=
 1654372453; bh=uA3g6u/P3to6nNAaeQtZ+PajTiaKUfbgRMji4itvnIQ=; b=m
 CBGRN37iPZICaXXkiH516ShjxdHC5688oi1IhayC7bAzVdwzoIub//WoqsaCtvR6
 UJgMaxJdELImctqEQXlR4eFOaq0GhFzj5E11S2pS76Vijcurzyb1ubLVTdXvx/JS
 vAjnU+YlBQpr9FNTmNGmnbjcqEDazmJBtZ4mcmati5szVT7On2hroU93zvp5V0pq
 ARk9ExLq2JrjYPVu3DjGCbLQ4JZTzCkfuJQ9cUtr1cOYvYX2oV3Ok3m+9w2KjXoW
 iSWz+pq6HoiQQVysbVHKXfk/Wl65T89keq3brCOqCUFKubWWj7OZchRLSbmaw/O5
 6zDROUSgXy4dP+SLxHOcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654286053; x=1654372453; bh=uA3g6u/P3to6n
 NAaeQtZ+PajTiaKUfbgRMji4itvnIQ=; b=tMCkBa/NR8O8qT3Cn3/xhNBBLQ1bP
 XDyWlJJ0/KaLlHT1AAly0bMsgyq5EATz8JuILDbR2EdOvlrEUXCrCW/MCw7R3aRQ
 64w/kW3iiFflQepQIeCZOjI5yEsNfImZ+OS7/IrSy9l3I7ObcwGBVkeuirRcT6U9
 +XgPE0/A/ZpXyEXjrPqiUWk3oetYPvm8ALWPNu1JDJisjdNL20jZvSQ/Hv4PnqkV
 dInh/exgHvquF7J71OMxxWcMm6y3ZiUdgjBu9RqfrYQNBQ3mvab5jrKVVhz6qJtL
 DkKuiOaDkQiSzNd5nYsw3JFzxD2kDBeq7RxAbGR3Dkr4aol/iy2xmvHhA==
X-ME-Sender: <xms:5WaaYiD1iL1FTbQUcm7C3I4X1kdbHwybNBQH7KTw4Y0adNhXRZ5EIw>
 <xme:5WaaYsg6AcHC0Lq_8io4KDjaMdugDDxXFO6uDTHL-IT18_iQYJqLBn-oLqJJE14DI
 ZTUAU-u05v2rFiwJf0>
X-ME-Received: <xmr:5WaaYlkPFuAxAraVEnPoKOK4lQZ3eODtQ9fC-RkkDRYNi-h0rHdUHjB4dIhRlLJBXIY2Wfk4Got7uWoGe7k->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:5WaaYgzrHdQaif7Y2LJ0WxAdTQCDjlSCWyqNAWlOrPBJVRlsIwaz_w>
 <xmx:5WaaYnSgPYW433fji1WBjxpk_b0osaH-9RwqAAmnALT3UvR_gcKmCQ>
 <xmx:5WaaYrYlPB1Co-HjmPlsA-3Ij6Sz8QRypzjhBAkigZ3ZcN_BNJle1A>
 <xmx:5WaaYjpV7Bf3wjE2LBlfpsDUXLY80aql99vtD7vI4_2FT-92iJggZA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 15:54:11 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Yanan Wang <wangyanan55@huawei.com>, Hanna Reitz <hreitz@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Dmitry Tikhov <d.tihov@yadro.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 03/11] hw/nvme: fix copy cmd for pi enabled namespaces
Date: Fri,  3 Jun 2022 21:53:46 +0200
Message-Id: <20220603195354.705516-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603195354.705516-1-its@irrelevant.dk>
References: <20220603195354.705516-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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

From: Dmitry Tikhov <d.tihov@yadro.com>

Current implementation have problem in the read part of copy command.
Because there is no metadata mangling before nvme_dif_check invocation,
reftag error could be thrown for blocks of namespace that have not been
previously written to.

Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 74540a03d518..08574c4dcbc8 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2787,6 +2787,10 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
         size_t mlen = nvme_m2b(ns, nlb);
         uint8_t *mbounce = iocb->bounce + nvme_l2b(ns, nlb);
 
+        status = nvme_dif_mangle_mdata(ns, mbounce, mlen, slba);
+        if (status) {
+            goto invalid;
+        }
         status = nvme_dif_check(ns, iocb->bounce, len, mbounce, mlen, prinfor,
                                 slba, apptag, appmask, &reftag);
         if (status) {
-- 
2.36.1


