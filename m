Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854DF36399F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 05:11:09 +0200 (CEST)
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYKJY-0000IE-Ju
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 23:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYKGP-0006rR-Fb; Sun, 18 Apr 2021 23:07:53 -0400
Received: from ozlabs.org ([203.11.71.1]:52311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYKGL-00051c-Pv; Sun, 18 Apr 2021 23:07:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNsFD25l3z9vFw; Mon, 19 Apr 2021 13:07:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618801664;
 bh=w2UaCUrwMSDTeRtzF21Fd2RxFtLOu1xUGwpvcG2RF2o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hd5dC4rMMSiD5WlJK+uZ7FgCOAbseeKpfaDowCWZeWafQh1tYvgOFOJ0QFwQt4Pi3
 O6Ee6qnQeTLGaR/SeI0OoWVkswZwUh8cKZgqKCSiDgpljNHz+C4EnPH25SAQ4yhB+0
 n+cRlT0vpjbCTIJXTj0utbjfGzi/PRtW0vrPRWlA=
Date: Mon, 19 Apr 2021 11:13:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 1/6] device_tree: Add qemu_fdt_add_path
Message-ID: <YHzZJvH/9CiYWia4@yekko.fritz.box>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-2-wangyanan55@huawei.com>
 <YHkYD+cCl9/GCxwJ@yekko.fritz.box>
 <cd3408c2-6025-7a44-bbf6-d675467c5749@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8G0E95ZjzJYq2SwN"
Content-Disposition: inline
In-Reply-To: <cd3408c2-6025-7a44-bbf6-d675467c5749@huawei.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8G0E95ZjzJYq2SwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 17, 2021 at 10:36:20AM +0800, wangyanan (Y) wrote:
> Hi David,
>=20
> On 2021/4/16 12:52, David Gibson wrote:
> > On Tue, Apr 13, 2021 at 04:07:40PM +0800, Yanan Wang wrote:
> > > From: Andrew Jones <drjones@redhat.com>
> > >=20
> > > qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except
> > > it also adds any missing subnodes in the path. We also tweak
> > > an error message of qemu_fdt_add_subnode().
> > >=20
> > > We'll make use of this new function in a coming patch.
> > >=20
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > ---
> > >   include/sysemu/device_tree.h |  1 +
> > >   softmmu/device_tree.c        | 45 +++++++++++++++++++++++++++++++++=
+--
> > >   2 files changed, 44 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tre=
e.h
> > > index 8a2fe55622..ef060a9759 100644
> > > --- a/include/sysemu/device_tree.h
> > > +++ b/include/sysemu/device_tree.h
> > > @@ -121,6 +121,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const ch=
ar *path);
> > >   uint32_t qemu_fdt_alloc_phandle(void *fdt);
> > >   int qemu_fdt_nop_node(void *fdt, const char *node_path);
> > >   int qemu_fdt_add_subnode(void *fdt, const char *name);
> > > +int qemu_fdt_add_path(void *fdt, const char *path);
> > >   #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)      =
           \
