Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9F764B0E1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 09:14:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p50O5-0003mO-5J; Tue, 13 Dec 2022 03:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p50Nr-0003jU-TT; Tue, 13 Dec 2022 03:11:32 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p50Nm-0004NZ-9B; Tue, 13 Dec 2022 03:11:24 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 9E3803200488;
 Tue, 13 Dec 2022 03:11:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 13 Dec 2022 03:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1670919079; x=1671005479; bh=zB
 Sq7WSlMeAII/wPemficpUEf7HRWN9y5C88cezhZSI=; b=ap6CtvNvGniWPEtWeP
 dlWZQXY8Q3XH3ZMwHi60mJLEGnNXyJaYuQE4HYbcV2xqvwu8OcCnMN66H6OWo20h
 rTyNLlw9MT723Qy0whnG747LtWbE/aEKEEhk2QQsazr9Cfd7FOhtHNrwkESA/Ily
 JjrbQjWubOyD51sUXUNsXMVwmksZCAFTJGgsY3q5HXh+dyBLHxphlNaXg1n4aX0Z
 BeI5UWc8AppDvZihpabSsFgZWJuS4V7AuG1trti9KjYEgR7ja8xK5gpJrzGMAdep
 zx+6IJNp2Toe8F4ASgHmjkoA8DgKjWYLpTtDx/YdFERZCSYMAJAAuNhSZPY32H4D
 5Vow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670919079; x=1671005479; bh=zBSq7WSlMeAII/wPemficpUEf7HR
 WN9y5C88cezhZSI=; b=YnDM55oVA+gP16aUc4esDSvOwDJkojLSLK8fursxQDV+
 nUO5+paFUplZHcRg9Sdu0F+eYLOc8g0kWITqX0cwQGTxtlIctOSc6516IZ9RJTA3
 sXFxDt+Kh13QHovS+XH8PgkgkO7tIY5EVcbXqw8uw/BY0FwZkhwGLRqgitBP8esb
 FIKd7A1cgtaUAmtaDHR8u0AJfrbxKoSv75tUDvo7bdbdbPriWcyr1tLGrFD88aYu
 JmkYHyMgqmetDd7Uq5b6jERhFJ1g899t+OX6D0hyBbrtBy0hBi/8E2Bxm1LtCmaC
 3f+mMU/pJKlM2ngoZQrIQmurifCMQn4K+49MuxFvWg==
X-ME-Sender: <xms:pjOYYwMzqjGpdnaWvoGCPOdtOFp2BEU_N_eLyXIc1l7XD6SClcQISQ>
 <xme:pjOYY2-GBvieif37RKAijakLwDqfB_wNhTh2Je-l-k4th2CuFVGkypz3l1SVUrCBK
 DAtnXTGaJWZ2JrW-Io>
X-ME-Received: <xmr:pjOYY3RPQ58pTP9gbF_NNtE7BPbbs0aaTYcULq7Owe8WV__3LPMumBcoJY23i_flERE187zEP3zK0hElfy20-SGShlE1rg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdelgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:pjOYY4t43mRbr1Fbik_o8Rnmvlhfx0BzGFaagYW34Gsv2I57CyXZSQ>
 <xmx:pjOYY4f5bbnGiOANeDHDjYdVLygih7vdIG2-w-YcmxI9bPzbhM4S4A>
 <xmx:pjOYY80kXV2Y5HJYtuDeP6ARQtO0QAsaYvnjwwmg2XgqOilIazHuPQ>
 <xmx:pzOYYw53Jm0hBF3Lssm5-lzJLZi26lP2fZk5ic9elZon7sfOZrpSrg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 03:11:17 -0500 (EST)
Date: Tue, 13 Dec 2022 09:11:15 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Joel Granados <j.granados@samsung.com>
Cc: k.jensen@samsung.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v4 0/2] Add OCP extended log to nvme QEMU
Message-ID: <Y5gzo3UW/BILkCWQ@cormorant.local>
References: <CGME20221125095151eucas1p19784fd6ca83c7c3721fdc06e02abc260@eucas1p1.samsung.com>
 <20221125094808.1856024-1-j.granados@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ikUCVuM+FN5a1rg4"
Content-Disposition: inline
In-Reply-To: <20221125094808.1856024-1-j.granados@samsung.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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


