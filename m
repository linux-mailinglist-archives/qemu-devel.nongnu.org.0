Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33579625A82
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 13:33:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otTCy-0000Wy-3l; Fri, 11 Nov 2022 07:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1otTCu-0000VR-UP; Fri, 11 Nov 2022 07:32:28 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1otTCr-0004vZ-3x; Fri, 11 Nov 2022 07:32:27 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id AC21E3200094;
 Fri, 11 Nov 2022 07:32:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 11 Nov 2022 07:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668169941; x=1668256341; bh=yD
 lHkiREP7p3mbeL+xK2DC5DREEutPx747eHlkdzWC8=; b=dzQ69vNsOEsNzeoS3G
 MdWBf+upD+rRCaBIM1LZ28d6m4uHkzZBM6jrInDCYwaTwxmAneUla/QhNV3uq2RD
 N4VjD1R1DpI6hx3qmivO6ikR/mHm9X2NmlJImuq64lf2u6baIkTxniiL7ypF2iZ8
 CexrzCZlPmBkMYVQFqW2U1n3K3mvAIdOBopqeV0VWVu8DrWuxkiJpmApk0iCXtOD
 8na4PwUb81HB5ssxBXSXzs/yRELT/7kWBNRK2OSn/5iyqGW9VdWyLwgBj+Z/gxCm
 d8Wx7nDJjmRBKeli6mlE5b1Ea7oO1fjGA6jfQ8yrVVI+a4F+PvRkaOfoNgQNxs+i
 EC6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668169941; x=1668256341; bh=yDlHkiREP7p3mbeL+xK2DC5DREEu
 tPx747eHlkdzWC8=; b=d9T1M55Xcy8brpiYIy8Sa7WgIaMCuTkffWEIGkb3OpuO
 UcyAr143a0OuG6pVFkAC/Yc/fvWIxrkJwyb9hxwcoUarjtXWam3gMhDHfWP9s6p0
 qwo4JP4GhAfiiMfulw6nbtpA3E37GNdjR+ZHvT42d7wI9Kyo5lPTE01umSkKx0o2
 i6e23/QOEGPYTZ5a4+5OgYOV6HatMGCVu9ZB15TC0OKsTLlu/tzc6fe+InLGGgQv
 1VqtqBAZSmzKqkpFxh6OHjWsLej8TVFjmq1andb65xStdi76ZDQOecVrItD29j4X
 Uehrt/D2ioHoxzPytWr3ETLIuGN3O7aNYcbDQ/Rb2w==
X-ME-Sender: <xms:1EBuY4vGyFbniTEIJ18cpO3LsXgDnJOA4RUa68BrIDnVk59d7l0BNw>
 <xme:1EBuY1eH9y_peOKdcCLeNcyvrt8DRBzlrXqT7r9UgxkfW3brqSIiNdha6deGmg1Lr
 zq00-i9RbF55UiUcsA>
X-ME-Received: <xmr:1EBuYzwikf1S_sWxvhBLVgKAD4q7mxscgIvqM-4OLNqlFU7yVHyidIsmjnL4CkuY6gJpIoaNlXWmbRSuaN8387O8GDFYmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeigdegudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:1EBuY7PnwDeJn2e8jESIMWv_PTJvbnoWbmnpjdtsHVILgzQMWXCoXA>
 <xmx:1EBuY489lRype4D3NchIaWSABBH-k_KI5BaKrSjH5HxZJWbr-RYk1A>
 <xmx:1EBuYzVMlIP3n2aE2CQ84mzBCfD_NbRvvW-PKsln347Wk6Ur-ridEQ>
 <xmx:1UBuY3k67TgaLpdHP69VhNQ3TwwwtfYgNfWN-y53zvROb5YFAweRQA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Nov 2022 07:32:19 -0500 (EST)
Date: Fri, 11 Nov 2022 13:32:17 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v3 2/2] hw/nvme: cleanup error reporting in nvme_init_pci()
Message-ID: <Y25A0Qx95NtrPmA3@cormorant.local>
References: <20221110220805.26816-1-its@irrelevant.dk>
 <20221110220805.26816-3-its@irrelevant.dk>
 <bfc67412-09ce-793e-49ac-b0af0cf05fbd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2dmcRCOFYjQ5X3Pg"
Content-Disposition: inline
In-Reply-To: <bfc67412-09ce-793e-49ac-b0af0cf05fbd@linaro.org>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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


--2dmcRCOFYjQ5X3Pg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 11 12:40, Philippe Mathieu-Daud=C3=A9 wrote:
> On 10/11/22 23:08, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Replace the local Error variable with errp and ERRP_GUARD() and change
> > the return value to bool.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >   hw/nvme/ctrl.c | 23 ++++++++++-------------
> >   1 file changed, 10 insertions(+), 13 deletions(-)
>=20
>=20
> > @@ -7388,14 +7387,12 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice=
 *pci_dev, Error **errp)
> >       }
> >       ret =3D msix_init(pci_dev, n->params.msix_qsize,
> >                       &n->bar0, 0, msix_table_offset,
> > -                    &n->bar0, 0, msix_pba_offset, 0, &err);
> > -    if (ret < 0) {
> > -        if (ret =3D=3D -ENOTSUP) {
> > -            warn_report_err(err);
> > -        } else {
> > -            error_propagate(errp, err);
> > -            return ret;
> > -        }
> > +                    &n->bar0, 0, msix_pba_offset, 0, errp);
> > +    if (ret =3D=3D -ENOTSUP) {
> > +        warn_report_err(*errp);
>=20
> Why only report ENOTSUP in particular?
>=20

Because the error is beneign (it's just a notice that MSI-X isnt
available on the platform).

> > +        *errp =3D NULL;
> > +    } else if (ret < 0) {
> > +        return false;
>=20
> Is that normal to ignore:
>=20
> -   error_setg(errp, "The number of MSI-X vectors is invalid");
>     return -EINVAL;
>=20
> -   error_setg(errp, "table & pba overlap, or they don't fit in BARs,"
>                      " or don't align");
>     return -EINVAL;
>=20
> Or possible future error added in msix_init()?

It is not ignored, it is passed up to the caller. On any other error,
returning false will cause device realization to fail and the error
(i.e. invalid vectors or overlap) be reported.

--2dmcRCOFYjQ5X3Pg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNuQNAACgkQTeGvMW1P
DemWAQgAkcwQjL80U7j4hGXowwVWooDSUyaVGZBRl1/6zRDnMqw45EQn78CZrN+G
DYbEP88J147ppmoGyUouSHt84esUJ/z/BOSGspzLx5mWgfng8sLwD3O8T/V3SMT9
kbm18/pXvZ2+4rrEVTrT9AFhPoGh8TFgj2qouVZtwXpi7XkJzojnsdTVcfxH3MwX
orKUw+ZMupfU7WZbhhR89/jb9z4MaPHNCVY1NOMzzUPjP44DzxZNgFIJsri7SFWg
4kpy/+SeOjzWSmqTds4obWeFN0DibB2p0c/LqOg4fLkhjMXyy+npN3mBC19cfU5D
T6qztd6Xn47swWVAwYGHcERQsd+Trg==
=T88p
-----END PGP SIGNATURE-----

--2dmcRCOFYjQ5X3Pg--

