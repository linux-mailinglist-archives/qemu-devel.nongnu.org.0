Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF09D321F7E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 20:00:01 +0100 (CET)
Received: from localhost ([::1]:47610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEGR6-0003gr-Qp
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 14:00:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEGFm-0004tT-TZ; Mon, 22 Feb 2021 13:48:18 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:50113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEGFa-0003i0-Pp; Mon, 22 Feb 2021 13:48:18 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 963715803BE;
 Mon, 22 Feb 2021 13:48:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Feb 2021 13:48:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=8HPIbXBiY9U8K
 8vCWWacn2bteea3HW7keVpAJqtUmYg=; b=CY1tcHM8mWNwNUdi+9wWzx/J4aT5x
 pWggfz3TqSVjRt6/BmtgmIb2LzFtJByFMg6BKEy6n4nico133ZXOx8SECfq/gqza
 R1UyN2ifUY+GBiqBe47fhW2Zc+2l/L237qXjyPqHedbPsLj5o+ww7kT/xYn4yk3h
 QNH7NC0qZCbSJLRCyV++m4KR/mQDITTWj30rZ2l2skJ5eD2Tlod8qGxc5gM3AGzL
 E8ihsO/3/z9KDlXI8fTPlK6JT9po2G1k0kWoZlDVClrAxNrTOKk8tGGI3aQ+afqC
 M87dHsOt/PvtDlAEd7YFwGgxiCDPkK/kah73nt/3X/bBObqQJ8207K/tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=8HPIbXBiY9U8K8vCWWacn2bteea3HW7keVpAJqtUmYg=; b=hpt7clZB
 Uqo9zP+x/YvsRc0B9zW3PajvPz7HMfnIAe45CoTXh+E2yJClxC8c8X6BJ8pgfNuo
 R/2RhHaYFXIShAxc3KBBHF4ZuSYtd+CHgPbesxPg+hhEHssI1qeb7Ar7PNvfCHjj
 IEy2Q5DPhitxde3VHGVM3085/TQ791Y97kTcPMAjKa3IetD0tLlPgW2oe1pHzFWc
 uJGDiM2Rdlq1thSq21dHcIrAggHGLVMlpLIL2F2HhdtMnTiBlpXE1emm2edSLdd/
 XiDZV7u73UGYNFHnqZcrHDd1a9n7yVw+EJW6C80tBU3zP15fvbsYsw6hitbUaFSK
 ocC6uxdDLYDtMQ==
X-ME-Sender: <xms:ZPwzYAFUMbOoKNWdKfXMlzRL_6lXAsHFrhpkx_oepZbGBGN5ti-fPQ>
 <xme:ZPwzYJXGWzRFEhqAu23xLRmOYlBPPaCfIv6CYKJxVEbWIgWEKF5-pv1w5e4Zsprl9
 apV_NFmww4qDWsPaCc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ZPwzYKLDOf6UMApdK9ou-M3mD-JUHr2j6VNChAAOiC37bpsPmAEv_w>
 <xmx:ZPwzYCFElz51fQuTygUazE92w8vXrNoUNvZ71mI9tcm-KftQvpp_xA>
 <xmx:ZPwzYGVsTTZzXrwmvedffQuVvmOseyy4-LTcxf5BQOWDnEKbgJb3bQ>
 <xmx:ZPwzYKrYSJ1qz0z25xjIT6FMT2To1nITA2tWfaBpd_pIuFecWhQE1Q>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 16CA7240068;
 Mon, 22 Feb 2021 13:48:02 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] hw/block/nvme: remove unnecessary endian conversion
Date: Mon, 22 Feb 2021 19:47:55 +0100
Message-Id: <20210222184759.65041-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222184759.65041-1-its@irrelevant.dk>
References: <20210222184759.65041-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Remove an unnecessary le_to_cpu conversion in Identify.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 1cd82fa3c9fe..c0b349dfab0d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3415,7 +3415,7 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
 
-    switch (le32_to_cpu(c->cns)) {
+    switch (c->cns) {
     case NVME_ID_CNS_NS:
          /* fall through */
     case NVME_ID_CNS_NS_PRESENT:
-- 
2.30.1


