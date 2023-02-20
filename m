Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424BE69CA69
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 13:01:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4po-0001Sl-2k; Mon, 20 Feb 2023 06:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pU4pk-0001R4-Tz; Mon, 20 Feb 2023 06:59:53 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pU4pg-0006e9-QS; Mon, 20 Feb 2023 06:59:52 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 8359D32009B0;
 Mon, 20 Feb 2023 06:59:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 20 Feb 2023 06:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defmacro.it; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1676894386; x=1676980786; bh=sz
 +ZkvRYqvipotb5H3zEIbNZDNXUnq9M5LHunFYKxRQ=; b=eoOLGSbqRbo9SNPUjS
 f+VdesbfbuAb7kvJWYPZvw2Ojag9VEP+7dZpYGp16CLEcFlzWHLQfZhuuXt1+Led
 EAASDmN56vn0EWUfF+rYBMb9uXbClPPYA4Y6IrIKrwzPOaCnRrYmYHoqVgXKulvM
 gJpKUCyUXIpqA1nfDzyMKEgoBi8LWOw2PAHDSjTpcMG2ArWQ9BRCfCcczVPxz7/s
 f+XYCIsVCJ8Tv00SZQOtL7xmCgw3HJZyP7DhUihe2c/+x5ucWwOoww7SV9CJpdyI
 3ELP/CJDmilTo8dxkn82pwN6n2f0XjgoxnfX+X7xb3QKlr3PIlqJyRLP6+BSjm+r
 ngHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1676894386; x=1676980786; bh=sz+ZkvRYqvipo
 tb5H3zEIbNZDNXUnq9M5LHunFYKxRQ=; b=MABLh0RwJzO42RfqQlzx+cJOmBeDk
 WLTvf6xS/Q8xeLUWrlfVPKH9ax5C+6TT/XhzME+ui90ACYKhKyuIiGUbTY53u2WL
 YsCU149LE1xEkFzSjj3bjE2trS8kJk9DQxd91ioG+QLMVfHtS8vG55GR5njxdM/O
 n2nkhLFgXkq2JpLxO1q2TDDpSK2PNRzS2Zx33J3jsKf3h0kCJwt4OWynyNmgoQ5J
 1mbc9vI3+yJaRV3fep6zf7U5FYHAs0aAcu04JWJbORbPv+fEH4Rjdl3e5YO/kD83
 HB7rBg/YQxdhVJcy6FQmlT1wdzoO9WsTWORDjGRKIBtwyexmDKIavyqVw==
X-ME-Sender: <xms:sWDzYzXDlFihewUBaPtWGVnvAtkfnVidtdGjlZQ2whi68DPALpBBnA>
 <xme:sWDzY7nXipEYB2Fesn7UcRilLUsfdcw5gRlaklscfj04FW9iJ4P1jJQeOTUzFA9qm
 BCYp7T9uW3kuDcO6qk>
X-ME-Received: <xmr:sWDzY_Zn2vmKqff2IUiDfDPPIrSHbZiuKG1m-6B5muPaRQ9GnErkKmTa4VonQOxAH7vHxG6BEJjmCq9d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejhedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfgvshhp
 vghrucffvghvrghnthhivghruceojhifugesuggvfhhmrggtrhhordhitheqnecuggftrf
 grthhtvghrnheptdefjeffudffhefhteevgfeliedtheduffduvdeiudehheelgedvheeh
 ledvteejnecuffhomhgrihhnpedvtdduledqtdekrdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhifugesuggvfhhmrggtrhhordhi
 th
X-ME-Proxy: <xmx:smDzY-WzEAurD_0aeI9l9MU6NPbSjo8ltz21Q9BFJssjaz8Xiu1UUA>
 <xmx:smDzY9kaHGHSMPFPC3PuNQrrKWH0vmor39DpCmy4Ya2o5_JTHjBJlg>
 <xmx:smDzY7cACQhbw6BNfySTlOVR8jJ-zdkBDgVzc9zf1brX_qtar_s5TQ>
 <xmx:smDzY2cVE_ta-RWr6U2r3NhfPuoDC_dAH5sr5XMQGXNhTvkM8rQm7w>
Feedback-ID: i0f41475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Feb 2023 06:59:44 -0500 (EST)
From: Jesper Devantier <jwd@defmacro.it>
To: jwd@defmacro.it,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Jesper Devantier <j.devantier@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v3 5/5] hw/nvme: flexible data placement emulation
Date: Mon, 20 Feb 2023 12:59:26 +0100
Message-Id: <20230220115926.54623-6-jwd@defmacro.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230220115926.54623-1-jwd@defmacro.it>
References: <20230220115926.54623-1-jwd@defmacro.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=jwd@defmacro.it;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Jesper Devantier <j.devantier@samsung.com>

Add emulation of TP4146 ("Flexible Data Placement").

Signed-off-by: Jesper Devantier <j.devantier@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 698 ++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/ns.c         | 143 +++++++++
 hw/nvme/nvme.h       |  85 +++++-
 hw/nvme/subsys.c     |  94 +++++-
 hw/nvme/trace-events |   1 +
 include/block/nvme.h | 173 ++++++++++-
 6 files changed, 1179 insertions(+), 15 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 17e6b430e2..82581902eb 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -238,6 +238,8 @@ static const bool nvme_feature_support[NVME_FID_MAX] = {
     [NVME_TIMESTAMP]                = true,
     [NVME_HOST_BEHAVIOR_SUPPORT]    = true,
     [NVME_COMMAND_SET_PROFILE]      = true,
+    [NVME_FDP_MODE]                 = true,
+    [NVME_FDP_EVENTS]               = true,
 };
 
 static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
@@ -249,6 +251,8 @@ static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
     [NVME_TIMESTAMP]                = NVME_FEAT_CAP_CHANGE,
     [NVME_HOST_BEHAVIOR_SUPPORT]    = NVME_FEAT_CAP_CHANGE,
     [NVME_COMMAND_SET_PROFILE]      = NVME_FEAT_CAP_CHANGE,
