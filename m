Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F49569A13
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 07:55:12 +0200 (CEST)
Received: from localhost ([::1]:49892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9KTm-0001cB-G0
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 01:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o9KQw-0000k8-F7
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 01:52:14 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:50321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o9KQi-0006Dc-Mj
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 01:52:14 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CFAA75C00C0;
 Thu,  7 Jul 2022 01:51:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 07 Jul 2022 01:51:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657173117; x=1657259517; bh=E+
 Iuss0fdMjA98I/RGoUAHGe75sEPtsLrsMbzz5Obe4=; b=al0z/fFGzAVr+GURBi
 lMJcZBt8taIU89Hgg+q/LriPScGiNieNp16Te62hbrOB2ewnYTYHdTfCgFZQ/dpn
 ufArlb9MaGt96KaQW+Pl6OIyNRgSLGf1U8vil3oQAIEADsZIMSukFbPtpLsvT5np
 uiAIWrh+LxNIKYtE+KmpeKeEmrmS9VXvEdCBHBsLHZOvcuoLoTDW1k6FowwjXeVd
 mjZAk2pXm263Fondwh/cb8/OIAvEP6GOI/m2fJiFnnCPgv2HMrxWN0/F3DAG5hpW
 n0fDmJhQo4FEGHxTwsnrQ13kuB0ljpJt3YGawgH71X5E5WJ5OZEiFDdVxEAYFAuo
 P+ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657173117; x=1657259517; bh=E+Iuss0fdMjA98I/RGoUAHGe75sE
 PtsLrsMbzz5Obe4=; b=3UmMkarGf37RXmIupFDMaZPBKHkUv9odSBPVgeBwd2OC
 THsgtigd5homxeDUX2Abqzm2o/n7YOyqZJsZbOKYAUTzk2rAK/Tc9R1qF5ts8PjI
 3ztxfg+XVRIf7u9FE3lkV+n33m3E9eH8x32H6fDdmusURN0FkVPTXavSMWTgxYl9
 DX1cyArqm2GNt0TV8sYiVDcEcsJZPIQAJJJISFB47DG2QYv8k0nnk17muqMMpxYF
 EUbDkP+Ts7yKC19SleH6WWnlr3fGp4kpE5rY1S4sXpsj2RGud+zGO5KcrqJ88snF
 WsOEEPM9rdzQjxFlcGe89I9zhZwCtRSdHes0upKGcA==
X-ME-Sender: <xms:fHTGYuXq8m2r_mJpwgxceG0dbG6R2QbyuHxFW4iBZDx4T-0mBTcqQQ>
 <xme:fHTGYqndiXjtCwjfEAUVjdAkySW7Prp4ATBR4sH0DAFlXZlgZxCdQ2O4GD7v5B6QV
 _p5YJsIZvabisPHvNI>
X-ME-Received: <xmr:fHTGYiaPBQ1Sr4slCF6iHuQ6JfjYbobIhrev_okEirFnWrVESJ1e6o17r0ibrAaGw-htZm5T70DUfARR_u8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigedguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:fHTGYlWD5bm6di6XPMC_SGhcgB9_3zNUt_cEAeuIJA4aNteeiMC0mQ>
 <xmx:fHTGYokNV19t4317Id3fW-h3bJpkH5e6rllRxwrxMz3FYVXT29aiGA>
 <xmx:fHTGYqd1bJfw82F-A6pnT0O3H5qxL6ey3Jyqu-abOOT5at5vHZjvAg>
 <xmx:fXTGYtziOCR50iIdYcCGWpltzCZyHe9Lzob_sR9qOxtPK7oMxN7acw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Jul 2022 01:51:55 -0400 (EDT)
Date: Thu, 7 Jul 2022 07:51:53 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: Keith Busch <kbusch@kernel.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <YsZ0eZ7xJtbxgLS8@apples>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
 <YsRwyMONg0+mHVsL@apples>
 <YsSGbhJQXp9fiCZK@kbusch-mbp.dhcp.thefacebook.com>
 <69E2ADBE-5064-4E04-B236-8815D82263AB@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZJYb5WFZkJTzdmFc"
Content-Disposition: inline
In-Reply-To: <69E2ADBE-5064-4E04-B236-8815D82263AB@ict.ac.cn>
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


--ZJYb5WFZkJTzdmFc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul  6 19:34, Jinhao Fan wrote:
> at 2:43 AM, Keith Busch <kbusch@kernel.org> wrote:
>=20
> > On Tue, Jul 05, 2022 at 07:11:36PM +0200, Klaus Jensen wrote:
> >> On Jul  5 22:24, Jinhao Fan wrote:
> >>> @@ -1374,7 +1374,14 @@ static void nvme_enqueue_req_completion(NvmeCQ=
ueue *cq, NvmeRequest *req)
> >>>=20
> >>>     QTAILQ_REMOVE(&req->sq->out_req_list, req, entry);
> >>>     QTAILQ_INSERT_TAIL(&cq->req_list, req, entry);
> >>> -    timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500=
);
> >>> +
> >>> +    if (req->sq->ioeventfd_enabled) {
> >>> +        /* Post CQE directly since we are in main loop thread */
> >>> +        nvme_post_cqes(cq);
> >>> +    } else {
> >>> +        /* Schedule the timer to post CQE later since we are in vcpu=
 thread */
> >>> +        timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +=
 500);
