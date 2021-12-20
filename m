Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A153647B21B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:29:35 +0100 (CET)
Received: from localhost ([::1]:38414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMTe-0003YR-L9
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:29:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mzKzG-00040u-Bo
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:54:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mzKzE-0005Kg-E5
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:54:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640015643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=65cJAAYz1hAoDq7w9XkdFkfgdtpVRGApdrKtGFjoNKA=;
 b=E1KNlhXNxmw/WkadtKKKcfl7j6bNr8lYmH8QY8yfKPvtSOkZwJyrKqK7RSlT1MQoXhGlRo
 XOimQM/k6S77PM3r79aa6igmmpwTEXpovdJ/bLvxTY12X0xFAMbL2pjkfk6Cf155709Znz
 J5Ik4n0K7vBRAtGVxWnjdwLkZcb3ibQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-3yklbXVoOSyhM_3AD23d4g-1; Mon, 20 Dec 2021 03:29:39 -0500
X-MC-Unique: 3yklbXVoOSyhM_3AD23d4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84EBA100C660;
 Mon, 20 Dec 2021 08:29:37 +0000 (UTC)
Received: from localhost (unknown [10.39.192.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 507D5610D0;
 Mon, 20 Dec 2021 08:29:13 +0000 (UTC)
Date: Mon, 20 Dec 2021 08:29:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v4 07/14] vfio-user: run vfio-user context
Message-ID: <YcA+1/1sJbrHKdon@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <f7fdee9b5cde0f8ee8e99702f113ab22dc4167ea.1639549843.git.jag.raman@oracle.com>
 <YbsgZDU06gcanadE@stefanha-x1.localdomain>
 <6EB1EAC5-14BF-46CB-A7CD-C45DE7116B44@oracle.com>
MIME-Version: 1.0
In-Reply-To: <6EB1EAC5-14BF-46CB-A7CD-C45DE7116B44@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2sJ2KVayR64qxfVQ"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "thuth@redhat.com" <thuth@redhat.com>, "bleal@redhat.com" <bleal@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "crosa@redhat.com" <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--2sJ2KVayR64qxfVQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 17, 2021 at 05:59:48PM +0000, Jag Raman wrote:
>=20
>=20
> > On Dec 16, 2021, at 6:17 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Wed, Dec 15, 2021 at 10:35:31AM -0500, Jagannathan Raman wrote:
> >> @@ -114,6 +118,62 @@ static void vfu_object_set_device(Object *obj, co=
nst char *str, Error **errp)
> >>     vfu_object_init_ctx(o, errp);
> >> }
> >>=20
> >> +static void vfu_object_ctx_run(void *opaque)
> >> +{
> >> +    VfuObject *o =3D opaque;
> >> +    int ret =3D -1;
> >> +
> >> +    while (ret !=3D 0) {
> >> +        ret =3D vfu_run_ctx(o->vfu_ctx);
> >> +        if (ret < 0) {
> >> +            if (errno =3D=3D EINTR) {
> >> +                continue;
> >> +            } else if (errno =3D=3D ENOTCONN) {
> >> +                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL)=
;
> >> +                o->vfu_poll_fd =3D -1;
> >> +                object_unparent(OBJECT(o));
> >> +                break;
> >=20
> > If nothing else logs a message then I think that should be done here so
> > users know why their vfio-user server object disappeared.
>=20
> Sure will do.
>=20
> Do you prefer a trace, or a message to the console? Trace makes sense to =
me.
> Presently, the client could unplug the vfio-user device which would trigg=
er the
> deletion of this object. This process could happen quietly.

If there is no way to differentiate graceful disconnect from unexpected
disconnect then logging might be too noisy.

Regarding the automatic deletion of the object, that might not be
desirable for two reasons:
1. It prevents reconnection or another client connecting.
2. Management tools are in the dark about it.

For #2 there are monitor events that QEMU emits to notify management
tools about state changes like disconnections.

It's worth thinking about current and future use cases before baking in
a policy like automatically deleting VfuObject on disconnect because
it's inflexible and would require a QEMU update in the future to support
a different policy.

One approach is to emit a disconnect event but leave the VfuObject in a
disconnected state. The management tool can then restart or clean up,
depending on its policy.

I'm not sure what's best because it depends on the use cases, but maybe
you and others have ideas here.

> >> @@ -208,6 +284,8 @@ static void vfu_object_init(Object *obj)
> >>                    TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
> >>         return;
> >>     }
> >> +
> >> +    o->vfu_poll_fd =3D -1;
> >> }
> >=20
> > This must call qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL)
> > when o->vfu_poll_fd !=3D -1 to avoid leaving a dangling fd handler
> > callback registered.
>=20
> This is during the init phase, and the FD handlers are not set. Do you me=
an
> to add this at finalize?
>=20
> I agree it=E2=80=99s good to explicitly add this at finalize. But vfu_des=
troy_ctx() should
> trigger a ENOTCONN, which would do it anyway.

I'm not sure my comment makes sense since this is the init function, not
finalize.

However, it's not clear to me that the o->vfu_poll_fd fd handler is
unregistered from the event loop when VfuObject is finalized (e.g. by
the object-del monitor command). You say vfu_destroy_ctx() triggers
ENOTCONN, but the VfuObject is freed after finalize returns so when is
the fd handler deregistered?

Stefan

--2sJ2KVayR64qxfVQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHAPtcACgkQnKSrs4Gr
c8iz/wgAwEK8NF8LV2mURyR8IdQLrtFLbDtrJtfj/Eh+RHTdbqKJH8bWBxRWrSz6
zEdAxum5ce2K0fr/v+JAwv7bEPrBJcPrJ6hOzwIB9Gq+62f3Wru/h15oPVa3S4Fe
vI285an42CCozL/ls/zyJj/QVCMxfW1rbeeD7562qKGpL2UJdRfAeBNGTcMzeh1D
SIk2Sx8fnecwBX0yDUhJuPo8p+dO7hUFjR8y9BigT/rPZh6hHk1GdFMUs14rG7ZK
GnYF47BiJFotPlaKogwnYOvXrtlpcxi5D4iWBHmlSwBiSwCN1hicAGj6yN7KAyB9
sD915D2r5UbJZ+Vlt95kLNW9sQQo4w==
=MF/x
-----END PGP SIGNATURE-----

--2sJ2KVayR64qxfVQ--