+    [NVME_FDP_MODE]                 = NVME_FEAT_CAP_CHANGE,
+    [NVME_FDP_EVENTS]               = NVME_FEAT_CAP_CHANGE | NVME_FEAT_CAP_NS,
 };
 
 static const uint32_t nvme_cse_acs[256] = {
@@ -281,6 +285,8 @@ static const uint32_t nvme_cse_iocs_nvm[256] = {
     [NVME_CMD_VERIFY]               = NVME_CMD_EFF_CSUPP,
     [NVME_CMD_COPY]                 = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
     [NVME_CMD_COMPARE]              = NVME_CMD_EFF_CSUPP,
+    [NVME_CMD_IO_MGMT_RECV]         = NVME_CMD_EFF_CSUPP,
+    [NVME_CMD_IO_MGMT_SEND]         = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
 };
 
 static const uint32_t nvme_cse_iocs_zoned[256] = {
@@ -299,12 +305,66 @@ static const uint32_t nvme_cse_iocs_zoned[256] = {
 
 static void nvme_process_sq(void *opaque);
 static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst);
+static inline uint64_t nvme_get_timestamp(const NvmeCtrl *n);
 
 static uint16_t nvme_sqid(NvmeRequest *req)
 {
     return le16_to_cpu(req->sq->sqid);
 }
 
+static inline uint16_t nvme_make_pid(NvmeNamespace *ns, uint16_t rg,
+                                     uint16_t ph)
+{
+    uint16_t rgif = ns->endgrp->fdp.rgif;
+
+    if (!rgif) {
+        return ph;
+    }
+
+    return (rg << (16 - rgif)) | ph;
+}
+
+static inline bool nvme_ph_valid(NvmeNamespace *ns, uint16_t ph)
+{
+    return ph < ns->fdp.nphs;
+}
+
+static inline bool nvme_rg_valid(NvmeEnduranceGroup *endgrp, uint16_t rg)
+{
+    return rg < endgrp->fdp.nrg;
+}
+
+static inline uint16_t nvme_pid2ph(NvmeNamespace *ns, uint16_t pid)
+{
+    uint16_t rgif = ns->endgrp->fdp.rgif;
+
+    if (!rgif) {
+        return pid;
+    }
+
+    return pid & ((1 << (15 - rgif)) - 1);
+}
+
+static inline uint16_t nvme_pid2rg(NvmeNamespace *ns, uint16_t pid)
+{
+    uint16_t rgif = ns->endgrp->fdp.rgif;
+
+    if (!rgif) {
+        return 0;
+    }
+
+    return pid >> (16 - rgif);
+}
+
+static inline bool nvme_parse_pid(NvmeNamespace *ns, uint16_t pid,
+                                  uint16_t *ph, uint16_t *rg)
+{
+    *rg = nvme_pid2rg(ns, pid);
+    *ph = nvme_pid2ph(ns, pid);
+
+    return nvme_ph_valid(ns, *ph) && nvme_rg_valid(ns->endgrp, *rg);
+}
+
 static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
                                    NvmeZoneState state)
 {
@@ -378,6 +438,69 @@ static uint16_t nvme_aor_check(NvmeNamespace *ns, uint32_t act, uint32_t opn)
     return nvme_zns_check_resources(ns, act, opn, 0);
 }
 
+static NvmeFdpEvent *nvme_fdp_alloc_event(NvmeCtrl *n, NvmeFdpEventBuffer *ebuf)
+{
+    NvmeFdpEvent *ret = NULL;
+    bool is_full = ebuf->next == ebuf->start && ebuf->nelems;
+
+    ret = &ebuf->events[ebuf->next++];
+    if (unlikely(ebuf->next == NVME_FDP_MAX_EVENTS)) {
+        ebuf->next = 0;
+    }
+    if (is_full) {
+        ebuf->start = ebuf->next;
+    } else {
+        ebuf->nelems++;
+    }
+
+    memset(ret, 0, sizeof(NvmeFdpEvent));
+    ret->timestamp = nvme_get_timestamp(n);
+
+    return ret;
+}
+
+static inline int log_event(NvmeRuHandle *ruh, uint8_t event_type)
+{
+    return (ruh->event_filter >> nvme_fdp_evf_shifts[event_type]) & 0x1;
+}
+
+static bool nvme_update_ruh(NvmeCtrl *n, NvmeNamespace *ns, uint16_t pid)
+{
+    NvmeEnduranceGroup *endgrp = ns->endgrp;
+    NvmeRuHandle *ruh;
+    NvmeReclaimUnit *ru;
+    NvmeFdpEvent *e = NULL;
+    uint16_t ph, rg, ruhid;
+
+    if (!nvme_parse_pid(ns, pid, &ph, &rg)) {
+        return false;
+    }
+
+    ruhid = ns->fdp.phs[ph];
+
+    ruh = &endgrp->fdp.ruhs[ruhid];
+    ru = &ruh->rus[rg];
+
+    if (ru->ruamw) {
+        if (log_event(ruh, FDP_EVT_RU_NOT_FULLY_WRITTEN)) {
+            e = nvme_fdp_alloc_event(n, &endgrp->fdp.host_events);
+            e->type = FDP_EVT_RU_NOT_FULLY_WRITTEN;
+            e->flags = FDPEF_PIV | FDPEF_NSIDV | FDPEF_LV;
+            e->pid = cpu_to_le16(pid);
+            e->nsid = cpu_to_le32(ns->params.nsid);
+            e->rgid = cpu_to_le16(rg);
+            e->ruhid = cpu_to_le16(ruhid);
+        }
+
+        /* log (eventual) GC overhead of prematurely swapping the RU */
+        nvme_fdp_stat_inc(&endgrp->fdp.mbmw, nvme_l2b(ns, ru->ruamw));
+    }
+
+    ru->ruamw = ruh->ruamw;
+
+    return true;
+}
+
 static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
 {
     hwaddr hi, lo;
@@ -3322,6 +3445,41 @@ invalid:
     return status | NVME_DNR;
 }
 
+static void nvme_do_write_fdp(NvmeCtrl *n, NvmeRequest *req, uint64_t slba,
+                              uint32_t nlb)
+{
+    NvmeNamespace *ns = req->ns;
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint64_t data_size = nvme_l2b(ns, nlb);
+    uint32_t dw12 = le32_to_cpu(req->cmd.cdw12);
+    uint8_t dtype = (dw12 >> 20) & 0xf;
+    uint16_t pid = le16_to_cpu(rw->dspec);
+    uint16_t ph, rg, ruhid;
+    NvmeReclaimUnit *ru;
+
+    if (dtype != NVME_DIRECTIVE_DATA_PLACEMENT ||
+        !nvme_parse_pid(ns, pid, &ph, &rg)) {
+        ph = 0;
+        rg = 0;
+    }
+
+    ruhid = ns->fdp.phs[ph];
+    ru = &ns->endgrp->fdp.ruhs[ruhid].rus[rg];
+
+    nvme_fdp_stat_inc(&ns->endgrp->fdp.hbmw, data_size);
+    nvme_fdp_stat_inc(&ns->endgrp->fdp.mbmw, data_size);
+
+    while (nlb) {
+        if (nlb < ru->ruamw) {
+            ru->ruamw -= nlb;
+            break;
+        }
+
+        nlb -= ru->ruamw;
+        nvme_update_ruh(n, ns, pid);
+    }
+}
+
 static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
                               bool wrz)
 {
@@ -3431,6 +3589,8 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
         if (!(zone->d.za & NVME_ZA_ZRWA_VALID)) {
             zone->w_ptr += nlb;
         }
+    } else if (ns->endgrp && ns->endgrp->fdp.enabled) {
+        nvme_do_write_fdp(n, req, slba, nlb);
     }
 
     data_offset = nvme_l2b(ns, slba);
@@ -4088,6 +4248,126 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
     return status;
 }
 
+static uint16_t nvme_io_mgmt_recv_ruhs(NvmeCtrl *n, NvmeRequest *req,
+                                       size_t len)
+{
+    NvmeNamespace *ns = req->ns;
+    NvmeEnduranceGroup *endgrp;
+    NvmeRuhStatus *hdr;
+    NvmeRuhStatusDescr *ruhsd;
+    unsigned int nruhsd;
+    uint16_t rg, ph, *ruhid;
+    size_t trans_len;
+    g_autofree uint8_t *buf = NULL;
+
+    if (!n->subsys) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    if (ns->params.nsid == 0 || ns->params.nsid == 0xffffffff) {
+        return NVME_INVALID_NSID | NVME_DNR;
+    }
+
+    if (!n->subsys->endgrp.fdp.enabled) {
+        return NVME_FDP_DISABLED | NVME_DNR;
+    }
+
+    endgrp = ns->endgrp;
+
+    nruhsd = ns->fdp.nphs * endgrp->fdp.nrg;
+    trans_len = sizeof(NvmeRuhStatus) + nruhsd * sizeof(NvmeRuhStatusDescr);
+    buf = g_malloc(trans_len);
+
+    trans_len = MIN(trans_len, len);
+
+    hdr = (NvmeRuhStatus *)buf;
+    ruhsd = (NvmeRuhStatusDescr *)(buf + sizeof(NvmeRuhStatus));
+
+    hdr->nruhsd = cpu_to_le16(nruhsd);
+
+    ruhid = ns->fdp.phs;
+
+    for (ph = 0; ph < ns->fdp.nphs; ph++, ruhid++) {
+        NvmeRuHandle *ruh = &endgrp->fdp.ruhs[*ruhid];
+
+        for (rg = 0; rg < endgrp->fdp.nrg; rg++, ruhsd++) {
+            uint16_t pid = nvme_make_pid(ns, rg, ph);
+
+            ruhsd->pid = cpu_to_le16(pid);
+            ruhsd->ruhid = *ruhid;
+            ruhsd->earutr = 0;
+            ruhsd->ruamw = cpu_to_le64(ruh->rus[rg].ruamw);
+        }
+    }
+
+    return nvme_c2h(n, buf, trans_len, req);
+}
+
+static uint16_t nvme_io_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeCmd *cmd = &req->cmd;
+    uint32_t cdw10 = le32_to_cpu(cmd->cdw10);
+    uint32_t numd = le32_to_cpu(cmd->cdw11);
+    uint8_t mo = (cdw10 & 0xff);
+    size_t len = (numd + 1) << 2;
+
+    switch (mo) {
+    case NVME_IOMR_MO_NOP:
+        return 0;
+    case NVME_IOMR_MO_RUH_STATUS:
+        return nvme_io_mgmt_recv_ruhs(n, req, len);
+    default:
+        return NVME_INVALID_FIELD | NVME_DNR;
+    };
+}
+
+static uint16_t nvme_io_mgmt_send_ruh_update(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeCmd *cmd = &req->cmd;
+    NvmeNamespace *ns = req->ns;
+    uint32_t cdw10 = le32_to_cpu(cmd->cdw10);
+    uint16_t ret = NVME_SUCCESS;
+    uint32_t npid = (cdw10 >> 1) + 1;
+    unsigned int i = 0;
+    g_autofree uint16_t *pids = NULL;
+    uint32_t maxnpid = n->subsys->endgrp.fdp.nrg * n->subsys->endgrp.fdp.nruh;
+
+    if (unlikely(npid >= MIN(NVME_FDP_MAXPIDS, maxnpid))) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    pids = g_new(uint16_t, npid);
+
+    ret = nvme_h2c(n, pids, npid * sizeof(uint16_t), req);
+    if (ret) {
+        return ret;
+    }
+
+    for (; i < npid; i++) {
+        if (!nvme_update_ruh(n, ns, pids[i])) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+    }
+
+    return ret;
+}
+
+static uint16_t nvme_io_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeCmd *cmd = &req->cmd;
+    uint32_t cdw10 = le32_to_cpu(cmd->cdw10);
+    uint8_t mo = (cdw10 & 0xff);
+
+    switch (mo) {
+    case NVME_IOMS_MO_NOP:
+        return 0;
+    case NVME_IOMS_MO_RUH_UPDATE:
+        return nvme_io_mgmt_send_ruh_update(n, req);
+    default:
+        return NVME_INVALID_FIELD | NVME_DNR;
+    };
+}
+
 static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns;
