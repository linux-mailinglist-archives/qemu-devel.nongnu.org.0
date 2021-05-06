Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5B93757BF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:41:52 +0200 (CEST)
Received: from localhost ([::1]:46084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leg8L-0007R5-GV
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lefyg-0000u9-A3
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:31:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lefyP-0005Q1-Ly
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s5P7fxn78yFOS7e1PaYW9b5e6HdcW3ufwtw9m/IvxHw=;
 b=cv2FgMwhabYYVmlAYruaxZmjUjU7Od+DzYL54mhKPMXKrky4V5Jxd44/dfboHvJDfok+jS
 tuP4BXYivGx+4FQVlfcRMvA/uLpmuUjyA/fK1X8JGXA+gQJLJ8TpTXMZI+HAyvc1PSUsGV
 E98L+cgLL218crM/dLpky9Hw2nh5Jns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-V9CG9RAKPU-NyuF3gpbsrA-1; Thu, 06 May 2021 11:31:30 -0400
X-MC-Unique: V9CG9RAKPU-NyuF3gpbsrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CE306D4FD;
 Thu,  6 May 2021 15:31:24 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E09F719726;
 Thu,  6 May 2021 15:31:23 +0000 (UTC)
Date: Thu, 6 May 2021 16:31:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 24/26] vhost-user-fs: Extend VhostUserFSSlaveMsg to
 pass additional info
Message-ID: <YJQLyo3hP2FdnXiv@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-25-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-25-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S21FU8qdwV527UnP"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--S21FU8qdwV527UnP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:00:58PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> From: Vivek Goyal <vgoyal@redhat.com>
>=20
> Extend VhostUserFSSlaveMsg so that slave can ask it to drop CAP_FSETID
> before doing I/O on fd.
>=20
> In some cases, virtiofsd takes the onus of clearing setuid bit on a file
> when WRITE happens. Generally virtiofsd does the WRITE to fd (from guest
> memory which is mapped in virtiofsd as well), but if this memory is
> unmappable in virtiofsd (like cache window), then virtiofsd asks qemu
> to do the I/O instead.
>=20
> To retain the capability to drop suid bit on write, qemu needs to
> drop the CAP_FSETID as well before write to fd. Extend VhostUserFSSlaveMs=
g
> so that virtiofsd can specify in message if CAP_FSETID needs to be
> dropped.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  hw/virtio/vhost-user-fs.c                 | 5 +++++
>  include/hw/virtio/vhost-user-fs.h         | 6 ++++++
>  subprojects/libvhost-user/libvhost-user.h | 6 ++++++
>  3 files changed, 17 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--S21FU8qdwV527UnP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCUC8oACgkQnKSrs4Gr
c8iY5Af+OlFBZalg9r/BoV2HNpGFwoLEPI923YX6hPbgocGfUAm8v3kZ6RwaBZ1I
ZFdWqKVBzrI3YZKYcGOWgu2NDhp50/OFyNcGYtEXXg1GEpzA5Re2AsWCiwnArggL
2AdCJbXWnO9LpefASRs9Utp93DypEeKXSftYY9upIGAqbhAqKEwMYCubShVjPkVi
c+5lv6/qf7GYX1mkfq5MI7Vzx+lJVhhrDoMaDhEeLs/mbqtnL7PCRHfCZ0rRwvpg
sGhbo+lqtNG6mO+q9GfQaom4lJW7wYeOKoH4UZ1BbIFCpJV+xaIr+tkluFLylMTE
clZlxPUCGivzfQUUXWynqHvWZkYlHA==
=WgX0
-----END PGP SIGNATURE-----

--S21FU8qdwV527UnP--


