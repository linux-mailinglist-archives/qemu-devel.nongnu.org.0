Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61682606FFD
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 08:25:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollTX-0007ke-99
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:25:47 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oll4F-0001GA-Gm
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 01:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oll47-0001Fi-Ou
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 01:59:31 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oll46-0007DF-46
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 01:59:31 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A37545C0003;
 Fri, 21 Oct 2022 01:59:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 21 Oct 2022 01:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1666331969; x=1666418369; bh=2Q
 GYbY0Z6URjTCwbPiKEW9k0ig3/DylN5xJKS8HdRbA=; b=vw8bLCqAa7rT4qorgY
 lEUqmKWyW2KOPvOw1DaMiQPXMeo8fjg+S/iL2FU2qnGZ2x1hU3xm75RGDx6wtDMS
 xgDS4ShIa0xKhVUBg9e43NqXdnIFVSVFCDseIyDLBPgp7YT5DdP5gYVzqCjt26Q1
 cgFLI18PLq8fTaZhCj55fWrpHKp1gl0Q6hs5slPDwJb5Q9EifObVTG32Jx9kfPhn
 hhBYOXYzwM3MWNbOCBfC+Z1tekMKtCvMQe+p5q01WEOXnISPA1pSypAYxTmOXzOn
 XAK16X7xao9nDjR/25rYGiaCEU5eHEfecSMjeU8wq9GlbtsYF7S/gJpsZ5RWHQ0G
 Cjgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666331969; x=1666418369; bh=2QGYbY0Z6URjTCwbPiKEW9k0ig3/
 DylN5xJKS8HdRbA=; b=CaLKPEI6HO3xYOGl+ocee2Ct0QP/Fg2Sg8NW6wKx+lwS
 PunVuIrdooOvceNGCQlHIckjnd2wtb5GvvSjaeH2ue/+91OPz3zz1/bL62E8oZLA
 aaa++hbZPqHWZuHLf+KCuSE+bjFXjqBevOljRyUpVW4KseiDrNPfGvv1Y6xquAWN
 ReyM7o+sOHT/FufCe8g7WZyQD7oVybzIE8ypYeosf0A9laroPLCo6+wLHoP6EJOT
 hV+gzrEDHzExo92/StzWJeiRnnDAi8R69LuT3icJu52gEv5W74/GDUCIf5RNmuph
 Ud/mWY877wAaMdn34RUP5+pNw6ThJRePfheD5V2g3A==
X-ME-Sender: <xms:QTVSY9_RSviHjzIaVz5drVQrrju7zkCaAyAr1nkFpRklzY0j0cHxdQ>
 <xme:QTVSYxvS8xMyRtzTVRVF_kjm86fUqACouaAh_7Ol4-A9LXm3fEDlqh5eKsFIKjEeT
 3dQLm4Bfot-TtoC3i8>
X-ME-Received: <xmr:QTVSY7AP2Z-Cj-POxdMTc7EcVc8mH-m-THsgic6jJQS9eu9Fa6GwWid3dcjwPXUsekRc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeljedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:QTVSYxc6p25Ym9e3joWmXQCiB2tk-K9ijOY_lY67AyQSIC9V4sVXfg>
 <xmx:QTVSYyMq3BbZJTs29_99ac_fi4hUJR7T5PS7QodqUpEGfaZEjT9i7g>
 <xmx:QTVSYzn_wzx-DuOkXJ1dixc4e3cqxu-qhli-Xysz3mZUfUZuo-IzIw>
 <xmx:QTVSY_pvzbvfAT0xiGmI9gPlrzjs2VYakqERO_fFoO4CjaMNeFtV7A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Oct 2022 01:59:28 -0400 (EDT)
Date: Fri, 21 Oct 2022 07:59:26 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: clay.mayers@kioxia.com
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Fam Zheng <fam@euphon.net>,
 Phlippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/4] hw/block/nvme: supply dw1 for aen result
Message-ID: <Y1I1PuvbMuO7HGf5@cormorant.local>
References: <20221021001835.942642-1-clay.mayers@kioxia.com>
 <20221021001835.942642-4-clay.mayers@kioxia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BpyjV9W3KsaOZn+D"
Content-Disposition: inline
In-Reply-To: <20221021001835.942642-4-clay.mayers@kioxia.com>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--BpyjV9W3KsaOZn+D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Okt 20 17:18, clay.mayers@kioxia.com wrote:
> From: Clay Mayers <clay.mayers@kioxia.com>
>=20
> cqe.dw1 AEN is sometimes required to convey the NSID of the log page
> to read.  This is the case for the zone descriptor changed log
> page.
>=20
> Signed-off-by: Clay Mayers <clay.mayers@kioxia.com>
> ---
>  hw/nvme/ctrl.c       | 19 +++++++++++--------
>  hw/nvme/nvme.h       |  2 ++
>  hw/nvme/trace-events |  2 +-
>  include/block/nvme.h |  4 +++-
>  4 files changed, 17 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index ae65226150..2b7997e4a7 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -477,6 +477,8 @@ typedef struct NvmeCtrl {
>      uint64_t    dbbuf_eis;
>      bool        dbbuf_enabled;
> =20
> +    bool        zdc_event_queued;
> +
>      struct {
>          MemoryRegion mem;
>          uint8_t      *buf;

Looks unrelated to this patch.

Otherwise,

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--BpyjV9W3KsaOZn+D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNSNT4ACgkQTeGvMW1P
Dek3ZQf9GoYyHkfbAKc4qxOX/YjW16m3ZJqw09l/rXySUuuhkdxZyiS8HePLHwim
Y2SRhCHOX7oQejynfVmGEpch3OiFtm4CfQ/pew93XogwPjj+hm7IMiPHedmP0bd/
Cvvlrhxk5rARXxCngygnXStNgyq66jtIrRkx3UkSAUsPstnXWCaSHaERoc83HaJG
TpVW98j2JRfwmssQeyCm/dUM587aOQe8gfTnk7YTIhjZTPIdV/mBbq73GOpkBlxD
eDtH4ci3ClCYKTppC5SPN0jCQ4lO4cBVHlxc4r+VliiDX/8ePT+sIatAR41NhiXu
KKKKOdfOKBNSCr/BK2UPOKVK0Kxk3g==
=R510
-----END PGP SIGNATURE-----

--BpyjV9W3KsaOZn+D--

