Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D7942125B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 17:10:39 +0200 (CEST)
Received: from localhost ([::1]:60714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXPbt-0008N9-DB
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 11:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXPYj-0005nz-CE
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:07:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXPYg-0003aD-6x
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:07:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633360032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U4BppRUV7+HHHpppQ861UQ2wNor0Hw+Vij/4QAFATac=;
 b=IzsH6pB0782rEKkKT/Yli1ecHBqAtFNqZAtBZb1aE6ZWzWYkxs0J1MgC9wkI48SaPbwO0O
 9LOXwYhSVBeRuj8ib/8JliePNSPTbCuyMdvSMSBh4UKwpEk5oNFZ6z+qy/67v2GHypmWZh
 6CiVuiqrru1pxLBJ6kmxZ3/LetqGJp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-vULsl0rGOyq2M-yZarcBNw-1; Mon, 04 Oct 2021 11:07:11 -0400
X-MC-Unique: vULsl0rGOyq2M-yZarcBNw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA7E436303;
 Mon,  4 Oct 2021 15:07:09 +0000 (UTC)
Received: from localhost (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED52019723;
 Mon,  4 Oct 2021 15:07:05 +0000 (UTC)
Date: Mon, 4 Oct 2021 16:07:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 12/13] virtiofsd: Implement blocking posix locks
Message-ID: <YVsYmHhbjPs/LEUc@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-13-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930153037.1194279-13-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9XQL1jyIUILLHsZa"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, iangelak@redhat.com,
 dgilbert@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--9XQL1jyIUILLHsZa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 11:30:36AM -0400, Vivek Goyal wrote:
> As of now we don't support fcntl(F_SETLKW) and if we see one, we return
> -EOPNOTSUPP.
>=20
> Change that by accepting these requests and returning a reply
> immediately asking caller to wait. Once lock is available, send a
> notification to the waiter indicating lock is available.
>=20
> In response to lock request, we are returning error value as "1", which
> signals to client to queue the lock request internally and later client
> will get a notification which will signal lock is taken (or error). And
> then fuse client should wake up the guest process.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c  | 37 ++++++++++++++++-
>  tools/virtiofsd/fuse_lowlevel.h  | 26 ++++++++++++
>  tools/virtiofsd/fuse_virtio.c    | 50 ++++++++++++++++++++---
>  tools/virtiofsd/passthrough_ll.c | 70 ++++++++++++++++++++++++++++----
>  4 files changed, 167 insertions(+), 16 deletions(-)
>=20
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowle=
vel.c
> index e4679c73ab..2e7f4b786d 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -179,8 +179,8 @@ int fuse_send_reply_iov_nofree(fuse_req_t req, int er=
ror, struct iovec *iov,
>          .unique =3D req->unique,
>          .error =3D error,
>      };
> -
> -    if (error <=3D -1000 || error > 0) {
> +    /* error =3D 1 has been used to signal client to wait for notificait=
on */

s/notificaiton/notification/

> +    if (error <=3D -1000 || error > 1) {
>          fuse_log(FUSE_LOG_ERR, "fuse: bad error value: %i\n", error);
>          out.error =3D -ERANGE;
>      }
> @@ -290,6 +290,11 @@ int fuse_reply_err(fuse_req_t req, int err)
>      return send_reply(req, -err, NULL, 0);
>  }
> =20
> +int fuse_reply_wait(fuse_req_t req)
> +{
> +    return send_reply(req, 1, NULL, 0);
> +}
> +
>  void fuse_reply_none(fuse_req_t req)
>  {
>      fuse_free_req(req);
> @@ -2165,6 +2170,34 @@ static void do_destroy(fuse_req_t req, fuse_ino_t =
nodeid,
>      send_reply_ok(req, NULL, 0);
>  }
> =20
> +static int send_notify_iov(struct fuse_session *se, int notify_code,
> +                           struct iovec *iov, int count)
> +{
> +    struct fuse_out_header out;
> +    if (!se->got_init) {
> +        return -ENOTCONN;
> +    }
> +    out.unique =3D 0;
> +    out.error =3D notify_code;

Please fully initialize all fuse_out_header fields so it's obvious that
there is no accidental information leak from virtiofsd to the guest:

  struct fuse_out_header out =3D {
      .error =3D notify_code,
  };

The host must not expose uninitialized memory to the guest (just like
the kernel vs userspace). fuse_send_msg() initializes out.len later, but
to be on the safe side I think we should be explicit here.

--9XQL1jyIUILLHsZa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFbGJgACgkQnKSrs4Gr
c8gAUAgAvKDRFORyxWItqCrupt3TuNF1j42PbZw3YAp6dd0LGK8JGi8e7JetfzWF
3k/9hhV1KsXY9ik2b78Eh1jeiJEy6zu2NlxY4FiTHKraziQaGHk0u1QOEDZUYapb
jmwddAVwkZne52ybbe62u2FKjIKYkUBUEdjXrlAFjmQVmDjQip6xvbQ58dorhL1n
PYc/nO3vJAWsMx+RFfVCFlZ7t7HTHYlZlgvKfcd3c1s3/O7mMi97DUWoqhfRvuka
fmz5QUidmg4goBBShWObBqpDnePlk6sAPB8AAdnBS6UgAKQaTAWIarjz9tHQqev6
9Dk0Wu+MAsHLI8j7CKv0ukbGgMGWig==
=1e2d
-----END PGP SIGNATURE-----

--9XQL1jyIUILLHsZa--


