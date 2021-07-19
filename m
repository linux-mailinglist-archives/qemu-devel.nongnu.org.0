Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F243CEDE4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:49:23 +0200 (CEST)
Received: from localhost ([::1]:52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5aCY-0002cs-MI
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5ZqZ-0004wC-HC; Mon, 19 Jul 2021 16:26:39 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:34123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5ZqX-0005Tp-1j; Mon, 19 Jul 2021 16:26:39 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id DFA7458163E;
 Mon, 19 Jul 2021 16:26:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 19 Jul 2021 16:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Dm2uU+oRPpg2n7496539neURpDa
 ODOOEZ40hExspzgg=; b=h9KMTLnO0SaglK0DkSP2eEoJgNEpOxZmp289aHWa+WY
 GgToKTUGJfmH4eJ/e9k1MNxSpn2zzNvZO96a0j2x+42WvCefldgy2NRPl++RTT/9
 OFubqbxSVsLrSGv+jiwg9ky3O9rAzYp6QfblzICL1V1uQoL4QFV/7Hr21IL7EH4g
 s8TuiK8ayFOD2y1ZhxRCJAQgIG2z1j/HpqkPsHQ6QhjRK9ZeOCcI+BTMoccPLarH
 +y2szm3+58tR7FIP+f2N68fvxlhK4ACR8bEJq0TsZRBCFZwU1dHtdbmjkIHX0hZE
 ohQR6waSaLbfSVXV7vV3XhCqGw3fSNsqrU5luCTSL2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Dm2uU+
 oRPpg2n7496539neURpDaODOOEZ40hExspzgg=; b=CIJeKXYT26gVKMrYhaRWi9
 inCFU8TsL2LkdZW/5vNe0k+VCXiYdNDidJ8j2xwq8Tk135F6huIo1w4Ec0l9m0rk
 SmjPFJcVUms/UvdQKcPBK6f7yfDLAoBajenolfjrxE+h0JQdG0hxVq9cSbxACwgY
 dld7S3G/D5LI9gXccbHP12ZkQ0ZbqtYOD+Fc2mH+cmOi2mfywcWnXcHrOqQH7oBy
 cJYRsI2qVpnpCq7rlPh9FNcV0qvS0Wa4LhES4cXJYblwgcdawOTT2csBmvLAJSlm
 cEozGizsp6ryKQfRc7HLpgdkI8OuI2albAQTmCTmhTRdz+/xBbAiVEa32o2il4oQ
 ==
X-ME-Sender: <xms:-9_1YITsMjeOS1A2GRJW9DeRiIqfPRwtrM52HTnMRQ_LIw2PM4ooig>
 <xme:-9_1YFxo0wqVKN5snIls9oKeCFFKGmEfyJ3N7DJb0mNfPspWKTcBTN9Z3JZnA1IgK
 -PKWeuAbqKM3U0KDaQ>
X-ME-Received: <xmr:-9_1YF1v9n9UE79U75V2iGu5ak8zG0_8K-9o38sWmSqOB8deHP1pqbHAjNkM0qFTQyn2sIw4YIfJTxzTaI-QDmBypzBT0JvITJkkce7RvB6iZAdpug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedtgddugeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:-9_1YMBkmnjZYDbcnWxu0UDoHKMsU5uVuTxqLSoJNjgpfy_bviQE7Q>
 <xmx:-9_1YBgqha1dphTgpFDGym4Kh_Ou-iaR-GVVGxhWWzJNdNEDsSAYew>
 <xmx:-9_1YIoYi6TmDEFXnWk5LGA1VIGId0YyUcxAJsK2UB4LMcbmZTC4HQ>
 <xmx:-9_1YETgatEqRT2okBGeb2mq-j0jbRnNajG3t2TJccGBv4PXDzesxQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jul 2021 16:26:33 -0400 (EDT)
Date: Mon, 19 Jul 2021 22:26:31 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 4/5] hw/nvme: fix mmio read
Message-ID: <YPXf93sWvU9549Y2@apples.localdomain>
References: <20210719200733.28502-1-its@irrelevant.dk>
 <20210719200733.28502-5-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BBiaORtz6HKKkGx8"
