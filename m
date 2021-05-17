Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0703828D2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:51:59 +0200 (CEST)
Received: from localhost ([::1]:56788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZum-00086p-K4
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOS-0003er-Dm; Mon, 17 May 2021 05:18:32 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:38855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOM-0005yG-NM; Mon, 17 May 2021 05:18:32 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 7DC4E449;
 Mon, 17 May 2021 05:18:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 May 2021 05:18:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=EMgjUG4Hjacj0
 rUL2PT4bxNaPXhR5+w4MaKi8XavRME=; b=Srn/NZOzo2ZZkU+3LMUic8TaRhi4+
 2PRt23hRbxxoiaZj9sFWmuj+E1RwDbP7gHalrvCVyZhS37wvOOSA3iVIJaSwtQdg
 hykP6QQ2nDQfNhpSgAWsXQ/N2OtoITjaah4JgU6MGYK0Bl0oTpAwyN+LbqwcAo/t
 v60jMxrd91n0HG9EwyPls1uvYnVO6ZZ5kksXg4K6VzDq4AR6e171fAhBZN1prvL6
 ebR4Mvojlwl6eDlKHBpZq/svofR5T5/cT/JvJaoWrcODyVpr77KvcA/q2KQPbiBz
 qfmMnQ9JnD3Cny0Z+W//NlfAq1gelJwpLxi5iMVUpF9+Lgs1j4scw/zSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=EMgjUG4Hjacj0rUL2PT4bxNaPXhR5+w4MaKi8XavRME=; b=fm/oFykZ
 hGWSzUHAU6v+qbl/mdKflcfxyHzMA9ea1Z79YSV8ZKd+73PBwS15d6M0NT4udych
 S1duOC3Xt5SX28O/4yta05buJ1Iaeml0vASx2XOFc1cRV2bGFBWmPdD3WmwRuZK8
 O+nvQb41jqSIUT/hLOSr604sI1TVw9SxkI6pelY7AQxzUuI8e1j6XDSKBRUDakp2
 XwvSO1ZIO8zMq0zEJrE0W3mPblqWCVexcZVvxykcwKJDtY3ON+5xs7hUk0Jb+w7B
 VWj7WCP2hgAsj2MtgmyigQdSPovefl1x6HJh+dNvLW21CqaV8R8T/Yj5lht6tyUr
 0y3a8SvPtba7pw==
X-ME-Sender: <xms:3zSiYJqfTNXt1CBRwI8j3d8uxoORw95C9tSoy5DurEEysdWQI1OQ6w>
 <xme:3zSiYLps8p43-zaBbKpI1lJfrQF-WgtrHLDfpLrZmjF3LyRpwYG2bxyIjnC5lBTkR
 v3DTU7lOXn55-vNUTM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeegne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:4DSiYGO_v_mt9ZOJOlG66tp5xdyMsclZe2tcLf3vw60_Vv15Ji88qg>
 <xmx:4DSiYE7bviqqVgEWFvh5C3Y1vf948zhPFu2sA_dGH2uREmIzdvLbhw>
 <xmx:4DSiYI44d7h5h6bcX-CR6PkNJvAsxgw0E9Mr781Xl3Y807sEGdC81Q>
 <xmx:4DSiYHaZGDdHl6H4DUshdS8YlGIUPGaCeFlKUqNSZQ1rZwCbNhqp5A>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:18:22 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 13/20] hw/block/nvme: replace nvme_ns_status
Date: Mon, 17 May 2021 11:17:30 +0200
Message-Id: <20210517091737.841787-14-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The inline nvme_ns_status() helper only has a single call site. Remove
it from the header file and inline it for real.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.h |  5 -----
 hw/block/nvme.c | 15 ++++++++-------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 2c4e7b90fa54..d9bee7e5a05c 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -137,11 +137,6 @@ typedef struct NvmeNamespace {
     } features;
 } NvmeNamespace;
 
-static inline uint16_t nvme_ns_status(NvmeNamespace *ns)
-{
-    return ns->status;
-}
-
 static inline uint32_t nvme_nsid(NvmeNamespace *ns)
 {
     if (ns) {
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index e7bd22b8b2ed..710af6a7147c 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3609,8 +3609,8 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
 
 static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
+    NvmeNamespace *ns;
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
-    uint16_t status;
 
     trace_pci_nvme_io_cmd(nvme_cid(req), nsid, nvme_sqid(req),
                           req->cmd.opcode, nvme_io_opc_str(req->cmd.opcode));
@@ -3642,21 +3642,22 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_flush(n, req);
     }
 
-    req->ns = nvme_ns(n, nsid);
-    if (unlikely(!req->ns)) {
+    ns = nvme_ns(n, nsid);
+    if (unlikely(!ns)) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    if (!(req->ns->iocs[req->cmd.opcode] & NVME_CMD_EFF_CSUPP)) {
+    if (!(ns->iocs[req->cmd.opcode] & NVME_CMD_EFF_CSUPP)) {
         trace_pci_nvme_err_invalid_opc(req->cmd.opcode);
         return NVME_INVALID_OPCODE | NVME_DNR;
     }
 
-    status = nvme_ns_status(req->ns);
-    if (unlikely(status)) {
-        return status;
+    if (ns->status) {
+        return ns->status;
     }
 
+    req->ns = ns;
+
     switch (req->cmd.opcode) {
     case NVME_CMD_WRITE_ZEROES:
         return nvme_write_zeroes(n, req);
-- 
2.31.1


