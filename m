Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59114C8BAB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 13:33:24 +0100 (CET)
Received: from localhost ([::1]:54074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP1gx-0007cv-Rz
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 07:33:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nP1WT-00020b-QZ; Tue, 01 Mar 2022 07:22:34 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:49925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nP1WQ-0004RI-Hj; Tue, 01 Mar 2022 07:22:33 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EBFA35C016A;
 Tue,  1 Mar 2022 07:22:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 01 Mar 2022 07:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=GYonGP97K1OPVe6Rx0izlTsRGfQ9+e
 FM4pvVsMA6UXo=; b=QcRqAiSREIzz1hXVQDpVULo/+jGHblsbWdb/Ohij+lFVHV
 DFgCyXLWkjGnmPAQCsIdH+xa6YvAHrbWIulOz5zO0hfv0htiVEkX0t3N7WPlBPfo
 m7+yFdB8YJK5Wrg8ztwsYfwGMplvwg1k9FBgF4ZP6OHPT3x+PMyeVrUnaovkq1ba
 QbNzk6owovxQLEiN6pUylRTGf9et9fxuKBxzsNgKRRPKIZyf+hPI89BPZlPK6R70
 Soy6RGRt6qb6meNCmHURvDP4tycfIXnHbxyEdd4Nsl1BStPoQwqdLqJmX6wTZjSI
 Wd5LcpW7J8Wuqbfjsz2VJHYiZvnvBPFWbSQ6/ooQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GYonGP97K1OPVe6Rx
 0izlTsRGfQ9+eFM4pvVsMA6UXo=; b=DHUThrmejlviHeyNxFMdMFTghvm9VFR+p
 wd6ahdmDU+u+DUYrTavWisqJfuqjuRyQp5im0//kv71DstLlzF5TvVcTJNJquR4i
 NX2NPWzHpk9n+rYHkw1QJmRaQh8sBGs+lJNFwPsgL4pZHAJ9Yji80aFaW6BrvAB2
 /Bv5reI0xit+zh8xA0aoxLdHEN3vzHoUMVp981vxXJbr8MTW2iU5f7dmL6TlDO4e
 Q2sq4uYmbrusHxmc88f0PgzzOEFMMD17rRRl9MmlfnOFuVdAK3/m/Gwq3ZktZjrj
 IjXGG8HL/aC0neaSuJ/SYaLs+onAxTFA/NpMlLESRQTGvKA+euJTw==
X-ME-Sender: <xms:BBAeYjl5ezikETNKDeEpHyvK9pfaNsex6m8ApjeQSBLq4zQv4MZ_bw>
 <xme:BBAeYm3v_XE_6wAEfolP2ZvQRhb_eJiTK-7t-h25WWeVqO-ZaXbjZyiWydi5fHeSK
 Zg4w7Yg4BnKpO0qmgQ>
X-ME-Received: <xmr:BBAeYpo3F-T7cDtw0gqzM1Kci4xMJxvcvNpQixhKKYDBItLoogKX_U06LSW5EgfobI4XPeCSwRp2wpBmJ40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:BBAeYrl0sgytzuVPX5z5VEhOc5Y8C15W4FnUlfxbS3Qfcl3OG5PEjw>
 <xmx:BBAeYh2tqQHt_SJptVc8VLt-9dulWpgRSUe_jdR7T99blDEJbGgaEA>
 <xmx:BBAeYqtfaWQqnqQsOtqUqFz3jubvSv0vDMd41rOnv255cNqiq8wtTw>
 <xmx:BBAeYsQzUTd_5dl6e23GpjZAcsfkbGuSAwnyzXrw_W7jEZZpw1GKfA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Mar 2022 07:22:27 -0500 (EST)
Date: Tue, 1 Mar 2022 13:22:25 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v5 09/15] hw/nvme: Make max_ioqpairs and msix_qsize
 configurable in runtime
Message-ID: <Yh4QAUMRwS/FQEAX@apples>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
 <20220217174504.1051716-10-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n6Cbr8/L31bQIer9"
Content-Disposition: inline
In-Reply-To: <20220217174504.1051716-10-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--n6Cbr8/L31bQIer9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 17 18:44, Lukasz Maniak wrote:
> From: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
>=20
> The NVMe device defines two properties: max_ioqpairs, msix_qsize. Having
> them as constants is problematic for SR-IOV support.
>=20
> SR-IOV introduces virtual resources (queues, interrupts) that can be
> assigned to PF and its dependent VFs. Each device, following a reset,
> should work with the configured number of queues. A single constant is
> no longer sufficient to hold the whole state.
>=20
> This patch tries to solve the problem by introducing additional
> variables in NvmeCtrl=E2=80=99s state. The variables for, e.g., managing =
queues
> are therefore organized as:
>  - n->params.max_ioqpairs =E2=80=93 no changes, constant set by the user
>  - n->(mutable_state) =E2=80=93 (not a part of this patch) user-configura=
ble,
>                         specifies number of queues available _after_
>                         reset
>  - n->conf_ioqpairs - (new) used in all the places instead of the =E2=80=
=98old=E2=80=99
>                       n->params.max_ioqpairs; initialized in realize()
>                       and updated during reset() to reflect user=E2=80=99s
>                       changes to the mutable state
>=20
> Since the number of available i/o queues and interrupts can change in
> runtime, buffers for sq/cqs and the MSIX-related structures are
> allocated big enough to handle the limits, to completely avoid the
> complicated reallocation. A helper function (nvme_update_msixcap_ts)
> updates the corresponding capability register, to signal configuration
> changes.
>=20
> Signed-off-by: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>

