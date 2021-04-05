Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7FD35423A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 15:06:01 +0200 (CEST)
Received: from localhost ([::1]:53822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTOvY-0004un-Kk
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 09:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lTOpu-00030W-G0
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 09:00:12 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:42907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lTOpn-0006Lf-74
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 09:00:09 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210405125956epoutp01914c586af9179f1601b6a01831ad87af~y97p7dQep3004030040epoutp01B
 for <qemu-devel@nongnu.org>; Mon,  5 Apr 2021 12:59:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210405125956epoutp01914c586af9179f1601b6a01831ad87af~y97p7dQep3004030040epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617627596;
 bh=28eSnBFwVzlc9DD2Dk16D+wnpUIzvzXxR/jwiEZx7K0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pggEZ9H4gFdVsjvRYnQ48cG8PbyKyTqBBp1KQ/sNy06QYdsE8X39zgw6dD2+iN3VY
 3GkmEV3NjhzpteAnFrIECb0sZTEOBP/Q/lReXErKh5xoE1l5b+UyG3ELdr4IL3aZ2K
 Vv3xV+wd0UMbrlIgkwv7l6UNScGLVCrESoVydJ4E=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210405125955epcas5p4f18f987f48e208ac9e58f1f36794f430~y97o_B00p1942719427epcas5p4e;
 Mon,  5 Apr 2021 12:59:55 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A0.D3.39068.BC90B606; Mon,  5 Apr 2021 21:59:55 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20210405123541epcas5p21088333e3cbaa1b40e10e7c20ab889aa~y9me1nK3-0708107081epcas5p2g;
 Mon,  5 Apr 2021 12:35:41 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210405123541epsmtrp2d82a6194af42171f3bd6d6f629eb3523~y9me0z7wh1891118911epsmtrp2L;
 Mon,  5 Apr 2021 12:35:41 +0000 (GMT)
X-AuditID: b6c32a4a-60fff7000000989c-57-606b09cbf8ee
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A6.F2.33967.D140B606; Mon,  5 Apr 2021 21:35:41 +0900 (KST)
Received: from 2030045822 (unknown [107.108.221.178]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210405123539epsmtip1cd74cc3cf888f7ef56037c3c48b5437c~y9mdObwwY0601206012epsmtip1K;
 Mon,  5 Apr 2021 12:35:39 +0000 (GMT)
Date: Mon, 5 Apr 2021 18:02:39 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH for-6.0 7/7] hw/block/nvme: fix handling of private
 namespaces
Message-ID: <20210405123239.GA1248@2030045822>
MIME-Version: 1.0
In-Reply-To: <20210324200907.408996-8-its@irrelevant.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7bCmhu5pzuwEg8UvBSyu7D/PaLH/4DdW
 i5ONe1gtJh26xmix5GKqxa9Obot5t5QtZr1rZ7M43ruDxeL1pP+sDlweP861s3nsnHWX3ePc
 jvPsHptWdbJ5PLm2mcnj/b6rbB59W1YxBrBHcdmkpOZklqUW6dslcGU8P/mSpeDOTMaKvocX
 mBoYNxZ1MXJySAiYSBzrmsHUxcjFISSwm1Hi89J7UM4nRomFyx+wQjjfGCVOLtvFBtNypHU3
 M0RiL6PE6hW/2SCcV4wS79b9YwSpYhFQkVh5uxmsg03ASGL22zdgcRGg+NN/e1lAGpgFljBJ
 rPq1iQkkISwQIvF12nKwBl4BPYmlzW3MELagxMmZT4AaODg4BSwkzl9VBQmLCihLHNh2HOxW
 CYG5HBItc5awQpznIjGlfysLhC0s8er4FnYIW0ri87u9QPPZgexqicNFEK0djBLHLm+A+sxe
 4t+zaWB3MgtkSHTP6YNqlZWYemodE0ScT6L39xMmiDivxI55MLaaxIJb36HqZSRm/rnNCnKy
 hICHxP6D4iBhIYGdjBK7b4lOYJSfheSxWUi2QdhWEp0fmlhnAXUzC0hLLP/HAWFqSqzfpb+A
 kXUVo2RqQXFuemqxaYFRXmq5XnFibnFpXrpecn7uJkZw2tLy2sH48MEHvUOMTByMhxglOJiV
 RHiP/8lKEOJNSaysSi3Kjy8qzUktPsQozcGiJM67w+BBvJBAemJJanZqakFqEUyWiYNTqoFp
 cWba2nsHFPIuLp5yeduli8Y7bqz8IBx34EbcvV3cUtFuCaFr2d02cil/tb7nyPT18o/LmjmF
 a/bFSD5k5Vx/12op67xYP5PD82o5Hif/PXJWrfTApJ0Tb5h84pj0XaPdvcDmva5hlPWxtnKG
 N3235h347FnZXPi/l3/epQlSZUnZwgv12W/4LNI/7+l3P6hHNq0mbsmiL0fT9Lqytyj75N11
 3lVdsoX/cE6c8EYBAzsxlQd5WQKTJilHKdzc+eP+NecdhVzv/6V0KN7ZeabacOfxZdJbj7w1
 SefMn9p+quXcoa05X+dYX+WrkE5kX8bK//7mi7R1j65u373/JN8626pVLpc9rvmVpmZUu7uu
 VGIpzkg01GIuKk4EAA/XYbvKAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsWy7bCSnK4sS3aCwf8bwhZX9p9ntNh/8Bur
 xcnGPawWkw5dY7RYcjHV4lcnt8W8W8oWs961s1kc793BYvF60n9WBy6PH+fa2Tx2zrrL7nFu
 x3l2j02rOtk8nlzbzOTxft9VNo++LasYA9ijuGxSUnMyy1KL9O0SuDLWLNvJWNA3nbFi8fbj
 TA2Mf/O7GDk5JARMJI607mbuYuTiEBLYzSgx490yZoiEjMSvU1OhbGGJlf+es0MUvWCUeLv4
 EztIgkVARWLl7WY2EJtNwEhi9ts3jCC2CFD86b+9LCANzALLmCROfH0B1iAsECLxddpysAZe
 AT2Jpc1tYBuEBFIlrv/6ww4RF5Q4OfMJC4jNLGAmMW/zQ6AaDiBbWmL5Pw4Qk1PAQuL8VVWQ
 ClEBZYkD244zTWAUnIWkeRaS5lkIzQsYmVcxSqYWFOem5xYbFhjmpZbrFSfmFpfmpesl5+du
 YgTHjJbmDsbtqz7oHWJk4mA8xCjBwawkwnv8T1aCEG9KYmVValF+fFFpTmrxIUZpDhYlcd4L
 XSfjhQTSE0tSs1NTC1KLYLJMHJxSDUwM1zXXdZ0pj053uGKr+PenaCnLr9e8ljb1R49ulM+/
 /lDn3myxGVvXdwdVrfFtt2DwWxzopCVzrWm5BfPWfW1fbv7/OrVV8sRVp4m+XBXnlUTrbT5U
 7mrO3rO4UuBS6ofsRk0N4ZPB05f7ujPwxM9dd82hjSPiaGlkhUeBmsl0j/kT89unr+O4G9ej
 zlny1t/39jQj9+vzuzIXPEhIMS5RfFQr+vRkhExM6uOHv4Jfnl09TWFywXKjy4l3k2Ztsld4
 kPRJuzuxl2GWx/Fu/hzDmIx710IveL9+cW6DuD9rOKdEi2ils9DKT86sa3mzKj+vPaPy+Yre
 gXLWi1z1iU09N/Pqewy2eDQWNLfsV2Ipzkg01GIuKk4EAOd1KY8IAwAA
X-CMS-MailID: 20210405123541epcas5p21088333e3cbaa1b40e10e7c20ab889aa
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----rJxxaR0GuCM_dHQxpWiIChs6D.UommiO4QigGiW7XG79mXGL=_4c266_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210405123541epcas5p21088333e3cbaa1b40e10e7c20ab889aa
References: <20210324200907.408996-1-its@irrelevant.dk>
 <20210324200907.408996-8-its@irrelevant.dk>
 <CGME20210405123541epcas5p21088333e3cbaa1b40e10e7c20ab889aa@epcas5p2.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------rJxxaR0GuCM_dHQxpWiIChs6D.UommiO4QigGiW7XG79mXGL=_4c266_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Wed, Mar 24, 2021 at 09:09:07PM +0100, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>Prior to this patch, if a private nvme-ns device (that is, a namespace
>that is not linked to a subsystem) is wired up to an nvme-subsys linked
>nvme controller device, the device fails to verify that the namespace id
>is unique within the subsystem. NVM Express v1.4b, Section 6.1.6 ("NSID
>and Namespace Usage") states that because the device supports Namespace
>Management, "NSIDs *shall* be unique within the NVM subsystem".
>
>Additionally, prior to this patch, private namespaces are not known to
>the subsystem and the namespace is considered exclusive to the
>controller with which it is initially wired up to. However, this is not
>the definition of a private namespace; per Section 1.6.33 ("private
>namespace"), a private namespace is just a namespace that does not
>support multipath I/O or namespace sharing, which means "that it is only
>able to be attached to one controller at a time".
>
>Fix this by always allocating namespaces in the subsystem (if one is
>linked to the controller), regardsless of the shared/private status of
>the namespace. Whether or not the namespace is shareable is controlled
>by a new `shared` nvme-ns parameter.
>
>Finally, this fix allows the nvme-ns `subsys` parameter to be removed,
>since the `shared` parameter now serves the purpose of attaching the
>namespace to all controllers in the subsystem upon device realization.
>It is invalid to have an nvme-ns namespace device with a linked
>subsystem without the parent nvme controller device also being linked to
>one and since the nvme-ns devices will unconditionally be "attached" (in
>QEMU terms that is) to an nvme controller device through an NvmeBus, the
>nvme-ns namespace device can always get a reference to the subsystem of
>the controller it is explicitly (using 'bus=' parametr) or implicitly
>attaching to.
>
>Fixes: e570768566b3 ("hw/block/nvme: support for shared namespace in subsystem")
>Cc: Minwoo Im <minwoo.im.dev@gmail.com>
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> hw/block/nvme-ns.h     |  10 ++--
> hw/block/nvme-subsys.h |   7 ++-
> hw/block/nvme.h        |  39 +-------------
> include/block/nvme.h   |   1 +
> hw/block/nvme-ns.c     |  74 +++++++++++++++++++++++----
> hw/block/nvme-subsys.c |  28 -----------
> hw/block/nvme.c        | 112 +++++++++++++----------------------------
> hw/block/trace-events  |   1 -
> 8 files changed, 106 insertions(+), 166 deletions(-)
>
>diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
>index 82340c4b2574..fb0a41f912e7 100644
>--- a/hw/block/nvme-ns.h
>+++ b/hw/block/nvme-ns.h
>@@ -29,6 +29,7 @@ typedef struct NvmeZone {
>
> typedef struct NvmeNamespaceParams {
>     bool     detached;
>+    bool     shared;
>     uint32_t nsid;
>     QemuUUID uuid;
>
>@@ -60,8 +61,8 @@ typedef struct NvmeNamespace {
>     const uint32_t *iocs;
>     uint8_t      csi;
>     uint16_t     status;
>+    int          attached;
>
>-    NvmeSubsystem   *subsys;
>     QTAILQ_ENTRY(NvmeNamespace) entry;
>
>     NvmeIdNsZoned   *id_ns_zoned;
>@@ -99,11 +100,6 @@ static inline uint32_t nvme_nsid(NvmeNamespace *ns)
>     return 0;
> }
>
>-static inline bool nvme_ns_shared(NvmeNamespace *ns)
>-{
>-    return !!ns->subsys;
>-}
>-
> static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
> {
>     NvmeIdNs *id_ns = &ns->id_ns;
>@@ -225,7 +221,7 @@ static inline void nvme_aor_dec_active(NvmeNamespace *ns)
> }
>
> void nvme_ns_init_format(NvmeNamespace *ns);
>-int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
>+int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
> void nvme_ns_drain(NvmeNamespace *ns);
> void nvme_ns_shutdown(NvmeNamespace *ns);
> void nvme_ns_cleanup(NvmeNamespace *ns);
>diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
>index aafa04b84829..24132edd005c 100644
>--- a/hw/block/nvme-subsys.h
>+++ b/hw/block/nvme-subsys.h
>@@ -14,7 +14,7 @@
>     OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
>
> #define NVME_SUBSYS_MAX_CTRLS   32
>-#define NVME_SUBSYS_MAX_NAMESPACES  256
>+#define NVME_MAX_NAMESPACES     256
>
> typedef struct NvmeCtrl NvmeCtrl;
> typedef struct NvmeNamespace NvmeNamespace;
>@@ -24,7 +24,7 @@ typedef struct NvmeSubsystem {
>
>     NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
>     /* Allocated namespaces for this subsystem */
>-    NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES + 1];
>+    NvmeNamespace *namespaces[NVME_MAX_NAMESPACES + 1];
>
>     struct {
>         char *nqn;
>@@ -32,7 +32,6 @@ typedef struct NvmeSubsystem {
> } NvmeSubsystem;
>
> int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
>-int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp);
>
> static inline NvmeCtrl *nvme_subsys_ctrl(NvmeSubsystem *subsys,
>         uint32_t cntlid)
>@@ -54,7 +53,7 @@ static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
>         return NULL;
>     }
>
>-    assert(nsid && nsid <= NVME_SUBSYS_MAX_NAMESPACES);
>+    assert(nsid && nsid <= NVME_MAX_NAMESPACES);
>
>     return subsys->namespaces[nsid];
> }
>diff --git a/hw/block/nvme.h b/hw/block/nvme.h
>index 1570f65989a7..644143597a0f 100644
>--- a/hw/block/nvme.h
>+++ b/hw/block/nvme.h
>@@ -6,17 +6,9 @@
> #include "nvme-subsys.h"
> #include "nvme-ns.h"
>
>-#define NVME_MAX_NAMESPACES 256
>-
> #define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
> #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
>
>-/*
>- * Subsystem namespace list for allocated namespaces should be larger than
>- * attached namespace list in a controller.
>- */
>-QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_SUBSYS_MAX_NAMESPACES);
>-
> typedef struct NvmeParams {
>     char     *serial;
>     uint32_t num_queues; /* deprecated since 5.1 */
>@@ -234,35 +226,6 @@ static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
>     return n->namespaces[nsid];
> }
>
>-static inline bool nvme_ns_is_attached(NvmeCtrl *n, NvmeNamespace *ns)
>-{
>-    int nsid;
>-
>-    for (nsid = 1; nsid <= n->num_namespaces; nsid++) {
>-        if (nvme_ns(n, nsid) == ns) {
>-            return true;
>-        }
>-    }
>-
>-    return false;
>-}
>-
>-static inline void nvme_ns_attach(NvmeCtrl *n, NvmeNamespace *ns)
>-{
>-    uint32_t nsid = nvme_nsid(ns);
>-    assert(nsid && nsid <= NVME_MAX_NAMESPACES);
>-
>-    n->namespaces[nsid] = ns;
>-}
>-
>-static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
>-{
>-    uint32_t nsid = nvme_nsid(ns);
>-    assert(nsid && nsid <= NVME_MAX_NAMESPACES);
>-
>-    n->namespaces[nsid] = NULL;
>-}
>-
> static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
> {
>     NvmeSQueue *sq = req->sq;
>@@ -291,7 +254,7 @@ typedef enum NvmeTxDirection {
>     NVME_TX_DIRECTION_FROM_DEVICE = 1,
> } NvmeTxDirection;
>
>-int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
>+void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
> uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
>                           NvmeTxDirection dir, NvmeRequest *req);
> uint16_t nvme_bounce_mdata(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
>diff --git a/include/block/nvme.h b/include/block/nvme.h
>index b0a4e4291611..4ac926fbc687 100644
>--- a/include/block/nvme.h
>+++ b/include/block/nvme.h
>@@ -847,6 +847,7 @@ enum NvmeStatusCodes {
>     NVME_FEAT_NOT_NS_SPEC       = 0x010f,
>     NVME_FW_REQ_SUSYSTEM_RESET  = 0x0110,
>     NVME_NS_ALREADY_ATTACHED    = 0x0118,
>+    NVME_NS_PRIVATE             = 0x0119,
>     NVME_NS_NOT_ATTACHED        = 0x011A,
>     NVME_NS_CTRL_LIST_INVALID   = 0x011C,
>     NVME_CONFLICTING_ATTRS      = 0x0180,
>diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
>index ca04ee1bacfb..aee43ba0b873 100644
>--- a/hw/block/nvme-ns.c
>+++ b/hw/block/nvme-ns.c
>@@ -73,7 +73,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
>     /* support DULBE and I/O optimization fields */
>     id_ns->nsfeat |= (0x4 | 0x10);
>
>-    if (nvme_ns_shared(ns)) {
>+    if (ns->params.shared) {
>         id_ns->nmic |= NVME_NMIC_NS_SHARED;
>     }
>
>@@ -387,7 +387,8 @@ static void nvme_zoned_ns_shutdown(NvmeNamespace *ns)
>     assert(ns->nr_open_zones == 0);
> }
>
>-static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
>+static int nvme_ns_check_constraints(NvmeCtrl *n, NvmeNamespace *ns,
>+                                     Error **errp)
> {
>     if (!ns->blkconf.blk) {
>         error_setg(errp, "block backend not configured");
>@@ -400,12 +401,32 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
>         return -1;
>     }
>
>+    if (ns->params.nsid > NVME_MAX_NAMESPACES) {
>+        error_setg(errp, "invalid namespace id (must be between 0 and %d)",
>+                   NVME_MAX_NAMESPACES);
>+        return -1;
>+    }
>+
>+    if (!n->subsys) {
>+        if (ns->params.detached) {
>+            error_setg(errp, "detached requires that the nvme device is "
>+                       "linked to an nvme-subsys device");
>+            return -1;
>+        }
>+
>+        if (ns->params.shared) {
>+            error_setg(errp, "shared requires that the nvme device is "
>+                       "linked to an nvme-subsys device");
>+            return -1;
>+        }
>+    }
>+
>     return 0;
> }
>
>-int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
>+int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
> {
>-    if (nvme_ns_check_constraints(ns, errp)) {
>+    if (nvme_ns_check_constraints(n, ns, errp)) {
>         return -1;
>     }
>
>@@ -453,27 +474,60 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
>     NvmeNamespace *ns = NVME_NS(dev);
>     BusState *s = qdev_get_parent_bus(dev);
>     NvmeCtrl *n = NVME(s->parent);
>+    NvmeSubsystem *subsys = n->subsys;
>+    uint32_t nsid = ns->params.nsid;
>+    int i;
>
>-    if (nvme_ns_setup(ns, errp)) {
>+    if (nvme_ns_setup(n, ns, errp)) {
>         return;
>     }
>
>-    if (ns->subsys) {
>-        if (nvme_subsys_register_ns(ns, errp)) {
>+    if (!nsid) {
>+        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
>+            if (!nvme_ns(n, i) || nvme_subsys_ns(subsys, i)) {
>+                nsid = ns->params.nsid = i;
>+                break;
>+            }
>+        }
>+
>+        if (!nsid) {
>+            error_setg(errp, "no free namespace id");
>             return;
>         }
>     } else {
>-        if (nvme_register_namespace(n, ns, errp)) {
>+        if (nvme_ns(n, nsid) || nvme_subsys_ns(subsys, nsid)) {
>+            error_setg(errp, "namespace id '%d' already allocated", nsid);
>             return;
>         }
>     }
>+
>+    if (subsys) {
>+        subsys->namespaces[nsid] = ns;
>+
>+        if (ns->params.detached) {
>+            return;
>+        }
>+
>+        if (ns->params.shared) {
>+            for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
>+                NvmeCtrl *ctrl = subsys->ctrls[i];
>+
>+                if (ctrl) {
>+                    nvme_attach_ns(ctrl, ns);
>+                }
>+            }
>+
>+            return;
>+        }
>+    }
>+
>+    nvme_attach_ns(n, ns);
> }
>
> static Property nvme_ns_props[] = {
>     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
>-    DEFINE_PROP_LINK("subsys", NvmeNamespace, subsys, TYPE_NVME_SUBSYS,
>-                     NvmeSubsystem *),
>     DEFINE_PROP_BOOL("detached", NvmeNamespace, params.detached, false),
>+    DEFINE_PROP_BOOL("shared", NvmeNamespace, params.shared, false)i,

Nice change point, hope we need update the usage, removing "subsys" from 
nvme-ns device params and adding "shared" param?

>     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
>     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
>     DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0),
>diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
>index 9fadef8cec99..283a97b79d57 100644
>--- a/hw/block/nvme-subsys.c
>+++ b/hw/block/nvme-subsys.c
>@@ -43,34 +43,6 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
>     return cntlid;
> }
>
>-int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp)
>-{
>-    NvmeSubsystem *subsys = ns->subsys;
>-    NvmeCtrl *n;
>-    uint32_t nsid = nvme_nsid(ns);
>-    int i;
>-
>-    assert(nsid && nsid <= NVME_SUBSYS_MAX_NAMESPACES);
>-
>-    if (subsys->namespaces[nsid]) {
>-        error_setg(errp, "namespace %d already registerd to subsy %s",
>-                   nvme_nsid(ns), subsys->parent_obj.id);
>-        return -1;
>-    }
>-
>-    subsys->namespaces[nsid] = ns;
>-
>-    for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
>-        n = subsys->ctrls[i];
>-
>-        if (n && nvme_register_namespace(n, ns, errp)) {
>-            return -1;
>-        }
>-    }
>-
>-    return 0;
>-}
>-
> static void nvme_subsys_setup(NvmeSubsystem *subsys)
> {
>     const char *nqn = subsys->params.nqn ?
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index e84e43b2692d..734a80dbd540 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -4250,7 +4250,7 @@ static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
>             continue;
>         }
>
>-        if (!nvme_ns_is_attached(ctrl, ns)) {
>+        if (!nvme_ns(ctrl, c->nsid)) {
>             continue;
>         }
>
>@@ -4907,6 +4907,10 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
>
>     trace_pci_nvme_ns_attachment(nvme_cid(req), dw10 & 0xf);
>
>+    if (!nvme_nsid_valid(n, nsid)) {
>+        return NVME_INVALID_NSID | NVME_DNR;
>+    }
>+
>     ns = nvme_subsys_ns(n->subsys, nsid);
>     if (!ns) {
>         return NVME_INVALID_FIELD | NVME_DNR;
>@@ -4928,18 +4932,23 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
>         }
>
>         if (attach) {
>-            if (nvme_ns_is_attached(ctrl, ns)) {
>+            if (nvme_ns(ctrl, nsid)) {
>                 return NVME_NS_ALREADY_ATTACHED | NVME_DNR;
>             }
>
>-            nvme_ns_attach(ctrl, ns);
>+            if (ns->attached && !ns->params.shared) {
>+                return NVME_NS_PRIVATE | NVME_DNR;
>+            }
>+
>+            nvme_attach_ns(ctrl, ns);
>             __nvme_select_ns_iocs(ctrl, ns);
>         } else {
>-            if (!nvme_ns_is_attached(ctrl, ns)) {
>+            if (!nvme_ns(ctrl, nsid)) {
>                 return NVME_NS_NOT_ATTACHED | NVME_DNR;
>             }
>
>-            nvme_ns_detach(ctrl, ns);
>+            ctrl->namespaces[nsid] = NULL;
>+            ns->attached--;
>
>             __nvme_update_dmrsl(ctrl);
>         }
>@@ -5827,6 +5836,12 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
>     if (n->namespace.blkconf.blk) {
>         warn_report("drive property is deprecated; "
>                     "please use an nvme-ns device instead");
>+
>+        if (n->subsys) {
>+            error_setg(errp, "subsystem support is unavailable with legacy "
>+                       "namespace ('drive' property)");
>+            return;
>+        }
>     }
>
>     if (params->max_ioqpairs < 1 ||
>@@ -5889,75 +5904,6 @@ static void nvme_init_state(NvmeCtrl *n)
>     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
> }
>
>-static int nvme_attach_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
>-{
>-    if (nvme_ns_is_attached(n, ns)) {
>-        error_setg(errp,
>-                   "namespace %d is already attached to controller %d",
>-                   nvme_nsid(ns), n->cntlid);
>-        return -1;
>-    }
>-
>-    nvme_ns_attach(n, ns);
>-
>-    return 0;
>-}
>-
>-int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
>-{
>-    uint32_t nsid = nvme_nsid(ns);
>-
>-    if (nsid > NVME_MAX_NAMESPACES) {
>-        error_setg(errp, "invalid namespace id (must be between 0 and %d)",
>-                   NVME_MAX_NAMESPACES);
>-        return -1;
>-    }
>-
>-    if (!nsid) {
>-        for (int i = 1; i <= n->num_namespaces; i++) {
>-            if (!nvme_ns(n, i)) {
>-                nsid = ns->params.nsid = i;
>-                break;
>-            }
>-        }
>-
>-        if (!nsid) {
>-            error_setg(errp, "no free namespace id");
>-            return -1;
>-        }
>-    } else {
>-        if (n->namespaces[nsid]) {
>-            error_setg(errp, "namespace id '%d' is already in use", nsid);
>-            return -1;
>-        }
>-    }
>-
>-    trace_pci_nvme_register_namespace(nsid);
>-
>-    /*
>-     * If subsys is not given, namespae is always attached to the controller
>-     * because there's no subsystem to manage namespace allocation.
>-     */
>-    if (!n->subsys) {
>-        if (ns->params.detached) {
>-            error_setg(errp,
>-                       "detached needs nvme-subsys specified nvme or nvme-ns");
>-            return -1;
>-        }
>-
>-        return nvme_attach_namespace(n, ns, errp);
>-    } else {
>-        if (!ns->params.detached) {
>-            return nvme_attach_namespace(n, ns, errp);
>-        }
>-    }
>-
>-    n->dmrsl = MIN_NON_ZERO(n->dmrsl,
>-                            BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
>-
>-    return 0;
>-}
>-
> static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
> {
>     uint64_t cmb_size = n->params.cmb_size_mb * MiB;
>@@ -6187,6 +6133,18 @@ static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
>     return 0;
> }
>
>+void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
>+{
>+    uint32_t nsid = ns->params.nsid;
>+    assert(nsid && nsid <= NVME_MAX_NAMESPACES);
>+
>+    n->namespaces[nsid] = ns;
>+    ns->attached++;
>+
>+    n->dmrsl = MIN_NON_ZERO(n->dmrsl,
>+                            BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
>+}
>+
> static void nvme_realize(PCIDevice *pci_dev, Error **errp)
> {
>     NvmeCtrl *n = NVME(pci_dev);
>@@ -6218,13 +6176,11 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>         ns = &n->namespace;
>         ns->params.nsid = 1;
>
>-        if (nvme_ns_setup(ns, errp)) {
>+        if (nvme_ns_setup(n, ns, errp)) {
>             return;
>         }
>
>-        if (nvme_register_namespace(n, ns, errp)) {
>-            return;
>-        }
>+        nvme_attach_ns(n, ns);
>     }
> }
>
>diff --git a/hw/block/trace-events b/hw/block/trace-events
>index 22da06986d72..fa12e3a67a75 100644
>--- a/hw/block/trace-events
>+++ b/hw/block/trace-events
>@@ -51,7 +51,6 @@ hd_geometry_guess(void *blk, uint32_t cyls, uint32_t heads, uint32_t secs, int t
>
> # nvme.c
> # nvme traces for successful events
>-pci_nvme_register_namespace(uint32_t nsid) "nsid %"PRIu32""
> pci_nvme_irq_msix(uint32_t vector) "raising MSI-X IRQ vector %u"
> pci_nvme_irq_pin(void) "pulsing IRQ pin"
> pci_nvme_irq_masked(void) "IRQ is masked"
>-- 

Changes looks good to me.
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>

>2.31.0
>
>

------rJxxaR0GuCM_dHQxpWiIChs6D.UommiO4QigGiW7XG79mXGL=_4c266_
Content-Type: text/plain; charset="utf-8"


------rJxxaR0GuCM_dHQxpWiIChs6D.UommiO4QigGiW7XG79mXGL=_4c266_--

