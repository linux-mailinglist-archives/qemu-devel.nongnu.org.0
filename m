Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6D642265F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 14:26:37 +0200 (CEST)
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXjWn-0002ux-0i
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 08:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXjTO-0008Eb-MG
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 08:23:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXjTM-0007iX-SS
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 08:23:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633436583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XPQj23sWb/O+16k0uw7dn+IVPu+2mmehno2BcKIhJMI=;
 b=S/Z4dS8gKuE2l/7QdhHIJmEpBTHUmyX8Xp1Npu9G05DZfTXcSw7rySkIsWbEH8GkEztDQK
 o5J6DbzxTb8cDS/UrBxMgbWrJ2e/vUuEXLoG/aM7W4wWE+wqbcXYsU191aLZjtaiH+UGB1
 t0+OGP3Jrbz4iYRSbtHffYK8LwkyEvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455--JncXWmbOzelr_AXj3nWlQ-1; Tue, 05 Oct 2021 08:23:00 -0400
X-MC-Unique: -JncXWmbOzelr_AXj3nWlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 806AD835DE2;
 Tue,  5 Oct 2021 12:22:59 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CC235F4E8;
 Tue,  5 Oct 2021 12:22:58 +0000 (UTC)
Date: Tue, 5 Oct 2021 13:22:58 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 13/13] virtiofsd, seccomp: Add clock_nanosleep() to allow
 list
Message-ID: <YVxDouMEj3aqTNf3@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-14-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930153037.1194279-14-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gvHFzYKtcbZ26Q1s"
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

--gvHFzYKtcbZ26Q1s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 11:30:37AM -0400, Vivek Goyal wrote:
> g_usleep() calls nanosleep() and that now seems to call clock_nanosleep()
> syscall. Now these patches are making use of g_usleep(). So add
> clock_nanosleep() to list of allowed syscalls.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/passthrough_seccomp.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/pass=
through_seccomp.c
> index cd24b40b78..03080806c0 100644
> --- a/tools/virtiofsd/passthrough_seccomp.c
> +++ b/tools/virtiofsd/passthrough_seccomp.c
> @@ -117,6 +117,7 @@ static const int syscall_allowlist[] =3D {
>      SCMP_SYS(writev),
>      SCMP_SYS(umask),
>      SCMP_SYS(nanosleep),
> +    SCMP_SYS(clock_nanosleep),

This patch can be dropped once sleep has been replaced by a condvar.

--gvHFzYKtcbZ26Q1s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFcQ6IACgkQnKSrs4Gr
c8hAWggAtWAYKqdiNQnnzwGMGMCtbpq78P2T9Y1X0YRwNqi6RQW2LLTne8DrCS3m
sssAGkK1c19CYa8tyaDBolKFNtUEPY2aIUW8mikXrPj72CrNH4dy9fFhdXFoLb/a
/nMYQ57E8mvzVfNgOaZjhmr7IPQoU+CFP3kMaL0o+J/PrRqrWcYj7alx29ASnV3B
0mkjZJGYqPJeEWpchfQDHK94H3p9qNVA2FpZ8ZPzjc9ofXo1ijGno6QNxEodqnYc
RA3xdCz/8wLfhLPf20yCunBuhRe//CqBb921d8ZTCLv2G6jf9NLUB9mMy/lshtDx
89wMw2pIffXtGeklEYxJ2c/YXiNkYA==
=ocDr
-----END PGP SIGNATURE-----

--gvHFzYKtcbZ26Q1s--