LGTM.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

> ---
>  hw/nvme/ctrl.c | 52 ++++++++++++++++++++++++++++++++++----------------
>  hw/nvme/nvme.h |  2 ++
>  2 files changed, 38 insertions(+), 16 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 7c1dd80f21d..f1b4026e4f8 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -445,12 +445,12 @@ static bool nvme_nsid_valid(NvmeCtrl *n, uint32_t n=
sid)
> =20
>  static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)
>  {
> -    return sqid < n->params.max_ioqpairs + 1 && n->sq[sqid] !=3D NULL ? =
0 : -1;
> +    return sqid < n->conf_ioqpairs + 1 && n->sq[sqid] !=3D NULL ? 0 : -1;
>  }
> =20
>  static int nvme_check_cqid(NvmeCtrl *n, uint16_t cqid)
>  {
> -    return cqid < n->params.max_ioqpairs + 1 && n->cq[cqid] !=3D NULL ? =
0 : -1;
> +    return cqid < n->conf_ioqpairs + 1 && n->cq[cqid] !=3D NULL ? 0 : -1;
>  }
> =20
>  static void nvme_inc_cq_tail(NvmeCQueue *cq)
> @@ -4188,8 +4188,7 @@ static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeReq=
uest *req)
>          trace_pci_nvme_err_invalid_create_sq_cqid(cqid);
>          return NVME_INVALID_CQID | NVME_DNR;
>      }
> -    if (unlikely(!sqid || sqid > n->params.max_ioqpairs ||
> -        n->sq[sqid] !=3D NULL)) {
> +    if (unlikely(!sqid || sqid > n->conf_ioqpairs || n->sq[sqid] !=3D NU=
LL)) {
>          trace_pci_nvme_err_invalid_create_sq_sqid(sqid);
>          return NVME_INVALID_QID | NVME_DNR;
>      }
> @@ -4541,8 +4540,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeReq=
uest *req)
>      trace_pci_nvme_create_cq(prp1, cqid, vector, qsize, qflags,
>                               NVME_CQ_FLAGS_IEN(qflags) !=3D 0);
> =20
> -    if (unlikely(!cqid || cqid > n->params.max_ioqpairs ||
> -        n->cq[cqid] !=3D NULL)) {
> +    if (unlikely(!cqid || cqid > n->conf_ioqpairs || n->cq[cqid] !=3D NU=
LL)) {
>          trace_pci_nvme_err_invalid_create_cq_cqid(cqid);
>          return NVME_INVALID_QID | NVME_DNR;
>      }
> @@ -4558,7 +4556,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeReq=
uest *req)
>          trace_pci_nvme_err_invalid_create_cq_vector(vector);
>          return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
>      }
> -    if (unlikely(vector >=3D n->params.msix_qsize)) {
> +    if (unlikely(vector >=3D n->conf_msix_qsize)) {
>          trace_pci_nvme_err_invalid_create_cq_vector(vector);
>          return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
>      }
> @@ -5155,13 +5153,12 @@ defaults:
> =20
>          break;
>      case NVME_NUMBER_OF_QUEUES:
> -        result =3D (n->params.max_ioqpairs - 1) |
> -            ((n->params.max_ioqpairs - 1) << 16);
> +        result =3D (n->conf_ioqpairs - 1) | ((n->conf_ioqpairs - 1) << 1=
6);
>          trace_pci_nvme_getfeat_numq(result);
>          break;
>      case NVME_INTERRUPT_VECTOR_CONF:
>          iv =3D dw11 & 0xffff;
> -        if (iv >=3D n->params.max_ioqpairs + 1) {
> +        if (iv >=3D n->conf_ioqpairs + 1) {
>              return NVME_INVALID_FIELD | NVME_DNR;
>          }
> =20
> @@ -5316,10 +5313,10 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, Nvm=
eRequest *req)
> =20
>          trace_pci_nvme_setfeat_numq((dw11 & 0xffff) + 1,
>                                      ((dw11 >> 16) & 0xffff) + 1,
> -                                    n->params.max_ioqpairs,
> -                                    n->params.max_ioqpairs);
> -        req->cqe.result =3D cpu_to_le32((n->params.max_ioqpairs - 1) |
> -                                      ((n->params.max_ioqpairs - 1) << 1=
6));
> +                                    n->conf_ioqpairs,
> +                                    n->conf_ioqpairs);
> +        req->cqe.result =3D cpu_to_le32((n->conf_ioqpairs - 1) |
> +                                      ((n->conf_ioqpairs - 1) << 16));
>          break;
>      case NVME_ASYNCHRONOUS_EVENT_CONF:
>          n->features.async_config =3D dw11;
> @@ -5757,8 +5754,24 @@ static void nvme_process_sq(void *opaque)
>      }
>  }
> =20
> +static void nvme_update_msixcap_ts(PCIDevice *pci_dev, uint32_t table_si=
ze)
> +{
> +    uint8_t *config;
> +
> +    if (!msix_present(pci_dev)) {
> +        return;
> +    }
> +
> +    assert(table_size > 0 && table_size <=3D pci_dev->msix_entries_nr);
> +
> +    config =3D pci_dev->config + pci_dev->msix_cap;
> +    pci_set_word_by_mask(config + PCI_MSIX_FLAGS, PCI_MSIX_FLAGS_QSIZE,
> +                         table_size - 1);
> +}
> +
>  static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
>  {
> +    PCIDevice *pci_dev =3D &n->parent_obj;
>      NvmeNamespace *ns;
>      int i;
> =20
> @@ -5788,15 +5801,17 @@ static void nvme_ctrl_reset(NvmeCtrl *n, NvmeRese=
tType rst)
>          g_free(event);
>      }
> =20
> -    if (!pci_is_vf(&n->parent_obj) && n->params.sriov_max_vfs) {
> +    if (!pci_is_vf(pci_dev) && n->params.sriov_max_vfs) {
>          if (rst !=3D NVME_RESET_CONTROLLER) {
> -            pcie_sriov_pf_disable_vfs(&n->parent_obj);
> +            pcie_sriov_pf_disable_vfs(pci_dev);
>          }
>      }
> =20
>      n->aer_queued =3D 0;
>      n->outstanding_aers =3D 0;
>      n->qs_created =3D false;
> +
> +    nvme_update_msixcap_ts(pci_dev, n->conf_msix_qsize);
>  }
> =20
>  static void nvme_ctrl_shutdown(NvmeCtrl *n)
> @@ -6507,6 +6522,9 @@ static void nvme_init_state(NvmeCtrl *n)
>      NvmeSecCtrlEntry *sctrl;
>      int i;
> =20
> +    n->conf_ioqpairs =3D n->params.max_ioqpairs;
> +    n->conf_msix_qsize =3D n->params.msix_qsize;
> +
>      /* add one to max_ioqpairs to account for the admin queue pair */
>      n->reg_size =3D pow2ceil(sizeof(NvmeBar) +
>                             2 * (n->params.max_ioqpairs + 1) * NVME_DB_SI=
ZE);
> @@ -6668,6 +6686,8 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pc=
i_dev, Error **errp)
>          }
>      }
> =20
> +    nvme_update_msixcap_ts(pci_dev, n->conf_msix_qsize);
> +
>      if (n->params.cmb_size_mb) {
>          nvme_init_cmb(n, pci_dev);
>      }
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 5ba07b62dff..314a2894759 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -434,6 +434,8 @@ typedef struct NvmeCtrl {
>      uint64_t    starttime_ms;
>      uint16_t    temperature;
>      uint8_t     smart_critical_warning;
> +    uint32_t    conf_msix_qsize;
> +    uint32_t    conf_ioqpairs;
> =20
>      struct {
>          MemoryRegion mem;
> --=20
> 2.25.1
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--n6Cbr8/L31bQIer9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmIeD/0ACgkQTeGvMW1P
DenvIggAwqjSEn72oFYC/i5JYtnkTufQVF71DeQGtdiJlQjk5HyAsCd95iwXiqEC
jU1OXx7IFaZzWigC9wzZcIdBm4YHg7UN7Uqp0U8hgLUHVQ0k/8o0EOwhc4d/530F
ULR/wJsY5Jn6eazN2LUR5Qnf1YpJLUz+55Z4SX5WVeH8MnQ0aW5+FLjp8prEPte/
Otdnz3LFvBV9JoqgZtKBcFl3TR6ldEqiLwDgG0/AJuS72bG4KC4HW9xrhehfxeHg
0lO8g8jz4RSk2GcC7lCvaNfPAvpRT/X6/L2Y2Nw3UqRwFV5tQP+S5yy9mmNH2tXG
Jd8Bswsy25GAn9yjb3f9cltkBZl2Sw==
=91TG
-----END PGP SIGNATURE-----

--n6Cbr8/L31bQIer9--