> >>> +    }
> >>=20
> >> Actually, we are only in the vcpu thread if we come here from
> >> nvme_process_db that in very rare circumstances may enqueue the
> >> completion of an AER due to an invalid doorbell write.
> >>=20
> >> In general, nvme_enqueue_req_completion is only ever called from the
> >> main iothread. Which actually causes me to wonder why we defer this wo=
rk
> >> in the first place. It does have the benefit that we queue up several
> >> completions before posting them in one go and raising the interrupt.
> >> But I wonder if that could be handled better.
> >=20
> > I think the timer is used because of the cq_full condition. We need to =
restart
> > completions when it becomes not full, which requires a doorbell write. =
Having
> > everyone from the main iothread use the same timer as the doorbell hand=
ler just
> > ensures single threaded list access.
>=20
> Could we let nvme_process_aers register another timer/BH to trigger
> nvme_enqueue_req_completion in the iothread? In this way we won=E2=80=99t=
 need the
> timer_mod in nvme_enqueue_req_completion.

Yes, we could have process_aers in a timer. Which would probably be
preferable in order to limit the amount of work the mmio handler is
doing in that rare case. However, its such a rare case (only misbehaving
drivers) that it's probably not worth optimizing for.

> We can also avoid some potential currency problems because CQ is only
> modified in the iothread.
>=20

There are currently no concurrency problems because of the Big QEMU
Lock. When the mmio handler is running, the vcpu holds the BQL (and
whenever the main iothread is running, it is holding the BQL).

> BTW, are there any reason that we must use timers (not BH) here? Also why=
 do
> we choose to delay for 500ns?

No particular reason. do not see any reason why this could not be bottom
halfs. This will likely change into bhs when we add iothread support
anyway.

--ZJYb5WFZkJTzdmFc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLGdHQACgkQTeGvMW1P
DelCbggAqnMH02p1335eZ5L9oZR2IHTmaPo4x81jIE8ZeQbsJBarALcKgYOSKObn
4VLbX0ghN1wHc9nwpy50tcn62gTR8zOUWL4DHmjvb2UF5aiQ3Jrx6M3yg5prWGge
ssmVHWbxObwLoA46p56ozb8JaPggtTp2Fi85t5QU4QU7JhoNlnI+eEgDdmPK1r9r
bz2r7a8/SEkKLDNlN/K9bczP+rw+a0p88ZmNGGvXNUlH6L+6kzebEArMZ8JCE67n
ThNbKDLbM5utDjcG/CXj8PDMEQzfjlwy48cDGK55ST/P3bLfY+HEl+Qx9CLwAV29
9SFvqlFAq6OsuoOxh/b2y1yMdWSFZQ==
=VL8i
-----END PGP SIGNATURE-----

--ZJYb5WFZkJTzdmFc--