@@ -4164,6 +4444,10 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_zone_mgmt_send(n, req);
     case NVME_CMD_ZONE_MGMT_RECV:
         return nvme_zone_mgmt_recv(n, req);
+    case NVME_CMD_IO_MGMT_RECV:
+        return nvme_io_mgmt_recv(n, req);
+    case NVME_CMD_IO_MGMT_SEND:
+        return nvme_io_mgmt_send(n, req);
     default:
         assert(false);
     }
@@ -4619,6 +4903,207 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
     return nvme_c2h(n, ((uint8_t *)&log) + off, trans_len, req);
 }
 
+static size_t sizeof_fdp_conf_descr(size_t nruh, size_t vss)
+{
+    size_t entry_siz = sizeof(NvmeFdpDescrHdr) + nruh * sizeof(NvmeRuhDescr)
+                       + vss;
+    return ROUND_UP(entry_siz, 8);
+}
+
+static uint16_t nvme_fdp_confs(NvmeCtrl *n, uint32_t endgrpid, uint32_t buf_len,
+                               uint64_t off, NvmeRequest *req)
+{
+    uint32_t log_size, trans_len;
+    g_autofree uint8_t *buf = NULL;
+    NvmeFdpDescrHdr *hdr;
+    NvmeRuhDescr *ruhd;
+    NvmeEnduranceGroup *endgrp;
+    NvmeFdpConfsHdr *log;
+    size_t nruh, fdp_descr_size;
+    int i;
+
+    if (endgrpid != 1 || !n->subsys) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    endgrp = &n->subsys->endgrp;
+
+    if (endgrp->fdp.enabled) {
+        nruh = endgrp->fdp.nruh;
+    } else {
+        nruh = 1;
+    }
+
+    fdp_descr_size = sizeof_fdp_conf_descr(nruh, FDPVSS);
+    log_size = sizeof(NvmeFdpConfsHdr) + fdp_descr_size;
+
+    if (off >= log_size) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    trans_len = MIN(log_size - off, buf_len);
+
+    buf = g_malloc0(log_size);
+    log = (NvmeFdpConfsHdr *)buf;
+    hdr = (NvmeFdpDescrHdr *)(log + 1);
+    ruhd = (NvmeRuhDescr *)(buf + sizeof(*log) + sizeof(*hdr));
+
+    log->num_confs = cpu_to_le16(0);
+    log->size = cpu_to_le32(log_size);
+
+    hdr->descr_size = cpu_to_le16(fdp_descr_size);
+    if (endgrp->fdp.enabled) {
+        hdr->fdpa = FIELD_DP8(hdr->fdpa, FDPA, VALID, 1);
+        hdr->fdpa = FIELD_DP8(hdr->fdpa, FDPA, RGIF, endgrp->fdp.rgif);
+        hdr->nrg = cpu_to_le16(endgrp->fdp.nrg);
+        hdr->nruh = cpu_to_le16(endgrp->fdp.nruh);
+        hdr->maxpids = cpu_to_le16(NVME_FDP_MAXPIDS - 1);
+        hdr->nnss = cpu_to_le32(NVME_MAX_NAMESPACES);
+        hdr->runs = cpu_to_le64(endgrp->fdp.runs);
+
+        for (i = 0; i < nruh; i++) {
+            ruhd->ruht = NVME_RUHT_INITIALLY_ISOLATED;
+            ruhd++;
+        }
+    } else {
+        /* 1 bit for RUH in PIF -> 2 RUHs max. */
+        hdr->nrg = cpu_to_le16(1);
+        hdr->nruh = cpu_to_le16(1);
+        hdr->maxpids = cpu_to_le16(NVME_FDP_MAXPIDS - 1);
+        hdr->nnss = cpu_to_le32(1);
+        hdr->runs = cpu_to_le64(96 * MiB);
+
+        ruhd->ruht = NVME_RUHT_INITIALLY_ISOLATED;
+    }
+
+    return nvme_c2h(n, (uint8_t *)buf + off, trans_len, req);
+}
+
+static uint16_t nvme_fdp_ruh_usage(NvmeCtrl *n, uint32_t endgrpid,
+                                   uint32_t dw10, uint32_t dw12,
+                                   uint32_t buf_len, uint64_t off,
+                                   NvmeRequest *req)
+{
+    NvmeRuHandle *ruh;
+    NvmeRuhuLog *hdr;
+    NvmeRuhuDescr *ruhud;
+    NvmeEnduranceGroup *endgrp;
+    g_autofree uint8_t *buf = NULL;
+    uint32_t log_size, trans_len;
+    uint16_t i;
+
+    if (endgrpid != 1 || !n->subsys) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    endgrp = &n->subsys->endgrp;
+
+    if (!endgrp->fdp.enabled) {
+        return NVME_FDP_DISABLED | NVME_DNR;
+    }
+
+    log_size = sizeof(NvmeRuhuLog) + endgrp->fdp.nruh * sizeof(NvmeRuhuDescr);
+
+    if (off >= log_size) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    trans_len = MIN(log_size - off, buf_len);
+
+    buf = g_malloc0(log_size);
+    hdr = (NvmeRuhuLog *)buf;
+    ruhud = (NvmeRuhuDescr *)(hdr + 1);
+
+    ruh = endgrp->fdp.ruhs;
+    hdr->nruh = cpu_to_le16(endgrp->fdp.nruh);
+
+    for (i = 0; i < endgrp->fdp.nruh; i++, ruhud++, ruh++) {
+        ruhud->ruha = ruh->ruha;
+    }
+
+    return nvme_c2h(n, (uint8_t *)buf + off, trans_len, req);
+}
+
+static uint16_t nvme_fdp_stats(NvmeCtrl *n, uint32_t endgrpid, uint32_t buf_len,
+                               uint64_t off, NvmeRequest *req)
+{
+    NvmeEnduranceGroup *endgrp;
+    NvmeFdpStatsLog log = {};
+    uint32_t trans_len;
+
+    if (off >= sizeof(NvmeFdpStatsLog)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    if (endgrpid != 1 || !n->subsys) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    if (!n->subsys->endgrp.fdp.enabled) {
+        return NVME_FDP_DISABLED | NVME_DNR;
+    }
+
+    endgrp = &n->subsys->endgrp;
+
+    trans_len = MIN(sizeof(log) - off, buf_len);
+
+    /* spec value is 128 bit, we only use 64 bit */
+    log.hbmw[0] = cpu_to_le64(endgrp->fdp.hbmw);
+    log.mbmw[0] = cpu_to_le64(endgrp->fdp.mbmw);
+    log.mbe[0] = cpu_to_le64(endgrp->fdp.mbe);
+
+    return nvme_c2h(n, (uint8_t *)&log + off, trans_len, req);
+}
+
+static uint16_t nvme_fdp_events(NvmeCtrl *n, uint32_t endgrpid,
+                                uint32_t buf_len, uint64_t off,
+                                NvmeRequest *req)
+{
+    NvmeEnduranceGroup *endgrp;
+    NvmeCmd *cmd = &req->cmd;
+    bool host_events = (cmd->cdw10 >> 8) & 0x1;
+    uint32_t log_size, trans_len;
+    NvmeFdpEventBuffer *ebuf;
+    g_autofree NvmeFdpEventsLog *elog = NULL;
+    NvmeFdpEvent *event;
+
+    if (endgrpid != 1 || !n->subsys) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    endgrp = &n->subsys->endgrp;
+
+    if (!endgrp->fdp.enabled) {
+        return NVME_FDP_DISABLED | NVME_DNR;
+    }
+
+    if (host_events) {
+        ebuf = &endgrp->fdp.host_events;
+    } else {
+        ebuf = &endgrp->fdp.ctrl_events;
+    }
+
+    log_size = sizeof(NvmeFdpEventsLog) + ebuf->nelems * sizeof(NvmeFdpEvent);
+    trans_len = MIN(log_size - off, buf_len);
+    elog = g_malloc0(log_size);
+    elog->num_events = cpu_to_le32(ebuf->nelems);
+    event = (NvmeFdpEvent *)(elog + 1);
+
+    if (ebuf->nelems && ebuf->start == ebuf->next) {
+        unsigned int nelems = (NVME_FDP_MAX_EVENTS - ebuf->start);
+        /* wrap over, copy [start;NVME_FDP_MAX_EVENTS[ and [0; next[ */
+        memcpy(event, &ebuf->events[ebuf->start],
+               sizeof(NvmeFdpEvent) * nelems);
+        memcpy(event + nelems, ebuf->events,
+               sizeof(NvmeFdpEvent) * ebuf->next);
+    } else if (ebuf->start < ebuf->next) {
+        memcpy(event, &ebuf->events[ebuf->start],
+               sizeof(NvmeFdpEvent) * (ebuf->next - ebuf->start));
+    }
+
+    return nvme_c2h(n, (uint8_t *)elog + off, trans_len, req);
+}
+
 static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = &req->cmd;
@@ -4631,13 +5116,14 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
     uint8_t  lsp = (dw10 >> 8) & 0xf;
     uint8_t  rae = (dw10 >> 15) & 0x1;
     uint8_t  csi = le32_to_cpu(cmd->cdw14) >> 24;
-    uint32_t numdl, numdu;
+    uint32_t numdl, numdu, lspi;
     uint64_t off, lpol, lpou;
     size_t   len;
     uint16_t status;
 
     numdl = (dw10 >> 16);
     numdu = (dw11 & 0xffff);
+    lspi = (dw11 >> 16);
     lpol = dw12;
     lpou = dw13;
 
@@ -4668,6 +5154,14 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_cmd_effects(n, csi, len, off, req);
     case NVME_LOG_ENDGRP:
         return nvme_endgrp_info(n, rae, len, off, req);
+    case NVME_LOG_FDP_CONFS:
+        return nvme_fdp_confs(n, lspi, len, off, req);
+    case NVME_LOG_FDP_RUH_USAGE:
+        return nvme_fdp_ruh_usage(n, lspi, dw10, dw12, len, off, req);
+    case NVME_LOG_FDP_STATS:
+        return nvme_fdp_stats(n, lspi, len, off, req);
+    case NVME_LOG_FDP_EVENTS:
+        return nvme_fdp_events(n, lspi, len, off, req);
     default:
         trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -5254,6 +5748,84 @@ static uint16_t nvme_get_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
     return nvme_c2h(n, (uint8_t *)&timestamp, sizeof(timestamp), req);
 }
 