> > >       do {                                                           =
           \
> > > diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> > > index 2691c58cf6..8592c7aa1b 100644
> > > --- a/softmmu/device_tree.c
> > > +++ b/softmmu/device_tree.c
> > > @@ -541,8 +541,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *n=
ame)
> > >       retval =3D fdt_add_subnode(fdt, parent, basename);
> > >       if (retval < 0) {
> > > -        error_report("FDT: Failed to create subnode %s: %s", name,
> > > -                     fdt_strerror(retval));
> > > +        error_report("%s: Failed to create subnode %s: %s",
> > > +                     __func__, name, fdt_strerror(retval));
> > >           exit(1);
> > >       }
> > > @@ -550,6 +550,47 @@ int qemu_fdt_add_subnode(void *fdt, const char *=
name)
> > >       return retval;
> > >   }
> > > +/*
> > > + * Like qemu_fdt_add_subnode(), but will add all missing
> > > + * subnodes in the path.
> > > + */
> > > +int qemu_fdt_add_path(void *fdt, const char *path)
> > > +{
> > > +    char *dupname, *basename, *p;
> > > +    int parent, retval =3D -1;
> > > +
> > > +    if (path[0] !=3D '/') {
> > > +        return retval;
> > > +    }
> > > +
> > > +    parent =3D fdt_path_offset(fdt, "/");
> > Getting the offset for "/" is never needed - it's always 0.
> Thanks, will fix it.
> > > +    p =3D dupname =3D g_strdup(path);
> > You shouldn't need the strdup(), see below.
> >=20
> > > +
> > > +    while (p) {
> > > +        *p =3D '/';
> > > +        basename =3D p + 1;
> > > +        p =3D strchr(p + 1, '/');
> > > +        if (p) {
> > > +            *p =3D '\0';
> > > +        }
> > > +        retval =3D fdt_path_offset(fdt, dupname);
> > The fdt_path_offset_namelen() function exists *exactly* so that you
> > can look up partial parths without having to mangle your input
> > string.  Just set the namelen right, and it will ignore anything to
> > the right of that.
> Function fdt_path_offset_namelen() seems more reasonable.
>=20
> After we call qemu_fdt_add_path() to add "/cpus/cpu-map/socket0/core0"
> successfully,
> if we want to add another path like "/cpus/cpu-map/socket0/core1" we will
> get the error
> -FDT_ERR_NOTFOUND for each partial path. But actually
> "/cpus/cpu-map/socket0"
> already exists, so by using fdt_path_offset_namelen() with right namelen =
we
> can avoid
> the error retval for this part.

I don't quite follow what you're saying here.  AFAICT your logic was
correct - it just involved a lot of mangling the given path (adding
and removing \0s) which becomes unnecessary with
fdt_path_offset_namelen().

> > > +        if (retval < 0 && retval !=3D -FDT_ERR_NOTFOUND) {
> > > +            error_report("%s: Invalid path %s: %s",
> > > +                         __func__, path, fdt_strerror(retval));
> > If you're getting an error other than FDT_ERR_NOTFOUND here, chances
> > are it's not an invalid path, but a corrupted fdt blob or something
> > else.
>=20
> Right, there can be variable reasons for the fail in addition to the inva=
lid
> path.
>=20
> > > +            exit(1);
> > > +        } else if (retval =3D=3D -FDT_ERR_NOTFOUND) {
> > > +            retval =3D fdt_add_subnode(fdt, parent, basename);
> > > +            if (retval < 0) {
> > > +                break;
> > > +            }
> I found another question here. If path "/cpus/cpu-map/socket0/core0" has
> already
> been added, when we want to add another path "/cpus/cpu-map/socket0/core1"
> and go here with retval =3D fdt_add_subnode(fdt, parent, "cpus"), then re=
tval
> will
> be -FDT_ERR_EXISTS, but we can't just break the loop in this case.
>=20
> Am I right of the explanation ?

Not exactly.  If you called that fdt_add_subnode() in that case you
would get FDT_ERR_EXISTS.  However, because the previous
fdt_path_offset() has returned -FDT_ERR_NOTFOUND, you've already
established that the partial path doesn't exist, so if you got an
FDT_ERR_EXISTS here something has gone very strangely wrong (such as
concurrent access to the flat tree, which would very likely corrupt
it).

Note that the repeated use of fdt_path_offset() in this function will
repeatedly rescan the whole fdt from the beginning.  If you're
concerned about performance (which you might well not be), then a more
efficient approach would be to take your input path component by
component and use fdt_subnode_offset() directly.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8G0E95ZjzJYq2SwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB82SQACgkQbDjKyiDZ
s5JDGQ/7Bw68dswDolWwWE40+GPvT7OzbEAkm4mLenyi/WZblSUwG7adnvjJJcd9
DbfhR3L8z+NwfkklduAqkE8iVzMZJwfZmuB78p7aZ4JwllaZUP8CN2GkSFdY92mg
luFThSxNbXOzksvDi9ou1QawrAAeRNiQmNVpNM33veoT59+3CRikeNCL7x+4HTpB
CmyETwb1+FhraVhG98DMswj5pjtzt8cdqks4hwg9dKmr/I43N1c+pfcfjPe2h0on
Uoe+Le8bEGG4t0a7wpD/pJD1s5tK2umKtACTHaNzzLea+uaGUTLBXJBUgQEwmkcS
ojCVrVVtxr9FYdQkTVdsqPE324eYFRQuOByulpB66jHirCxGwQA9qmnozj2XjZ4h
VJdDWWarbu+mTmysey3wAKg9nsOLuNWnUn6jSj6GQHdKUpX1fJwNR3xu8Kx7Wt62
SdYt/D/vlPINQeagL34ptVEAQTkirhiXf5uHoREqEFb4EcW3PzjJCoStWAj89htd
lsEcdNqHD4MXCNtHYT3La+yVqKpq20+gsRl/1Zoa/BmS3KJMfRhdTsWOTEcGBY0S
DsGkJLUAT+fZfHzv7c4MhUaJ6j0zm5fuTGRzLnPhELWJDL/gdAdnHRDetU9p0LaK
EG7EwjIDIG+doSqf2vBkCGfSudv4HfSADGylwUv+oNt6KX6ehh8=
=Y8lR
-----END PGP SIGNATURE-----

--8G0E95ZjzJYq2SwN--

