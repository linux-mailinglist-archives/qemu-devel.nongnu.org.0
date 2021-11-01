Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ADE441A0B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:38:58 +0100 (CET)
Received: from localhost ([::1]:59070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUiQ-0007Dq-3S
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mhUft-0004Mo-5x
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:36:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mhUfq-0003qA-PX
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635762977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SSArX8L69y2mgC3qWuWgLZei7wVh74A6XUNXsaKVMio=;
 b=f7PanSOOr4X4Y0p+BoX+oXPhME5CgAwTPl4tiTyfAqk79jyhYif0U/sK9+9BbuGSg4n0F+
 fFcuxowgOhCXqn5m1IQPiP/XB14Vj/ad9sADkey+HLmpRSosNF+zS16vw/YnavLYTSNQt9
 5FpnvCEieEu6ikLmOdLmDxKbtJ3Tfj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-PGiGJHeWMUSic5Z90cnqLQ-1; Mon, 01 Nov 2021 06:36:14 -0400
X-MC-Unique: PGiGJHeWMUSic5Z90cnqLQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1565E362FA;
 Mon,  1 Nov 2021 10:36:13 +0000 (UTC)
Received: from localhost (unknown [10.39.192.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CFEE1017E35;
 Mon,  1 Nov 2021 10:35:57 +0000 (UTC)
Date: Mon, 1 Nov 2021 10:35:56 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v3 04/12] vfio-user: instantiate vfio-user context
Message-ID: <YX/DDFyf3/5348R0@stefanha-x1.localdomain>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <82b00867c07020fcf71749627414a80ef6b691cb.1633929457.git.jag.raman@oracle.com>
 <YXl3dzdzNZZZWLOS@stefanha-x1.localdomain>
 <093B71B9-46AF-442D-80A6-49EF27874618@oracle.com>
MIME-Version: 1.0
In-Reply-To: <093B71B9-46AF-442D-80A6-49EF27874618@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xSk1zFIdYfwcHYVY"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--xSk1zFIdYfwcHYVY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 29, 2021 at 02:59:02PM +0000, Jag Raman wrote:
>=20
>=20
> > On Oct 27, 2021, at 11:59 AM, Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >=20
> > On Mon, Oct 11, 2021 at 01:31:09AM -0400, Jagannathan Raman wrote:
> >> @@ -94,9 +101,31 @@ static void vfu_object_set_device(Object *obj, con=
st char *str, Error **errp)
> >>     trace_vfu_prop("device", str);
> >> }
> >>=20
> >> +/*
> >> + * vfio-user-server depends on the availability of the 'socket' and '=
device'
> >> + * properties. It also depends on devices instantiated in QEMU. These
> >> + * dependencies are not available during the instance_init phase of t=
his
> >> + * object's life-cycle. As such, the server is initialized after the
> >> + * machine is setup. machine_init_done_notifier notifies vfio-user-se=
rver
> >> + * when the machine is setup, and the dependencies are available.
> >> + */
> >> +static void vfu_object_machine_done(Notifier *notifier, void *data)
> >> +{
> >> +    VfuObject *o =3D container_of(notifier, VfuObject, machine_done);
> >=20
> > Was there a check for non-NULL o->socket before this? Maybe it's not
> > needed because QAPI treats 'socket' as a required field and refuses to
> > create the SocketAddress if it's missing?
>=20
> Yes,  =E2=80=9Csocket=E2=80=9D is a required option. The server will not =
launch without that option.

Thanks for confirming!

> I believe optional parameters are defined within =E2=80=98[=E2=80=98 and =
=E2=80=98]=E2=80=99 braces in "./qapi/qom.json"

Optional parameters have the asterisk ('*'). Block quotes are for lists.

Stefan

--xSk1zFIdYfwcHYVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF/wwwACgkQnKSrs4Gr
c8gJ/Qf+KnfthuLQKMRIwhyO0VwYzv3Hs6pMtp2BlXmKhqQKKzt/Yq9kufdhaRk3
nIvvKl0mtCCHd28lUywkEEYLZtjmH0zVeSZVW8+KKyVDqws2ZA2g2ql7VSma1KQ+
EnrEk5vj25DZK84yKrNoCUMySaMYOI9XNrRn+d94vK2QW1FDkyTb7JKAboizi9nX
VlyqFl79Zq2hgsHueGBsw553Z2WwVETlriCMglr+VlB9yAGEu2uDgE8zoH7iu4Gk
qe+7Pq3akRWPclX7YLLKVsO+G/Rn/np2tn4tKKzOS1W5ux3fc8m4AZBjtqlPhh3f
pYFgifgRszh87AWsgtwHZh1axKIFoA==
=E6sH
-----END PGP SIGNATURE-----

--xSk1zFIdYfwcHYVY--