+static int nvme_get_feature_fdp(NvmeCtrl *n, uint32_t endgrpid,
+                                uint32_t *result)
+{
+    *result = 0;
+
+    if (!n->subsys || !n->subsys->endgrp.fdp.enabled) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    *result = FIELD_DP16(0, FEAT_FDP, FDPE, 1);
+    *result = FIELD_DP16(*result, FEAT_FDP, CONF_NDX, 0);
+
+    return NVME_SUCCESS;
+}
+
+static uint16_t nvme_get_feature_fdp_events(NvmeCtrl *n, NvmeNamespace *ns,
+                                            NvmeRequest *req, uint32_t *result)
+{
+    NvmeCmd *cmd = &req->cmd;
+    uint32_t cdw11 = le32_to_cpu(cmd->cdw11);
+    uint16_t ph = cdw11 & 0xffff;
+    uint8_t noet = (cdw11 >> 16) & 0xff;
+    uint16_t ruhid, ret;
+    uint32_t nentries = 0;
+    uint8_t s_events_ndx = 0;
+    size_t s_events_siz = sizeof(NvmeFdpEventDescr) * noet;
+    g_autofree NvmeFdpEventDescr *s_events = g_malloc0(s_events_siz);
+    NvmeRuHandle *ruh;
+    NvmeFdpEventDescr *s_event;
+
+    if (!n->subsys || !n->subsys->endgrp.fdp.enabled) {
+        return NVME_FDP_DISABLED | NVME_DNR;
+    }
+
+    if (!nvme_ph_valid(ns, ph)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    ruhid = ns->fdp.phs[ph];
+    ruh = &n->subsys->endgrp.fdp.ruhs[ruhid];
+
+    assert(ruh);
+
+    if (unlikely(noet == 0)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    for (uint8_t event_type = 0; event_type < FDP_EVT_MAX; event_type++) {
+        uint8_t shift = nvme_fdp_evf_shifts[event_type];
+        if (!shift && event_type) {
+            /*
+             * only first entry (event_type == 0) has a shift value of 0
+             * other entries are simply unpopulated.
+             */
+            continue;
+        }
+
+        nentries++;
+
+        s_event = &s_events[s_events_ndx];
+        s_event->evt = event_type;
+        s_event->evta = (ruh->event_filter >> shift) & 0x1;
+
+        /* break if all `noet` entries are filled */
+        if ((++s_events_ndx) == noet) {
+            break;
+        }
+    }
+
+    ret = nvme_c2h(n, s_events, s_events_siz, req);
+    if (ret) {
+        return ret;
+    }
+
+    *result = nentries;
+    return NVME_SUCCESS;
+}
+
 static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = &req->cmd;
@@ -5266,6 +5838,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
     uint16_t iv;
     NvmeNamespace *ns;
     int i;
+    uint16_t endgrpid = 0, ret = NVME_SUCCESS;
 
     static const uint32_t nvme_feature_default[NVME_FID_MAX] = {
         [NVME_ARBITRATION] = NVME_ARB_AB_NOLIMIT,
@@ -5363,6 +5936,33 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
     case NVME_HOST_BEHAVIOR_SUPPORT:
         return nvme_c2h(n, (uint8_t *)&n->features.hbs,
                         sizeof(n->features.hbs), req);
+    case NVME_FDP_MODE:
+        endgrpid = dw11 & 0xff;
+
+        if (endgrpid != 0x1) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+
+        ret = nvme_get_feature_fdp(n, endgrpid, &result);
+        if (ret) {
+            return ret;
+        }
+        goto out;
+    case NVME_FDP_EVENTS:
+        if (!nvme_nsid_valid(n, nsid)) {
+            return NVME_INVALID_NSID | NVME_DNR;
+        }
+
+        ns = nvme_ns(n, nsid);
+        if (unlikely(!ns)) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+
+        ret = nvme_get_feature_fdp_events(n, ns, req, &result);
+        if (ret) {
+            return ret;
+        }
+        goto out;
     default:
         break;
     }
@@ -5395,6 +5995,20 @@ defaults:
         if (iv == n->admin_cq.vector) {
             result |= NVME_INTVC_NOCOALESCING;
         }
+        break;
+    case NVME_FDP_MODE:
+        endgrpid = dw11 & 0xff;
+
+        if (endgrpid != 0x1) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+
+        ret = nvme_get_feature_fdp(n, endgrpid, &result);
+        if (ret) {
+            return ret;
+        }
+        goto out;
+
         break;
     default:
         result = nvme_feature_default[fid];
@@ -5403,7 +6017,7 @@ defaults:
 
 out:
     req->cqe.result = cpu_to_le32(result);
-    return NVME_SUCCESS;
+    return ret;
 }
 
 static uint16_t nvme_set_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
@@ -5421,6 +6035,51 @@ static uint16_t nvme_set_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
     return NVME_SUCCESS;
 }
 
