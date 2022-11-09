Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907E8622BAE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 13:35:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oskIw-0000rD-7T; Wed, 09 Nov 2022 07:35:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oskIT-0000oa-LA; Wed, 09 Nov 2022 07:35:14 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oskIR-00052j-RD; Wed, 09 Nov 2022 07:35:13 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E181F3200AC5;
 Wed,  9 Nov 2022 07:35:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 09 Nov 2022 07:35:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1667997309; x=1668083709; bh=vG
 ZAqECFMcq0A2a3uWe5aA2JPfQFdH8h99plkmyePYA=; b=Q/+bmPCD6+bkesDn2Y
 2LFN6HpDZn9peAP4CKW2ZsLYD8LpSaP+Iz9V04giftYHycKZ/UoOZW3nmbmKvLhj
 obqPZwqIx+TiK3TN5GZNjuzZ5Y9UT2S0NziUAzOhDnunUDbOxn2IObRGqqA6iTUs
 fc9Y8N60UsZ7LwUGhnkYH23V1xvFjy+cCMiCQ4BP25JJjYyTSTsqaCyuWm/mpEuW
 aje0KPelyeEYTeymYY6VAZxANuBQ3I+WiKLH5oyssvda7/T/rBLvkwfNCNsCDN4k
 z9es1sX2thW/3G3BCBAJBeyWGA5R4fXb7S57ti/ugORQ7QGiRX4rBXR6lVARwris
 r0Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1667997309; x=1668083709; bh=vGZAqECFMcq0A2a3uWe5aA2JPfQF
 dH8h99plkmyePYA=; b=mj1A31qnl4gov8zCXrIWI5JIP18eNthHC8v6QbOH2wUs
 5xivpSLP7s3Ww4RrEWEsgnA0O3NXF7sbRnaJ6UekiHngu8hZuCq89hfa5KZm+dSU
 BL978MFcFwSvZiXEc5QP6utpUeXYhhA4O4s6c8VxCPqDdI2hYWpSUJc44YsbCHly
 JNboNtKmBzoX8jfr1SQpsZDOSNEONYzs4CJcc2DHAuO7f3VkqkOMWEVSjyjsXEbe
 bjH6Zy83CZY4FDenjUV65D/uOrUaymNwZLuf+4kipU3Le7GtOI1ui0mlKg7qUQOc
 FpT1dQScZ9PNjo5xSSWAhQkJVg7ykptZIanb1SZa4Q==
X-ME-Sender: <xms:fZ5rY8z6psTPiYcB2BXSY1ntHOP3EKPGBlzJdeGVeXXWZwykBI60UQ>
 <xme:fZ5rYwQtciRJj5YvXElfCc5Jio4xk52RscwBP98r-gUG9Z-a-E7lRUwYHkEP4JPFW
 parjYkeXNhnyhOytmc>
X-ME-Received: <xmr:fZ5rY-UaHwjIzUUa1_WCnLe-mN3YpClwqI_6eFBbVfU0gSIjv9TYe3EHmOPMQDlSAoI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedvgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:fZ5rY6idZw3PDW4lmRwUCWAIgUrFJGyDbWP9LvItTtxG2A8o3ZQn1Q>
 <xmx:fZ5rY-DU5g8_YVhoYwOMOwUc_8e1ScHkmSru-soxx3eK6w5DAApceA>
 <xmx:fZ5rY7J_8CcjeBbELMHjgtGEZNDHtzXKsd3Ed3Ppyf9ZGXjxT2ZBGg>
 <xmx:fZ5rYx-l6KUNf8QA-3P3w0aOyVGuLwDh1g7-aDUiWc8M85Ebu9X3Pg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Nov 2022 07:35:08 -0500 (EST)
Date: Wed, 9 Nov 2022 13:35:06 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH 2/2] hw/nvme: cleanup error reporting in nvme_init_pci()
Message-ID: <Y2ueekJGratzJUD1@cormorant.local>
References: <20221109105357.30430-1-its@irrelevant.dk>
 <20221109105357.30430-3-its@irrelevant.dk>
 <87sfisnw82.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="C8CFRmF0vFIChJUY"
Content-Disposition: inline
In-Reply-To: <87sfisnw82.fsf@pond.sub.org>
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


--C8CFRmF0vFIChJUY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov  9 13:33, Markus Armbruster wrote:
> Klaus Jensen <its@irrelevant.dk> writes:
>=20
> > From: Klaus Jensen <k.jensen@samsung.com>
> >
> > Replace the local Error variable with errp and ERRP_GUARD().
> >
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/nvme/ctrl.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index 4cc6ae753295..38eb5ec54f9d 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -7345,13 +7345,13 @@ static int nvme_add_pm_capability(PCIDevice *pc=
i_dev, uint8_t offset)
> > =20
> >  static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
> >  {
> > +    ERRP_GUARD();
> > +
>=20
> Drop the blank line, please.
>=20

Roger.

> >      uint8_t *pci_conf =3D pci_dev->config;
> >      uint64_t bar_size;
> >      unsigned msix_table_offset, msix_pba_offset;
> >      int ret;
> > =20
> > -    Error *err =3D NULL;
> > -
> >      pci_conf[PCI_INTERRUPT_PIN] =3D 1;
> >      pci_config_set_prog_interface(pci_conf, 0x2);
> > =20
> > @@ -7388,13 +7388,13 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice=
 *pci_dev, Error **errp)
> >      }
> >      ret =3D msix_init(pci_dev, n->params.msix_qsize,
> >                      &n->bar0, 0, msix_table_offset,
> > -                    &n->bar0, 0, msix_pba_offset, 0, &err);
> > +                    &n->bar0, 0, msix_pba_offset, 0, errp);
> >      if (ret < 0) {
> >          if (ret =3D=3D -ENOTSUP) {
> > -            warn_report_err(err);
> > +            warn_report_err(*errp);
> > +            *errp =3D NULL;
> >          } else {
> > -            error_propagate(errp, err);
> > -            return ret;
> > +            return -1;
> >          }
> >      }
>=20
> Suggest to reduce nesting:
>=20
>        if (ret =3D=3D -ENOTSUP) {
>            warn_report_err(*errp);
>            *errp =3D NULL;
>        } else if (ret < 0) {
>            return -1;
>        }
>=20
> Entirely up to you.
>=20
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>=20

Makes sense, thanks!

--C8CFRmF0vFIChJUY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNrnnoACgkQTeGvMW1P
DemScwf/YSN1pZA0NpFrpGonehGxI19MWyC2sipLseaaRIkTSkfABhWJP6UHZQ9n
wkAVaiOqe3J8VGSmvA3/6dzZy8RFcLgaEUIHQBdBUaG7XOfrbBxT80j5GTR6OWsp
ga4AhotnESVJpICDb2FEcjD664g6TFBqEbERIkPI+pE8b5aKfG1LSd+ETzGkWQX4
tot67GLHW4T9IpXNNp4+7LfKHM9fQI2sanEK6POMo2cwCsEM7TfM0ur6aNQpCkdk
jfr7SG1UHP23dOmF8kWdrbdCucQBTQPc8X9JvGD0vyBU7SqmtdJXo/YT+y5bDQrH
D8/edEja/1QGeJNUyAOWBVIsN5re+Q==
=poSg
-----END PGP SIGNATURE-----

--C8CFRmF0vFIChJUY--

