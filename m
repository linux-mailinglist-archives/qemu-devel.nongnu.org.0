Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7847F422D19
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:56:06 +0200 (CEST)
Received: from localhost ([::1]:50946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmnV-0002kA-ID
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXmij-0004mO-Pk
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXmih-0007F9-9q
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5lOI2Ht8py5TltBd8ZUh22sZ/xDTLbI3+2Q+qxfBmJk=;
 b=YA5iZG83KXJD7uEruIYFsqILzNom9zOXxPlJmKJfrvqMN5RR8emZYASKo6fZ/PHM21+5WD
 PbUK9dHP1AeAEdqJdBe/wCDxVu6whSm5AkItwY4s27IAKt7zEVSEhhx9VXGHIYWkcy5u5k
 dnmI0gFItIYscHg2UHgIxh9DfTCTA+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-NvwkBu1jNVmaT9H2Y_vu_w-1; Tue, 05 Oct 2021 11:51:04 -0400
X-MC-Unique: NvwkBu1jNVmaT9H2Y_vu_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECE3FA40C5;
 Tue,  5 Oct 2021 15:51:03 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EC895F4F9;
 Tue,  5 Oct 2021 15:50:44 +0000 (UTC)
Date: Tue, 5 Oct 2021 16:50:43 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 13/13] virtiofsd, seccomp: Add
 clock_nanosleep() to allow list
Message-ID: <YVx0U8Wg7jahdoJD@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-14-vgoyal@redhat.com>
 <YVxDouMEj3aqTNf3@stefanha-x1.localdomain>
 <YVxsQg+edz0kFmUl@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVxsQg+edz0kFmUl@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LN7iIjBUGk0WIkLW"
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--LN7iIjBUGk0WIkLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 11:16:18AM -0400, Vivek Goyal wrote:
> On Tue, Oct 05, 2021 at 01:22:58PM +0100, Stefan Hajnoczi wrote:
> > On Thu, Sep 30, 2021 at 11:30:37AM -0400, Vivek Goyal wrote:
> > > g_usleep() calls nanosleep() and that now seems to call clock_nanosle=
ep()
> > > syscall. Now these patches are making use of g_usleep(). So add
> > > clock_nanosleep() to list of allowed syscalls.
> > >=20
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > ---
> > >  tools/virtiofsd/passthrough_seccomp.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/=
passthrough_seccomp.c
> > > index cd24b40b78..03080806c0 100644
> > > --- a/tools/virtiofsd/passthrough_seccomp.c
> > > +++ b/tools/virtiofsd/passthrough_seccomp.c
> > > @@ -117,6 +117,7 @@ static const int syscall_allowlist[] =3D {
> > >      SCMP_SYS(writev),
> > >      SCMP_SYS(umask),
> > >      SCMP_SYS(nanosleep),
> > > +    SCMP_SYS(clock_nanosleep),
> >=20
> > This patch can be dropped once sleep has been replaced by a condvar.
>=20
> There is another sleep in do_pool_destroy() where we are waiting
> for all current threads to exit.
>=20
> do_pool_destroy() {
>     g_usleep(10000);
> }

That won't be necessary if there's a way to avoid the thread pool :).
See my other reply about closing the OFD instead of using signals to
cancel blocking fcntl(2).

Stefan

--LN7iIjBUGk0WIkLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFcdFMACgkQnKSrs4Gr
c8iRegf9HxJKHYFn5Qx9pLzTuAiaoYJmzlrx0JMJhMMzCfhUEGng/btgMckfJD1R
hUK27n/+pPuCm++jQxksUujBAGnEO1f8MKYYMEOZRrHbYgztl5uayl74w2qeSKFk
JfO/0o20auesIzxMYTnO2mNAE/JCgxHwLCthMzCJwr8cwiZAzUzxdxs6ktMWYTv8
O2w7SF6GbnFT+qGJ8nzNGkUvmVz0IKqOxUY3IvUoU7QrFOMFUzjh80DOXhLOxuE6
8wvYLMY1PomUUJxABOrjoiJl5htLWaHoKM6o2PG7VjQH9a7Xe573il9dsIr2uLF3
OtDWusoAI20XYlPjiOshuLvg73WSrg==
=SQqc
-----END PGP SIGNATURE-----

--LN7iIjBUGk0WIkLW--


