Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E86F3602D4
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 08:58:15 +0200 (CEST)
Received: from localhost ([::1]:39812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWvx8-00081C-Da
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 02:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lWvsa-0006TA-Ep; Thu, 15 Apr 2021 02:53:32 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:46879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lWvsW-00072U-W4; Thu, 15 Apr 2021 02:53:32 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1BE8D10C8;
 Thu, 15 Apr 2021 02:53:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 15 Apr 2021 02:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=VqpreVlkM+l5iDfizppH6zpyBGG
 NK+Th/IL8PCMiooQ=; b=ys+4uqDomkAvsMzZOSLCApglTm0oeOhGQH1q1d/oHGB
 a+o0IuPoozz+a0EV//mhp2K/WBaS//PP//9jdpepxB5nOBBl1KJ5cwsk5pNroRN1
 Y7qAub3bgp74K+P7WRAuLgSvytypcaOegWhhKSqFOoboQfqymUfKUCS4VxNQMQTb
 4pWAqrR5FYlTu/zDHK+eZbuU7n7mHMj0wm5hbTbeCugCbIjMc25JWWkFOkJbQRwA
 s662UWFQS/GaouuFNVT8p2gDgzVcBymlIe9RqPWoWHccAr759qAhc44xjPvxXk4Z
 /G0FT+FyBYpVMJHCfAGUiAYtOtHCZO1LQMzRj3+snog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VqpreV
 lkM+l5iDfizppH6zpyBGGNK+Th/IL8PCMiooQ=; b=NMCSJjvyPm+ayhW81F0qWr
 QEoroPSgQwnmcns8dAjrgsqCK208G/dqYvOtYQtEGAX94RP4rsmyDaev6GPqUs6H
 bY90JUcF9EGd8Gkuj9t1/ODapwTy6kJRfbZaMpdu5pEweJCfiuFC6lRbdjjKGv1d
 0tkQhtFcGWtL1XGu2eJ7xjB9x83ovl7ED89BYKd/oHmycOTyF3Hbb/IhtXPvO7NG
 aOvWzWU9Rt0NFOuwH1szbrNyV0E6O53TGsDEtp3IOljqghchIBvZ4cpJXpFNjiTH
 PhkncwBW6VYSGLWOBTGt0rtrd3rmcqcgCFGfWnzuir0TpCXq1TZdXd2fahZYgDgQ
 ==
X-ME-Sender: <xms:4-J3YJwVwZ3o_sliyBI6XVW7QdbNYzgJG3UR1CVV8_8xV7m_PuS71w>
 <xme:4-J3YJR3ZiB3kI9zuDH-d1c39hf-cWjec-7eGipD7tK9VgzwmOydJeraBz9Gf650X
 8V-MYfavQQF8IpaTrY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelvddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucfkphepkedtrdduieejrdelkedrudel
 tdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:4-J3YDU64GbxMyVHFdqHFrlRq0yuOX-Cbm1igl0DCz2o3Frhy7HvLA>
 <xmx:4-J3YLjSgyXvHl9Em4tvGMdhJsWLMQLvkWn8TJxbWpCTvMkdL0WdGg>
 <xmx:4-J3YLDMVXYqJEqxmt193nCVt7SoKG3-LT1kpbcfd7sBSbXF64k5bg>
 <xmx:5eJ3YNAObaiIooI48vPW6ODbFUCeLYMkmiNFNIZI6yFPDbMA6HAH_A>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 66C3B24005B;
 Thu, 15 Apr 2021 02:53:22 -0400 (EDT)
Date: Thu, 15 Apr 2021 08:53:20 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH 1/2] hw/block/nvme: align with existing style
Message-ID: <YHfi4IiGoJA+CiTG@apples.localdomain>
References: <CGME20210317093352epcas5p3193a70101b750934fabcb2540129e499@epcas5p3.samsung.com>
 <20210317093006.31404-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MUAhds1EJPxcpQ4e"
