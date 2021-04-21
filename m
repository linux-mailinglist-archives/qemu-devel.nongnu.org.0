Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9543664F8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 07:44:47 +0200 (CEST)
Received: from localhost ([::1]:51598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ5fK-0005w1-MV
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 01:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZ5ZG-0003gm-3M; Wed, 21 Apr 2021 01:38:32 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:43795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZ5ZD-0005lM-3h; Wed, 21 Apr 2021 01:38:29 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AB4395C0199;
 Wed, 21 Apr 2021 01:38:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 21 Apr 2021 01:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=FR4oxnZeEbjxfCQHq+VDk31sQEk
 izgObI6mgL5UlHLg=; b=cTeCOBrnFEHPwfCkwJ/klqW5ckAm+Qmks1PJE2Bg//Y
 MhzKqxOavQICKPiOJ/mhUEsxHSvIoWey1clTN0ZfYo2dm9Nk4B4z6PmFI0Ei6JlQ
 UTr5Mla+itDwaIq/7pjUJPwf5msTZnS8ARgO0YYlDh/DCk/cJU6tr65Zrl/NZ/qI
 xnQNwhQaOmCbAUfZXDHB8vqTPEy+GhpT3ve1G3N1EsKyIuHbtEViGHASgUod4ysx
 PQSAqWtyfKwpc4U0XucnNONBygp7ksRIgFGf+IDYimlwK+M/TQBK8zkC2If58MU7
 0jwibFyjBwVYhb5VPYlmQYY9t60UCQYHA3OvldVj21Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FR4oxn
 ZeEbjxfCQHq+VDk31sQEkizgObI6mgL5UlHLg=; b=PknAa7hHL5l76OIT3Nw2Ir
 gjRLX/mYRN5y744jFgputTxk9DjkRkC++0OkxMqfop1LbXu7wb8s+87gNSkc55R5
 z0mKHqgGS5nb0mV0iaYJwWya0DVOenFzA07UM4YnhPkLBbt1CEcht4RTa5xSrZrC
 W68Y9RTAbDm+HzIz3le8bViSYHqnbdDL8I2mXyS+HQcWaUYQqsyTuuGR6xIKv+g4
 2R3MAUvz1ibw4ghlYZwYJmOj925DfYDd5J1pg5k9zlvNn/tOTfBFEvRa+sXGpnUI
 1Xvc/zw0FfuHYt2FRmDl5nimeo8WIma+jbSsTzYdiSjI04+K89AiXgSMMkm5IdNg
 ==
X-ME-Sender: <xms:T7p_YEW1XzG0cMJy1_2mf3-jIye_Eg5CBSFwzAWIFd_HeWW6cf9BBQ>
 <xme:T7p_YIlILjyVvdeeSAmq2WVx5G8iGPHMaG3Jx0HUS-rLZAFOCM5z-0xYEIadHs2fp
 u8t5m5s1V-7vuYXeEc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtjedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjeegudffueeiteekieelkedvueelte
 evjeduieeludfffeejgeffhfduvdduffeknecukfhppeektddrudeijedrleekrdduledt
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:T7p_YIZQjNjQ8WqpfrsMrn2ZF-ZZl7OE98f_69rJ1ajew6dcQKSJRw>
 <xmx:T7p_YDUZgvhiWjmlUIcdwXGoIfHQ3cA2YhU9P0ZViihka6i6aax22A>
 <xmx:T7p_YOkdKiG59ChcrmaFt6qqFmDeyypk9yH87TE8JJbvkk66H4oMCw>
 <xmx:Ubp_YAUHz9QS87X_oCVQPO3k1wiliLYeFgpDFrLPYceg3Esot4LGCQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6AEDD24005B;
 Wed, 21 Apr 2021 01:38:22 -0400 (EDT)
Date: Wed, 21 Apr 2021 07:38:20 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH v3] hw/block/nvme: align with existing style
Message-ID: <YH+6TAs3Uh1UxmBC@apples.localdomain>
References: <CGME20210416035611epcas5p10b843f74cc93c015b5e74da149a8bd18@epcas5p1.samsung.com>
 <20210416035228.16339-1-anaidu.gollu@samsung.com>
 <YHkgmntXdYf68F9y@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wE13+pJfxwNCzgzr"
