Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825784AF6BE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 17:32:38 +0100 (CET)
Received: from localhost ([::1]:53500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHptV-00019G-6P
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 11:32:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nHofi-0007zJ-Hv
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 10:14:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nHofM-00074b-Hz
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 10:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644419635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1PEJF28Qa86jduBFwsG0RvSUPntBw0cjRX7gTlXOKrg=;
 b=UrMttusyQBXGQafiuuWrNQXzBJLcz93+/pTczX91LNGuRL9Kvjo8yGuMWDV6/A9GkhvjrF
 G5Y5qFcIchFpq3eNFz46LsX2fgB959RjIXCjgQJvwzz5/Htu4NPkNPs3W9LS7TsSWnSGKb
 kJ7UyT/pHXiSvYPSaHUE1A5sL8kNJKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-PQMmVvEZO5u88aIHQQQLGw-1; Wed, 09 Feb 2022 10:13:52 -0500
X-MC-Unique: PQMmVvEZO5u88aIHQQQLGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9115814249;
 Wed,  9 Feb 2022 15:13:50 +0000 (UTC)
Received: from localhost (unknown [10.39.193.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61873105C896;
 Wed,  9 Feb 2022 15:13:50 +0000 (UTC)
Date: Wed, 9 Feb 2022 15:13:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: christian.ehrhardt@canonical.com
Subject: Re: [PATCH] tools/virtiofsd: Add rseq syscall to the seccomp allowlist
Message-ID: <YgPaLBwxZF38c9OD@stefanha-x1.localdomain>
References: <20220209111456.3328420-1-christian.ehrhardt@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AedpXmdabohGmpO3"
Content-Disposition: inline
In-Reply-To: <20220209111456.3328420-1-christian.ehrhardt@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Hudson-Doyle <michael.hudson@canonical.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AedpXmdabohGmpO3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 09, 2022 at 12:14:56PM +0100, christian.ehrhardt@canonical.com =
wrote:
> From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
>=20
> The virtiofsd currently crashes when used with glibc 2.35.
> That is due to the rseq system call being added to every thread
> creation [1][2].
>=20
> [1]: https://www.efficios.com/blog/2019/02/08/linux-restartable-sequences/
> [2]: https://sourceware.org/pipermail/libc-alpha/2022-February/136040.html
>=20
> This happens not at daemon start, but when a guest connects
>=20
>     /usr/lib/qemu/virtiofsd -f --socket-path=3D/tmp/testvfsd -o sandbox=
=3Dchroot \
>         -o source=3D/var/guests/j-virtiofs --socket-group=3Dkvm
>     virtio_session_mount: Waiting for vhost-user socket connection...
>     # start ok, now guest will connect
>     virtio_session_mount: Received vhost-user socket connection
>     virtio_loop: Entry
>     fv_queue_set_started: qidx=3D0 started=3D1
>     fv_queue_set_started: qidx=3D1 started=3D1
>     Bad system call (core dumped)
>=20
> We have to put rseq on the seccomp allowlist to avoid that the daemon
> is crashing in this case.
>=20
> Reported-by: Michael Hudson-Doyle <michael.hudson@canonical.com>
> Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> ---
>  tools/virtiofsd/passthrough_seccomp.c | 3 +++
>  1 file changed, 3 insertions(+)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--AedpXmdabohGmpO3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmID2iwACgkQnKSrs4Gr
c8jOBQf/dmD6nfL54vgvxEozr/K93AUNMkLi0XfkVP4vpF9DTCKJN5RQQ1u8GXuJ
vLbg5GEYb3ZqRztPxzXfIBtMvApv9CosVI9CR5bJYmF5PNpwmZL6QFBEu2+SdgF9
c5ipQu/g1tqP0IMLJNOCbtk4Mr6CEVuCUn/kVtURRI/c5ZQCjQ+W9SjybOd829PW
BikJaE5L3YPtmHViQu46KV1M6tkrxwujFcvki9aGU9wRdgGJraGOKEoxBhT//qiX
u2ZkvYVRE9O9SPALBS97D0D/FLrO8mECffvw42LextBfzTuwb6ts3SfLmrTuJyXW
2E8wjIWxxN0izarxHWQIofs67ZoCFA==
=nrOE
-----END PGP SIGNATURE-----

--AedpXmdabohGmpO3--