+static uint16_t nvme_set_feature_fdp_events(NvmeCtrl *n, NvmeNamespace *ns,
+                                            NvmeRequest *req)
+{
+    NvmeCmd *cmd = &req->cmd;
+    uint32_t cdw11 = le32_to_cpu(cmd->cdw11);
+    uint16_t ph = cdw11 & 0xffff;
+    uint8_t noet = (cdw11 >> 16) & 0xff;
+    uint16_t ret, ruhid;
+    uint8_t enable = le32_to_cpu(cmd->cdw12) & 0x1;
+    uint8_t event_mask = 0;
+    unsigned int i;
+    g_autofree uint8_t *events = g_malloc0(noet);
+    NvmeRuHandle *ruh = NULL;
+
+    assert(ns);
+
+    if (!n->subsys || !n->subsys->endgrp.fdp.enabled) {
+        return NVME_FDP_DISABLED | NVME_DNR;
+    }
+
+    if (!nvme_ph_valid(ns, ph)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    ruhid = ns->fdp.phs[ph];
+    ruh = &n->subsys->endgrp.fdp.ruhs[ruhid];
+
+    ret = nvme_h2c(n, events, noet, req);
+    if (ret) {
+        return ret;
+    }
+
+    for (i = 0; i < noet; i++) {
+        event_mask |= (1 << nvme_fdp_evf_shifts[events[i]]);
+    }
+
+    if (enable) {
+        ruh->event_filter |= event_mask;
+    } else {
+        ruh->event_filter = ruh->event_filter & ~event_mask;
+    }
+
+    return NVME_SUCCESS;
+}
+
 static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = NULL;
@@ -5580,6 +6239,11 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
             return NVME_CMD_SET_CMB_REJECTED | NVME_DNR;
         }
         break;
+    case NVME_FDP_MODE:
+        /* spec: abort with cmd seq err if there's one or more NS' in endgrp */
+        return NVME_CMD_SEQ_ERROR | NVME_DNR;
+    case NVME_FDP_EVENTS:
+        return nvme_set_feature_fdp_events(n, ns, req);
     default:
         return NVME_FEAT_NOT_CHANGEABLE | NVME_DNR;
     }
@@ -6155,6 +6819,7 @@ static uint16_t nvme_directive_send(NvmeCtrl *n, NvmeRequest *req)
 
 static uint16_t nvme_directive_receive(NvmeCtrl *n, NvmeRequest *req)
 {
+    NvmeNamespace *ns;
     uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
     uint32_t dw11 = le32_to_cpu(req->cmd.cdw11);
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
@@ -6176,7 +6841,30 @@ static uint16_t nvme_directive_receive(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    return nvme_c2h(n, (uint8_t *)&id, trans_len, req);
+    ns = nvme_ns(n, nsid);
+    if (!ns) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    switch (dtype) {
+    case NVME_DIRECTIVE_IDENTIFY:
+        switch (doper) {
+        case NVME_DIRECTIVE_RETURN_PARAMS:
+            if (ns->endgrp->fdp.enabled) {
+                id.supported |= 1 << NVME_DIRECTIVE_DATA_PLACEMENT;
+                id.enabled |= 1 << NVME_DIRECTIVE_DATA_PLACEMENT;
+                id.persistent |= 1 << NVME_DIRECTIVE_DATA_PLACEMENT;
+            }
+
+            return nvme_c2h(n, (uint8_t *)&id, trans_len, req);
+
+        default:
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+
+    default:
+        return NVME_INVALID_FIELD;
+    }
 }
 
 static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
@@ -7541,6 +8229,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
         ctratt |= NVME_CTRATT_ENDGRPS;
 
         id->endgidmax = cpu_to_le16(0x1);
+
+        if (n->subsys->endgrp.fdp.enabled) {
+            ctratt |= NVME_CTRATT_FDPS;
+        }
     }
 
     id->ctratt = cpu_to_le32(ctratt);
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 23872a174c..cfac960dcf 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -14,8 +14,10 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "qemu/bitops.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/block-backend.h"
 
@@ -377,6 +379,130 @@ static void nvme_zoned_ns_shutdown(NvmeNamespace *ns)
     assert(ns->nr_open_zones == 0);
 }
 
