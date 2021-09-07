Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078C2402A1E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:49:04 +0200 (CEST)
Received: from localhost ([::1]:35204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbTC-0005XX-Mu
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNb2e-0007sY-FT
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:21:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNb2c-0005Vs-LN
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:21:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631020893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kmGcQ8ycBbHI/lCJq6QqUju6yN1qIo5hni6cMUlhaQY=;
 b=brD+b/hSyy2/J+VZbZMhOm/Cvv1OiaS/9f3RRULbsGOe3bMYdXF/9fBjrMJZThmGTYt+TC
 t3/TG/urcSGpxyI0yEv7LIHhAgn1RfRKFJgMM4pIQNMe/Yvm2CJEVw38INmV64e552iIo6
 Dk6XXw0TRXChv+yxfO6XlzNZV3Fd4FA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-ZLSLH3W9MoCsvEKN6DA_0A-1; Tue, 07 Sep 2021 09:21:27 -0400
X-MC-Unique: ZLSLH3W9MoCsvEKN6DA_0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12B96107ACC7;
 Tue,  7 Sep 2021 13:21:26 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFE045D9DE;
 Tue,  7 Sep 2021 13:21:20 +0000 (UTC)
Date: Tue, 7 Sep 2021 14:21:19 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Message-ID: <YTdnT27fLn4nwp2n@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <e9fa92081e0faf49089f4afb9a45187e49ea4bad.1629131628.git.elena.ufimtseva@oracle.com>
 <YST++FLqV02TlusW@stefanha-x1.localdomain>
 <924FF1F2-E7AF-4044-B5A4-94A2F1504110@oracle.com>
MIME-Version: 1.0
In-Reply-To: <924FF1F2-E7AF-4044-B5A4-94A2F1504110@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Gk6BKDPR5tvLrA2F"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Gk6BKDPR5tvLrA2F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 30, 2021 at 03:00:37AM +0000, John Johnson wrote:
> > On Aug 24, 2021, at 7:15 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> > On Mon, Aug 16, 2021 at 09:42:37AM -0700, Elena Ufimtseva wrote:
> >> +    proxy->ioc =3D ioc;
> >> +    proxy->flags =3D VFIO_PROXY_CLIENT;
> >> +    proxy->state =3D VFIO_PROXY_CONNECTED;
> >> +    qemu_cond_init(&proxy->close_cv);
> >> +
> >> +    if (vfio_user_iothread =3D=3D NULL) {
> >> +        vfio_user_iothread =3D iothread_create("VFIO user", errp);
> >> +    }
> >=20
> > Why is a dedicated IOThread needed for VFIO user?
> >=20
>=20
> =09It seemed the best model for inbound message processing.  Most message=
s
> are replies, so the receiver will either signal a thread waiting the repl=
y or
> report any errors from the server if there is no waiter.  None of this re=
quires
> the BQL.
>=20
> =09If the message is a request - which currently only happens if device
> DMA targets guest memory that wasn=E2=80=99t mmap()d by QEMU or if the =
=E2=80=99secure-dma=E2=80=99
> option is used - then the receiver can then acquire BQL so it can call th=
e
> VFIO code to handle the request.

QEMU is generally event-driven and the APIs are designed for that style.
Threads in QEMU are there for parallelism or resource control,
everything else is event-driven.

It's not clear to me if there is a reason why the message processing
must be done in a separate thread or whether it is just done this way
because the code was written in multi-threaded style instead of
event-driven style.

You mentioned other threads waiting for replies. Which threads are they?

> > Please use true. '1' is shorter but it's less obvious to the reader (I
> > had to jump to the definition to check whether this field was bool or
> > int).
> >=20
>=20
> =09I assume this is also true for the other boolean struct members
> I=E2=80=99ve added.

Yes, please. QEMU uses bool and true/false.

>=20
>=20
> >> +    aio_bh_schedule_oneshot(iothread_get_aio_context(vfio_user_iothre=
ad),
> >> +                            vfio_user_cb, proxy);
> >> +
> >> +    /* drop locks so the iothread can make progress */
> >> +    qemu_mutex_unlock_iothread();
> >=20
> > Why does the BQL needs to be dropped so vfio_user_iothread can make
> > progress?
> >=20
>=20
> =09See above.  Acquiring BQL by the iothread is rare, but I have to
> handle the case where a disconnect is concurrent with an incoming request
> message that is waiting for the BQL.  See the proxy state check after BQL
> is acquired in vfio_user_recv()

Here is how this code looks when written using coroutines (this is from
nbd/server.c):

  static coroutine_fn void nbd_trip(void *opaque)
  {
      ...
      req =3D nbd_request_get(client);
      ret =3D nbd_co_receive_request(req, &request, &local_err);
      client->recv_coroutine =3D NULL;
 =20
      if (client->closing) {
          /*
           * The client may be closed when we are blocked in
           * nbd_co_receive_request()
           */
          goto done;
      }

It's the same check. The code is inverted: the server reads the next
request using nbd_co_receive_request() (this coroutine function can
yield while waiting for data on the socket).

This way the network communication code doesn't need to know how
messages will by processed by the client or server. There is no need for
if (isreply) { qemu_cond_signal(&reply->cv); } else {
proxy->request(proxy->reqarg, buf, &reqfds); }. The callbacks and
threads aren't hardcoded into the network communication code.

This goes back to the question earlier about why a dedicated thread is
necessary here. I suggest writing the network communication code using
coroutines. That way the code is easier to read (no callbacks or
thread synchronization), there are fewer thread-safety issues to worry
about, and users or management tools don't need to know about additional
threads (e.g. CPU/NUMA affinity).

Stefan

--Gk6BKDPR5tvLrA2F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE3Z08ACgkQnKSrs4Gr
c8iIgwgAu8PEGzWjsCuoiH3QWbJQ76hOkBABUr9tcbzZYesMaMzI1F46WLZMsNru
fLU5ha0UA0RVqyb91O2M9IrNSXF6XL4pBssZP77EshkQSoiXGkU7WEbiXhCxCavw
t35Ozbz1jI6bU5lPrB5zhQENNyRrfcHj9h+99n68SFLMSGPr9l4DZfta3lMwfKX8
b1dse9OGavvjqwejvFh9udbLAJEnSjKq7SNztb1dfy6cXHaizJNfx5uuV20xysz6
m6Zo1QFacSeFGCVKXLZQAEiNJqfIbIYUkbkHrHL5IijAAn8ot1AK9CYrJRymVKD7
wT1G08g7FvbmYewRc/RQ1wLR1NhMRQ==
=Nmjv
-----END PGP SIGNATURE-----

--Gk6BKDPR5tvLrA2F--


