Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FE6423B83
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 12:30:58 +0200 (CEST)
Received: from localhost ([::1]:46458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY4CP-0002Pb-R3
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 06:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mY48r-0000Qj-EA
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:27:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mY48p-0007WB-NT
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633516033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ihkrUVNB+e/dYJ7mhxTuQ0psq4w0TXUNoPX0Y/LBCRA=;
 b=DtKHPubIhTlsk2AH8gSYOTxM8p5994jiw5ad5s97qopv5E+MzZ/yXZKQiCYzTNMtbCMZAc
 suNjwxVywyw4x9ys4uNWQSYC+bEAabYl5RQsPEhFVLxHSDdjUiUgC4DD3UuavBcKMhV81d
 aGSZsV63BcN71WBplNLnUPEP2/XDxZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-TIW8VUpsMAGRGkIR5igH2w-1; Wed, 06 Oct 2021 06:27:12 -0400
X-MC-Unique: TIW8VUpsMAGRGkIR5igH2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72B871084681;
 Wed,  6 Oct 2021 10:27:11 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 112AD100238C;
 Wed,  6 Oct 2021 10:27:06 +0000 (UTC)
Date: Wed, 6 Oct 2021 11:27:06 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 13/13] virtiofsd, seccomp: Add
 clock_nanosleep() to allow list
Message-ID: <YV15+gGJ4ybRRKnm@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-14-vgoyal@redhat.com>
 <YVxDouMEj3aqTNf3@stefanha-x1.localdomain>
 <YVxsQg+edz0kFmUl@redhat.com>
 <YVx0U8Wg7jahdoJD@stefanha-x1.localdomain>
 <YVyLNQM8PXO8iDed@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVyLNQM8PXO8iDed@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pDFxbfaz984+NjYw"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

--pDFxbfaz984+NjYw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 01:28:21PM -0400, Vivek Goyal wrote:
> On Tue, Oct 05, 2021 at 04:50:43PM +0100, Stefan Hajnoczi wrote:
> > On Tue, Oct 05, 2021 at 11:16:18AM -0400, Vivek Goyal wrote:
> > > On Tue, Oct 05, 2021 at 01:22:58PM +0100, Stefan Hajnoczi wrote:
> > > > On Thu, Sep 30, 2021 at 11:30:37AM -0400, Vivek Goyal wrote:
> > > > > g_usleep() calls nanosleep() and that now seems to call clock_nan=
osleep()
> > > > > syscall. Now these patches are making use of g_usleep(). So add
> > > > > clock_nanosleep() to list of allowed syscalls.
> > > > >=20
> > > > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > > > ---
> > > > >  tools/virtiofsd/passthrough_seccomp.c | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >=20
> > > > > diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtio=
fsd/passthrough_seccomp.c
> > > > > index cd24b40b78..03080806c0 100644
> > > > > --- a/tools/virtiofsd/passthrough_seccomp.c
> > > > > +++ b/tools/virtiofsd/passthrough_seccomp.c
> > > > > @@ -117,6 +117,7 @@ static const int syscall_allowlist[] =3D {
> > > > >      SCMP_SYS(writev),
> > > > >      SCMP_SYS(umask),
> > > > >      SCMP_SYS(nanosleep),
> > > > > +    SCMP_SYS(clock_nanosleep),
> > > >=20
> > > > This patch can be dropped once sleep has been replaced by a condvar=
.
> > >=20
> > > There is another sleep in do_pool_destroy() where we are waiting
> > > for all current threads to exit.
> > >=20
> > > do_pool_destroy() {
> > >     g_usleep(10000);
> > > }
> >=20
> > That won't be necessary if there's a way to avoid the thread pool :).
> > See my other reply about closing the OFD instead of using signals to
> > cancel blocking fcntl(2).
>=20
> Hi Stefan,
>=20
> I responded to that email already. man fnctl does not say anything
> about closing fd will unblock the waiter with -EINTR and I had a=20
> quick look at kernel code and did not find anything which suggested
> closing fd will unblock current waiters.
>=20
> So is this something you know works or you want me to try and see
> if it works?

Thanks for testing it!

Stefan

--pDFxbfaz984+NjYw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFdefkACgkQnKSrs4Gr
c8jUBgf+N9IJH4S4Tlyyv5GPZHHa88XFtkfoZEMfLVHBmE5CNM4z66bFuGGMZsLR
YiR5Vg0wxHqhT4ixs9M38kXCjWLGtgoXqJhRvMWsvgjK5jOLSesivwSPktfOTwxf
I9RkBgyBFxIMCNGRrxLmlpBU8jGX1OOE2D8Vi6KAbm3gVk6kE+rrlGIOL4mi3qvv
o8gaVhIQNeZHZh53z8ayZT6GK3XN4/u7K4SjKAWlfRkFLUD9txN1ojfJPcd/NU9B
tlUDy11szZqJI+OSRU9Mf4+isPy6VT9RI3oxKYB3mYTH9beH9mzzUHrn5115v9Gx
dvTWeTKUPphOJz1Vm2fx+Aoo37rAfg==
=J/vs
-----END PGP SIGNATURE-----

--pDFxbfaz984+NjYw--