Content-Disposition: inline
In-Reply-To: <YHkgmntXdYf68F9y@apples.localdomain>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wE13+pJfxwNCzgzr
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 16 07:28, Klaus Jensen wrote:
>On Apr 16 09:22, Gollu Appalanaidu wrote:
>>Use lower case hexadecimal format for the constants and in
>>comments use the same format as used in Spec. ("FFFFFFFFh")
>>
>>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>>---
>>-v3: Add Suggestions (Philippe)
>>Describe the NVMe subsystem style in nvme.c header
>>
>>-v2: Address review comments (Klaus)
>>use lower case hexa format for the code and in comments
>>use the same format as used in Spec. ("FFFFFFFFh")
>>
>>hw/block/nvme-ns.c   |  2 +-
>>hw/block/nvme.c      | 46 +++++++++++++++++++++++++-------------------
>>include/block/nvme.h | 10 +++++-----
>>3 files changed, 32 insertions(+), 26 deletions(-)
>>
>>diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
>>index 7bb618f182..a0895614d9 100644
>>--- a/hw/block/nvme-ns.c
>>+++ b/hw/block/nvme-ns.c
>>@@ -303,7 +303,7 @@ static void nvme_ns_init_zoned(NvmeNamespace *ns)
>>
>>    id_ns_z =3D g_malloc0(sizeof(NvmeIdNsZoned));
>>
>>-    /* MAR/MOR are zeroes-based, 0xffffffff means no limit */
>>+    /* MAR/MOR are zeroes-based, FFFFFFFFFh means no limit */
>>    id_ns_z->mar =3D cpu_to_le32(ns->params.max_active_zones - 1);
>>    id_ns_z->mor =3D cpu_to_le32(ns->params.max_open_zones - 1);
>>    id_ns_z->zoc =3D 0;
>>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>>index 624a1431d0..cbe7f33daa 100644
>>--- a/hw/block/nvme.c
>>+++ b/hw/block/nvme.c
>>@@ -134,6 +134,12 @@
>> *         Setting this property to true enables Read Across Zone Boundar=
ies.
>> */
>>
>>+/**
>>+ * While QEMU coding style prefers lowercase hexadecimal in constants,
>>+ * the NVMe subsystem use the format from the NVMe specifications in
>>+ * the comments: no '0x' prefix, uppercase, 'h' hexadecimal suffix
>>+ */
>>+
>>#include "qemu/osdep.h"
>>#include "qemu/units.h"
>>#include "qemu/error-report.h"
>>@@ -3607,18 +3613,18 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequ=
est *req)
>>
>>    /*
>>     * In the base NVM command set, Flush may apply to all namespaces
>>-     * (indicated by NSID being set to 0xFFFFFFFF). But if that feature =
is used
>>+     * (indicated by NSID being set to FFFFFFFFh). But if that feature i=
s used
>>     * along with TP 4056 (Namespace Types), it may be pretty screwed up.
>>     *
>>-     * If NSID is indeed set to 0xFFFFFFFF, we simply cannot associate t=
he
>>+     * If NSID is indeed set to FFFFFFFFh, we simply cannot associate the
>>     * opcode with a specific command since we cannot determine a unique =
I/O
>>     * command set. Opcode 0x0 could have any other meaning than something
>>     * equivalent to flushing and say it DOES have completely different
>>-     * semantics in some other command set - does an NSID of 0xFFFFFFFF =
then
>>+     * semantics in some other command set - does an NSID of FFFFFFFFh t=
hen
>>     * mean "for all namespaces, apply whatever command set specific comm=
and
>>     * that uses the 0x0 opcode?" Or does it mean "for all namespaces, ap=
ply
>>     * whatever command that uses the 0x0 opcode if, and only if, it allo=
ws
>>-     * NSID to be 0xFFFFFFFF"?
>>+     * NSID to be FFFFFFFFh"?
>>     *
>>     * Anyway (and luckily), for now, we do not care about this since the
>>     * device only supports namespace types that includes the NVM Flush c=
ommand
>>@@ -3934,7 +3940,7 @@ static uint16_t nvme_changed_nslist(NvmeCtrl *n, ui=
nt8_t rae, uint32_t buf_len,
>>            NVME_CHANGED_NSID_SIZE) {
>>        /*
>>         * If more than 1024 namespaces, the first entry in the log page =
should
>>-         * be set to 0xffffffff and the others to 0 as spec.
>>+         * be set to FFFFFFFFh and the others to 0 as spec.
>>         */
>>        if (i =3D=3D ARRAY_SIZE(nslist)) {
>>            memset(nslist, 0x0, sizeof(nslist));
>>@@ -4332,7 +4338,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, N=
vmeRequest *req,
>>    trace_pci_nvme_identify_nslist(min_nsid);
>>
>>    /*
>>-     * Both 0xffffffff (NVME_NSID_BROADCAST) and 0xfffffffe are invalid =
values
>>+     * Both FFFFFFFFh (NVME_NSID_BROADCAST) and FFFFFFFFEh are invalid v=
alues
>>     * since the Active Namespace ID List should return namespaces with i=
ds
>>     * *higher* than the NSID specified in the command. This is also spec=
ified
>>     * in the spec (NVM Express v1.3d, Section 5.15.4).
>>@@ -4379,7 +4385,7 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *=
n, NvmeRequest *req,
>>    trace_pci_nvme_identify_nslist_csi(min_nsid, c->csi);
>>
>>    /*
>>-     * Same as in nvme_identify_nslist(), 0xffffffff/0xfffffffe are inva=
lid.
>>+     * Same as in nvme_identify_nslist(), FFFFFFFFh/FFFFFFFFEh are inval=
id.
>>     */
>>    if (min_nsid >=3D NVME_NSID_BROADCAST - 1) {
>>        return NVME_INVALID_NSID | NVME_DNR;
>>@@ -4595,7 +4601,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeR=
equest *req)
>>            /*
>>             * The Reservation Notification Mask and Reservation Persiste=
nce
>>             * features require a status code of Invalid Field in Command=
 when
>>-             * NSID is 0xFFFFFFFF. Since the device does not support tho=
se
>>+             * NSID is FFFFFFFFh. Since the device does not support those
>>             * features we can always return Invalid Namespace or Format =
as we
>>             * should do for all other features.
>>             */
>>@@ -4854,8 +4860,8 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeR=
equest *req)
>>            return NVME_INVALID_FIELD | NVME_DNR;
>>        }
>>
>>-        trace_pci_nvme_setfeat_numq((dw11 & 0xFFFF) + 1,
>>-                                    ((dw11 >> 16) & 0xFFFF) + 1,
>>+        trace_pci_nvme_setfeat_numq((dw11 & 0xffff) + 1,
>>+                                    ((dw11 >> 16) & 0xffff) + 1,
>>                                    n->params.max_ioqpairs,
>>                                    n->params.max_ioqpairs);
>>        req->cqe.result =3D cpu_to_le32((n->params.max_ioqpairs - 1) |
>>@@ -5493,7 +5499,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offs=
et, uint64_t data,
>>            n->bar.cc =3D data;
>>        }
>>        break;
>>-    case 0x1C:  /* CSTS */
>>+    case 0x1c:  /* CSTS */
>>        if (data & (1 << 4)) {
>>            NVME_GUEST_ERR(pci_nvme_ub_mmiowr_ssreset_w1c_unsupported,
>>                           "attempted to W1C CSTS.NSSRO"
>>@@ -5505,7 +5511,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offs=
et, uint64_t data,
>>        }
>>        break;
>>    case 0x20:  /* NSSR */
>>-        if (data =3D=3D 0x4E564D65) {
>>+        if (data =3D=3D 0x4e564d65) {
>>            trace_pci_nvme_ub_mmiowr_ssreset_unsupported();
>>        } else {
>>            /* The spec says that writes of other values have no effect */
>>@@ -5575,11 +5581,11 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr of=
fset, uint64_t data,
>>        n->bar.cmbmsc =3D (n->bar.cmbmsc & 0xffffffff) | (data << 32);
>>        return;
>>
>>-    case 0xE00: /* PMRCAP */
>>+    case 0xe00: /* PMRCAP */
>>        NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrcap_readonly,
>>                       "invalid write to PMRCAP register, ignored");
>>        return;
>>-    case 0xE04: /* PMRCTL */
>>+    case 0xe04: /* PMRCTL */
>>        n->bar.pmrctl =3D data;
>>        if (NVME_PMRCTL_EN(data)) {
>>            memory_region_set_enabled(&n->pmr.dev->mr, true);
>>@@ -5590,19 +5596,19 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr of=
fset, uint64_t data,
>>            n->pmr.cmse =3D false;
>>        }
>>        return;
>>-    case 0xE08: /* PMRSTS */
>>+    case 0xe08: /* PMRSTS */
>>        NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrsts_readonly,
>>                       "invalid write to PMRSTS register, ignored");
>>        return;
>>-    case 0xE0C: /* PMREBS */
>>+    case 0xe0C: /* PMREBS */
>>        NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrebs_readonly,
>>                       "invalid write to PMREBS register, ignored");
>>        return;
>>-    case 0xE10: /* PMRSWTP */
>>+    case 0xe10: /* PMRSWTP */
>>        NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrswtp_readonly,
>>                       "invalid write to PMRSWTP register, ignored");
>>        return;
>>-    case 0xE14: /* PMRMSCL */
>>+    case 0xe14: /* PMRMSCL */
>>        if (!NVME_CAP_PMRS(n->bar.cap)) {
>>            return;
>>        }
>>@@ -5622,7 +5628,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offs=
et, uint64_t data,
>>        }
>>
>>        return;
>>-    case 0xE18: /* PMRMSCU */
>>+    case 0xe18: /* PMRMSCU */
>>        if (!NVME_CAP_PMRS(n->bar.cap)) {
>>            return;
>>        }
>>@@ -5664,7 +5670,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr=
 addr, unsigned size)
