Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445B635C90A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:41:17 +0200 (CEST)
Received: from localhost ([::1]:45454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVxkZ-0002Jm-HV
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lVxeZ-0005Rk-4c
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:35:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lVxeX-0007wz-Gl
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618238100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0bfBbEPaAGKlABsVfw6fGgwwtb0N1Xgw6eoo5t8waQc=;
 b=HDDwt2mAShUXkivEo75VCE35bSOS9wvwqcz78609lo271cR99yrdp0mJwTUc1AruTr/8iC
 jIxh8ogDcpOIU0TjtrYzZTBE98eYDBXFQMLVmDnjkxNkBBO8cf/Xwcc1KRK7xl6/1UEEFZ
 zFGS/XdmNKxxDlHPHBsiMDr+sWs/i88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-5kG87qSNMZii2Ozs01hUyw-1; Mon, 12 Apr 2021 10:34:58 -0400
X-MC-Unique: 5kG87qSNMZii2Ozs01hUyw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 080716D4F2
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 14:34:58 +0000 (UTC)
Received: from localhost (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FA4F10023B0;
 Mon, 12 Apr 2021 14:34:57 +0000 (UTC)
Date: Mon, 12 Apr 2021 15:34:52 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] docs/devel/qgraph: add troubleshooting information
Message-ID: <YHRajEtrTQF41tdo@stefanha-x1.localdomain>
References: <20210409190109.476167-1-stefanha@redhat.com>
 <20210409190109.476167-3-stefanha@redhat.com>
 <13fb9be3-e928-d404-bcfe-25be7ef611d6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <13fb9be3-e928-d404-bcfe-25be7ef611d6@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AuBA/qwEXrAfyPe6"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--AuBA/qwEXrAfyPe6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 10, 2021 at 06:41:03AM +0200, Thomas Huth wrote:
> On 09/04/2021 21.01, Stefan Hajnoczi wrote:
> > It can be tricky to troubleshoot qos-test when a test won't execute. Ad=
d
> > an explanation of how to trace qgraph node connectivity and find which
> > node has the problem.
> >=20
> > Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   docs/devel/qgraph.rst | 58 ++++++++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 58 insertions(+)
> >=20
> > diff --git a/docs/devel/qgraph.rst b/docs/devel/qgraph.rst
> > index a9aff167ad..4635efb2c2 100644
> > --- a/docs/devel/qgraph.rst
> > +++ b/docs/devel/qgraph.rst
> > @@ -92,6 +92,64 @@ The basic framework steps are the following:
> >   Depending on the QEMU binary used, only some drivers/machines will be
> >   available and only test that are reached by them will be executed.
> > +Troubleshooting unavailable tests
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +If there is no path from an available machine to a test then that test=
 will
> > +unavailable and cannot execute. This can happen if a test or driver di=
d not set
>=20
> "will be unavailable" ? or "will be marked as unavailable" ?
>=20
> Apart from that, patch looks fine to me.

Thanks, will fix.

Stefan

--AuBA/qwEXrAfyPe6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB0WowACgkQnKSrs4Gr
c8iQBgf/arRvGz36og2wdTIDN+FyHfeWtrOv1sZkx2AQUdvCfpPwRYW6d62ZlHHN
btrDzKZ9vEMUVcNqHV8zBWzT9SphAsTBp04xS0/XZjufRUOvc4o1R5B0YHlyibIn
czfPbSxIi8iqtD9+Dot1MElsg4t8zYEj4yilyuRPEPbHR4TPvrSNEkrI/F4Mpdn3
8wTdbC72k3NuNw2cmwVNCRD5w5XOuzfRCARtOz+sxcoXurUQU7RlKB3RO+NYBSfc
YONHZKLsMflB7iMOhthmP7bi1ure+iuMhX/itm9jqJEw8Qc3fqaeiaZlThvRbx6d
JiMuPV+3Lb0Yr44TJkC0Bs10pOnMVw==
=uqpP
-----END PGP SIGNATURE-----

--AuBA/qwEXrAfyPe6--


