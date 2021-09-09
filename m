Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9AA40459F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 08:32:03 +0200 (CEST)
Received: from localhost ([::1]:54200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mODbO-00041l-97
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 02:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mODYv-0002k4-E1
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:29:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mODYs-00005O-DE
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631168965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ldcRntge8eaQpQ1ESaubgkzmP/358xmV9dBARTaFj1I=;
 b=ILrRD6ZMEiojcG4xloQ3bcvsvNXYx9FpgbqV2DPkSf1DdxxnoUlg7+D7SGyr6oF1uIlzKy
 +7MCTs5BbwdwpTlYfEGbXPc3TvP2bHsLfsiYThRBKHyDKRZLeuAnxKafL0ZFLHnm5pqyM9
 NDRtqRF+b3StFOkZMmNhS7NDnEpCtpw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-rIo4m6yTM3u5nS89nIM_Ag-1; Thu, 09 Sep 2021 02:29:21 -0400
X-MC-Unique: rIo4m6yTM3u5nS89nIM_Ag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F25B835DE1;
 Thu,  9 Sep 2021 06:29:20 +0000 (UTC)
Received: from localhost (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B65810074EF;
 Thu,  9 Sep 2021 06:29:15 +0000 (UTC)
Date: Thu, 9 Sep 2021 07:29:15 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Message-ID: <YTmpu6BQ8NNrl8gk@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <e9fa92081e0faf49089f4afb9a45187e49ea4bad.1629131628.git.elena.ufimtseva@oracle.com>
 <YST++FLqV02TlusW@stefanha-x1.localdomain>
 <924FF1F2-E7AF-4044-B5A4-94A2F1504110@oracle.com>
 <YTdnT27fLn4nwp2n@stefanha-x1.localdomain>
 <22CBE2AD-14EB-4162-9E97-FB7D279480AA@oracle.com>
MIME-Version: 1.0
In-Reply-To: <22CBE2AD-14EB-4162-9E97-FB7D279480AA@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YTPGOiaA6sqRMVxq"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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

--YTPGOiaA6sqRMVxq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 09, 2021 at 05:11:49AM +0000, John Johnson wrote:
>=20
>=20
> > On Sep 7, 2021, at 6:21 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
> >=20
> >=20
> > This way the network communication code doesn't need to know how
> > messages will by processed by the client or server. There is no need fo=
r
> > if (isreply) { qemu_cond_signal(&reply->cv); } else {
> > proxy->request(proxy->reqarg, buf, &reqfds); }. The callbacks and
> > threads aren't hardcoded into the network communication code.
> >=20
>=20
> =09I fear we are talking past each other.  The vfio-user protocol
> is bi-directional.  e.g., the client both sends requests to the server
> and receives requests from the server on the same socket.  No matter
> what threading model we use, the receive algorithm will be:
>=20
>=20
> read message header
> if it=E2=80=99s a reply
>    schedule the thread waiting for the reply
> else
>    run a callback to process the request
>=20
>=20
> =09The only way I can see changing this is to establish two
> uni-directional sockets: one for requests outbound to the server,
> and one for requests inbound from the server.
>=20
> =09This is the reason I chose the iothread model.  It can run
> independently of any vCPU/main threads waiting for replies and of
> the callback thread.  I did muddle this idea by having the iothread
> become a callback thread by grabbing BQL and running the callback
> inline when it receives a request from the server, but if you like a
> pure event driven model, I can make incoming requests kick a BH from
> the main loop.  e.g.,
>=20
> if it=E2=80=99s a reply
>    qemu_cond_signal(reply cv)
> else
>    qemu_bh_schedule(proxy bh)
>=20
> =09That would avoid disconnect having to handle the iothread
> blocked on BQL.
>=20
>=20
> > This goes back to the question earlier about why a dedicated thread is
> > necessary here. I suggest writing the network communication code using
> > coroutines. That way the code is easier to read (no callbacks or
> > thread synchronization), there are fewer thread-safety issues to worry
> > about, and users or management tools don't need to know about additiona=
l
> > threads (e.g. CPU/NUMA affinity).
> >=20
>=20
>=20
> =09I did look at coroutines, but they seemed to work when the sender
> is triggering the coroutine on send, not when request packets are arrivin=
g
> asynchronously to the sends.

This can be done with a receiver coroutine. Its job is to be the only
thing that reads vfio-user messages from the socket. A receiver
coroutine reads messages from the socket and wakes up the waiting
coroutine that yielded from vfio_user_send_recv() or
vfio_user_pci_process_req().

(Although vfio_user_pci_process_req() could be called directly from the
receiver coroutine, it seems safer to have a separate coroutine that
processes requests so that the receiver isn't blocked in case
vfio_user_pci_process_req() yields while processing a request.)

Going back to what you mentioned above, the receiver coroutine does
something like this:

  if it's a reply
      reply =3D find_reply(...)
      qemu_coroutine_enter(reply->co) // instead of signalling reply->cv
  else
      QSIMPLEQ_INSERT_TAIL(&pending_reqs, request, next);
      if (pending_reqs_was_empty) {
          qemu_coroutine_enter(process_request_co);
      }

The pending_reqs queue holds incoming requests that the
process_request_co coroutine processes.

Stefan

--YTPGOiaA6sqRMVxq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE5qboACgkQnKSrs4Gr
c8hQHAgAoRCDlK+o822Zt2x37gFD3728ej2VnBdxWk1crgiZyeEQPuYQOEunMLJv
NG+vkwCtgWH8p16SgAWtG8O3gdkeK6VTepeLwTIyNTMIfZrPxIY77fkstCmIlSmo
2Js6DAl1siODFFPX545xtLzIIZiOE3Ol6fREYPPsKip9voGzuPCPHBYTtIpk0X6Z
jyVXX9Vt5Na5W3c1w7WpFJ5hQ1qvxQuHZbRaJ0Ae9jT1Tgu5MeV9tMFtvl1bpeLW
ifuzeEcE2zr4yEp2FbZ/Xh9soM/nB3QxMdUB2yb5AUIFrazB3tW7ixQK0GQcht8E
Jyp0ZlBnI+FonbyhiRWyWVxEh3nLnQ==
=BD6a
-----END PGP SIGNATURE-----

--YTPGOiaA6sqRMVxq--