>>         * from PMRSTS should ensure prior writes
>>         * made it to persistent media
>>         */
>>-        if (addr =3D=3D 0xE08 &&
>>+        if (addr =3D=3D 0xe08 &&
>>            (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
>>            memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
>>        }
>>diff --git a/include/block/nvme.h b/include/block/nvme.h
>>index 4ac926fbc6..0739e0d665 100644
>>--- a/include/block/nvme.h
>>+++ b/include/block/nvme.h
>>@@ -848,8 +848,8 @@ enum NvmeStatusCodes {
>>    NVME_FW_REQ_SUSYSTEM_RESET  =3D 0x0110,
>>    NVME_NS_ALREADY_ATTACHED    =3D 0x0118,
>>    NVME_NS_PRIVATE             =3D 0x0119,
>>-    NVME_NS_NOT_ATTACHED        =3D 0x011A,
>>-    NVME_NS_CTRL_LIST_INVALID   =3D 0x011C,
>>+    NVME_NS_NOT_ATTACHED        =3D 0x011a,
>>+    NVME_NS_CTRL_LIST_INVALID   =3D 0x011c,
>>    NVME_CONFLICTING_ATTRS      =3D 0x0180,
>>    NVME_INVALID_PROT_INFO      =3D 0x0181,
>>    NVME_WRITE_TO_RO            =3D 0x0182,
>>@@ -1409,9 +1409,9 @@ typedef enum NvmeZoneState {
>>    NVME_ZONE_STATE_IMPLICITLY_OPEN  =3D 0x02,
>>    NVME_ZONE_STATE_EXPLICITLY_OPEN  =3D 0x03,
>>    NVME_ZONE_STATE_CLOSED           =3D 0x04,
>>-    NVME_ZONE_STATE_READ_ONLY        =3D 0x0D,
>>-    NVME_ZONE_STATE_FULL             =3D 0x0E,
>>-    NVME_ZONE_STATE_OFFLINE          =3D 0x0F,
>>+    NVME_ZONE_STATE_READ_ONLY        =3D 0x0d,
>>+    NVME_ZONE_STATE_FULL             =3D 0x0e,
>>+    NVME_ZONE_STATE_OFFLINE          =3D 0x0f,
>>} NvmeZoneState;
>>
>>static inline void _nvme_check_size(void)
>>--=20
>>2.17.1
>>
>
>Looks good. I'll fixup a couple of missing constants in the comments=20
>(e.g. 0x0 -> 0h) when merged.
>
>Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

Applied to nvme-next.

--wE13+pJfxwNCzgzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmB/ukoACgkQTeGvMW1P
DendpQf/TOhIfXSB7GaCayuDMAigpdMwJiCH3C6c6pcKU2/7H1I/Je7B0BLM1R9Z
Ywebe8iTnVTbMbmz3K62nxmbSARPUnNBK/Eef1BiBf27teP9dtDNjGIhyooynaoy
gVxq769rYJWKCaFy0SzD+GPI7Od9sJKCmaaXI8wdQ8xMVDTzjnTGMIr2iViUIzUY
dCAGX5Y3NrLhnIKnTDvSH2NQVLbusalk3pv2KguJsnY7r2G+v059hVYRjMmkQifs
iY/ZICPZUX3cWZ/XB/oZ7zYlQDSNVCkc80qpH6hY6+QeoXM23OKNDB+qOjV9Muh6
gRFAo1cUl8K0hUGDtzCVYnvAoYtolg==
=FMi3
-----END PGP SIGNATURE-----

--wE13+pJfxwNCzgzr--

