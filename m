Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AAE323B61
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:41:50 +0100 (CET)
Received: from localhost ([::1]:54476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEsY9-000430-AZ
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEsWu-0003YF-OA
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:40:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEsWs-0006jQ-W1
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614166830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+wmS1pXCJW4MCb4uOlyiYMZb4ScaZyV68XcCDYaSyzk=;
 b=ER2dqR+MtVAhYQ+15owK1xeNUz6JUMRWosgy3pEsJO2TwCE9T9/7y7I3fhg8jl7CAXXUkm
 Whw4NQI9Qo/doLrEZAUjtY+hwUM6dxARX8m3v8WVwCayK7zuvcAzwDIijlfP7LCIhcx6Ht
 jWQRq4coJ/1KPNhJu4Ht4fCIswKeIhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-H7rZj5C5M5STnzfHKvdhzA-1; Wed, 24 Feb 2021 06:40:28 -0500
X-MC-Unique: H7rZj5C5M5STnzfHKvdhzA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 553A3801965;
 Wed, 24 Feb 2021 11:40:26 +0000 (UTC)
Received: from localhost (ovpn-115-137.ams2.redhat.com [10.36.115.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7192460C61;
 Wed, 24 Feb 2021 11:40:25 +0000 (UTC)
Date: Wed, 24 Feb 2021 11:40:24 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sai Pavan Boddu <saipava@xilinx.com>
Subject: Re: [PATCH v2 01/22] block: add eMMC block device type
Message-ID: <YDY7KKI1Xme29UlQ@stefanha-x1.localdomain>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613982039-13861-2-git-send-email-sai.pavan.boddu@xilinx.com>
 <3c229241-fdc5-a445-d96e-ca16a5c0106b@redhat.com>
 <BY5PR02MB6772EEE95845BAD093CAC972CA809@BY5PR02MB6772.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BY5PR02MB6772EEE95845BAD093CAC972CA809@BY5PR02MB6772.namprd02.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VdtvjZ1lUtiJHXRc"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>, Luc Michel <luc.michel@greensocs.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--VdtvjZ1lUtiJHXRc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 05:35:20PM +0000, Sai Pavan Boddu wrote:
> Hi Philippe,
>=20
> > -----Original Message-----
> > From: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > Sent: Monday, February 22, 2021 5:34 PM
> > To: Sai Pavan Boddu <saipava@xilinx.com>; Markus Armbruster
> > <armbru@redhat.com>; Kevin Wolf <kwolf@redhat.com>; Max Reitz
> > <mreitz@redhat.com>; Vladimir Sementsov-Ogievskiy
> > <vsementsov@virtuozzo.com>; Eric Blake <eblake@redhat.com>; Joel Stanle=
y
> > <joel@jms.id.au>; C=E9dric Le Goater <clg@kaod.org>; Vincent Palatin
> > <vpalatin@chromium.org>; Dr. David Alan Gilbert <dgilbert@redhat.com>;
> > Thomas Huth <thuth@redhat.com>; Stefan Hajnoczi <stefanha@redhat.com>;
> > Peter Maydell <peter.maydell@linaro.org>; Alistair Francis
> > <alistair.francis@wdc.com>; Edgar Iglesias <edgari@xilinx.com>; Luc Mic=
hel
> > <luc.michel@greensocs.com>; Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Sai Pavan Boddu <saipava@xilinx.com>; qemu-devel@nongnu.org; qemu-
> > block@nongnu.org
> > Subject: Re: [PATCH v2 01/22] block: add eMMC block device type
> >=20
> > On 2/22/21 9:20 AM, Sai Pavan Boddu wrote:
> > > From: Vincent Palatin <vpalatin@chromium.org>
> > >
> > > Add new block device type.
> > >
> > > Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> > > [SPB: Rebased over 5.1 version]
> > > Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  include/sysemu/blockdev.h | 1 +
> > >  blockdev.c                | 1 +
> > >  2 files changed, 2 insertions(+)
> > >
> > > diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> > > index 3b5fcda..eefae9f 100644
> > > --- a/include/sysemu/blockdev.h
> > > +++ b/include/sysemu/blockdev.h
> > > @@ -24,6 +24,7 @@ typedef enum {
> > >       */
> > >      IF_NONE =3D 0,
> > >      IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO,
> > > IF_XEN,
> > > +    IF_EMMC,
> > >      IF_COUNT
> > >  } BlockInterfaceType;
> > >
> > > diff --git a/blockdev.c b/blockdev.c
> > > index cd438e6..390d43c 100644
> > > --- a/blockdev.c
> > > +++ b/blockdev.c
> > > @@ -83,6 +83,7 @@ static const char *const if_name[IF_COUNT] =3D {
> > >      [IF_SD] =3D "sd",
> > >      [IF_VIRTIO] =3D "virtio",
> > >      [IF_XEN] =3D "xen",
> > > +    [IF_EMMC] =3D "emmc",
> > >  };
> >=20
> > We don't need to introduce support for the legacy -drive magic.
> >=20
> > -device should be enough for this device, right?
> [Sai Pavan Boddu] I was seeing to use -device for emmc. But I see we anyw=
ay need blockdev support for this, which would require us the use -drive.
>=20
> Can you give some pointers, how to approach this ?

It is probably not necessary to add a new IF_ constant. Would this work:

  -drive if=3Dnone,id=3Demmc0,file=3Dtest.img,format=3Draw
  -device emmc,...,drive=3Demmc0

Or the more modern:

  -blockdev node-name=3Demmc0,driver=3Dfile,filename=3Dtest.img
  -device emmc,...,drive=3Demmc0

?

(The syntax might need small tweaks but is shows the general idea.)

Stefan

--VdtvjZ1lUtiJHXRc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA2OygACgkQnKSrs4Gr
c8gS+wgAt6tTUeatlg0r0ypGM6gNiMQR9dnpr5TFtj2GZlw/fT8AYv71HUjtr6J+
2WevoGHYjTyIVy7Jxo2Ym3gPk5NvpX4BkheywWCPog8CHHwvp19l6BqO5vg46O1n
rvNx6fcm3LttYGYEZjP6KaMjah3BDDkA0bxbUMr0C8gmnnWuttTgduTDG3GiQdpQ
MVylpxtJigiTK4Bcx0TIJvCp50wcPdcgIV6ZSeN/YO14COkFO0hNXZEvMXn97413
AZlhS3nW0bqIGRJf3IfJsfkz1a88EhRl+VAHagqCrUQaEjjonYE6lrR1pPgKzynK
BjfvqiEwg4SAQDRelsCpWmyu6A2big==
=Vsa/
-----END PGP SIGNATURE-----

--VdtvjZ1lUtiJHXRc--


