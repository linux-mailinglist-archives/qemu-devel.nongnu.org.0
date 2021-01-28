Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94038307B7B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:58:07 +0100 (CET)
Received: from localhost ([::1]:59128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5AcQ-0002MT-G2
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:58:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l5AXV-00004u-LX
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:53:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l5AXL-0007He-9C
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:53:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611852769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/6/XyeBjHe9euEJEL5L6qFeQly1W5zIhRR+yRJOloMY=;
 b=fsMRFFuIJJRj6Qkedi4eQTDbWue7PkfG++884UXbK+Cqh20BiUf2TUf+soJvwcL5sI9O7A
 iMKaJGrBZ7CpQs4Q0V8+T7nijOrfw8ZocdumGPcIC11QYwwAYKKwHM2RgKKYzwXtF0A1fr
 fSoRFSiaXkSCoxEA2R5oaIfkt+Ra7Hg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-AbeNd8iEOeivphhXooDqSQ-1; Thu, 28 Jan 2021 11:52:46 -0500
X-MC-Unique: AbeNd8iEOeivphhXooDqSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5E9B107ACE4
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 16:52:45 +0000 (UTC)
Received: from localhost (ovpn-112-242.ams2.redhat.com [10.36.112.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D591D5C1BB;
 Thu, 28 Jan 2021 16:52:35 +0000 (UTC)
Date: Thu, 28 Jan 2021 16:52:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 4/6] qemu, vhost-user: Extend protocol to
 start/stop/flush slave channel
Message-ID: <20210128165234.GC20377@stefanha-x1.localdomain>
References: <20210125180115.22936-1-vgoyal@redhat.com>
 <20210125180115.22936-5-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210125180115.22936-5-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--m51xatjYGsM+13rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2021 at 01:01:13PM -0500, Vivek Goyal wrote:
> Currently we don't have a mechanism to flush slave channel while shutting
> down vhost-user device and that can result a deadlock. Consider following
> scenario.
>=20
> 1. Slave gets a request from guest on virtqueue (say index 1, vq1), to ma=
p
>    a portion of file in qemu address space.
>=20
> 2. Thread serving vq1 receives this request and sends a message to qemu o=
n
>    slave channel/fd and gets blocked in waiting for a response from qemu.
>=20
> 3. In the mean time, user does "echo b > /proc/sysrq-trigger" in guest. T=
his
>    leads to qemu reset and ultimately in main thread we end up in
>    vhost_dev_stop() which is trying to shutdown virtqueues for the device=
.
>=20
> 4. Slave gets VHOST_USER_GET_VRING_BASE message to shutdown a virtqueue o=
n
>    unix socket being used for communication.
>=20
> 5. Slave tries to shutdown the thread serving vq1 and waits for it to
>    terminate. But vq1 thread can't terminate because it is waiting for
>    a response from qemu on slave_fd. And qemu is not processing slave_fd
>    anymore as qemu is ressing (and not running main event loop anymore)
>    and is waiting for a response to VHOST_USER_GET_VRING_BASE.
>=20
> So we have a deadlock. Qemu is waiting on slave to response to
> VHOST_USER_GET_VRING_BASE message and slave is waiting on qemu to
> respond to request it sent on slave_fd.
>=20
> I can reliably reproduce this race with virtio-fs.
>=20
> Hence here is the proposal to solve this problem. Enhance vhost-user
> protocol to properly shutdown slave_fd channel. And if there are pending
> requests, flush the channel completely before sending the request to
> shutdown virtqueues.
>=20
> New workflow to shutdown slave channel is.
>=20
> - Qemu sends VHOST_USER_STOP_SLAVE_CHANNEL request to slave. It waits
>   for an reply from guest.
>=20
> - Then qemu sits in a tight loop waiting for
>   VHOST_USER_SLAVE_STOP_CHANNEL_COMPLETE message from slave on slave_fd.
>   And while waiting for this message, qemu continues to process requests
>   on slave_fd to flush any pending requests. This will unblock threads
>   in slave and allow slave to shutdown slave channel.
>=20
> - Once qemu gets VHOST_USER_SLAVE_STOP_CHANNEL_COMPLETE message, it knows
>   no more requests will come on slave_fd and it can continue to shutdown
>   virtqueues now.
>=20
> - Once device starts again, qemu will send VHOST_USER_START_SLAVE_CHANNEL
>   message to slave to open the slave channel and receive requests.
>=20
> IOW, this allows for proper shutdown of slave channel, making sure
> no threads in slave are blocked on sending/receiving message. And
> this in-turn allows for shutting down of virtqueues, hence resolving
> the deadlock.

Is the new message necessary? How about letting QEMU handle slave fd
activity while waiting for virtqueues to stop instead?

In other words, QEMU should monitor both the UNIX domain socket and the
slave fd after it has sent VHOST_USER_GET_VRING_BASE and is awaiting the
response.

Stefan

--m51xatjYGsM+13rf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAS69IACgkQnKSrs4Gr
c8hvdgf/TJrKtCrO7zJeyOv/D2hjb69ypEdv7T50K7n0aSHSauRES52UfiLdDAqT
R31dPir+EXxOQCstuw0w9GSVxJxWt8HBD6Nq4aclhjYiRun8wnYdc6A6WPv79v5C
H4Q45pXw179Dy3NDvpz2vAARp5Us/5s+yT8bhAAn4rKBipL2rkoVPOPA8aGKqNXp
021MOsfZLm50G5nKT1qCQMfRHDaGkPnjWIQmYmCn5OVE7HFw1OOy+4cC0ybQu8XV
cjI5x/RZfMnhYDshIdGgRmfP2NpWZskTOJ/beYmcoVDBy9WVMjn/6M5GZ4bzt7Jv
emvUMTBfaiT73CXMiAzHuhWD9xuh7w==
=mOHF
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--


