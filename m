Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2C75664F3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:23:20 +0200 (CEST)
Received: from localhost ([::1]:53582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dq3-0003NU-F1
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o8dYP-0006v2-6K
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:05:07 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:49831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o8dYH-00080N-6N
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:05:04 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 169A95C00B1;
 Tue,  5 Jul 2022 04:04:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 05 Jul 2022 04:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1657008294; x=1657094694; bh=qF
 NEizlYcGDlLwMaBipVF62+d577l9fb0Uae/dcWv8c=; b=ZpI7xx5ndAyuLROBw8
 0QFVUjZfXnzMyPG9NPBu9eh8LR+ZP7DpmW+9DkY8YO9m+MPI6TEKLW6JC1c7SY6u
 4J6zWXiyAGyxSezFJgX9yKfDMK51ZQvNT7hY/1ZklATHzxKqpJasayy+fAwsQocD
 Z3gH0wdEdSu+SxVVSFPBudBOBAjwxSkWBkSTDuPgr4BX055J0/a7W+AwUKv3m5ah
 5MSTJC2Lzet8KmOmtXIG9v1CHIxph96gIP4cL7xwy3FOV+9Hj3xZkYT84VUlcxHU
 7a5Ddd+sonBZkJ07/6b9Pw1KL1BaMxavqKDK8GkYZyxZfEzxZ/MU+vvvMXT5odST
 vaRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1657008294; x=1657094694; bh=qFNEizlYcGDlLwMaBipVF62+d577
 l9fb0Uae/dcWv8c=; b=Wd/AKuW3/D+01lDqm9m49rDGZAqcm4bmOTNrwHTuMkvu
 YNkDwuTF7xQPGVcoBI21wQqFBmXhyBY0XY7lTrmn3aw7kJSwozoVIl2G95nA7h49
 JclXNNrgKqGVrVw5+ctBkwkYIN5M+51xBQsUvpDf9dQ9/2qemcwO9ANSrQBfoV89
 GKPE6cE0s4JJjtzF2IbGbStHJ1h5kQoMMvpjlhEEMPK6/g0vWfjxMDAwmKI4G76s
 DdbyHFx3/ReeMaaUPsxF4ScF/eBRXzL2Sy9olbqs62Bjk1u4RdzyCiWp6LMkl495
 z3y07mm1FtOXPptFXzcNL1vQV8wU4C4410Snt+aZqQ==
X-ME-Sender: <xms:pPDDYn-sJdWnaUSonbSmb3v3juOXJ5zpT4ZP75fNvulIoEFLG6-HjQ>
 <xme:pPDDYjuoDgmCe0bPPOnMafedoKe11NkVvOcTCwxjQhkC36k0j-25ONjJtKTx2EU9b
 RqMJhoJdO-BTme11FU>
X-ME-Received: <xmr:pPDDYlD7Jj7FWlUfRm05uiM5J7NY3Yu8COZ99Ezww7vQV57KOqtkp2aoTETQ1o6gEwOZkPZJ-v5USR2hNkM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:pPDDYjdNBs-AKVJWnenlLSILbHbj5YD7PR4bWp5vYdE1nqRj6FP57Q>
 <xmx:pPDDYsMOBuzxzhG89QZU0RD67dvS58jpxBjoofuHmb5bJaewtDBjLw>
 <xmx:pPDDYlkXgibb-S5J-LcnQ60p0nxDEhjeB_wu4tsABvUAjJDUFQGkEQ>
 <xmx:pvDDYlYR7SvxPHk4qu9D23PrUVRCB62ZoT80S1RvE1O2oD5_LkqWxQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 04:04:51 -0400 (EDT)
Date: Tue, 5 Jul 2022 10:04:49 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
Subject: Re: [PATCH v3] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <YsPwoSy8qUXAf5ef@apples>
References: <20220704032620.2710779-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YoAmOBSKDAIygHk1"
Content-Disposition: inline
In-Reply-To: <20220704032620.2710779-1-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YoAmOBSKDAIygHk1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul  4 11:26, Jinhao Fan wrote:
> Add property "ioeventfd" which is enabled by default. When this is
> enabled, updates on the doorbell registers will cause KVM to signal
> an event to the QEMU main loop to handle the doorbell updates.
> Therefore, instead of letting the vcpu thread run both guest VM and
> IO emulation, we now use the main loop thread to do IO emulation and
> thus the vcpu thread has more cycles for the guest VM.
>=20
> Since ioeventfd does not tell us the exact value that is written, it is
> only useful when shadow doorbell buffer is enabled, where we check
> for the value in the shadow doorbell buffer when we get the doorbell
> update event.
>=20
> IOPS comparison on Linux 5.19-rc2: (Unit: KIOPS)
>=20
> qd           1   4  16  64
> qemu        35 121 176 153
> ioeventfd   41 133 258 313
>=20
> Changes since v2:
>  - Add memory_region_del_eventfd() when freeing queues to avoid leak
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
>  hw/nvme/ctrl.c | 108 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  hw/nvme/nvme.h |   5 +++
>  2 files changed, 112 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index c952c34f94..9ceedf0c29 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
>  static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
>  {
> +    uint16_t offset =3D sq->sqid << 3;
> +
>      n->sq[sq->sqid] =3D NULL;
>      timer_free(sq->timer);
> +    memory_region_del_eventfd(&n->iomem,
> +                              0x1000 + offset, 4, false, 0, &sq->notifie=
r);
> +    event_notifier_cleanup(&sq->notifier);

Need to guard this with an `if (sq->ioeventfd_enabled)`.

>      g_free(sq->io_req);
>      if (sq->sqid) {
>          g_free(sq);
> @@ -4271,6 +4348,12 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl =
*n, uint64_t dma_addr,
>      if (n->dbbuf_enabled) {
>          sq->db_addr =3D n->dbbuf_dbs + (sqid << 3);
>          sq->ei_addr =3D n->dbbuf_eis + (sqid << 3);
> +           =20
> +        if (n->params.ioeventfd && sq->sqid !=3D 0) {
> +            if (!nvme_init_sq_ioeventfd(sq)) {
> +                sq->ioeventfd_enabled =3D true;
> +            }
> +        }
>      }
> =20
>      assert(n->cq[cqid]);
> @@ -4575,8 +4658,13 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequ=
est *req)
> =20
>  static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
>  {
> +    uint16_t offset =3D (cq->cqid << 3) + (1 << 2);
> +
>      n->cq[cq->cqid] =3D NULL;
>      timer_free(cq->timer);
> +    memory_region_del_eventfd(&n->iomem,
> +                              0x1000 + offset, 4, false, 0, &cq->notifie=
r);
> +    event_notifier_cleanup(&cq->notifier);

Same, should also be guarded.

Otherwise, looks good to me!

--YoAmOBSKDAIygHk1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLD8JwACgkQTeGvMW1P
DenOTAgAhjKysbyN1DSIuto6WUwcOXxVux1DLtAVrgMrj6YQZBHvDVAhkyzrMoX+
xAWluOKsAbpIkUFmPRijT0y5ZlXYw6qsKS0+kmKGU0Qh/eyvFs98XEq5bHPEO3aN
Km8sCozhNxKu5yBXZMex09Fo0RKqjSuEMLOI1OFd6W60PN5ms69bx6dZxuVROh0b
DPP3jiyqKMa+sWw4zcGkTZNmSUJmv5SzI36cR4THfVTKRlKp9vKyVZn45PhimWND
w3yVvnG0XHO71Un+ynEebOn9VnuGMOPf03Ty3DODd/jxY7h7C7o49JdwDFGzzs2/
Ce9vrSOYA4sHXRz0Eq6nSxQJPPMizQ==
=6R72
-----END PGP SIGNATURE-----

--YoAmOBSKDAIygHk1--

