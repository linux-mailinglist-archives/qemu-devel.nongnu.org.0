Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68C232804F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:09:29 +0100 (CET)
Received: from localhost ([::1]:47872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjEm-0006iT-Pc
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGj6c-0002AM-9Y; Mon, 01 Mar 2021 09:01:02 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:45625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGj6X-0003zK-DL; Mon, 01 Mar 2021 09:01:02 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 672AC5803BC;
 Mon,  1 Mar 2021 09:00:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 01 Mar 2021 09:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=agC0G6g5VCDJ+
 67kg3vEnbj2qAo19qlIIRh1GLrSUxE=; b=YT2A5J29Z31v8b03b11OCLIQDXyrI
 bYMklKEHnPyyCErBaLQvgjZUV9/Yqo5pBC5N5K4im+/1bQN5qZPYgZUrIvr+tPjY
 Hwi6ZjgRVZVy6ob0oWdwDWvfsyspIvj/NMkGasP9/8usN8GNk3+ExKRd7HEkP2B3
 4oVfDkmJGPrYT1KsRwlDfFv2L56EWqUki2/S3HC9cS0RMMp0ZIemYzGeQT08VS2r
 xAv53EQyfZ9MTA7bI+z6ll7ZLOZqQqVS1J10gKiPafb8qRyON9vPUhGQklxRuVIh
 J7vWJ3FYKPkv9R+c3r2JyIRss48l/1fj4jcK6hho2eHcDJIsdY+FVz2hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=agC0G6g5VCDJ+67kg3vEnbj2qAo19qlIIRh1GLrSUxE=; b=pdmxc5m3
 GC+6Os836LAgC7iNi+r7TwcZhjfVDjjlfxJiUUj/ifh6BoNtqjZcLOrc4CAwSe2o
 SCr2Nl6+5DnGs8rLTcWdVQ5YZg9iSjDkyq51vFPgi6WPBnSaBg97wJ+JlpZT7NTo
 eiULOefNfuwJpPEhqX4iEZbr4/tdgpbj96ZnFWPGKu2HcDsd3Mm/o2/EKeqNpn/t
 dlNqP1NjGsNbchohC617LvgaO7YW/t9Dh4BCUArC+5i/IpQA7/H8b5Ortnlieecm
 Z5JdyhC2nhiaY6deHmx9yTSSAkzXESj0ox8JNbBI6Mtn2xZxlAraC9Z2Ct+tnKwW
 nnYUHwoGe5vcHg==
X-ME-Sender: <xms:l_M8YIFflQSbkjIUolez-I-HORarzgBvHaX_mKr6XdFyZbujMzfpsw>
 <xme:l_M8YMCVAO8fGOwr8I_ODrMnqjIDEfHmDPYrLf-ktXysESIDR3VPjbA78NjmvtggV
 nBb9okxMQhWDBGsNQ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:l_M8YK0MTIQlS_bIQDfNLE3uHisPAJvu2EmpqLkFRVt7C00siyl7Dg>
 <xmx:l_M8YBN2Nhc_M_5cWA8lzwqZolY-0ylKmoPeerbL9C2uUhcLnIMyHw>
 <xmx:l_M8YP4WDm2xy6VgobFnvK_n3hPQXefqcMYYuvoND8G8hCi05iDIOQ>
 <xmx:l_M8YHTGhOFA7UYBFcmoJiDNGXd6IWBaYa8vOgTaUhBjpxXQRkdmtA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D70E9108006E;
 Mon,  1 Mar 2021 09:00:53 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/12] hw/block/nvme: fix strerror printing
Date: Mon,  1 Mar 2021 15:00:38 +0100
Message-Id: <20210301140047.106261-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301140047.106261-1-its@irrelevant.dk>
References: <20210301140047.106261-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Fix missing sign inversion.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 8244909562a2..ed6068d1306d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1155,7 +1155,7 @@ static void nvme_aio_err(NvmeRequest *req, int ret)
         break;
     }
 
-    trace_pci_nvme_err_aio(nvme_cid(req), strerror(ret), status);
+    trace_pci_nvme_err_aio(nvme_cid(req), strerror(-ret), status);
 
     error_setg_errno(&local_err, -ret, "aio failed");
     error_report_err(local_err);
-- 
2.30.1


