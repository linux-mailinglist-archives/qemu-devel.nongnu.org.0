Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE696B57D0
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Mar 2023 03:25:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paou6-0003jl-Nu; Fri, 10 Mar 2023 21:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1paou5-0003jF-Cz
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 21:24:13 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1paou3-0000Or-BP
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 21:24:12 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6EBE15C0069;
 Fri, 10 Mar 2023 21:24:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 10 Mar 2023 21:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1678501447; x=1678587847; bh=1Dohxc6Kth0w3HkKHso4hnDzC53XqmYhGiE
 kQUaTxkY=; b=yDvtaQGTlVRzrQnQaZ12GdgZIx/3MWRzFGOviJMwtVI2i2sZWha
 uau+9t++qt5RQH4adeu7/UxjcctqMBD1cXOTXKMdDSpq8z3mRS38PnhIwak8OUzh
 ojmw/wR1UCq8fyWwaeL11HixaRTQGH7WU/2utLH1wm//Pji9f0NDu8mBn2MPvpPZ
 s2wjCsMtCct5a6SbtzOJ7kLKkDhzu5B3q20RahM6LNzRq7e3zaFhYi1uTn5no/vP
 cJrOd6d6f/OQHKGARJ8AVrPWO/j3iEfJsTdBl2d3gIACxR1cRvjCvsuAP4YMihgE
 ABCqoWFBPATiPpkXm9U0rUlZKiwdN/ulGDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678501447; x=1678587847; bh=1Dohxc6Kth0w3HkKHso4hnDzC53XqmYhGiE
 kQUaTxkY=; b=VFPRexi/88HH4ZHTn8DHCeazR5A0vQR0Si3ln1P0AZUISJi3Uz7
 aBQhQ9nmfm9yh8X7VcQnvW/D3a2zN+gN2ApluM3teu820NsxL5ysfDDKzPdQ19Z2
 pgIXrHKcSEZ8rz5yWs4RnC1XCmUbZagyHBHooS9MFxHp9rRs95lcTP3soCaandFH
 3QC1UOlfe7oFneMGNM96xlraMGgyzku1q7TOTiuxbC1hk8vYFIcomZl7UIN7bf8k
 w+MTN206r+sN5x6t2ihFnsXdY37bPz6PVg/L4hcKyPJJppEqk0PpLSsR889EkX+W
 1yKRpmVc5KT4u+OQDroR5k2GE5V8BljtR/A==
X-ME-Sender: <xms:R-YLZDVbktkfH2ZS5zlVJi70umakaOW-QLO0p7JicBaOZ3g3X2iprA>
 <xme:R-YLZLmPFHQ3Wm9aVUELtI4-1FJCz12fVuEyN0XwGQTY77WyCp2obZZhhxzypma_r
 kLHPJiXH1ByTjK32RU>
X-ME-Received: <xmr:R-YLZPa_zckHTKAU5rJMbyrEXCj5YKbHA0nrznyAmSQVYMNv3huuThyTdx7me2ScDt4qaWMpZA-Ii7IhXKjZ8YOpqSv4kduN6DbmPtZuhiJ2AMSL0RiRww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdduledggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptgfghfggufffkfhfvegjvffosehtqhhmtdhhtdejnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeeuiedtvdejgfegfffgudetvddtueffueejffejgeelveeutddtveehfffh
 feetieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:R-YLZOUrvVZDHSYL9tYfVEQLL4N18LBx68t3-WDJXXdsxs0JTfCjLg>
 <xmx:R-YLZNkyWy2UJ15TFmIxH8ToJejS2VGK0h9CshnW8gWjS2RKu51O7Q>
 <xmx:R-YLZLc4ds7LzEEl4FJ_5oY3SZyrlcS-JVJzempPSbGnEhBV7535oA>
 <xmx:R-YLZDheksvlqEPXjAEvkUAS7VxqfpfBrBXZvXubhgIbmoI1Wvy8dQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Mar 2023 21:24:06 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Peter Delevoryas <peter@pjd.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [PULL 4/5] contrib/gitdm: Add Facebook the domain map
Date: Fri, 10 Mar 2023 18:23:54 -0800
Message-Id: <AF400B79-9BB0-4303-A097-6D170A64B4E8@pjd.dev>
References: <20230310155726.2222233-5-alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 Iris Chen <irischenlj@fb.com>,
 =?utf-8?Q?Daniel_M=C3=BCller?= <muellerd@fb.com>
In-Reply-To: <20230310155726.2222233-5-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: iPhone Mail (20D67)
Received-SPF: pass client-ip=66.111.4.27; envelope-from=peter@pjd.dev;
 helo=out3-smtp.messagingengine.com
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



> On Mar 10, 2023, at 7:57 AM, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>=20
> =EF=BB=BFA number of Facebook developers contribute to the project. Peter c=
an
> you confirm your want pjd.dev contributions counted here or as
> an individual contributor?

I want them counted as Facebook, for now. If I leave Facebook I=E2=80=99ll s=
end an update=20

Thanks!
Peter

>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Iris Chen <irischenlj@fb.com>
> Cc: Daniel M=C3=BCller <muellerd@fb.com>
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
> Message-Id: <20221219121914.851488-9-alex.bennee@linaro.org>
>=20
> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
> index 1ea20b9890..8913a886c9 100644
> --- a/contrib/gitdm/domain-map
> +++ b/contrib/gitdm/domain-map
> @@ -12,6 +12,7 @@ citrix.com      Citrix
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
> index 288b100d89..907ffde017 100644
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
> 2.39.2
>=20