+static NvmeRuHandle *nvme_find_ruh_by_attr(NvmeEnduranceGroup *endgrp,
+                                           uint8_t ruha, uint16_t *ruhid)
+{
+    for (uint16_t i = 0; i < endgrp->fdp.nruh; i++) {
+        NvmeRuHandle *ruh = &endgrp->fdp.ruhs[i];
+
+        if (ruh->ruha == ruha) {
+            *ruhid = i;
+            return ruh;
+        }
+    }
+
+    return NULL;
+}
+
+static bool nvme_ns_init_fdp(NvmeNamespace *ns, Error **errp)
+{
+    NvmeEnduranceGroup *endgrp = ns->endgrp;
+    NvmeRuHandle *ruh;
+    uint8_t lbafi = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
+    unsigned int *ruhid, *ruhids;
+    char *r, *p, *token;
+    uint16_t *ph;
+
+    if (!ns->params.fdp.ruhs) {
+        ns->fdp.nphs = 1;
+        ph = ns->fdp.phs = g_new(uint16_t, 1);
+
+        ruh = nvme_find_ruh_by_attr(endgrp, NVME_RUHA_CTRL, ph);
+        if (!ruh) {
+            ruh = nvme_find_ruh_by_attr(endgrp, NVME_RUHA_UNUSED, ph);
+            if (!ruh) {
+                error_setg(errp, "no unused reclaim unit handles left");
+                return false;
+            }
+
+            ruh->ruha = NVME_RUHA_CTRL;
+            ruh->lbafi = lbafi;
+            ruh->ruamw = endgrp->fdp.runs >> ns->lbaf.ds;
+
+            for (uint16_t rg = 0; rg < endgrp->fdp.nrg; rg++) {
+                ruh->rus[rg].ruamw = ruh->ruamw;
+            }
+        } else if (ruh->lbafi != lbafi) {
+            error_setg(errp, "lba format index of controller assigned "
+                       "reclaim unit handle does not match namespace lba "
+                       "format index");
+            return false;
+        }
+
+        return true;
+    }
+
+    ruhid = ruhids = g_new0(unsigned int, endgrp->fdp.nruh);
+    r = p = strdup(ns->params.fdp.ruhs);
+
+    /* parse the placement handle identifiers */
+    while ((token = qemu_strsep(&p, ";")) != NULL) {
+        ns->fdp.nphs += 1;
+        if (ns->fdp.nphs > NVME_FDP_MAXPIDS ||
+            ns->fdp.nphs == endgrp->fdp.nruh) {
+            error_setg(errp, "too many placement handles");
+            free(r);
+            return false;
+        }
+
+        if (qemu_strtoui(token, NULL, 0, ruhid++) < 0) {
+            error_setg(errp, "cannot parse reclaim unit handle identifier");
+            free(r);
+            return false;
+        }
+    }
+
+    free(r);
+
+    ph = ns->fdp.phs = g_new(uint16_t, ns->fdp.nphs);
+
+    ruhid = ruhids;
+
+    /* verify the identifiers */
+    for (unsigned int i = 0; i < ns->fdp.nphs; i++, ruhid++, ph++) {
+        if (*ruhid >= endgrp->fdp.nruh) {
+            error_setg(errp, "invalid reclaim unit handle identifier");
+            return false;
+        }
+
+        ruh = &endgrp->fdp.ruhs[*ruhid];
+
+        switch (ruh->ruha) {
+        case NVME_RUHA_UNUSED:
+            ruh->ruha = NVME_RUHA_HOST;
+            ruh->lbafi = lbafi;
+            ruh->ruamw = endgrp->fdp.runs >> ns->lbaf.ds;
+
+            for (uint16_t rg = 0; rg < endgrp->fdp.nrg; rg++) {
+                ruh->rus[rg].ruamw = ruh->ruamw;
+            }
+
+            break;
+
+        case NVME_RUHA_HOST:
+            if (ruh->lbafi != lbafi) {
+                error_setg(errp, "lba format index of host assigned"
+                           "reclaim unit handle does not match namespace "
+                           "lba format index");
+                return false;
+            }
+
+            break;
+
+        case NVME_RUHA_CTRL:
+            error_setg(errp, "reclaim unit handle is controller assigned");
+            return false;
+
+        default:
+            abort();
+        }
+
+        *ph = *ruhid;
+    }
+
+    return true;
+}
+
 static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
 {
     unsigned int pi_size;
@@ -417,6 +543,11 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
+    if (ns->params.zoned && ns->endgrp && ns->endgrp->fdp.enabled) {
+        error_setg(errp, "cannot be a zoned- in an FDP configuration");
+        return -1;
+    }
+
     if (ns->params.zoned) {
         if (ns->params.max_active_zones) {
             if (ns->params.max_open_zones > ns->params.max_active_zones) {
@@ -502,6 +633,12 @@ int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
         nvme_ns_init_zoned(ns);
     }
 
+    if (ns->endgrp && ns->endgrp->fdp.enabled) {
+        if (!nvme_ns_init_fdp(ns, errp)) {
+            return -1;
+        }
+    }
+
     return 0;
 }
 
@@ -525,6 +662,10 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
         g_free(ns->zone_array);
         g_free(ns->zd_extensions);
     }
+
+    if (ns->endgrp && ns->endgrp->fdp.enabled) {
+        g_free(ns->fdp.phs);
+    }
 }
 
 static void nvme_ns_unrealize(DeviceState *dev)
@@ -562,6 +703,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
             return;
         }
         ns->subsys = subsys;
+        ns->endgrp = &subsys->endgrp;
     }
 
     if (nvme_ns_setup(ns, errp)) {
@@ -648,6 +790,7 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_SIZE("zoned.zrwafg", NvmeNamespace, params.zrwafg, -1),
     DEFINE_PROP_BOOL("eui64-default", NvmeNamespace, params.eui64_default,
                      false),
+    DEFINE_PROP_STRING("fdp.ruhs", NvmeNamespace, params.fdp.ruhs),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index e489830478..209e8f5b4c 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -27,6 +27,8 @@
 #define NVME_MAX_CONTROLLERS 256
 #define NVME_MAX_NAMESPACES  256
 #define NVME_EUI64_DEFAULT ((uint64_t)0x5254000000000000)
+#define NVME_FDP_MAX_EVENTS 63
+#define NVME_FDP_MAXPIDS 128
 
 QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_NSID_BROADCAST - 1);
 
