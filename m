Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3653F204E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 20:59:54 +0200 (CEST)
Received: from localhost ([::1]:55756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGnGa-00042J-NY
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 14:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>)
 id 1mGnFV-0003FL-9k; Thu, 19 Aug 2021 14:58:45 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:41580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>)
 id 1mGnFT-0006P8-2y; Thu, 19 Aug 2021 14:58:44 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2A9E520132;
 Thu, 19 Aug 2021 18:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629399520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kEV1PsGc31ugjk97lnzkYmsGornHvB3LKH3jqaT32Sg=;
 b=O4gP3UrK0kThi9pfW2DgUtsop2AleHiDG72XPHsApnPcPTs5TcI0LlOtbiXLBG+ksOXQoj
 TuZJB1jrjKUB0UL7anVsYHAL4De5mJDh+GZIgP/sz6j7rSqwfdch+DKC81UqF86MWT0qhX
 S8Ho2SY4e8x0eeG/g93l6Vmgt/sTRjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629399520;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kEV1PsGc31ugjk97lnzkYmsGornHvB3LKH3jqaT32Sg=;
 b=+Z0SGqcfel7lUWv9ntIj8YE/TtD+OEn+670dIeQDN0BG8JLlzt7toJwPbRcm3DBnFFEvWo
 tA5UhECLoRYx6wCA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 90C5D13A30;
 Thu, 19 Aug 2021 18:58:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id kTdbE96pHmFuRgAAGKfGzw
 (envelope-from <jziviani@suse.de>); Thu, 19 Aug 2021 18:58:38 +0000
Date: Thu, 19 Aug 2021 15:58:35 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] qemu-img: Allow target be aligned to sector size
Message-ID: <YR6p25VvIzERBLBi@pizza>
References: <20210819101200.64235-1-hreitz@redhat.com> <YR5rWv4h+8QuyQGI@pizza>
 <15930d90-ef66-103a-5ed5-549a08d7a559@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="84lWwKLKaRt9j7UE"
Content-Disposition: inline
In-Reply-To: <15930d90-ef66-103a-5ed5-549a08d7a559@redhat.com>
Received-SPF: pass client-ip=195.135.220.29; envelope-from=jziviani@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--84lWwKLKaRt9j7UE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 19, 2021 at 05:14:30PM +0200, Hanna Reitz wrote:
> On 19.08.21 16:31, Jose R. Ziviani wrote:
> > Hello Hanna,
> >=20
> > On Thu, Aug 19, 2021 at 12:12:00PM +0200, Hanna Reitz wrote:
> > > We cannot write to images opened with O_DIRECT unless we allow them to
> > > be resized so they are aligned to the sector size: Since 9c60a5d1978,
> > > bdrv_node_refresh_perm() ensures that for nodes whose length is not
> > > aligned to the request alignment and where someone has taken a WRITE
> > > permission, the RESIZE permission is taken, too).
> > >=20
> > > Let qemu-img convert pass the BDRV_O_RESIZE flag (which causes
> > > blk_new_open() to take the RESIZE permission) when using cache=3Dnone=
 for
> > > the target, so that when writing to it, it can be aligned to the targ=
et
> > > sector size.
> > >=20
> > > Without this patch, an error is returned:
> > >=20
> > > $ qemu-img convert -f raw -O raw -t none foo.img /mnt/tmp/foo.img
> > > qemu-img: Could not open '/mnt/tmp/foo.img': Cannot get 'write'
> > > permission without 'resize': Image size is not a multiple of request
> > > alignment
> > >=20
> > > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1994266
> > > Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> > > ---
> > > As I have written in the BZ linked above, I am not sure what behavior=
 we
> > > want.  It can be argued that the current behavior is perfectly OK
> > > because we want the target to have the same size as the source, so if
> > > this cannot be done, we should just print the above error (which I th=
ink
> > > explains the problem well enough that users can figure out they need =
to
> > > resize the source image).
> > >=20
> > > OTOH, it is difficult for me to imagine a case where the user would
> > > prefer the above error to just having qemu-img align the target image=
's
> > > length.
> > This is timely convenient because I'm currently investigating an issue =
detected
> > by a libvirt-tck test:
> >=20
> > https://gitlab.com/libvirt/libvirt-tck/-/blob/master/scripts/qemu/200-q=
cow2-single-backing-file.t
> >=20
> > It fails with the same message:
> > qemu-system-x86_64: -device virtio-blk-pci,bus=3Dpci.0,addr=3D0x3,drive=
=3Dlibvirt-1-format,id=3Dvirtio-disk1,write-cache=3Don: Cannot get 'write' =
permission without 'resize': Image size is not a multiple of request alignm=
ent
> >=20
> > Libvirt-tck basically wants to make sure that libvirt won't pass a 'bac=
king'
> > argument if we force a QCOW2 image to be interpreted as a RAW image. Bu=
t, the
> > actual size of a (not preallocated) QCOW2 is usually unaligned so we en=
ded up
> > failing at that requirement.
> >=20
> > I crafted a reproducer (tck-main is a QCOW2 image):
> >   $ ./qemu-system-x86_64 \
> >    -machine pc-i440fx-6.0,accel=3Dkvm -m 1024 -display none -no-user-co=
nfig -nodefaults \
> >    -kernel vmlinuz -initrd initrd \
> >    -blockdev driver=3Dfile,filename=3D/var/cache/libvirt-tck/storage-fs=
/tck/tck-main,node-name=3Da,cache.direct=3Don \
> >    -blockdev node-name=3Dname,driver=3Draw,file=3Da \
> >    -device virtio-blk-pci,drive=3Dname
> >=20
> > And if I remove 'cache.direct=3Don' OR if I remove the device virtio-bl=
k-pci I
> > don't hit the failure.
> >=20
> > In order to fix the libvirt-tck test case, I think that creating a prea=
llocated
> > QCOW2 image is the best approach, considering their test case goal. But=
, if you
> > don't mind, could you explain why cache.direct=3Don doesn't set resize =
permission
> > with virtio-blk-pci?
>=20
> Well, users only take the permissions they need.=C2=A0 Because the device=
 doesn=E2=80=99t
