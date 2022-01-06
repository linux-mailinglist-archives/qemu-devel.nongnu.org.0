Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BDC4865F5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:21:37 +0100 (CET)
Received: from localhost ([::1]:40992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Te4-0000Me-1O
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:21:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n5Swa-0002Zv-1y
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:36:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n5SwX-0004bD-DT
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:36:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641476189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bVGeMxfbZJe2VnydjC5rTEdT9TkRzquOtNZB49+hZmE=;
 b=gkbPAftqX168qHCKEd2KxH5Nw2jWnQDxCQoHsDHhktWP5SRm5/Bi5amr9tvsb03JHkCfRJ
 REKqXX0MB1PVqAvZ66zUVyxcPuu2y9Yedort0Q6eFeB0SVD4bkIFsuk5kZZ5qh8IVzYm1M
 XoplqTXvIo1oNqkJvxcnzzP2i9Om0tk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-ITO_WWECPeaeSWwqKdFlQQ-1; Thu, 06 Jan 2022 08:36:26 -0500
X-MC-Unique: ITO_WWECPeaeSWwqKdFlQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAA7B18C89E4;
 Thu,  6 Jan 2022 13:36:24 +0000 (UTC)
Received: from localhost (unknown [10.39.193.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A69B84D33;
 Thu,  6 Jan 2022 13:35:33 +0000 (UTC)
Date: Thu, 6 Jan 2022 13:35:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: [PATCH v4 07/14] vfio-user: run vfio-user context
Message-ID: <YdbwJE2E0T6Lo9Aw@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <f7fdee9b5cde0f8ee8e99702f113ab22dc4167ea.1639549843.git.jag.raman@oracle.com>
 <YbsgZDU06gcanadE@stefanha-x1.localdomain>
 <6EB1EAC5-14BF-46CB-A7CD-C45DE7116B44@oracle.com>
 <DM8PR02MB80054A55BCA44CD3525364308B4B9@DM8PR02MB8005.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR02MB80054A55BCA44CD3525364308B4B9@DM8PR02MB8005.namprd02.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CQgnpnaS+o//EzPY"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
 "thuth@redhat.com" <thuth@redhat.com>, Jag Raman <jag.raman@oracle.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>, John Levon <john.levon@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--CQgnpnaS+o//EzPY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 10:38:10AM +0000, Thanos Makatos wrote:
>=20
>=20
> > -----Original Message-----
> > From: Jag Raman <jag.raman@oracle.com>
> > Sent: 17 December 2021 18:00
> > To: Stefan Hajnoczi <stefanha@redhat.com>; John Levon
> > <john.levon@nutanix.com>; Thanos Makatos <thanos.makatos@nutanix.com>
> > Cc: qemu-devel <qemu-devel@nongnu.org>; Alex Williamson
> > <alex.williamson@redhat.com>; Marc-Andr=E9 Lureau
> > <marcandre.lureau@gmail.com>; Philippe Mathieu-Daud=E9
> > <philmd@redhat.com>; pbonzini@redhat.com; alex.bennee@linaro.org;
> > thuth@redhat.com; crosa@redhat.com; wainersm@redhat.com;
> > bleal@redhat.com; Elena Ufimtseva <elena.ufimtseva@oracle.com>; John
> > Levon <john.levon@nutanix.com>; John Johnson
> > <john.g.johnson@oracle.com>; Thanos Makatos
> > <thanos.makatos@nutanix.com>; Swapnil Ingle <swapnil.ingle@nutanix.com>
> > Subject: Re: [PATCH v4 07/14] vfio-user: run vfio-user context
> >=20
> >=20
> >=20
> > > On Dec 16, 2021, at 6:17 AM, Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
> > >
> > > On Wed, Dec 15, 2021 at 10:35:31AM -0500, Jagannathan Raman wrote:
> > >> @@ -114,6 +118,62 @@ static void vfu_object_set_device(Object *obj,
> > const char *str, Error **errp)
> > >>     vfu_object_init_ctx(o, errp);
> > >> }
> > >>
> > >> +static void vfu_object_ctx_run(void *opaque)
> > >> +{
> > >> +    VfuObject *o =3D opaque;
> > >> +    int ret =3D -1;
> > >> +
> > >> +    while (ret !=3D 0) {
> > >> +        ret =3D vfu_run_ctx(o->vfu_ctx);
> > >> +        if (ret < 0) {
> > >> +            if (errno =3D=3D EINTR) {
> > >> +                continue;
> > >> +            } else if (errno =3D=3D ENOTCONN) {
> > >> +                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NUL=
L);
> > >> +                o->vfu_poll_fd =3D -1;
> > >> +                object_unparent(OBJECT(o));
> > >> +                break;
> > >
> > > If nothing else logs a message then I think that should be done here =
so
> > > users know why their vfio-user server object disappeared.
> >=20
> > Sure will do.
> >=20
> > Do you prefer a trace, or a message to the console? Trace makes sense t=
o me.
> > Presently, the client could unplug the vfio-user device which would tri=
gger the
> > deletion of this object. This process could happen quietly.
> >=20
> > >
> > >> +            } else {
> > >> +                error_setg(&error_abort, "vfu: Failed to run device=
 %s - %s",
> > >> +                           o->device, strerror(errno));
> > >
> > > error_abort is equivalent to assuming !o->daemon. In the case where t=
he
> > > user doesn't want to automatically shut down the process we need to l=
og
> > > a message without aborting.
> >=20
> > OK, makes sense.
> >=20
> > >
> > >> +                 break;
> > >
> > > Indentation is off.
> > >
> > >> +            }
> > >> +        }
> > >> +    }
> > >> +}
> > >> +
> > >> +static void vfu_object_attach_ctx(void *opaque)
> > >> +{
> > >> +    VfuObject *o =3D opaque;
> > >> +    GPollFD pfds[1];
> > >> +    int ret;
> > >> +
> > >> +    qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
> > >> +
> > >> +    pfds[0].fd =3D o->vfu_poll_fd;
> > >> +    pfds[0].events =3D G_IO_IN | G_IO_HUP | G_IO_ERR;
> > >> +
> > >> +retry_attach:
> > >> +    ret =3D vfu_attach_ctx(o->vfu_ctx);
> > >> +    if (ret < 0 && (errno =3D=3D EAGAIN || errno =3D=3D EWOULDBLOCK=
)) {
> > >> +        qemu_poll_ns(pfds, 1, 500 * (int64_t)SCALE_MS);
> > >> +        goto retry_attach;
> > >
> > > This can block the thread indefinitely. Other events like monitor
> > > commands are not handled in this loop. Please make this asynchronous
> > > (set an fd handler and return from this function so we can try again
> > > later).
> > >
> > > The vfu_attach_ctx() implementation synchronously negotiates the
> > > vfio-user connection :(. That's a shame because even if accept(2) is
> > > handled asynchronously, the negotiation can still block. It would be
> > > cleanest to have a fully async libvfio-user's vfu_attach_ctx() API to
> > > avoid blocking. Is that possible?
> >=20
> > Thanos / John,
> >=20
> >     Any thoughts on this?
>=20
> I'm discussing this with John and FYI there are other places where libvfi=
o-user can block, e.g. sending a response or receiving a command. Is it jus=
t the negotiation you want it to be asynchronous or _all_ libvfio-user oper=
ations? Making libvfio-user fully asynchronous might require a substantial =
API rewrite.

I see at least two reasons for a fully async API:

1. The program wants to handle other events (e.g. a management REST API)
   from the same event loop thread that invokes libvfio-user. If
   libvfio-user blocks then the other events cannot be handled within a
   reasonable time frame.

   The workaround for this is to use multi-threading and ignore the
   event-driven architecture implied by vfu_get_poll_fd().

2. The program handles multiple clients that do not trust each other.
   This could be a software-defined network switch or storage appliance.
   A malicious client can cause a denial-of-service by making a
   libvfio-user call block.

   Again, the program needs separate threads instead of an event loop to
   work around this.

The downside to a sync approach is that programs that already have an
event loop require extra code to set up dedicated threads for
libvfio-user. That's a library integration/usability issue.

In some cases it's okay to block: when the program doesn't need to
handle other events. If most users of libvfio-user are expected to fall
into this category then there's no need to change the API.

Either way, the doc comments in libvfio-user.h aren't very clear.
Someone integrating this library may think vfu_get_poll_fd() allows for
fully async operation.

Stefan

--CQgnpnaS+o//EzPY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHW8CQACgkQnKSrs4Gr
c8gbvAf/TKi38lDmXSFXxf9Quyi/icsU+qCURaem1SFxUWCBOuiyaFYTsRbCow1/
geudjaCYqLL6xZia4sE6tN7qe+HuagbqZYvA4/oCTxNStZ0zVenbCacbReV7KVHs
heUnjSgWAP9oik2TFRqbjUh6c3sUobJqZm0uSwumXSWcjk3SBR7lsJAYn9HtAw7f
Hl099CzpYEoBsdJPiNH0LrNIqFGmjOT1v5FBRF1YehOl7vR0KWQHr4CTSnC1gSYA
9BQN8ntlXaLjIACTY99MPGfW7ULeo6wn2PM9nAzxmUYEemmimAQvafdY5KQBFRxQ
vYmc9mXStjxcPGCW90Mu5QZhGoMjWg==
=s6uz
-----END PGP SIGNATURE-----

--CQgnpnaS+o//EzPY--