@@ -45,8 +47,47 @@ typedef struct NvmeBus {
     OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
 #define SUBSYS_SLOT_RSVD (void *)0xFFFF
 
+typedef struct NvmeReclaimUnit {
+    uint64_t ruamw;
+} NvmeReclaimUnit;
+
+typedef struct NvmeRuHandle {
+    uint8_t  ruht;
+    uint8_t  ruha;
+    uint64_t event_filter;
+    uint8_t  lbafi;
+    uint64_t ruamw;
+
+    /* reclaim units indexed by reclaim group */
+    NvmeReclaimUnit *rus;
+} NvmeRuHandle;
+
+typedef struct NvmeFdpEventBuffer {
+    NvmeFdpEvent     events[NVME_FDP_MAX_EVENTS];
+    unsigned int     nelems;
+    unsigned int     start;
+    unsigned int     next;
+} NvmeFdpEventBuffer;
+
 typedef struct NvmeEnduranceGroup {
     uint8_t event_conf;
+
+    struct {
+        NvmeFdpEventBuffer host_events, ctrl_events;
+
+        uint16_t nruh;
+        uint16_t nrg;
+        uint8_t  rgif;
+        uint64_t runs;
+
+        uint64_t hbmw;
+        uint64_t mbmw;
+        uint64_t mbe;
+
+        bool enabled;
+
+        NvmeRuHandle *ruhs;
+    } fdp;
 } NvmeEnduranceGroup;
 
 typedef struct NvmeSubsystem {
@@ -55,11 +96,19 @@ typedef struct NvmeSubsystem {
     uint8_t     subnqn[256];
     char        *serial;
 
-    NvmeCtrl      *ctrls[NVME_MAX_CONTROLLERS];
-    NvmeNamespace *namespaces[NVME_MAX_NAMESPACES + 1];
+    NvmeCtrl           *ctrls[NVME_MAX_CONTROLLERS];
+    NvmeNamespace      *namespaces[NVME_MAX_NAMESPACES + 1];
+    NvmeEnduranceGroup endgrp;
 
     struct {
         char *nqn;
+
+        struct {
+            bool     enabled;
+            uint64_t runs;
+            uint16_t nruh;
+            uint32_t nrg;
+        } fdp;
     } params;
 } NvmeSubsystem;
 
@@ -100,6 +149,21 @@ typedef struct NvmeZone {
     QTAILQ_ENTRY(NvmeZone) entry;
 } NvmeZone;
 
+#define FDP_EVT_MAX 0xff
+#define NVME_FDP_MAX_NS_RUHS 32u
+#define FDPVSS 0
+
+static const uint8_t nvme_fdp_evf_shifts[FDP_EVT_MAX] = {
+    /* Host events */
+    [FDP_EVT_RU_NOT_FULLY_WRITTEN]      = 0,
+    [FDP_EVT_RU_ATL_EXCEEDED]           = 1,
+    [FDP_EVT_CTRL_RESET_RUH]            = 2,
+    [FDP_EVT_INVALID_PID]               = 3,
+    /* CTRL events */
+    [FDP_EVT_MEDIA_REALLOC]             = 32,
+    [FDP_EVT_RUH_IMPLICIT_RU_CHANGE]    = 33,
+};
+
 typedef struct NvmeNamespaceParams {
     bool     detached;
     bool     shared;
@@ -129,6 +193,10 @@ typedef struct NvmeNamespaceParams {
     uint32_t numzrwa;
     uint64_t zrwas;
     uint64_t zrwafg;
+
+    struct {
+        char *ruhs;
+    } fdp;
 } NvmeNamespaceParams;
 
 typedef struct NvmeNamespace {
@@ -172,10 +240,17 @@ typedef struct NvmeNamespace {
 
     NvmeNamespaceParams params;
     NvmeSubsystem *subsys;
+    NvmeEnduranceGroup *endgrp;
 
     struct {
         uint32_t err_rec;
     } features;
+
+    struct {
+        uint16_t nphs;
+        /* reclaim unit handle identifiers indexed by placement handle */
+        uint16_t *phs;
+    } fdp;
 } NvmeNamespace;
 
 static inline uint32_t nvme_nsid(NvmeNamespace *ns)
@@ -279,6 +354,12 @@ static inline void nvme_aor_dec_active(NvmeNamespace *ns)
     assert(ns->nr_active_zones >= 0);
 }
 
+static inline void nvme_fdp_stat_inc(uint64_t *a, uint64_t b)
+{
+    uint64_t ret = *a + b;
+    *a = ret < *a ? UINT64_MAX : ret;
+}
+
 void nvme_ns_init_format(NvmeNamespace *ns);
 int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 9d2643678b..24ddec860e 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -7,10 +7,13 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 
 #include "nvme.h"
 
+#define NVME_DEFAULT_RU_SIZE (96 * MiB)
+
 static int nvme_subsys_reserve_cntlids(NvmeCtrl *n, int start, int num)
 {
     NvmeSubsystem *subsys = n->subsys;
@@ -109,13 +112,95 @@ void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeCtrl *n)
     n->cntlid = -1;
 }
 
-static void nvme_subsys_setup(NvmeSubsystem *subsys)
+static bool nvme_calc_rgif(uint16_t nruh, uint16_t nrg, uint8_t *rgif)
+{
+    uint16_t val;
+    unsigned int i;
+
+    if (unlikely(nrg == 1)) {
+        /* PIDRG_NORGI scenario, all of pid is used for PHID */
+        *rgif = 0;
+        return true;
+    }
+
+    val = nrg;
+    i = 0;
+    while (val) {
+        val >>= 1;
+        i++;
+    }
+    *rgif = i;
+
+    /* ensure remaining bits suffice to represent number of phids in a RG */
+    if (unlikely((UINT16_MAX >> i) < nruh)) {
+        *rgif = 0;
+        return false;
+    }
+
+    return true;
+}
+
+static bool nvme_subsys_setup_fdp(NvmeSubsystem *subsys, Error **errp)
+{
+    NvmeEnduranceGroup *endgrp = &subsys->endgrp;
+
+    if (!subsys->params.fdp.runs) {
+        error_setg(errp, "fdp.runs must be non-zero");
+        return false;
+    }
+
+    endgrp->fdp.runs = subsys->params.fdp.runs;
+
+    if (!subsys->params.fdp.nrg) {
+        error_setg(errp, "fdp.nrg must be non-zero");
+        return false;
+    }
+
+    endgrp->fdp.nrg = subsys->params.fdp.nrg;
+
+    if (!subsys->params.fdp.nruh) {
+        error_setg(errp, "fdp.nruh must be non-zero");
+        return false;
+    }
+
+    endgrp->fdp.nruh = subsys->params.fdp.nruh;
+
+    if (!nvme_calc_rgif(endgrp->fdp.nruh, endgrp->fdp.nrg, &endgrp->fdp.rgif)) {
+        error_setg(errp,
+                   "cannot derive a valid rgif (nruh %"PRIu16" nrg %"PRIu32")",
+                   endgrp->fdp.nruh, endgrp->fdp.nrg);
+        return false;
+    }
+
+    endgrp->fdp.ruhs = g_new(NvmeRuHandle, endgrp->fdp.nruh);
+
+    for (uint16_t ruhid = 0; ruhid < endgrp->fdp.nruh; ruhid++) {
+        endgrp->fdp.ruhs[ruhid] = (NvmeRuHandle) {
+            .ruht = NVME_RUHT_INITIALLY_ISOLATED,
+            .ruha = NVME_RUHA_UNUSED,
+        };
+
+        endgrp->fdp.ruhs[ruhid].rus = g_new(NvmeReclaimUnit, endgrp->fdp.nrg);
+    }
+
+    endgrp->fdp.enabled = true;
+
+    return true;
+}
+
+static bool nvme_subsys_setup(NvmeSubsystem *subsys, Error **errp)
 {
     const char *nqn = subsys->params.nqn ?
         subsys->params.nqn : subsys->parent_obj.id;
 
     snprintf((char *)subsys->subnqn, sizeof(subsys->subnqn),
              "nqn.2019-08.org.qemu:%s", nqn);
+
+    if (subsys->params.fdp.enabled && !nvme_subsys_setup_fdp(subsys, errp)) {
+        return false;
+    }
+
+    return true;
 }
 
 static void nvme_subsys_realize(DeviceState *dev, Error **errp)
@@ -124,11 +209,16 @@ static void nvme_subsys_realize(DeviceState *dev, Error **errp)
 
     qbus_init(&subsys->bus, sizeof(NvmeBus), TYPE_NVME_BUS, dev, dev->id);
 
-    nvme_subsys_setup(subsys);
+    nvme_subsys_setup(subsys, errp);
 }
 
 static Property nvme_subsystem_props[] = {
     DEFINE_PROP_STRING("nqn", NvmeSubsystem, params.nqn),
+    DEFINE_PROP_BOOL("fdp", NvmeSubsystem, params.fdp.enabled, false),
+    DEFINE_PROP_SIZE("fdp.runs", NvmeSubsystem, params.fdp.runs,
+                     NVME_DEFAULT_RU_SIZE),
+    DEFINE_PROP_UINT32("fdp.nrg", NvmeSubsystem, params.fdp.nrg, 1),
+    DEFINE_PROP_UINT16("fdp.nruh", NvmeSubsystem, params.fdp.nruh, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index b16f2260b4..7f7837e1a2 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -117,6 +117,7 @@ pci_nvme_clear_ns_reset(uint32_t state, uint64_t slba) "zone state=%"PRIu32", sl
 pci_nvme_zoned_zrwa_implicit_flush(uint64_t zslba, uint32_t nlb) "zslba 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_pci_reset(void) "PCI Function Level Reset"
 pci_nvme_virt_mngmt(uint16_t cid, uint16_t act, uint16_t cntlid, const char* rt, uint16_t nr) "cid %"PRIu16", act=0x%"PRIx16", ctrlid=%"PRIu16" %s nr=%"PRIu16""
+pci_nvme_fdp_ruh_change(uint16_t rgid, uint16_t ruhid) "change RU on RUH rgid=%"PRIu16", ruhid=%"PRIu16""
 
 # error conditions
 pci_nvme_err_mdts(size_t len) "len %zu"
diff --git a/include/block/nvme.h b/include/block/nvme.h
index d463d0ef5f..bb231d0b9a 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1,6 +1,8 @@
 #ifndef BLOCK_NVME_H
 #define BLOCK_NVME_H
 
+#include "hw/registerfields.h"
+
 typedef struct QEMU_PACKED NvmeBar {
     uint64_t    cap;
     uint32_t    vs;
@@ -631,7 +633,9 @@ enum NvmeIoCommands {
     NVME_CMD_WRITE_ZEROES       = 0x08,
     NVME_CMD_DSM                = 0x09,
     NVME_CMD_VERIFY             = 0x0c,
+    NVME_CMD_IO_MGMT_RECV       = 0x12,
     NVME_CMD_COPY               = 0x19,
+    NVME_CMD_IO_MGMT_SEND       = 0x1d,
     NVME_CMD_ZONE_MGMT_SEND     = 0x79,
     NVME_CMD_ZONE_MGMT_RECV     = 0x7a,
     NVME_CMD_ZONE_APPEND        = 0x7d,
@@ -724,7 +728,9 @@ typedef struct QEMU_PACKED NvmeRwCmd {
     uint64_t    slba;
     uint16_t    nlb;
     uint16_t    control;
-    uint32_t    dsmgmt;
+    uint8_t     dsmgmt;
+    uint8_t     rsvd;
+    uint16_t    dspec;
     uint32_t    reftag;
     uint16_t    apptag;
     uint16_t    appmask;
@@ -895,6 +901,8 @@ enum NvmeStatusCodes {
     NVME_INVALID_PRP_OFFSET     = 0x0013,
     NVME_CMD_SET_CMB_REJECTED   = 0x002b,
     NVME_INVALID_CMD_SET        = 0x002c,
+    NVME_FDP_DISABLED           = 0x0029,
+    NVME_INVALID_PHID_LIST      = 0x002a,
     NVME_LBA_RANGE              = 0x0080,
     NVME_CAP_EXCEEDED           = 0x0081,
     NVME_NS_NOT_READY           = 0x0082,
@@ -1031,6 +1039,10 @@ enum NvmeLogIdentifier {
     NVME_LOG_CHANGED_NSLIST             = 0x04,
     NVME_LOG_CMD_EFFECTS                = 0x05,
     NVME_LOG_ENDGRP                     = 0x09,
+    NVME_LOG_FDP_CONFS                  = 0x20,
+    NVME_LOG_FDP_RUH_USAGE              = 0x21,
+    NVME_LOG_FDP_STATS                  = 0x22,
+    NVME_LOG_FDP_EVENTS                 = 0x23,
 };
 
 typedef struct QEMU_PACKED NvmePSD {
@@ -1160,6 +1172,7 @@ enum NvmeIdCtrlOaes {
 enum NvmeIdCtrlCtratt {
     NVME_CTRATT_ENDGRPS = 1 <<  4,
     NVME_CTRATT_ELBAS   = 1 << 15,
+    NVME_CTRATT_FDPS    = 1 << 19,
 };
 
 enum NvmeIdCtrlOacs {
@@ -1273,6 +1286,8 @@ enum NvmeFeatureIds {
     NVME_TIMESTAMP                  = 0xe,
     NVME_HOST_BEHAVIOR_SUPPORT      = 0x16,
     NVME_COMMAND_SET_PROFILE        = 0x19,
+    NVME_FDP_MODE                   = 0x1d,
+    NVME_FDP_EVENTS                 = 0x1e,
     NVME_SOFTWARE_PROGRESS_MARKER   = 0x80,
     NVME_FID_MAX                    = 0x100,
 };
@@ -1652,22 +1667,164 @@ typedef struct NvmeDirectiveIdentify {
     uint8_t unused1[31];
     uint8_t enabled;
     uint8_t unused33[31];
-    uint8_t rsvd64[4032];
+    uint8_t persistent;
+    uint8_t unused65[31];
+    uint8_t rsvd64[4000];
 } NvmeDirectiveIdentify;
 
-enum NvmeDirective {
-    NVME_DIRECTIVE_SUPPORTED = 0x0,
-    NVME_DIRECTIVE_ENABLED   = 0x1,
-};
-
 enum NvmeDirectiveTypes {
-    NVME_DIRECTIVE_IDENTIFY = 0x0,
+    NVME_DIRECTIVE_IDENTIFY       = 0x0,
+    NVME_DIRECTIVE_DATA_PLACEMENT = 0x2,
 };
 
 enum NvmeDirectiveOperations {
     NVME_DIRECTIVE_RETURN_PARAMS = 0x1,
 };
 
+typedef struct QEMU_PACKED NvmeFdpConfsHdr {
+    uint16_t num_confs;
+    uint8_t  version;
+    uint8_t  rsvd3;
+    uint32_t size;
+    uint8_t  rsvd8[8];
+} NvmeFdpConfsHdr;
+
+REG8(FDPA, 0x0)
+    FIELD(FDPA, RGIF, 0, 4)
+    FIELD(FDPA, VWC, 4, 1)
+    FIELD(FDPA, VALID, 7, 1);
+
+typedef struct QEMU_PACKED NvmeFdpDescrHdr {
+    uint16_t descr_size;
+    uint8_t  fdpa;
+    uint8_t  vss;
+    uint32_t nrg;
+    uint16_t nruh;
+    uint16_t maxpids;
+    uint32_t nnss;
+    uint64_t runs;
+    uint32_t erutl;
+    uint8_t  rsvd28[36];
+} NvmeFdpDescrHdr;
+
+enum NvmeRuhType {
+    NVME_RUHT_INITIALLY_ISOLATED = 1,
+    NVME_RUHT_PERSISTENTLY_ISOLATED = 2,
+};
+
+typedef struct QEMU_PACKED NvmeRuhDescr {
+    uint8_t ruht;
+    uint8_t rsvd1[3];
+} NvmeRuhDescr;
+
+typedef struct QEMU_PACKED NvmeRuhuLog {
+    uint16_t nruh;
+    uint8_t  rsvd2[6];
+} NvmeRuhuLog;
+
+enum NvmeRuhAttributes {
+    NVME_RUHA_UNUSED = 0,
+    NVME_RUHA_HOST = 1,
+    NVME_RUHA_CTRL = 2,
+};
+
+typedef struct QEMU_PACKED NvmeRuhuDescr {
+    uint8_t ruha;
+    uint8_t rsvd1[7];
+} NvmeRuhuDescr;
+
+typedef struct QEMU_PACKED NvmeFdpStatsLog {
+    uint64_t hbmw[2];
+    uint64_t mbmw[2];
+    uint64_t mbe[2];
+    uint8_t  rsvd48[16];
+} NvmeFdpStatsLog;
+
+typedef struct QEMU_PACKED NvmeFdpEventsLog {
+    uint32_t num_events;
+    uint8_t  rsvd4[60];
+} NvmeFdpEventsLog;
+
+enum NvmeFdpEventType {
+    FDP_EVT_RU_NOT_FULLY_WRITTEN = 0x0,
+    FDP_EVT_RU_ATL_EXCEEDED = 0x1,
+    FDP_EVT_CTRL_RESET_RUH = 0x2,
+    FDP_EVT_INVALID_PID = 0x3,
+    FDP_EVT_MEDIA_REALLOC = 0x80,
+    FDP_EVT_RUH_IMPLICIT_RU_CHANGE = 0x81,
+};
+
+enum NvmeFdpEventFlags {
+    FDPEF_PIV = 1 << 0,
+    FDPEF_NSIDV = 1 << 1,
+    FDPEF_LV = 1 << 2,
+};
+
+typedef struct QEMU_PACKED NvmeFdpEvent {
+    uint8_t  type;
+    uint8_t  flags;
+    uint16_t pid;
+    uint64_t timestamp;
+    uint32_t nsid;
+    uint64_t type_specific[2];
+    uint16_t rgid;
+    uint8_t  ruhid;
+    uint8_t  rsvd35[5];
+    uint64_t vendor[3];
+} NvmeFdpEvent;
+
+typedef struct QEMU_PACKED NvmePhidList {
+    uint16_t nnruhd;
+    uint8_t  rsvd2[6];
+} NvmePhidList;
+
+typedef struct QEMU_PACKED NvmePhidDescr {
+    uint8_t  ruht;
+    uint8_t  rsvd1;
+    uint16_t ruhid;
+} NvmePhidDescr;
+
+REG32(FEAT_FDP, 0x0)
+    FIELD(FEAT_FDP, FDPE, 0, 1)
+    FIELD(FEAT_FDP, CONF_NDX, 8, 8);
+
+typedef struct QEMU_PACKED NvmeFdpEventDescr {
+    uint8_t evt;
+    uint8_t evta;
+} NvmeFdpEventDescr;
+
+REG32(NVME_IOMR, 0x0)
+    FIELD(NVME_IOMR, MO, 0, 8)
+    FIELD(NVME_IOMR, MOS, 16, 16);
+
+enum NvmeIomr2Mo {
+    NVME_IOMR_MO_NOP = 0x0,
+    NVME_IOMR_MO_RUH_STATUS = 0x1,
+    NVME_IOMR_MO_VENDOR_SPECIFIC = 0x255,
+};
+
+typedef struct QEMU_PACKED NvmeRuhStatus {
+    uint8_t  rsvd0[14];
+    uint16_t nruhsd;
+} NvmeRuhStatus;
+
+typedef struct QEMU_PACKED NvmeRuhStatusDescr {
+    uint16_t pid;
+    uint16_t ruhid;
+    uint32_t earutr;
+    uint64_t ruamw;
+    uint8_t  rsvd16[16];
+} NvmeRuhStatusDescr;
+
+REG32(NVME_IOMS, 0x0)
+    FIELD(NVME_IOMS, MO, 0, 8)
+    FIELD(NVME_IOMS, MOS, 16, 16);
+
+enum NvmeIoms2Mo {
+    NVME_IOMS_MO_NOP = 0x0,
+    NVME_IOMS_MO_RUH_UPDATE = 0x1,
+};
+
 static inline void _nvme_check_size(void)
 {
     QEMU_BUILD_BUG_ON(sizeof(NvmeBar) != 4096);
-- 
2.39.2


