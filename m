Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EE237A2BF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:57:39 +0200 (CEST)
Received: from localhost ([::1]:51762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOCw-0003N9-PD
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgNeA-0000LW-1D
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgNe8-0005Hb-6w
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620721299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t1L2rWW+pSY0GILWZVQfuU6HQ9lepu0rk6BvKW+ApdA=;
 b=T53uZ+3sV/Xz1+1CFIs1exzPNUnyUq9CSmXFmIl+Bicys1eKjl3QBXhEbxDQ9p50tT+nhh
 Si+mHqp1UY3hy1msrB/b3aXYY6fvXT+2TJ0gcyoQZST9h4ToU7L+JZ8Yjmd8ICfqK2aJCH
 nOVzsMUsPSKdhHjy/B1UyVduuca6Tf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-cBXZ2zhbOrm5bkJjH8xGYA-1; Tue, 11 May 2021 04:21:37 -0400
X-MC-Unique: cBXZ2zhbOrm5bkJjH8xGYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F940879537
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:21:36 +0000 (UTC)
Received: from localhost (ovpn-112-6.ams2.redhat.com [10.36.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E504C6A97E;
 Tue, 11 May 2021 08:21:29 +0000 (UTC)
Date: Tue, 11 May 2021 09:21:28 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/3] vhost-user: warn when guest RAM is not shared
Message-ID: <YJo+iLT6nWcPSvVy@stefanha-x1.localdomain>
References: <20210222161017.570837-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210222161017.570837-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0h61ZhTfZINL749d"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0h61ZhTfZINL749d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 04:10:14PM +0000, Stefan Hajnoczi wrote:
> vhost-user requires -object memory-backend-*,share=3Don option so that QE=
MU uses
> mmap(MAP_SHARED) on guest RAM that is shared with the vhost-user device b=
ackend
> process. This is needed so the QEMU process sees changes made by the vhos=
t-user
> device backend process, and vice versa.
>=20
> Today QEMU and the vhost-user device process will start up and then fail =
with a
> confusing error message if the user forgot to specify share=3Don.
>=20
> This patch series adds a warning letting the user know that share=3Don is
> required.
>=20
> Stefan Hajnoczi (3):
>   tests/qtest/vhost-user-test: use share=3Don with memfd
>   memory: add memory_region_is_mapped_shared()
>   vhost-user: warn when guest RAM is not shared
>=20
>  include/exec/memory.h         | 11 +++++++++++
>  hw/virtio/vhost-user.c        | 20 ++++++++++++++++----
>  softmmu/memory.c              |  6 ++++++
>  tests/qtest/vhost-user-test.c |  2 +-
>  4 files changed, 34 insertions(+), 5 deletions(-)

Ping for QEMU 6.1

--0h61ZhTfZINL749d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCaPogACgkQnKSrs4Gr
c8hFhwf9H8ldC6qsgKUZPS/uTtWH2KUcX1JMa2zJRRljflpHGHk0W1wJNx61jIEc
+vtX2FThdOG7wlGXE7lda2s+BCJ9vAti/znnPZoE8J5n9yCB2C5afoKIZ8e6EIDF
CiOzpe2TyBJs5F7DRaLleVcf4vz6unKZy3y+h1UN3Jnmo05vLIMasVGcSEhzsoI2
56p1UOLLxzpQRedV+R6SbB2L6W48zEdiewsQsECIgCwY46JlYKLmnoDt+z1OAZpH
DkUDdPbt90MA6p75UEer+WtJRH2QI1qDAfakfsl9sCdiYWxiCUYOxpUgYu3Adr5m
RgqZxY4oCk5uhO8MF5TAPmvUawjJ0g==
=BbCi
-----END PGP SIGNATURE-----

--0h61ZhTfZINL749d--


