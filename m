Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE053C610B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:56:47 +0200 (CEST)
Received: from localhost ([::1]:39062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zEc-0003Mi-Ms
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2zCn-0000zY-Po
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2zCl-0005At-OW
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626108891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4rqCahuOn+ddAKhoLcUdRBsflU+yYlrCTa/RXig28Y4=;
 b=BNdh2ZLRPMZCbciPkahSq+u4KrH5hIPiE8CINXr0TF6RgEI0BHRs9Pobb6QTtVTtSi4LiQ
 a3tHqFPi5yP15qtYnYLcrl2WmLfoLSfvagb14oDUWZr3tS8yhsK0gKFz6HySx9EUC1u4kn
 GrJx0aB/QoD1gTbR8lcwBa1RhxHORFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-AuH17rr6MPOH6N5WlpzmLg-1; Mon, 12 Jul 2021 12:54:49 -0400
X-MC-Unique: AuH17rr6MPOH6N5WlpzmLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83D00800C78;
 Mon, 12 Jul 2021 16:54:47 +0000 (UTC)
Received: from localhost (ovpn-112-230.ams2.redhat.com [10.36.112.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09F741970E;
 Mon, 12 Jul 2021 16:54:46 +0000 (UTC)
Date: Mon, 12 Jul 2021 12:03:27 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
Subject: Re: [RFC PATCH 1/2] hw/nvme: add mi device
Message-ID: <YOwhf59Xb/9IkZ9K@stefanha-x1.localdomain>
References: <CGME20210709135651epcas5p1c544dec5377413bfa4b2eeab6ee43f26@epcas5p1.samsung.com>
 <20210709135545.GA11148@test-zns>
MIME-Version: 1.0
In-Reply-To: <20210709135545.GA11148@test-zns>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IMpYdEGnbZt5/SdV"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, jg123.choi@samsung.com,
 qemu-block@nongnu.org, k.jensen@samsung.com, d.palani@samsung.com,
 qemu-devel@nongnu.org, linux-nvme@lists.infradead.org, mreitz@redhat.com,
 its@irrelevant.dk, u.kishore@samsung.com, kbusch@kernel.org,
 javier.gonz@samsung.com, prakash.v@samsung.com, mohit.kap@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--IMpYdEGnbZt5/SdV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 09, 2021 at 07:25:45PM +0530, Padmakar Kalghatgi wrote:
> The enclosed patch contains the implementation of certain
> commands of nvme-mi specification.The MI commands are useful
> to manage/configure/monitor the device.Eventhough the MI commands
> can be sent via the inband NVMe-MI send/recieve commands, the idea here i=
s
> to emulate the sideband interface for MI.
>=20
> Since the nvme-mi specification deals in communicating
> to the nvme subsystem via. a sideband interface, in this
> qemu implementation, virtual-vsock is used for making the
> sideband communication, the guest VM needs to make the
> connection to the specific cid of the vsock of the qemu host.
>=20
> One needs to specify the following command in the launch to
> specify the nvme-mi device, cid and to setup the vsock:
> -device nvme-mi,bus=3D<nvme bus number>
> -device vhost-vsock-pci, guest-cid=3D<vsock cid>
>=20
> The following commands are tested with nvme-cli by hooking
> to the cid of the vsock as shown above and use the socket
> send/recieve commands to issue the commands and get the response.
>=20
> we are planning to push the changes for nvme-cli as well to test the
> MI functionality.

Is the purpose of this feature (-device nvme-mi) testing MI with QEMU's
NVMe implementation?

My understanding is that instead of inventing an out-of-band interface
in the form of a new paravirtualized device, you decided to use vsock to
send MI commands from the guest to QEMU?

> As the connection can be established by the guest VM at any point,
> we have created a thread which is looking for a connection request.
> Please suggest if there is a native/better way to handle this.

QEMU has an event-driven architecture and uses threads sparingly. When
it uses threads it uses qemu_create_thread() instead of
pthread_create(), but I suggest using qemu_set_fd_handler() or a
coroutine with QIOChannel to integrate into the QEMU event loop instead.

I didn't see any thread synchronization, so I'm not sure if accessing
NVMe state from the MI thread is safe. Changing the code to use QEMU's
event loop can solve that problem since there's no separate thread.

> This module makes use of the NvmeCtrl structure of the nvme module,
> to fetch relevant information of the nvme device which are used in
> some of the mi commands. Eventhough certain commands might require
> modification to the nvme module, currently we have currently refrained
> from making changes to the nvme module.

Why did you decide to implement -device nvme-mi as a device on
TYPE_NVME_BUS? If the NVMe spec somehow requires this then I'm surprised
that there's no NVMe bus interface (callbacks). It seems like this could
just as easily be a property of an NVMe controller -device
nvme,mi=3Don|off or -device nvme-subsys,mi=3Don|off? I'm probably just not
familiar enough with MI and NVMe architecture...

Stefan

--IMpYdEGnbZt5/SdV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDsIX8ACgkQnKSrs4Gr
c8jXkwf9HuFYHIhF3iAVsVtP9f9yvG+qxjBlU0+Uk8I1m8PfAu6BIefddWrvSMxV
eGzRPe2PCAYs8uQpoCSXQ05W9luzLJJF6o8Qk6ojekXCcG/VSszvMj6o9F3NpWBx
EGxifEtCjCH60HjLUZH+rVoT9GpVmY8lAp1PRjS6NCHUc0M/gwF9OZKA/f0IvT3C
ZY1RsjmHNXT1hk2F7u5t4q8wE2uWIHe8lXL6oAAHQd76OJN3Mrgq+1rpuVvsAGbN
zQAjDJAN0C9BSrEUnKF3MCAHB2CdGaM+mEMJOmPTgAmctqAR39O88acFnZbm1w3c
jp3Jaz0+zy4GjLbi4mog6d2CfIRxWw==
=rx62
-----END PGP SIGNATURE-----

--IMpYdEGnbZt5/SdV--


