Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8643A650E8F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:23:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Hz5-0007xx-Kh; Mon, 19 Dec 2022 10:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1p7Hyn-0007wg-HG
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:23:04 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1p7Hyh-0002ng-QH
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:23:00 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id BD3D95C012A;
 Mon, 19 Dec 2022 10:22:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 19 Dec 2022 10:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1671463372; x=
 1671549772; bh=u9U5LOpzhWy0YxrJWA+zeE18kMAhb1Lk+A9B6iT5kko=; b=N
 eyvZN/0E/fZTvSKbGU3naE8mapnhtiNpro7L9nvX5wTS8aHcykQKJYiihU+OQzIy
 X9/1DlXInW83OeGB20wczHXryvGQuZb1FzIZziJ1NMQ00a7IHXIJmIOtCaIbwEhy
 kza/n0WL/TJjCefyZQy93bahZZtsb7mrRH0hQC0zczswLu2BVeBJBg6gJZZv1weX
 nGXpnnjXIdSP97bLKI6efz58S7vFv1OcxHnoEn3d8tu8+4p50K0xaepdpQKWW0Hu
 Gws80myCVxoarQtWrRodIkhJVhTxdKCbgdyMAre3zxzVjNoddLDdnDC7NdktOw8t
 e3uKIBBgfAmZFADxDTP5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1671463372; x=
 1671549772; bh=u9U5LOpzhWy0YxrJWA+zeE18kMAhb1Lk+A9B6iT5kko=; b=R
 oezqPe7LrlgpCiVUg1cT6+ZUtqz5rhymGc4UspaqHZDz8U/Rk2UOF9VBLH211Mma
 JM6rFfaErIedeUHxnv9/HXz4XSOsIC64pyIlTNKQIwi2meVAjMVDxRnNI0GomcMa
 2SYZVK4YRBizdhHx+Xsrigf06jqiEJH9mjeuNKaNcn3wFKM949fc2oB22Tg5RsZ9
 /jHbD4kLnfGODtjBuGF5S55bgcPaJ8iHuKboA/GQ6BzurBOEMlN1AlBl6RzBE9y7
 mWXmU010OFgonmIbUtzCSsS7HJTgnwzr+B5iyNNU4fWwWeXos9nozpBMNnA+nY3H
 OnP+5Mkmp7+E0vL/Zaetw==
X-ME-Sender: <xms:zIGgY6tjaEdSIByKjoWD-DSKDPnonP7zjrd9CLgRmF7O70g8uw_BiA>
 <xme:zIGgY_ctmKTNywkW0ARWa4I0A-up98tNj7CHxnUC1V2oDoE0iG31UER1C-W7zzHyJ
 dzLOCYB5gSVzj9oMu0>
X-ME-Received: <xmr:zIGgY1zUK1cW0TRtbLcbCM1HxIGU4lbSZP_YFge88HgvGsZrowRSpug4zrLsktGWWiVYIL4N8xY4sxl6cxSsEX9mf1otembNe3Iqrq8VUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpegtgffhggfufffkfhevjgfvofesthhqmhdthhdtjeenucfhrhhomheprfgvthgv
 rhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgrth
 htvghrnhepueeitddvjefggeffgfdutedvtdeuffeujeffjeegleevuedttdevheffhfef
 teeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepph
 gvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:zIGgY1N_J1B1PRIJuOXflu0GAPc9yBZUTTxjv7vOL2K2NSLv_n3JMg>
 <xmx:zIGgY6-M_TMz5WjjF0lDqqyvQDnYPDvqhhCL0NtKhFg_l1fwHMXbJw>
 <xmx:zIGgY9W8lONLuTJqndxDWQRoMbkH0kpnYOtuMdon2XIwuBY1IrPFwA>
 <xmx:zIGgYxYI5jLXBJNBkyOp3vS4WNtor9yuKRUnw6UsJ1DuYY6tZNVN5A>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Dec 2022 10:22:52 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Peter Delevoryas <peter@pjd.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 08/11] contrib/gitdm: Add Facebook the domain map
Date: Mon, 19 Dec 2022 07:22:40 -0800
Message-Id: <052012F1-2E78-40FC-990B-6AA3C95FDB37@pjd.dev>
References: <20221219121914.851488-9-alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Iris Chen <irischenlj@fb.com>,
 Peter Delevoryas <pdel@meta.com>, Daniel Mueller <muellerd@meta.com>
In-Reply-To: <20221219121914.851488-9-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: iPhone Mail (20B110)
Received-SPF: pass client-ip=66.111.4.29; envelope-from=peter@pjd.dev;
 helo=out5-smtp.messagingengine.com
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



> On Dec 19, 2022, at 4:19 AM, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>=20
> =EF=BB=BF!----------------------------------------------------------------=
---|
>  This Message Is =46rom an External Sender
>=20
> |-------------------------------------------------------------------!
>=20
> A number of Facebook developers contribute to the project. Peter can
> you confirm your want pjd.dev contributions counted here or as
> an individual contributor?

Oh, hey: yes I can confirm that, I want pjd.dev contributions counted here a=
s fb stuff.

By the way: recently, every Facebook developers email has migrated to =E2=80=
=9Cusername@meta.com=E2=80=9D. So now all my fb.com email goes to my meta.co=
m inbox. We may or may not want to include both emails. I think the fb.com e=
mails will stay around for quite a while, but yeah.

>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Iris Chen <irischenlj@fb.com>
> Cc: Peter Delevoryas <pdel@fb.com>
> Cc: Peter Delevoryas <peter@pjd.dev>
> Cc: Daniel M=C3=BCller <muellerd@fb.com>
> ---
> contrib/gitdm/domain-map         | 1 +
> contrib/gitdm/group-map-facebook | 5 +++++
> gitdm.config                     | 1 +
> 3 files changed, 7 insertions(+)
> create mode 100644 contrib/gitdm/group-map-facebook
>=20
> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
> index 03d12b3ba6..22d7f953e1 100644
> --- a/contrib/gitdm/domain-map
> +++ b/contrib/gitdm/domain-map
> @@ -14,6 +14,7 @@ citrix.com      Citrix
> crudebyte.com   Crudebyte
> chinatelecom.cn China Telecom
> eldorado.org.br Instituto de Pesquisas Eldorado
> +fb.com          Facebook
> fujitsu.com     Fujitsu
> google.com      Google
> greensocs.com   GreenSocs
> diff --git a/contrib/gitdm/group-map-facebook b/contrib/gitdm/group-map-fa=
cebook
> new file mode 100644
> index 0000000000..38589f8fb9
> --- /dev/null
> +++ b/contrib/gitdm/group-map-facebook
> @@ -0,0 +1,5 @@
> +#
> +# Some Facebook contributors also occasionally use personal email address=
es.
> +#
> +
> +peter@pjd.dev
> diff --git a/gitdm.config b/gitdm.config
> index f79d39df63..75b55b3603 100644
> --- a/gitdm.config
> +++ b/gitdm.config
> @@ -33,6 +33,7 @@ EmailMap contrib/gitdm/domain-map
>=20
> GroupMap contrib/gitdm/group-map-cadence Cadence Design Systems
> GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
> +GroupMap contrib/gitdm/group-map-facebook Facebook
> GroupMap contrib/gitdm/group-map-ibm IBM
> GroupMap contrib/gitdm/group-map-janustech Janus Technologies
> GroupMap contrib/gitdm/group-map-netflix Netflix
> --=20
> 2.34.1
>=20


