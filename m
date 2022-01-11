Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9B148AAB0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 10:39:29 +0100 (CET)
Received: from localhost ([::1]:36516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Dcm-0004Tr-P6
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 04:39:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7Daf-00030S-H0
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:37:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7Dac-0004K2-3F
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641893832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ye9FUqNs8A32CgCpbaC+OTP3FJWOJHoxhFUaQlVf78E=;
 b=ZgEzhVEeA+bplqgNarz1tsljJXgAYGBdMReSP5Qfns2y6u9FoDR0NE7DGZEJbtCXKeFADP
 jDFKgqh7TgJA7gpyV2uOc6zsFboQXwyrna/YXv1WuKTSFTyMqUdpwoFDpJhfKZDNjDlCus
 dIL5ej0sv+hG+h2RNl0JojiKA7h/lZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-V2Jty7_8MzOWpcqQCcDLXQ-1; Tue, 11 Jan 2022 04:37:09 -0500
X-MC-Unique: V2Jty7_8MzOWpcqQCcDLXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B93DC1018722;
 Tue, 11 Jan 2022 09:37:06 +0000 (UTC)
Received: from localhost (unknown [10.39.195.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FD2C70D20;
 Tue, 11 Jan 2022 09:36:37 +0000 (UTC)
Date: Tue, 11 Jan 2022 09:36:35 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Levon <john.levon@nutanix.com>
Subject: Re: [PATCH v4 07/14] vfio-user: run vfio-user context
Message-ID: <Yd1Po1Wv6T3AELBF@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <f7fdee9b5cde0f8ee8e99702f113ab22dc4167ea.1639549843.git.jag.raman@oracle.com>
 <YbsgZDU06gcanadE@stefanha-x1.localdomain>
 <6EB1EAC5-14BF-46CB-A7CD-C45DE7116B44@oracle.com>
 <DM8PR02MB80054A55BCA44CD3525364308B4B9@DM8PR02MB8005.namprd02.prod.outlook.com>
 <YdbwJE2E0T6Lo9Aw@stefanha-x1.localdomain>
 <YdxzRoyD5gZDduYr@movementarian.org>
MIME-Version: 1.0
In-Reply-To: <YdxzRoyD5gZDduYr@movementarian.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Uy1wKZRuKne0gNlM"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
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

--Uy1wKZRuKne0gNlM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 05:56:25PM +0000, John Levon wrote:
> On Thu, Jan 06, 2022 at 01:35:32PM +0000, Stefan Hajnoczi wrote:
>=20
> > > > >> +static void vfu_object_attach_ctx(void *opaque)
> > > > >> +{
> > > > >> +    VfuObject *o =3D opaque;
> > > > >> +    GPollFD pfds[1];
> > > > >> +    int ret;
> > > > >> +
> > > > >> +    qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
> > > > >> +
> > > > >> +    pfds[0].fd =3D o->vfu_poll_fd;
> > > > >> +    pfds[0].events =3D G_IO_IN | G_IO_HUP | G_IO_ERR;
> > > > >> +
> > > > >> +retry_attach:
> > > > >> +    ret =3D vfu_attach_ctx(o->vfu_ctx);
> > > > >> +    if (ret < 0 && (errno =3D=3D EAGAIN || errno =3D=3D EWOULDB=
LOCK)) {
> > > > >> +        qemu_poll_ns(pfds, 1, 500 * (int64_t)SCALE_MS);
> > > > >> +        goto retry_attach;
> > > > >
> > > > > This can block the thread indefinitely. Other events like monitor
> > > > > commands are not handled in this loop. Please make this asynchron=
ous
> > > > > (set an fd handler and return from this function so we can try ag=
ain
> > > > > later).
> > > > >
> > > > > The vfu_attach_ctx() implementation synchronously negotiates the
> > > > > vfio-user connection :(. That's a shame because even if accept(2)=
 is
> > > > > handled asynchronously, the negotiation can still block. It would=
 be
> > > > > cleanest to have a fully async libvfio-user's vfu_attach_ctx() AP=
I to
> > > > > avoid blocking. Is that possible?
> > > >=20
> > > > Thanos / John,
> > > >=20
> > > >     Any thoughts on this?
> > >=20
> > > I'm discussing this with John and FYI there are other places where li=
bvfio-user can block, e.g. sending a response or receiving a command. Is it=
 just the negotiation you want it to be asynchronous or _all_ libvfio-user =
operations? Making libvfio-user fully asynchronous might require a substant=
ial API rewrite.
> >=20
> > I see at least two reasons for a fully async API:
> >=20
> > 1. The program wants to handle other events (e.g. a management REST API=
)
> >    from the same event loop thread that invokes libvfio-user. If
> >    libvfio-user blocks then the other events cannot be handled within a
> >    reasonable time frame.
> >=20
> >    The workaround for this is to use multi-threading and ignore the
> >    event-driven architecture implied by vfu_get_poll_fd().
> >=20
> > 2. The program handles multiple clients that do not trust each other.
> >    This could be a software-defined network switch or storage appliance=
.
> >    A malicious client can cause a denial-of-service by making a
> >    libvfio-user call block.
> >=20
> >    Again, the program needs separate threads instead of an event loop t=
o
> >    work around this.
>=20
> Hi Stefan, we're certainly aware of the rationale. Ultimately we just hav=
en't
> yet found resources to fix this: in practice, we don't really hit problem=
s from
> the parts that are still synchronous. Of course, that's not a good argume=
nt when
> it comes to your second issue, and indeed the library is not currently su=
itable
> for multiple untrusted clients.
>=20
> For Jag but: patches are welcome. But it's not just negotiate(): all sort=
s of
> things are potentially synchronous - for example, it's expected that the =
region
> read/write callbacks are done synchronously. Any other client reply, or
> server->client message, is also synchronous.
>=20
> It's partly why we haven't yet stabilised the API.

From the QEMU side it's okay to have blocking code in this experimental
feature if users are aware of the limitation (e.g. the monitor is
unresponsive if vfio-user blocks) and multiple untrusted clients are not
supported. The QEMU code should also make its limitations clear so
readers are aware of them and know the author chose this approach
intentionally rather than due to an oversight.

Jag: Please mention this in the documentation and add a comment to
vfu_object_attach_ctx() explaining that this code currently blocks.

I think in the long run it will be necessary to address it, e.g. in the
multi-client case. That can either be done with threads or by making
libvfio-user fully async.

Stefan

--Uy1wKZRuKne0gNlM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHdT6MACgkQnKSrs4Gr
c8h5Agf/Sq8lXYna2aQvZXL/MEeMwqeHRBmUTNJ9iZKBIVYMVLrckMoNrk5o1Dp2
0D1MVzr3aqj7JyD6uwCxJCo6PYH6Q3FsZZEvDFSHcx9ndY8mcgfczvG9hRtAlzam
xWIMIcPM6pUPrh1zlBEG0juWwk24hyszONmh8gG7QBbDJrH8Gv/zNR/2rT+4BrH6
TN/R8S5jZRHnTkgDsNiQEWRsAdsYHqd0LlnXqoDVJWBZBaAPBxtZ9jk0ke6I8x9s
hGhcg8b66rHPxHVcpg9+KTzXVDp30NDvUXqLu/R7KSFZQ2+9UfQl1SsZ77+vnAL3
g+EDhAKIydxLTH9dpQe3sqRx6oFJtg==
=zkW0
-----END PGP SIGNATURE-----

--Uy1wKZRuKne0gNlM--