Content-Disposition: inline
In-Reply-To: <20210719200733.28502-5-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BBiaORtz6HKKkGx8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 19 22:07, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> The new PMR test unearthed a long-standing issue with MMIO reads on
> big-endian hosts.
>=20
> Fix this by unconditionally storing all controller registers in little
> endian.
>=20
> Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 290 +++++++++++++++++++++++++++----------------------
>  1 file changed, 162 insertions(+), 128 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 0449cc4dee9b..76721e31c6b1 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -439,10 +439,12 @@ static uint8_t nvme_sq_empty(NvmeSQueue *sq)
> =20
>  static void nvme_irq_check(NvmeCtrl *n)
>  {
> +    uint32_t intms =3D ldl_le_p(&n->bar.intms);
> +
>      if (msix_enabled(&(n->parent_obj))) {
>          return;
>      }
> -    if (~n->bar.intms & n->irq_status) {
> +    if (~intms & n->irq_status) {
>          pci_irq_assert(&n->parent_obj);
>      } else {
>          pci_irq_deassert(&n->parent_obj);
> @@ -1289,7 +1291,7 @@ static void nvme_post_cqes(void *opaque)
>          if (ret) {
>              trace_pci_nvme_err_addr_write(addr);
>              trace_pci_nvme_err_cfs();
> -            n->bar.csts =3D NVME_CSTS_FAILED;
> +            stl_le_p(&n->bar.csts, NVME_CSTS_FAILED);
>              break;
>          }
>          QTAILQ_REMOVE(&cq->req_list, req, entry);
> @@ -4022,7 +4024,7 @@ static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeReq=
uest *req)
>          trace_pci_nvme_err_invalid_create_sq_sqid(sqid);
>          return NVME_INVALID_QID | NVME_DNR;
>      }
> -    if (unlikely(!qsize || qsize > NVME_CAP_MQES(n->bar.cap))) {
> +    if (unlikely(!qsize || qsize > NVME_CAP_MQES(ldq_le_p(&n->bar.cap)))=
) {
>          trace_pci_nvme_err_invalid_create_sq_size(qsize);
>          return NVME_MAX_QSIZE_EXCEEDED | NVME_DNR;
>      }
> @@ -4208,7 +4210,7 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8=
_t csi, uint32_t buf_len,
>          return NVME_INVALID_FIELD | NVME_DNR;
>      }
> =20
> -    switch (NVME_CC_CSS(n->bar.cc)) {
> +    switch (NVME_CC_CSS(ldl_le_p(&n->bar.cc))) {
>      case NVME_CC_CSS_NVM:
>          src_iocs =3D nvme_cse_iocs_nvm;
>          /* fall through */
> @@ -4370,7 +4372,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeReq=
uest *req)
>          trace_pci_nvme_err_invalid_create_cq_cqid(cqid);
>          return NVME_INVALID_QID | NVME_DNR;
>      }
> -    if (unlikely(!qsize || qsize > NVME_CAP_MQES(n->bar.cap))) {
> +    if (unlikely(!qsize || qsize > NVME_CAP_MQES(ldq_le_p(&n->bar.cap)))=
) {
>          trace_pci_nvme_err_invalid_create_cq_size(qsize);
>          return NVME_MAX_QSIZE_EXCEEDED | NVME_DNR;
>      }
> @@ -5163,17 +5165,19 @@ static void nvme_update_dmrsl(NvmeCtrl *n)
> =20
>  static void nvme_select_iocs_ns(NvmeCtrl *n, NvmeNamespace *ns)
>  {
> +    uint32_t cc =3D ldl_le_p(&n->bar.cc);
> +
>      ns->iocs =3D nvme_cse_iocs_none;
>      switch (ns->csi) {
>      case NVME_CSI_NVM:
> -        if (NVME_CC_CSS(n->bar.cc) !=3D NVME_CC_CSS_ADMIN_ONLY) {
> +        if (NVME_CC_CSS(cc) !=3D NVME_CC_CSS_ADMIN_ONLY) {
>              ns->iocs =3D nvme_cse_iocs_nvm;
>          }
>          break;
>      case NVME_CSI_ZONED:
> -        if (NVME_CC_CSS(n->bar.cc) =3D=3D NVME_CC_CSS_CSI) {
> +        if (NVME_CC_CSS(cc) =3D=3D NVME_CC_CSS_CSI) {
>              ns->iocs =3D nvme_cse_iocs_zoned;
> -        } else if (NVME_CC_CSS(n->bar.cc) =3D=3D NVME_CC_CSS_NVM) {
> +        } else if (NVME_CC_CSS(cc) =3D=3D NVME_CC_CSS_NVM) {
>              ns->iocs =3D nvme_cse_iocs_nvm;
>          }
>          break;
> @@ -5510,7 +5514,7 @@ static void nvme_process_sq(void *opaque)
>          if (nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd))) {
>              trace_pci_nvme_err_addr_read(addr);
>              trace_pci_nvme_err_cfs();
> -            n->bar.csts =3D NVME_CSTS_FAILED;
> +            stl_le_p(&n->bar.csts, NVME_CSTS_FAILED);
>              break;
>          }
>          nvme_inc_sq_head(sq);
> @@ -5565,8 +5569,6 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
>      n->aer_queued =3D 0;
>      n->outstanding_aers =3D 0;
>      n->qs_created =3D false;
> -
> -    n->bar.cc =3D 0;
>  }
> =20
>  static void nvme_ctrl_shutdown(NvmeCtrl *n)
> @@ -5605,7 +5607,12 @@ static void nvme_select_iocs(NvmeCtrl *n)
> =20
>  static int nvme_start_ctrl(NvmeCtrl *n)
>  {
> -    uint32_t page_bits =3D NVME_CC_MPS(n->bar.cc) + 12;
> +    uint64_t cap =3D ldq_le_p(&n->bar.cap);
> +    uint32_t cc =3D ldl_le_p(&n->bar.cc);
> +    uint32_t aqa =3D ldl_le_p(&n->bar.aqa);
> +    uint64_t asq =3D ldq_le_p(&n->bar.asq);
> +    uint64_t acq =3D ldq_le_p(&n->bar.acq);
> +    uint32_t page_bits =3D NVME_CC_MPS(cc) + 12;
>      uint32_t page_size =3D 1 << page_bits;
> =20
>      if (unlikely(n->cq[0])) {
> @@ -5616,73 +5623,72 @@ static int nvme_start_ctrl(NvmeCtrl *n)
>          trace_pci_nvme_err_startfail_sq();
>          return -1;
>      }
> -    if (unlikely(!n->bar.asq)) {
> +    if (unlikely(!asq)) {
>          trace_pci_nvme_err_startfail_nbarasq();
>          return -1;
>      }
> -    if (unlikely(!n->bar.acq)) {
> +    if (unlikely(!acq)) {
>          trace_pci_nvme_err_startfail_nbaracq();
>          return -1;
>      }
> -    if (unlikely(n->bar.asq & (page_size - 1))) {
> -        trace_pci_nvme_err_startfail_asq_misaligned(n->bar.asq);
> +    if (unlikely(asq & (page_size - 1))) {
> +        trace_pci_nvme_err_startfail_asq_misaligned(asq);
>          return -1;
>      }
> -    if (unlikely(n->bar.acq & (page_size - 1))) {
> -        trace_pci_nvme_err_startfail_acq_misaligned(n->bar.acq);
> +    if (unlikely(acq & (page_size - 1))) {
> +        trace_pci_nvme_err_startfail_acq_misaligned(acq);
>          return -1;
>      }
> -    if (unlikely(!(NVME_CAP_CSS(n->bar.cap) & (1 << NVME_CC_CSS(n->bar.c=
c))))) {
> -        trace_pci_nvme_err_startfail_css(NVME_CC_CSS(n->bar.cc));
> +    if (unlikely(!(NVME_CAP_CSS(cap) & (1 << NVME_CC_CSS(cc))))) {
> +        trace_pci_nvme_err_startfail_css(NVME_CC_CSS(cc));
>          return -1;
>      }
> -    if (unlikely(NVME_CC_MPS(n->bar.cc) <
> -                 NVME_CAP_MPSMIN(n->bar.cap))) {
> +    if (unlikely(NVME_CC_MPS(cc) < NVME_CAP_MPSMIN(cap))) {
>          trace_pci_nvme_err_startfail_page_too_small(
> -                    NVME_CC_MPS(n->bar.cc),
> -                    NVME_CAP_MPSMIN(n->bar.cap));
> +                    NVME_CC_MPS(cc),
> +                    NVME_CAP_MPSMIN(cap));
>          return -1;
>      }
> -    if (unlikely(NVME_CC_MPS(n->bar.cc) >
> -                 NVME_CAP_MPSMAX(n->bar.cap))) {
> +    if (unlikely(NVME_CC_MPS(cc) >
> +                 NVME_CAP_MPSMAX(cap))) {
>          trace_pci_nvme_err_startfail_page_too_large(
> -                    NVME_CC_MPS(n->bar.cc),
> -                    NVME_CAP_MPSMAX(n->bar.cap));
> +                    NVME_CC_MPS(cc),
> +                    NVME_CAP_MPSMAX(cap));
>          return -1;
>      }
> -    if (unlikely(NVME_CC_IOCQES(n->bar.cc) <
> +    if (unlikely(NVME_CC_IOCQES(cc) <
>                   NVME_CTRL_CQES_MIN(n->id_ctrl.cqes))) {
>          trace_pci_nvme_err_startfail_cqent_too_small(
> -                    NVME_CC_IOCQES(n->bar.cc),
> -                    NVME_CTRL_CQES_MIN(n->bar.cap));
> +                    NVME_CC_IOCQES(cc),
> +                    NVME_CTRL_CQES_MIN(cap));
>          return -1;
>      }
> -    if (unlikely(NVME_CC_IOCQES(n->bar.cc) >
> +    if (unlikely(NVME_CC_IOCQES(cc) >
>                   NVME_CTRL_CQES_MAX(n->id_ctrl.cqes))) {
>          trace_pci_nvme_err_startfail_cqent_too_large(
> -                    NVME_CC_IOCQES(n->bar.cc),
> -                    NVME_CTRL_CQES_MAX(n->bar.cap));
> +                    NVME_CC_IOCQES(cc),
> +                    NVME_CTRL_CQES_MAX(cap));
>          return -1;
>      }
> -    if (unlikely(NVME_CC_IOSQES(n->bar.cc) <
> +    if (unlikely(NVME_CC_IOSQES(cc) <
>                   NVME_CTRL_SQES_MIN(n->id_ctrl.sqes))) {
>          trace_pci_nvme_err_startfail_sqent_too_small(
> -                    NVME_CC_IOSQES(n->bar.cc),
> -                    NVME_CTRL_SQES_MIN(n->bar.cap));
> +                    NVME_CC_IOSQES(cc),
> +                    NVME_CTRL_SQES_MIN(cap));
>          return -1;
>      }
> -    if (unlikely(NVME_CC_IOSQES(n->bar.cc) >
> +    if (unlikely(NVME_CC_IOSQES(cc) >
>                   NVME_CTRL_SQES_MAX(n->id_ctrl.sqes))) {
>          trace_pci_nvme_err_startfail_sqent_too_large(
> -                    NVME_CC_IOSQES(n->bar.cc),
> -                    NVME_CTRL_SQES_MAX(n->bar.cap));
> +                    NVME_CC_IOSQES(cc),
> +                    NVME_CTRL_SQES_MAX(cap));
>          return -1;
>      }
> -    if (unlikely(!NVME_AQA_ASQS(n->bar.aqa))) {
> +    if (unlikely(!NVME_AQA_ASQS(aqa))) {
>          trace_pci_nvme_err_startfail_asqent_sz_zero();
>          return -1;
>      }
> -    if (unlikely(!NVME_AQA_ACQS(n->bar.aqa))) {
> +    if (unlikely(!NVME_AQA_ACQS(aqa))) {
>          trace_pci_nvme_err_startfail_acqent_sz_zero();
>          return -1;
>      }
> @@ -5690,12 +5696,10 @@ static int nvme_start_ctrl(NvmeCtrl *n)
>      n->page_bits =3D page_bits;
>      n->page_size =3D page_size;
>      n->max_prp_ents =3D n->page_size / sizeof(uint64_t);
> -    n->cqe_size =3D 1 << NVME_CC_IOCQES(n->bar.cc);
> -    n->sqe_size =3D 1 << NVME_CC_IOSQES(n->bar.cc);
> -    nvme_init_cq(&n->admin_cq, n, n->bar.acq, 0, 0,
> -                 NVME_AQA_ACQS(n->bar.aqa) + 1, 1);
> -    nvme_init_sq(&n->admin_sq, n, n->bar.asq, 0, 0,
> -                 NVME_AQA_ASQS(n->bar.aqa) + 1);
> +    n->cqe_size =3D 1 << NVME_CC_IOCQES(cc);
> +    n->sqe_size =3D 1 << NVME_CC_IOSQES(cc);
> +    nvme_init_cq(&n->admin_cq, n, acq, 0, 0, NVME_AQA_ACQS(aqa) + 1, 1);
> +    nvme_init_sq(&n->admin_sq, n, asq, 0, 0, NVME_AQA_ASQS(aqa) + 1);
> =20
>      nvme_set_timestamp(n, 0ULL);
> =20
> @@ -5708,22 +5712,33 @@ static int nvme_start_ctrl(NvmeCtrl *n)
> =20
>  static void nvme_cmb_enable_regs(NvmeCtrl *n)
>  {
> -    NVME_CMBLOC_SET_CDPCILS(n->bar.cmbloc, 1);
> -    NVME_CMBLOC_SET_CDPMLS(n->bar.cmbloc, 1);
> -    NVME_CMBLOC_SET_BIR(n->bar.cmbloc, NVME_CMB_BIR);
> +    uint32_t cmbloc =3D ldl_le_p(&n->bar.cmbloc);
> +    uint32_t cmbsz =3D ldl_le_p(&n->bar.cmbsz);
> =20
> -    NVME_CMBSZ_SET_SQS(n->bar.cmbsz, 1);
> -    NVME_CMBSZ_SET_CQS(n->bar.cmbsz, 0);
> -    NVME_CMBSZ_SET_LISTS(n->bar.cmbsz, 1);
> -    NVME_CMBSZ_SET_RDS(n->bar.cmbsz, 1);
> -    NVME_CMBSZ_SET_WDS(n->bar.cmbsz, 1);
> -    NVME_CMBSZ_SET_SZU(n->bar.cmbsz, 2); /* MBs */
> -    NVME_CMBSZ_SET_SZ(n->bar.cmbsz, n->params.cmb_size_mb);
> +    NVME_CMBLOC_SET_CDPCILS(cmbloc, 1);
> +    NVME_CMBLOC_SET_CDPMLS(cmbloc, 1);
> +    NVME_CMBLOC_SET_BIR(cmbloc, NVME_CMB_BIR);
> +    stl_le_p(&n->bar.cmbloc, cmbloc);
> +
> +    NVME_CMBSZ_SET_SQS(cmbsz, 1);
> +    NVME_CMBSZ_SET_CQS(cmbsz, 0);
> +    NVME_CMBSZ_SET_LISTS(cmbsz, 1);
> +    NVME_CMBSZ_SET_RDS(cmbsz, 1);
> +    NVME_CMBSZ_SET_WDS(cmbsz, 1);
> +    NVME_CMBSZ_SET_SZU(cmbsz, 2); /* MBs */
> +    NVME_CMBSZ_SET_SZ(cmbsz, n->params.cmb_size_mb);
> +    stl_le_p(&n->bar.cmbsz, cmbsz);
>  }
> =20
>  static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>                             unsigned size)
>  {
> +    uint64_t cap =3D ldq_le_p(&n->bar.cap);
> +    uint32_t cc =3D ldl_le_p(&n->bar.cc);
> +    uint32_t intms =3D ldl_le_p(&n->bar.intms);
> +    uint32_t csts =3D ldl_le_p(&n->bar.csts);
> +    uint32_t pmrsts =3D ldl_le_p(&n->bar.pmrsts);
> +
>      if (unlikely(offset & (sizeof(uint32_t) - 1))) {
>          NVME_GUEST_ERR(pci_nvme_ub_mmiowr_misaligned32,
>                         "MMIO write not 32-bit aligned,"
> @@ -5747,9 +5762,10 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr off=
set, uint64_t data,
>                             " when MSI-X is enabled");
>              /* should be ignored, fall through for now */
>          }
> -        n->bar.intms |=3D data & 0xffffffff;
> +        intms |=3D data;
> +        stl_le_p(&n->bar.intms, intms);
>          n->bar.intmc =3D n->bar.intms;
> -        trace_pci_nvme_mmio_intm_set(data & 0xffffffff, n->bar.intmc);
> +        trace_pci_nvme_mmio_intm_set(data & 0xffffffff, intms);
>          nvme_irq_check(n);
>          break;
>      case NVME_REG_INTMC:
> @@ -5759,44 +5775,55 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr of=
fset, uint64_t data,
>                             " when MSI-X is enabled");
>              /* should be ignored, fall through for now */
>          }
> -        n->bar.intms &=3D ~(data & 0xffffffff);
> +        intms &=3D ~data;
> +        stl_le_p(&n->bar.intms, intms);
>          n->bar.intmc =3D n->bar.intms;
> -        trace_pci_nvme_mmio_intm_clr(data & 0xffffffff, n->bar.intmc);
> +        trace_pci_nvme_mmio_intm_clr(data & 0xffffffff, intms);
>          nvme_irq_check(n);
>          break;
>      case NVME_REG_CC:
>          trace_pci_nvme_mmio_cfg(data & 0xffffffff);
> +
>          /* Windows first sends data, then sends enable bit */
> -        if (!NVME_CC_EN(data) && !NVME_CC_EN(n->bar.cc) &&
> -            !NVME_CC_SHN(data) && !NVME_CC_SHN(n->bar.cc))
> +        if (!NVME_CC_EN(data) && !NVME_CC_EN(cc) &&
> +            !NVME_CC_SHN(data) && !NVME_CC_SHN(cc))
>          {
> -            n->bar.cc =3D data;
> +            cc =3D data;
>          }
> =20
> -        if (NVME_CC_EN(data) && !NVME_CC_EN(n->bar.cc)) {
> -            n->bar.cc =3D data;
> +        if (NVME_CC_EN(data) && !NVME_CC_EN(cc)) {
> +            cc =3D data;
> +
> +            /* flush CC since nvme_start_ctrl() needs the value */
> +            stl_le_p(&n->bar.cc, cc);
>              if (unlikely(nvme_start_ctrl(n))) {
>                  trace_pci_nvme_err_startfail();
> -                n->bar.csts =3D NVME_CSTS_FAILED;
> +                csts =3D NVME_CSTS_FAILED;
>              } else {
>                  trace_pci_nvme_mmio_start_success();
> -                n->bar.csts =3D NVME_CSTS_READY;
> +                csts =3D NVME_CSTS_READY;
>              }
> -        } else if (!NVME_CC_EN(data) && NVME_CC_EN(n->bar.cc)) {
> +        } else if (!NVME_CC_EN(data) && NVME_CC_EN(cc)) {
>              trace_pci_nvme_mmio_stopped();
>              nvme_ctrl_reset(n);
> -            n->bar.csts &=3D ~NVME_CSTS_READY;
> +            cc =3D 0;
> +            csts &=3D ~NVME_CSTS_READY;
>          }
> -        if (NVME_CC_SHN(data) && !(NVME_CC_SHN(n->bar.cc))) {
> +
> +        if (NVME_CC_SHN(data) && !(NVME_CC_SHN(cc))) {
>              trace_pci_nvme_mmio_shutdown_set();
>              nvme_ctrl_shutdown(n);
> -            n->bar.cc =3D data;
> -            n->bar.csts |=3D NVME_CSTS_SHST_COMPLETE;
> -        } else if (!NVME_CC_SHN(data) && NVME_CC_SHN(n->bar.cc)) {
> +            cc =3D data;
> +            csts |=3D NVME_CSTS_SHST_COMPLETE;
> +        } else if (!NVME_CC_SHN(data) && NVME_CC_SHN(cc)) {
>              trace_pci_nvme_mmio_shutdown_cleared();
> -            n->bar.csts &=3D ~NVME_CSTS_SHST_COMPLETE;
> -            n->bar.cc =3D data;
> +            csts &=3D ~NVME_CSTS_SHST_COMPLETE;
> +            cc =3D data;
>          }
> +
> +        stl_le_p(&n->bar.cc, cc);
> +        stl_le_p(&n->bar.csts, csts);
> +
>          break;
>      case NVME_REG_CSTS:
>          if (data & (1 << 4)) {
> @@ -5818,26 +5845,24 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr of=
fset, uint64_t data,
>          }
>          break;
>      case NVME_REG_AQA:
> -        n->bar.aqa =3D data & 0xffffffff;
> +        stl_le_p(&n->bar.aqa, data);
>          trace_pci_nvme_mmio_aqattr(data & 0xffffffff);
>          break;
>      case NVME_REG_ASQ:
> -        n->bar.asq =3D size =3D=3D 8 ? data :
> -            (n->bar.asq & ~0xffffffffULL) | (data & 0xffffffff);
> +        stn_le_p(&n->bar.asq, data, size);

Argh. I hurried a change here and it bit me.

I'll let my CI run to the end and I'll send a v5...

--BBiaORtz6HKKkGx8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmD13/MACgkQTeGvMW1P
DenJ8wgAvtraLwfBip8wdSVMoE3WoYLVG1floxvX/XtBcGkVQy389Ir/t60YwzB0
MdkhJAHlUPkryelyCSF6Xaf/8sqrPNHeZf4TcYNkF3iKwSCT6ZJL+tASy8vqaCO1
ApXTkriZZlpm4g2aD6EAWJ0MGKpX8FCICSfzWhCq/QnZ6FnZ1zH+KgdAd/rw6ECk
YVfuqoVmrXdKaMgfDLEBeG4raySEhTecNnKYwOCvRMUQmmlxi3UwNCE1tt9/AQVY
7MlxYcE6pZdzEqxlrqXq9mvteaj2VSGey5TirxaT8G9zTg6IAvmKDi505VMh5KXn
420owKfOmaHkdoR8J7Gd9pNeuVD/sw==
=Y6eC
-----END PGP SIGNATURE-----

--BBiaORtz6HKKkGx8--

