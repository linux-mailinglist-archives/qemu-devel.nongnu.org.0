Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8094B5EDBC2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:29:27 +0200 (CEST)
Received: from localhost ([::1]:51704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odVFi-0000u2-Qw
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1odSWI-0004jV-Nt
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1odSWG-0002cs-F6
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664354055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W86nqS16JlvWSTNzoAVxg+EvJ6s67mYaJEwcmQwC0TU=;
 b=F4tN7/J+M+ANGKiXv1Ur49u63SfuM1l4UnhTaiudhtNDMZTNhBofAp0oOc27m8GsUq6ydG
 ix6tKGTjYatmeY4/vaauDq+93/Ugm6XJMNZtN35p/fGqTcHSpy5gj0m9FF1M3K/wAOIvxb
 Bef6SR61x3XaTu9x4qTleAOj9W4IJ7Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-ApHPdFgwO7eBpbJviDF_Xw-1; Wed, 28 Sep 2022 04:33:04 -0400
X-MC-Unique: ApHPdFgwO7eBpbJviDF_Xw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29F542999B55;
 Wed, 28 Sep 2022 08:33:04 +0000 (UTC)
Received: from localhost (unknown [10.33.36.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D33BF1415102;
 Wed, 28 Sep 2022 08:33:03 +0000 (UTC)
Date: Wed, 28 Sep 2022 10:33:40 +0200
From: Sergio Lopez <slp@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Colin Walters <walters@verbum.org>,
 virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] virtiofsd: Any reason why there's not an "openat2"
 sandbox mode?
Message-ID: <20220928083340.eyizwu6mm3cc3bxu@mhamilton>
References: <4362261a-c762-4666-84e2-03c9daa6c4d9@www.fastmail.com>
 <YzMmu3xfOtQwuFUx@redhat.com> <YzMrYAJQeSP2hDSs@redhat.com>
 <CAJh=p+5rQDBJJC8VNGL10KYgDeq-Hg5WK7avONCti03eJGH+ow@mail.gmail.com>
 <798fe353-9537-44fe-a76a-819e8c93abb5@www.fastmail.com>
 <YzNZnPiUqySu6sGh@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lmyp75irfhdzyuhx"
Content-Disposition: inline
In-Reply-To: <YzNZnPiUqySu6sGh@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lmyp75irfhdzyuhx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2022 at 04:14:20PM -0400, Stefan Hajnoczi wrote:
> On Tue, Sep 27, 2022 at 01:51:41PM -0400, Colin Walters wrote:
> >=20
> >=20
> > On Tue, Sep 27, 2022, at 1:27 PM, German Maglione wrote:
> > >
> > >> > Now all the development has moved to rust virtiofsd.
> >=20
> > Oh, awesome!!  The code there looks great.
> >=20
> > > I could work on this for the next major version and see if anything b=
reaks.
> > > But I prefer to add this as a compilation feature, instead of a comma=
nd line
> > > option that we will then have to maintain for a while.
> >=20
> > Hmm, what would be the issue with having the code there by default?  I =
think rather than any new command line option, we automatically use `openat=
2+RESOLVE_IN_ROOT` if the process is run as a nonzero uid.
> >=20
> > > Also, I don't see it as a sandbox feature, as Stefan mentioned, a com=
promised
> > > process can call openat2() without RESOLVE_IN_ROOT.=20
> >=20
> > I'm a bit skeptical honestly about how secure the existing namespace co=
de is against a compromised virtiofsd process.  The primary worry is guest =
filesystem traversals, right?  openat2+RESOLVE_IN_ROOT addresses that.  Plu=
s being in Rust makes this dramatically safer.
> >=20
> > > I did some test with
> > > Landlock to lock virtiofsd inside the shared directory, but IIRC it r=
equires a
> > > kernel 5.13
> >=20
> > But yes, landlock and other things make sense, I just don't see these t=
hings as strongly linked.  IOW we shouldn't in my opinion block unprivilege=
d virtiofsd on more sandboxing than openat2 already gives us.
>=20
> I think openat2(RESOLVE_IN_ROOT) support should be added unless there is
> another unprivileged mechanism that is stronger.
>=20
> The security implications need to be covered in the user documentation
> so people can decide whether using this mode is appropriate.
>=20
> We should continue to explain the difference between a voluntary
> mechanism like openat2(RESOLVE_IN_ROOT) and a mandatory mechanism like
> mount namespaces with pivot_root(2). Rust programs are not immune to
> arbitrary code execution, but it's less likely than with a C program.

I agree. Perhaps we could modify the "none" sandbox mode to use
openat2, if available, and add an "openat2" mode which does basically
the same thing, but bailing out if openat2 is not available.

And explain this clearly in the docs, of course.

Sergio.

--lmyp75irfhdzyuhx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmM0BuMACgkQ9GknjS8M
AjXa9RAAmMn37H5nvrK0KlyhPF0aCUNMuALPhvCLC540vQBIsA6fOI8pNEQmfCuY
coosqUijnp0kW4Pk+O2JdKCYEa1M1ZhX+t7T0rOOEteCt4lw9S3egpQ0K6plVIfC
BRVDWJ/igh7OExX7Hb84gPLM4UzHqtDcE9/0Dm1feNuqu0pZUqK7jT5uVbu7fSeD
dj/+Z8u4SNIxobH0G17IZpTjb6r+P3RrgMplByH4PtqtyMf9oueObrBRm7MQmq8P
bQexURbGmKunHGtled8Zafuw4EB2vbKmTtnQxkV1l//yYmBCZyj74m70Wb3sHda0
6jiTlQbJxKgTlycmTBbtbkAUtcahQFmXEKCVOI2sIZz9JZ3rfwOvYENBARX6iGDU
/c91/fm9jGnmiv7aRTWZNyhlUl/xl7boPFPXe/llF+YzVur/M1UBEdZbFKbpbMj/
/yICFJ4lJQkBPLjB+mIBzo7gfmTchPQ6W/BP6LVoFvGhvcE6dL26x89/8UtdyxQT
zYiHvZgntqJ6MqXhW5Up8HFmShbVrCln4E6WaJmpEVjop7xTOBEp2oX6Ix3vbL9k
yTklajDYWfaRpehNUH9Q5fWOCq79kROEQ3mv75KZTc2ke2kf+x2MUJQwz9T3JRhR
Uq1+7hnLuiXtdDRDiL5oZ5sCxiEqX+znLPt6ao5sAb4p9ANE66A=
=yhfj
-----END PGP SIGNATURE-----

--lmyp75irfhdzyuhx--


