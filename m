Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC4A464B22
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 11:01:59 +0100 (CET)
Received: from localhost ([::1]:35868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msMR0-00044b-T5
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 05:01:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1msMOd-0003PF-BB
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 04:59:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1msMOa-0004Tb-61
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 04:59:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638352762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XkLw2+8RLAmah3j6zfLqvIVa6bSBiHQe1VKvWbj8usY=;
 b=JoEI6Zpiw7lG8er+GAAxDYy/Y7xuF5eqWmddNBWaWfMuObK/nPciKQN0OVn4YQuZQ1xX5g
 cE7ZuB+X/KyC4nuxIC2sOD8fCgp4e6DoJqsalQhRvrSL/lh7sGM2SS1oFRuED4XvI+eemW
 I1SmlIZlNqCfXrvZNDdsbDpRy53tjiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-rwQRvjAGMQmRwGr99LlurA-1; Wed, 01 Dec 2021 04:59:15 -0500
X-MC-Unique: rwQRvjAGMQmRwGr99LlurA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 445E4835B47;
 Wed,  1 Dec 2021 09:59:14 +0000 (UTC)
Received: from localhost (unknown [10.39.195.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FE3110013D6;
 Wed,  1 Dec 2021 09:59:00 +0000 (UTC)
Date: Wed, 1 Dec 2021 09:58:59 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] virtio: signal after wrapping packed used_idx
Message-ID: <YadHY+VDuIobVUYh@stefanha-x1.localdomain>
References: <20211130134510.267382-1-stefanha@redhat.com>
 <20211130184031-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211130184031-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SrFj1vGQA6wMIJcX"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Tiwei Bie <tiwei.bie@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--SrFj1vGQA6wMIJcX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 06:40:49PM -0500, Michael S. Tsirkin wrote:
> On Tue, Nov 30, 2021 at 01:45:10PM +0000, Stefan Hajnoczi wrote:
> > Packed Virtqueues wrap used_idx instead of letting it run freely like
> > Split Virtqueues do. If the used ring wraps more than once there is no
> > way to compare vq->signalled_used and vq->used_idx in
> > virtio_packed_should_notify() since they are modulo vq->vring.num.
> >=20
> > This causes the device to stop sending used buffer notifications when
> > when virtio_packed_should_notify() is called less than once each time
> > around the used ring.
> >=20
> > It is possible to trigger this with virtio-blk's dataplane
> > notify_guest_bh() irq coalescing optimization. The call to
> > virtio_notify_irqfd() (and virtio_packed_should_notify()) is deferred t=
o
> > a BH. If the guest driver is polling it can complete and submit more
> > requests before the BH executes, causing the used ring to wrap more tha=
n
> > once. The result is that the virtio-blk device ceases to raise
> > interrupts and I/O hangs.
> >=20
> > Cc: Tiwei Bie <tiwei.bie@intel.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Makes sense.  Fixes tag?

Good idea.

Fixes: 86044b24e865fb9596ed77a4d0f3af8b90a088a1 ("virtio: basic packed virt=
queue support")

--SrFj1vGQA6wMIJcX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGnR2IACgkQnKSrs4Gr
c8gRNgf9FNyvJ5jtcovRxJbXmN10wRofGp+tCdEoRFTC9yCyqP1Rqpw2kHe5rSjY
QS51ufxWOhCFQ7ymIxCe5+JnjbPKA88mbmdMzP/BWYF4PdEQQyzEDWvhpGJmnEH8
IJClTR8Ju3JW1Nn3CZ2CbJcVJ5IunKtBIGw3wqYLATSJ5ZvSWeyxJZTq8ni9efrA
QqkA5zBJV5uSHCBXulGhKcidjcMWa84yp6cqiW2nbDj0hrs0tr1CjGmk9gam6Rp9
QVPfZwuiZpVQjMED1gThb9oaPnOm2BJphJ60VSvhkjgCvrux7g1taVdrQSEjZDn2
5/Fq1h0o5N0qwd9N9Xt4AQGAo151Eg==
=jcn8
-----END PGP SIGNATURE-----

--SrFj1vGQA6wMIJcX--


