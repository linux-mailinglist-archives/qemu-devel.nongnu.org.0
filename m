Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647B8672134
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 16:25:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIAJ9-0000oQ-9S; Wed, 18 Jan 2023 10:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pIAJ0-0000l7-Cm
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:24:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pIAIy-000372-H4
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:24:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674055487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MJanMrED8TpWJG0c+3bb19Ft/BVJdAxOWniR5q2U1so=;
 b=gGCj1bf7YIwQ6eOsUD1BulUFa0u9C3G/sbaTLfLRFqTtEN1RxD2zjANxA1J9zXeL/uhVh6
 qGQ7qtwilkt631p9vNg5ivn/wypftK2IYygjCeGXGpGosbSzmvltH4PriFkI2jcplm2J84
 mjVbizOFDmtCCL463PrzQyhZMES4Hv8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-OKOSwrKQPPea44o4n2hyGQ-1; Wed, 18 Jan 2023 10:24:46 -0500
X-MC-Unique: OKOSwrKQPPea44o4n2hyGQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A563380234E;
 Wed, 18 Jan 2023 15:24:45 +0000 (UTC)
Received: from localhost (unknown [10.39.195.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F2DF492B00;
 Wed, 18 Jan 2023 15:24:44 +0000 (UTC)
Date: Wed, 18 Jan 2023 10:24:43 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Warner Losh <imp@bsdimp.com>,
 qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/3] bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA
 warnings
Message-ID: <Y8gPO9NkppvnJA/y@fedora>
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-3-eesposit@redhat.com>
 <CANCZdfq=F9HJnjX9sGq6w9tzVx2C8e9jOfk2Lfer_mm2bDRP0A@mail.gmail.com>
 <Y8bMBZFqVP+EFzA8@redhat.com>
 <CANCZdfrg+S-EsjzcJe78aWr3pBaESv1+MUkLa-H6i=o-S0LaqQ@mail.gmail.com>
 <Y8bYI4RgV4F5b1ht@redhat.com>
 <c2c62083-1e04-b70c-baac-cf2bf1a21660@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PiOqjy+HgtD+ZX3S"
Content-Disposition: inline
In-Reply-To: <c2c62083-1e04-b70c-baac-cf2bf1a21660@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--PiOqjy+HgtD+ZX3S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2023 at 04:12:09PM +0100, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> Am 17/01/2023 um 18:17 schrieb Kevin Wolf:
> > Am 17.01.2023 um 17:43 hat Warner Losh geschrieben:
> >> On Tue, Jan 17, 2023 at 9:25 AM Kevin Wolf <kwolf@redhat.com> wrote:
> >>
> >>> Am 17.01.2023 um 17:16 hat Warner Losh geschrieben:
> >>>> On Tue, Jan 17, 2023 at 6:52 AM Emanuele Giuseppe Esposito <
> >>>> eesposit@redhat.com> wrote:
> >>>>
> >>>>> QEMU does not compile when enabling clang's thread safety analysis
> >>>>> (TSA),
> >>>>> because some functions create wrappers for pthread mutexes but do
> >>>>> not use any TSA macro. Therefore the compiler fails.
> >>>>>
> >>>>> In order to make the compiler happy and avoid adding all the
> >>>>> necessary macros to all callers (lock functions should use
> >>>>> TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to allusers=
 of
> >>>>> pthread_mutex_lock/pthread_mutex_unlock),
> >>>>> simply use TSA_NO_TSA to supppress such warnings.
> >>>>
> >>>> I'm not sure I understand this quite right. Maybe a clarifying quest=
ion
> >>>> will help me understand: Why is this needed for bsd-user but not
> >>>> linux-user? How are they different here?
> >>>
> >>> FreeBSD's pthread headers include TSA annotations for some functions
> >>> that force us to do something about them (for now: suppress the warni=
ngs
> >>> in their callers) before we can enable -Wthread-safety for the purpos=
es
> >>> where we really want it. Without this, calling functions like
> >>> pthread_mutex_lock() would cause compiler errors.
> >>>
> >>> glibc's headers don't contain such annotations, so the same is not
> >>> necessary on Linux
> >>>
> >>
> >> Thanks Kevin. With that explanation, these patches and their explanati=
on
> >> make perfect sense now. Often when there's a patch to bsd-user but not
> >> linux-user, it's because bsd-user needs to do more in some way (which =
I try
> >> to keep up on).
> >>
> >> In this case, it's because FreeBSD's libc is a bit ahead of the curve.=
 So I
> >> understand why it's needed, and what I need to do next (though I think=
 that
> >> I may have to wait for the rest of qemu to be annotated)...
> >=20
> > I assume that the bsd-user part is actually sufficiently independent
> > that you could do proper annotations there if you want.
> >=20
> > However, be aware that TSA has some serious limitations with C, so you
> > can't express certain things, and it isn't as strict as it could be (in
> > particular, function pointers bypass it). As long as you have global
> > locks (as opposed to locks in structs), it kind of works, though.
> > Certainly better than nothing.
> >=20
> > But it probably means that some of the rest of QEMU may never get the
> > annotations. Also, our primary goal is protecting the block layer, so
> > someone else would have to work on other locks. With checks disabled on
> > individual functions like in this series, it should at least be possible
> > to work on it incrementally.
> >=20
> >> It might be better, though, to put some of this information in the com=
mit
> >> message so it isn't just on the mailing list.
> >=20
> > Yes, I agree. We can tweak the commit messages before merging it.
>=20
> New proposed commit message:
>=20
> bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA warnings in FreeBSD
>=20
> FreeBSD implements pthread headers using TSA (thread safety analysis)
> annotations, therefore when an application is compiled with -Wthread-safe=
ty
> there are some locking/annotation requirements that the user of the
> pthread API has to follow.
>=20
> This will also be the case in QEMU, since bsd-user/mmap.c uses the
> pthread API. Therefore when building it with -Wthread-safety the
> compiler will throw warnings because the functions are not properly
> annotated. We need TSA to be enabled because it ensures
> that the critical sections of an annotated variable are properly
> locked.
>=20
> In order to make the compiler happy and avoid adding all the
> necessary macros to all callers (lock functions should use
> TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to all
> users of pthread_mutex_lock/pthread_mutex_unlock),
> simply use TSA_NO_TSA to supppress such warnings.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>=20
> Same message could be applied to patch 1, substituting bsd-user/mmap
> with util/qemu-thread-posix.

Looks good to me.

Stefan

--PiOqjy+HgtD+ZX3S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPIDzsACgkQnKSrs4Gr
c8g55Qf/Y9FCxQFku4sq+/88OzzEzvXEhBW8+ipxjvJkQW+sTT8TmoK/r0DXQ63A
6APlh9hesq+Z5nTkElcOgg0YLe6ocpWPW13dmO4n5p6RZdtS7lozJ1sAnbcESiVV
fLa3LN2yiBIsorTggZdJ+wAcMBrEYZq0fw7NRN/+Daicahwrlr8LQIOnTIijTi7t
jJYuHky3ADeQPHaXAaIinzw+d/AtWIFRDjjBgNPDGaD4jUVlpXvqbw5+x60bIK+X
swo94ULCCwXZrvwaRMXUIxM7izvH82m4VjwJkdJHfmga4GsriAhbiE0CXaNqMpZK
/zWpPvP7iAsflkej5rQhS2Q5pxTJ4g==
=/G3e
-----END PGP SIGNATURE-----

--PiOqjy+HgtD+ZX3S--