Content-Disposition: inline
In-Reply-To: <20210317093006.31404-1-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 k.jensen@samsung.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MUAhds1EJPxcpQ4e
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 17 15:00, Gollu Appalanaidu wrote:
>Make uniform hexadecimal numbers format.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> hw/block/nvme.c      | 30 +++++++++++++++---------------
> include/block/nvme.h | 10 +++++-----
> 2 files changed, 20 insertions(+), 20 deletions(-)
>
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index d439e44db8..21e85374bf 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -2728,18 +2728,18 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeReque=
st *req)
>
>     /*
>      * In the base NVM command set, Flush may apply to all namespaces
>-     * (indicated by NSID being set to 0xFFFFFFFF). But if that feature i=
s used
>+     * (indicated by NSID being set to 0xffffffff). But if that feature i=
s used
>      * along with TP 4056 (Namespace Types), it may be pretty screwed up.
>      *
>-     * If NSID is indeed set to 0xFFFFFFFF, we simply cannot associate the
>+     * If NSID is indeed set to 0xffffffff, we simply cannot associate the
>      * opcode with a specific command since we cannot determine a unique =
I/O
>      * command set. Opcode 0x0 could have any other meaning than something
>      * equivalent to flushing and say it DOES have completely different
>-     * semantics in some other command set - does an NSID of 0xFFFFFFFF t=
hen
>+     * semantics in some other command set - does an NSID of 0xffffffff t=
hen
>      * mean "for all namespaces, apply whatever command set specific comm=
and
>      * that uses the 0x0 opcode?" Or does it mean "for all namespaces, ap=
ply
>      * whatever command that uses the 0x0 opcode if, and only if, it allo=
ws
>-     * NSID to be 0xFFFFFFFF"?
>+     * NSID to be 0xffffffff"?
>      *
>      * Anyway (and luckily), for now, we do not care about this since the
>      * device only supports namespace types that includes the NVM Flush c=
ommand
>@@ -3948,8 +3948,8 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRe=
quest *req)
>             return NVME_INVALID_FIELD | NVME_DNR;
>         }
>
>-        trace_pci_nvme_setfeat_numq((dw11 & 0xFFFF) + 1,
>-                                    ((dw11 >> 16) & 0xFFFF) + 1,
>+        trace_pci_nvme_setfeat_numq((dw11 & 0xffff) + 1,
>+                                    ((dw11 >> 16) & 0xffff) + 1,
>                                     n->params.max_ioqpairs,
>                                     n->params.max_ioqpairs);
>         req->cqe.result =3D cpu_to_le32((n->params.max_ioqpairs - 1) |
>@@ -4436,7 +4436,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offse=
t, uint64_t data,
>         }
>         break;
>     case 0x20:  /* NSSR */
>-        if (data =3D=3D 0x4E564D65) {
>+        if (data =3D=3D 0x4e564d65) {
>             trace_pci_nvme_ub_mmiowr_ssreset_unsupported();
>         } else {
>             /* The spec says that writes of other values have no effect */
>@@ -4506,11 +4506,11 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr off=
set, uint64_t data,
>         n->bar.cmbmsc =3D (n->bar.cmbmsc & 0xffffffff) | (data << 32);
>         return;
>
>-    case 0xE00: /* PMRCAP */
>+    case 0xe00: /* PMRCAP */
>         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrcap_readonly,
>                        "invalid write to PMRCAP register, ignored");
>         return;
>-    case 0xE04: /* PMRCTL */
>+    case 0xe04: /* PMRCTL */
>         n->bar.pmrctl =3D data;
>         if (NVME_PMRCTL_EN(data)) {
>             memory_region_set_enabled(&n->pmr.dev->mr, true);
>@@ -4521,19 +4521,19 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr off=
set, uint64_t data,
>             n->pmr.cmse =3D false;
>         }
>         return;
>-    case 0xE08: /* PMRSTS */
>+    case 0xe08: /* PMRSTS */
>         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrsts_readonly,
>                        "invalid write to PMRSTS register, ignored");
>         return;
>-    case 0xE0C: /* PMREBS */
>+    case 0xe0C: /* PMREBS */
>         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrebs_readonly,
>                        "invalid write to PMREBS register, ignored");
>         return;
>-    case 0xE10: /* PMRSWTP */
>+    case 0xe10: /* PMRSWTP */
>         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrswtp_readonly,
>                        "invalid write to PMRSWTP register, ignored");
>         return;
>-    case 0xE14: /* PMRMSCL */
>+    case 0xe14: /* PMRMSCL */
>         if (!NVME_CAP_PMRS(n->bar.cap)) {
>             return;
>         }
>@@ -4553,7 +4553,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offse=
t, uint64_t data,
>         }
>
>         return;
>-    case 0xE18: /* PMRMSCU */
>+    case 0xe18: /* PMRMSCU */
>         if (!NVME_CAP_PMRS(n->bar.cap)) {
>             return;
>         }
>@@ -4595,7 +4595,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr =
addr, unsigned size)
>          * from PMRSTS should ensure prior writes
>          * made it to persistent media
>          */
>-        if (addr =3D=3D 0xE08 &&
>+        if (addr =3D=3D 0xe08 &&
>             (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
>             memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
>         }
>diff --git a/include/block/nvme.h b/include/block/nvme.h
>index 372d0f2799..fc65cfcb01 100644
>--- a/include/block/nvme.h
>+++ b/include/block/nvme.h
>@@ -840,8 +840,8 @@ enum NvmeStatusCodes {
>     NVME_FEAT_NOT_NS_SPEC       =3D 0x010f,
>     NVME_FW_REQ_SUSYSTEM_RESET  =3D 0x0110,
>     NVME_NS_ALREADY_ATTACHED    =3D 0x0118,
>-    NVME_NS_NOT_ATTACHED        =3D 0x011A,
>-    NVME_NS_CTRL_LIST_INVALID   =3D 0x011C,
>+    NVME_NS_NOT_ATTACHED        =3D 0x011a,
>+    NVME_NS_CTRL_LIST_INVALID   =3D 0x011c,
>     NVME_CONFLICTING_ATTRS      =3D 0x0180,
>     NVME_INVALID_PROT_INFO      =3D 0x0181,
>     NVME_WRITE_TO_RO            =3D 0x0182,
>@@ -1392,9 +1392,9 @@ typedef enum NvmeZoneState {
>     NVME_ZONE_STATE_IMPLICITLY_OPEN  =3D 0x02,
>     NVME_ZONE_STATE_EXPLICITLY_OPEN  =3D 0x03,
>     NVME_ZONE_STATE_CLOSED           =3D 0x04,
>-    NVME_ZONE_STATE_READ_ONLY        =3D 0x0D,
>-    NVME_ZONE_STATE_FULL             =3D 0x0E,
>-    NVME_ZONE_STATE_OFFLINE          =3D 0x0F,
>+    NVME_ZONE_STATE_READ_ONLY        =3D 0x0d,
>+    NVME_ZONE_STATE_FULL             =3D 0x0e,
>+    NVME_ZONE_STATE_OFFLINE          =3D 0x0f,
> } NvmeZoneState;
>
> static inline void _nvme_check_size(void)
>--=20
>2.17.1
>

I do prefer lower case hex in code, but for comments I'd actually like=20
if they used the same format as in the spec (i.e. "FFFFFFFFh").

This is total bikeshedding, but I guess this patch basically is too :)

--MUAhds1EJPxcpQ4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmB34t4ACgkQTeGvMW1P
DelZAggAiQIOoFHJnTd9rTLrVp5oUHE/UlUNC5n968WIB7dppYkqE4n1YuTPCMiP
dCISsxnCAj6Vmfr4ItGdPd/T8Nr+QsLXy/ppQyAEsvFb3ieBio1buTP13bLsL5E6
L3XEPAscU7uaUhUHaT6mHEWHfG2wA4mBpbM+KYUpiv8QSRALC9ejbnr2qrUe5gYq
aSB8PDnmZPPsSxqOH0YhNz+lCdsHjR8jKovPOVKEeVuB30yOhy5KK/p2l4HVmSnl
z0/AxdVQvFy8g0JO0izcEUhsQG9W0pXBMKpfGJRr9e2UqPbt7e2UIDFFnJcTMyYO
CgDbFXvd2vlmvlywx2tTnWnw7Ibe1w==
=BJ2u
-----END PGP SIGNATURE-----

--MUAhds1EJPxcpQ4e--