--ikUCVuM+FN5a1rg4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 25 10:48, Joel Granados wrote:
> The motivation and description are contained in the last patch in this se=
t.
> Will copy paste it here for convenience:
>=20
>     In order to evaluate write amplification factor (WAF) within the stor=
age
>     stack it is important to know the number of bytes written to the
>     controller. The existing SMART log value of Data Units Written is too
>     coarse (given in units of 500 Kb) and so we add the SMART health
>     information extended from the OCP specification (given in units of by=
tes).
>=20
>     To accommodate different vendor specific specifications like OCP, we =
add a
>     multiplexing function (nvme_vendor_specific_log) which will route to =
the
>     different log functions based on arguments and log ids. We only retur=
n the
>     OCP extended smart log when the command is 0xC0 and ocp has been turn=
ed on
>     in the args.
>=20
>     Though we add the whole nvme smart log extended structure, we only po=
pulate
>     the physical_media_units_{read,written}, log_page_version and
>     log_page_uuid.
>=20
> V4 changes:
> 1. Fixed cpu_to_le64 instead of cpu_to_le32
> 2. Variable naming : uuid -> guid
> 3. Changed how the guid value appears in the code:
>    Used to be:
>         smart_l.log_page_uuid[0] =3D 0xA4F2BFEA2810AFC5;
>         smart_l.log_page_uuid[1] =3D 0xAFD514C97C6F4F9C;
>=20
>    Now is:
>         static const uint8_t guid[16] =3D {
>             0xC5, 0xAF, 0x10, 0x28, 0xEA, 0xBF, 0xF2, 0xA4,
>             0x9C, 0x4F, 0x6F, 0x7C, 0xC9, 0x14, 0xD5, 0xAF
>         };
>=20
>    This is different from what @klaus suggested because I want to keep it
>    consistent to what nvme-cli currently implements. I think here we can
>    either change both nvme-cli and this patch or leave the order of the
>    bytes as they are here. This all depends on how you interpret the Spec
>    (which is ambiguous)
>=20
> V3 changes:
> 1. Corrected a bunch of checkpatch issues. Since I changed the first patch
>    I did not include the reviewed-by.
> 2. Included some documentation in nvme.rst for the ocp argument
> 3. Squashed the ocp arg changes into the main patch.
> 4. Fixed several comments and an open parenthesis
> 5. Hex values are now in lower case.
> 6. Change the reserved format to rsvd<BYTEOFFSET>
> 7. Made sure that NvmeCtrl is the first arg in all the functions.
> 8. Fixed comment on commit of main patch
>=20
> V2 changes:
> 1. I moved the ocp parameter from the namespace to the subsystem as it is
>    defined there in the OCP specification
> 2. I now accumulate statistics from all namespaces and report them back on
>    the extended log as per the spec.
> 3. I removed the default case in the switch in nvme_vendor_specific_log as
>    it does not have any special function.
>=20
> Joel Granados (2):
>   nvme: Move adjustment of data_units{read,written}
>   nvme: Add physical writes/reads from OCP log
>=20
>  docs/system/devices/nvme.rst |  7 ++++
>  hw/nvme/ctrl.c               | 73 +++++++++++++++++++++++++++++++++---
>  hw/nvme/nvme.h               |  1 +
>  include/block/nvme.h         | 36 ++++++++++++++++++
>  4 files changed, 111 insertions(+), 6 deletions(-)
>=20
> --=20
> 2.30.2
>=20

LGTM,

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--ikUCVuM+FN5a1rg4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmOYM6MACgkQTeGvMW1P
DenM/gf/VrmATxbmuL5gAvXbQIiQWxYiy49KyErpPEgiAKOOCHcEwIX9qz2eax0L
A5U4/DYUCNSGXRLSDZfEHIrQiPTpe5M6SSgIW91sEmkz6BsmTJpAl7v9ooNoCdTr
RU2KWYl1z5rdq4ZjilN75/asMLVPU3whjGeg+7/JHnsq7jEaaJEhBla5N5Ed86HS
UVb5PpdreRmDjNDB9vHSMrfqgSrcFnT6fvbPUJQlSeEly2ZTzI4pE+IGCyt0UJmf
tnWr9qQAwm3+LcL8DXpirEpRdyS+zzoef6xrBzFcGJyDSj0CgjHgvAlOWTxQy8bp
QYW2iiyz+hbRTqoLKYXqtUh2lvjH1w==
=LI69
-----END PGP SIGNATURE-----

--ikUCVuM+FN5a1rg4--

