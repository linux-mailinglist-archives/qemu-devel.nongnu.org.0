Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2843BEBBD
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:59:26 +0200 (CEST)
Received: from localhost ([::1]:37486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19xN-0007wD-NZ
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m19o3-00007i-Uk; Wed, 07 Jul 2021 11:49:47 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:35971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m19o2-0003Ee-F9; Wed, 07 Jul 2021 11:49:47 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id D29E732009B4;
 Wed,  7 Jul 2021 11:49:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 07 Jul 2021 11:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=h8t2938WpU3UU
 zpsqciYJT+0fzYoMfhS77cmgL5tVOs=; b=kiBugl8LU9Abra5AkwV6AgBvn0YPU
 FzIA//hemjx5HP146RrOl0Y6Yx79EL+C/wcFz0bib17K8w8AXjXMfEmSHX6Xa1Fn
 4qWo6r1FfkFz9XJ2L0PWTyVgd4WUNXo3yIsvhoNoPabvqxZv6XW+vdR9j9H7W7PY
 ur4bng349jIY+cjAY7o52ZmzCr52gzIz6egMdFfkl+Enrl4427XADNfOHW9NSqaP
 OE8VKHCr0ou2ICWbd2NZbU+H7vfOz4Y2Vj4AElhRQWwpZbs8hZOo8GY7JAPH+feo
 M8FCkJ/lfR9rYRPy0gi6l9NAGVTmF5axQ4s2VNrNOApXe76MOsCclmptQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=h8t2938WpU3UUzpsqciYJT+0fzYoMfhS77cmgL5tVOs=; b=u4CqAemX
 e88/BlX8HBn0zNcTtdxqhhIL3uj/uR3GdGqFgQuhiJxnGliN7R11jm1pps64BVgA
 8KlUlW0H/q5dms48TPqNU44+2oym4gZ69Z84bJBOhO4kbL7rCJa86N8Zxsxm3m9t
 o7fLM3yk5W4b0WzVzrNu6VbQdG7BpS6p1R3w2e3K5d83gJieQGtqadTGFe3fa5cp
 LT+pmJ1IQ0lPc2X+2JUA7chFbRvUbfAQm3EOPKJxMrSYRTJ9Cr7iHu8ppJmq5+Gr
 ogr6YMZFbQOoPfhW3xXjoaCznvAxW7ABhOIxFP+lfvcSej2wsqc9xfw4PI1R1XfA
 P/0/i2HwoTd7EA==
X-ME-Sender: <xms:GM3lYPHAw1SnAFQ_Sz2ImVWK3bNlWtsdFYUmkuDgR17Upc23L30lFQ>
 <xme:GM3lYMXI0xov4M_KBmNAsldrwpaF7_7ywS14AvC0gs9v5FllqoIVLQ3dltPcpCzKP
 Dme_nXxCzPJNv_cufc>
X-ME-Received: <xmr:GM3lYBLSiZVLK6G0qAZKSxsHhZhcHuABxu7TXnhQ06Fy0pyzHRXzMGxemJFOBQLTPOlYBzHcipOk8O6OzDVex_mivcCDjMUDChZN4I298Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgdelvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:GM3lYNEJ5ge99LSWBGYmN_JeF9tS3HbOPAaGuhT3fT8OsRcVmieLjg>
 <xmx:GM3lYFW4s5DHe61M9YlujDDMk87ld-WaosaP-CZS_rBF_I0qYhlIwA>
 <xmx:GM3lYIN2ZDmUjNysXURR1ldH9FPSPZfHU7HHODf1yG6PY1doMDjsfw>
 <xmx:GM3lYLxEAlai_fy4RPwXGkj447lGddhNEFudJiXeVFBkQiQ13SWuuw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 11:49:43 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] hw/nvme: mark nvme-subsys non-hotpluggable
Date: Wed,  7 Jul 2021 17:49:34 +0200
Message-Id: <20210707154936.200166-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707154936.200166-1-its@irrelevant.dk>
References: <20210707154936.200166-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Hannes Reinecke <hare@suse.de>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

We currently lack the infrastructure to handle subsystem hotplugging, so
disable it.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/subsys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 192223d17ca1..dc7a96862f37 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -61,6 +61,7 @@ static void nvme_subsys_class_init(ObjectClass *oc, void *data)
 
     dc->realize = nvme_subsys_realize;
     dc->desc = "Virtual NVMe subsystem";
+    dc->hotpluggable = false;
 
     device_class_set_props(dc, nvme_subsystem_props);
 }
-- 
2.32.0


