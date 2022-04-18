Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD83504CA6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 08:30:31 +0200 (CEST)
Received: from localhost ([::1]:43952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngKu2-0008WA-JC
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 02:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ngKe8-0006VK-HN; Mon, 18 Apr 2022 02:14:00 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:40415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ngKe5-0002MZ-Tm; Mon, 18 Apr 2022 02:14:00 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id BA0973201DB0;
 Mon, 18 Apr 2022 02:13:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 18 Apr 2022 02:13:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650262435; x=1650348835; bh=3g
 TKz4WgfKEn+xC182rLU+v19j82HJsVhM6/NbTKSjM=; b=Yl6WACGIzxCMUe8gzo
 BePFoyuyUP6QNTJZNlueUWTF+lGg17mX2kNuEAkhePe+KxwYibVNbz05Z46P+Pyd
 jQzSAl9XoXSxn9ypnUCk/FpB0KjDds0A+OOa5+Y9ZIt2kvmWWrWcaSNOM8ho/sFR
 cFqrrz//h0uA9kDnmwOaAZBEKN/hrsakOo2zjd1jRsh5qM5DHxR7/N5P36wqH9B0
 nie9EcJTm3xgRP94W/NlwB/KPE35TqPuJ8cF/nWan+a1sWPxlwsfFDPhbOqXEEMN
 gBaYyNCpIR8OBYJ6xfzRT21heZ0t2hKZwa1A3CdmibvHfEdPKC0dUqXMJhK+5nl+
 F/Hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650262435; x=
 1650348835; bh=3gTKz4WgfKEn+xC182rLU+v19j82HJsVhM6/NbTKSjM=; b=z
 h29dIHVf6AAsGJgjKV7z/qe7bNOnGR7ht+qCZetG8BycAxT1ZWHfzhSE85ERTYoX
 BIr0rjhlnM58anNKbYVZwyyyuiW6SwI3hUz6P1LqmhX1XDFrFn875Z9mnpYwhzcq
 qYixvVKp6gwj5Myno3qHFfu3Ecnbvt4n3OrzBG9Gpqpnf+g0pUXnY/wwFfQU/s10
 KaGGsWk4tNzCzEpWDRvJ8d6Poln/aE4RRi/5a/PMkIqOetA2VW/qujGnLPHgC2lG
 cZ02QnzAW7OE57Q1kJBkze5QGLGPvTNOCMegIH6M2RlhD02HtaB5rkQNqqckJiIa
 hloqmXsdO76dox9UeqxQQ==
X-ME-Sender: <xms:owFdYtnyon0JKEFoQl09s34C_af_HQ7eYJZlRLuuCE48Ag2ppSUaHQ>
 <xme:owFdYo14kjq47o_GjubFWpfMtcyy37KU4DgOaGkAwoltjZcaJ8qv5YlgJAAttpdlt
 7rw6GfGB8HynAl6TMU>
X-ME-Received: <xmr:owFdYjpaCOh2eV8K66hhWj_ru-KVrp0VWxX42iudc3fGY4rN7dkZmGl2YDjYNCdH5aEVcCjXEA9FlZ8UPDU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddttddgleelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjeegudffueeiteekieelkedvueelte
 evjeduieeludfffeejgeffhfduvdduffeknecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:owFdYtny-Qqz_BQ9rQ9mEMmYErau3NVent1TsYYg2IJKwsIC1b_Jsw>
 <xmx:owFdYr0g64ZVG5tiJsrtMQki3C8LFbdXL-YrSu7jwR-7Iub_r3ifNg>
 <xmx:owFdYstaqUbtXBL_pufeoMGWFW7-hkvJg0ctAmp9a592b1r5EDGpIg>
 <xmx:owFdYr88N8AgDxyCg8eOsopdlL2aNhQPqAFHzIfOAkc0eUuz7CRQLg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Apr 2022 02:13:53 -0400 (EDT)
Date: Mon, 18 Apr 2022 08:13:52 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Tikhov <d.tihov@yadro.com>
Subject: Re: [PATCH v2] hw/nvme: add missing return statement
Message-ID: <Yl0BoGv2yg1fg5ln@apples>
References: <20220415204832.h6fyygvyouhtjlji@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xUVMxosvndq6UjYg"
Content-Disposition: inline
In-Reply-To: <20220415204832.h6fyygvyouhtjlji@localhost.localdomain>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Cc: kbusch@kernel.org, ddtikhov@gmail.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xUVMxosvndq6UjYg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 15 23:48, Dmitry Tikhov wrote:
> Since there is no return after nvme_dsm_cb invocation, metadata
> associated with non-zero block range is currently zeroed. Also this
> behaviour leads to segfault since we schedule iocb->bh two times.
> First when entering nvme_dsm_cb with iocb->idx =3D=3D iocb->nr and
> second because of missing return on call stack unwinding by calling
> blk_aio_pwrite_zeroes and subsequent nvme_dsm_cb callback.
>=20
> Fixes: d7d1474fd85d ("hw/nvme: reimplement dsm to allow cancellation")
> Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
> ---
> v2:
> - Instead of adding else just insert return statement
> - Add: "Fixes: d7d1474fd85d" to commit message
>=20
>  hw/nvme/ctrl.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 03760ddeae..74540a03d5 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -2372,6 +2372,7 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
>          }
> =20
>          nvme_dsm_cb(iocb, 0);
> +        return;
>      }
> =20
>      iocb->aiocb =3D blk_aio_pwrite_zeroes(ns->blkconf.blk, nvme_moff(ns,=
 slba),
> --=20
> 2.35.1
>=20

Thanks,

Applied to nvme-next!

--xUVMxosvndq6UjYg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJdAZ4ACgkQTeGvMW1P
DelcVwf/frlPZdbt4P/3L0jlJs1wqFFraQnFeO9xf5SJJ+ZxTw1Ge+m/QAShQSyb
EGSLCpRfdubaaI8EE+pKIjAFFwfKP4T1m62U+uXqdpiuONRfIng22HAYBQ71SwNv
9NyQN7SIo1Flu5nz+bSyVmKMd+/XnO2lLRGxh2i7mtrUKZyqSLTYK1kA+mMvmnyy
SPcYOJi0dQURjpLDaHVPdlUOvrdmjpcGDK+sm2vzTfzsrV3XOPKzc5ocmRGB/P7x
p/5KhYi++VQ35P/FISEzSBeo7xQIoq9Kc0bm1Tub2dNecRaMorhYWoFKYzaJplnV
hdPqJDU9UVD66MoqTamJsvzqeJpLMg==
=5Hsw
-----END PGP SIGNATURE-----

--xUVMxosvndq6UjYg--