> actively want to resize the disk, it doesn=E2=80=99t take the permission =
(because
> other simultaneous users might not share that permission, and so taking m=
ore
> permissions than you need may cause problems).
>=20
> So the decision whether to take the permission or not is a tradeoff.=C2=
=A0 I
> mean, there=E2=80=99s always a work-around: The error message tells you t=
hat the
> image is not aligned to the request alignment, so you can align the image
> size manually.=C2=A0 The question is whether taking the permissions may be
> problematic, and whether the user can be expected to align the image size.
>=20
> (And we also need to keep in mind that this case is extremely rare. I don=
=E2=80=99t
> think that users in practice will ever have images that are not 4k-aligne=
d.=C2=A0
> What the test is doing is of course something that would never happen in a
> practical set-up, in fact, I believe attaching a qcow2 image as a raw ima=
ge
> to a VM is something that would usually be considered dangerous from a
> security perspective.[1])
>=20
> For qemu-img convert (i.e. for this patch), I decided that it is extremely
> unlikely there are concurrent users for the target, so I can=E2=80=99t im=
agine
> taking more permissions would cause problems.=C2=A0 The only downside I c=
ould see
> is that the target image would be larger than the source image, but I thi=
nk
> that is still the outcome that users want.
>=20
> On the other side, applying the work-around may be problematic for users:
> The source image of qemu-img convert shouldn=E2=80=99t have to be writabl=
e.=C2=A0 So
> resizing it (just so it can be converted to be stored on a medium with 4k
> sector size) may actually be impossible for the user.
>=20
> Now, for the virtio-blk case, that is different.=C2=A0 If you=E2=80=99re =
willing to apply
> the work-around, then you don=E2=80=99t have to do so on an =E2=80=9Cinno=
cent bystander=E2=80=9D
> image.=C2=A0 You have to resize the very image you want to use, i.e. one =
that
> must be writable anyway.=C2=A0 So resizing the image outside of qemu to m=
atch the
> alignment is feasible.
>=20
> OTOH, because this is a live and complete image, it=E2=80=99s entirely po=
ssible that
> there are concurrent users that would block virtio-blk from taking the
> RESIZE permission, so I don=E2=80=99t think we should take it lightly.
>=20
> So I think for the virtio-blk case the weight of pro and contra is very
> different than for qemu-img.=C2=A0 I=E2=80=99m not sure we should take th=
e RESIZE
> permission in that case, especially considering that the example is not a
> real-world one.
>=20
> I think if we really want to improve something for the virtio-blk case, it
> would be to have the error message tell what the request alignment is, and
> to add an error hint like
>=20
> =E2=80=9CTry resizing the image using `qemu-img resize -f {bs->drv->forma=
t_name}
> +{ROUND_UP(length, aligment) - length}`.=E2=80=9D
>=20
> Hanna
>=20
> [1] Just to have it mentioned: Attaching a qcow2 image as a qcow2 image
> should work perfectly fine, because the qcow2 driver takes the RESIZE
> permission.
>=20

Yep, it works perfectly fine. I only get the alignment error because (I thi=
nk)
the RAW driver sees a QCOW2 containing only a few kB of metadata and assumes
it's the whole disk size. Even after some debugging I was not understanding
much about the requirements that apply to that RESIZE permission, which is
clear now.

Thank you SO much for such detailed explanation!

Jose

--84lWwKLKaRt9j7UE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmEeqdcACgkQaJ4wdCKK
F5azjw//VsYzKT96wZNzNXoe2jJ03wqQLLrV08T3+op/QMgbRXgeiJ9FZv2Bii4G
XK8s/ij/IbpUHRAhxA2U1GykiXe+w1ysSXsafq+PcaUrtyAZzqrbKqqNOi2qbNO2
eaTYIGuAyhgSXr5K0BileYyqGwQivhye6Ozh50GzrTa0qFdkjrmL7IYHMHSoW+OF
iEM4AoKNFqWyOzqEE9aEzrxwDo5g2cn7BUXxwMczWouyVGoePIu5gZ5c0WLqXsEE
SwOx6DIl9E/ADq8ZJAp5Xgq35VonjCAY26MBE6UgQcCzLu1OjSsYb4u5vYj5iit+
kzujo/UupG57UZjNZZ1wZ+P+aFIoI0kvuEwxYdcCdIb26drIw3A9vmthEU/Ha6mj
6Yz4A3uZzV2lL/Q9ZqId6ImP+iy8r1Hv3aoed6JKMdctlP06rtLE3K8R+Bhe8d9R
s+64Af6D3gfOqLFqzJBCoa+68W4MXvkHFwHuYjloR4WFUK+gjkDI4r++KbM8pvIi
eHtk1W2C5JHiMrAKqcDJynbTkECqx9ZbylnqKyh+MWBNi9F7/pwlZRXwy7y0MZRW
zNzURMlmcLgPQuPWbNiyIV+HgUDZhcvmQwQz0vgpJ1LI07lLS6db1k0EWEoTH5Da
7Wun1DXSTc9XSPixsOfrbXOV97bHUhP28pFH94/TseSzyezDp+c=
=v9+0
-----END PGP SIGNATURE-----

--84lWwKLKaRt9j7UE--

