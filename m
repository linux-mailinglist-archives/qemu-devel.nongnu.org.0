Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F7C408B3A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:42:55 +0200 (CEST)
Received: from localhost ([::1]:53066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlIU-0003Ug-Pv
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPlBr-0003Jm-SI
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:36:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPlBn-0006Px-DX
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631536557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j4wk6oTRdaTMpnJ1KQmxYj+PhEmuj/KyBemEY058vlA=;
 b=A6HoN3Qk/BS5BdhjzCyAeUbEXUVCRxZv76EezNPf//v/gzAllemU5qD/o5yZnsQ3Hpcxyt
 M1csONGRaaiSn2amfOoMhQcxGresEiFckSm/yvU2OH8ttrBWK+2J5eUDK0qfT1di8aeQWz
 bWAsW20njFJV/UsfW8+xEeFWgsG/JNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-6ESxpX6nMy6AP7Z_rWE30A-1; Mon, 13 Sep 2021 08:35:55 -0400
X-MC-Unique: 6ESxpX6nMy6AP7Z_rWE30A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55CBC1084681;
 Mon, 13 Sep 2021 12:35:54 +0000 (UTC)
Received: from localhost (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 045C55C1D1;
 Mon, 13 Sep 2021 12:35:49 +0000 (UTC)
Date: Mon, 13 Sep 2021 13:35:48 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Message-ID: <YT9FpNYNoT/HWNdF@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <e9fa92081e0faf49089f4afb9a45187e49ea4bad.1629131628.git.elena.ufimtseva@oracle.com>
 <YST++FLqV02TlusW@stefanha-x1.localdomain>
 <924FF1F2-E7AF-4044-B5A4-94A2F1504110@oracle.com>
 <YTdnT27fLn4nwp2n@stefanha-x1.localdomain>
 <22CBE2AD-14EB-4162-9E97-FB7D279480AA@oracle.com>
 <YTmpu6BQ8NNrl8gk@stefanha-x1.localdomain>
 <9F0B3728-7F6C-4FBB-BF4C-49F29324F1F5@oracle.com>
MIME-Version: 1.0
In-Reply-To: <9F0B3728-7F6C-4FBB-BF4C-49F29324F1F5@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="K7qwGiUDaxzDJm9i"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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

--K7qwGiUDaxzDJm9i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 10, 2021 at 05:25:13AM +0000, John Johnson wrote:
>=20
>=20
> > On Sep 8, 2021, at 11:29 PM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Thu, Sep 09, 2021 at 05:11:49AM +0000, John Johnson wrote:
> >>=20
> >>=20
> >> =09I did look at coroutines, but they seemed to work when the sender
> >> is triggering the coroutine on send, not when request packets are arri=
ving
> >> asynchronously to the sends.
> >=20
> > This can be done with a receiver coroutine. Its job is to be the only
> > thing that reads vfio-user messages from the socket. A receiver
> > coroutine reads messages from the socket and wakes up the waiting
> > coroutine that yielded from vfio_user_send_recv() or
> > vfio_user_pci_process_req().
> >=20
> > (Although vfio_user_pci_process_req() could be called directly from the
> > receiver coroutine, it seems safer to have a separate coroutine that
> > processes requests so that the receiver isn't blocked in case
> > vfio_user_pci_process_req() yields while processing a request.)
> >=20
> > Going back to what you mentioned above, the receiver coroutine does
> > something like this:
> >=20
> >  if it's a reply
> >      reply =3D find_reply(...)
> >      qemu_coroutine_enter(reply->co) // instead of signalling reply->cv
> >  else
> >      QSIMPLEQ_INSERT_TAIL(&pending_reqs, request, next);
> >      if (pending_reqs_was_empty) {
> >          qemu_coroutine_enter(process_request_co);
> >      }
> >=20
> > The pending_reqs queue holds incoming requests that the
> > process_request_co coroutine processes.
> >=20
>=20
>=20
> =09How do coroutines work across threads?  There can be multiple vCPU
> threads waiting for replies, and I think the receiver coroutine will be
> running in the main loop thread.  Where would a vCPU block waiting for
> a reply?  I think coroutine_yield() returns to its coroutine_enter() call=
er.

A vCPU thread holding the BQL can iterate the event loop if it has
reached a synchronous point that needs to wait for a reply before
returning. I think we have this situation when a MemoryRegion is
accessed on the proxy device.

For example, block/block-backend.c:blk_prw() kicks off a coroutine and
then runs the event loop until the coroutine finishes:

  Coroutine *co =3D qemu_coroutine_create(co_entry, &rwco);
  bdrv_coroutine_enter(blk_bs(blk), co);
  BDRV_POLL_WHILE(blk_bs(blk), rwco.ret =3D=3D NOT_DONE);

BDRV_POLL_WHILE() boils down to a loop like this:

  while ((cond)) {
    aio_poll(ctx, true);
  }

I also want to check that I understand the scenarios in which the
vfio-user communication code is used:

1. vhost-user-server

The vfio-user communication code should run in a given AioContext (it
will be the main loop by default but maybe the user will be able to
configure a specific IOThread in the future).

2. vCPU thread vfio-user clients

The vfio-user communication code is called from the vCPU thread where
the proxy device executes. The MemoryRegion->read()/write() callbacks
are synchronous, so the thread needs to wait for a vfio-user reply
before it can return.

Is this what you had in mind?

Stefan

--K7qwGiUDaxzDJm9i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE/RaQACgkQnKSrs4Gr
c8jcCAf/SJ3udKtt8/oFj7mmXRHofYWZpEnby06Q5LULQerI5luEdrT1/+R6snw4
wtVDy06LWpN3pZ+I2LqtzoCtAW2suE0Qc3ZZaWlyIs1YOnfGN1WBWgPtp71FT0Li
peAXkZbyq/zOKqwPFpPur7xqohtj30hosvmdF/WEfcnBgRGJjTovWO3xQYZK1NRf
7ZFSNnNaGhS4vxYtC4bCiHHiYhjt81OsO0S8B9VyiqVgpA/c3UVcRvErzRmMJLQP
Gn0ujOedIVynunbXjutUah143+5wDDUj8Ak17IMKdNdjMaUfEcQMs2SNG7slWwPO
hkuAtYfFnEOYlnIPq7Mzl6/el9CEPQ==
=Vw/5
-----END PGP SIGNATURE-----

--K7qwGiUDaxzDJm9i--


