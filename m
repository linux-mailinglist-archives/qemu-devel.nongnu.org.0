Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85103F1BA8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:34:34 +0200 (CEST)
Received: from localhost ([::1]:60684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGj7p-0003X1-QG
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>)
 id 1mGj5U-0001hC-UA; Thu, 19 Aug 2021 10:32:08 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:35466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>)
 id 1mGj5O-0007Es-7z; Thu, 19 Aug 2021 10:32:08 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4008D220A2;
 Thu, 19 Aug 2021 14:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629383518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vGkAIT4j+87pyHJ/puOqjJMlmNR4ilQEE0snxqQ41ZU=;
 b=FQHTqD/LWbUW42QOEXScFxFK38XHJz6fA3KXZ0ZWrnTZ4HBB/jYXxoVZez2NC6XYPYOaup
 Pw1xRF68tQrPGqOB48RF2kw7D2zMPXFwO8cjK8g3UkOESyf7kVzhF7vXM6qhf4/bFq+Kvr
 qJimF80sw+LeLoHCALjsFrcSst5gjVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629383518;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vGkAIT4j+87pyHJ/puOqjJMlmNR4ilQEE0snxqQ41ZU=;
 b=cLwPepPgrFPPNfb9GbN/pHi39Q8FoU5S9vJ7fkMmbI2xNdt4pqky2gAJEmymz9X+tnKwGc
 qhITB+fPxCcoLHBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B9A5D13A10;
 Thu, 19 Aug 2021 14:31:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id mLt/HlxrHmETDAAAGKfGzw
 (envelope-from <jziviani@suse.de>); Thu, 19 Aug 2021 14:31:56 +0000
Date: Thu, 19 Aug 2021 11:31:54 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] qemu-img: Allow target be aligned to sector size
Message-ID: <YR5rWv4h+8QuyQGI@pizza>
References: <20210819101200.64235-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="t1+CDH/9lb9qj1Ji"
Content-Disposition: inline
In-Reply-To: <20210819101200.64235-1-hreitz@redhat.com>
Received-SPF: pass client-ip=195.135.220.28; envelope-from=jziviani@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--t1+CDH/9lb9qj1Ji
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Hanna,

On Thu, Aug 19, 2021 at 12:12:00PM +0200, Hanna Reitz wrote:
> We cannot write to images opened with O_DIRECT unless we allow them to
> be resized so they are aligned to the sector size: Since 9c60a5d1978,
> bdrv_node_refresh_perm() ensures that for nodes whose length is not
> aligned to the request alignment and where someone has taken a WRITE
> permission, the RESIZE permission is taken, too).
>=20
> Let qemu-img convert pass the BDRV_O_RESIZE flag (which causes
> blk_new_open() to take the RESIZE permission) when using cache=3Dnone for
> the target, so that when writing to it, it can be aligned to the target
> sector size.
>=20
> Without this patch, an error is returned:
>=20
> $ qemu-img convert -f raw -O raw -t none foo.img /mnt/tmp/foo.img
> qemu-img: Could not open '/mnt/tmp/foo.img': Cannot get 'write'
> permission without 'resize': Image size is not a multiple of request
> alignment
>=20
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1994266
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> As I have written in the BZ linked above, I am not sure what behavior we
> want.  It can be argued that the current behavior is perfectly OK
> because we want the target to have the same size as the source, so if
> this cannot be done, we should just print the above error (which I think
> explains the problem well enough that users can figure out they need to
> resize the source image).
>=20
> OTOH, it is difficult for me to imagine a case where the user would
> prefer the above error to just having qemu-img align the target image's
> length.

This is timely convenient because I'm currently investigating an issue dete=
cted
by a libvirt-tck test:

https://gitlab.com/libvirt/libvirt-tck/-/blob/master/scripts/qemu/200-qcow2=
-single-backing-file.t

It fails with the same message:
qemu-system-x86_64: -device virtio-blk-pci,bus=3Dpci.0,addr=3D0x3,drive=3Dl=
ibvirt-1-format,id=3Dvirtio-disk1,write-cache=3Don: Cannot get 'write' perm=
ission without 'resize': Image size is not a multiple of request alignment

Libvirt-tck basically wants to make sure that libvirt won't pass a 'backing'
argument if we force a QCOW2 image to be interpreted as a RAW image. But, t=
he
actual size of a (not preallocated) QCOW2 is usually unaligned so we ended =
up
failing at that requirement.

I crafted a reproducer (tck-main is a QCOW2 image):
 $ ./qemu-system-x86_64 \
  -machine pc-i440fx-6.0,accel=3Dkvm -m 1024 -display none -no-user-config =
-nodefaults \
  -kernel vmlinuz -initrd initrd \
  -blockdev driver=3Dfile,filename=3D/var/cache/libvirt-tck/storage-fs/tck/=
tck-main,node-name=3Da,cache.direct=3Don \
  -blockdev node-name=3Dname,driver=3Draw,file=3Da \
  -device virtio-blk-pci,drive=3Dname

And if I remove 'cache.direct=3Don' OR if I remove the device virtio-blk-pc=
i I
don't hit the failure.

In order to fix the libvirt-tck test case, I think that creating a prealloc=
ated
QCOW2 image is the best approach, considering their test case goal. But, if=
 you
don't mind, could you explain why cache.direct=3Don doesn't set resize perm=
ission
with virtio-blk-pci?

Thank you!

> ---
>  qemu-img.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/qemu-img.c b/qemu-img.c
> index 908fd0cce5..d4b29bf73e 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -2628,6 +2628,14 @@ static int img_convert(int argc, char **argv)
>          goto out;
>      }
> =20
> +    if (flags & BDRV_O_NOCACHE) {
> +        /*
> +         * If we open the target with O_DIRECT, it may be necessary to
> +         * extend its size to align to the physical sector size.
> +         */
> +        flags |=3D BDRV_O_RESIZE;
> +    }
> +
>      if (skip_create) {
>          s.target =3D img_open(tgt_image_opts, out_filename, out_fmt,
>                              flags, writethrough, s.quiet, false);
> --=20
> 2.31.1
>=20
>=20

--t1+CDH/9lb9qj1Ji
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmEea1MACgkQaJ4wdCKK
F5ZIWQ/8CkzuGecri+jycKRo5x7aOb44ZA2YCznqKvG+vfzB7yemSLFMsYXbyI4m
mb1Zqa8HDgwc32utoUXlVaSJQsp83Usqge3fp/OtOrs8Ri1dVwwQSEF/WcLkk6Kd
9Di/BWRPsKO3gpwSWtgcN43K+Pcu96BRlxRf37Y1ST5C9QzYcwu/dv4/iLd12s2F
9pEIt1PAGI/+Y7NvRE99lHlJqCDc6yLfPZLS3IspDXEvEGHhs4SxQpI+9Ki4RSUy
Ryg3oirwAwdYL+Env9kMqNmLp8C7LCF8t6Ug+sSF7OS5aglONM12IuyWp34ECZ0P
JbLalbR9hCtR6QrXpT7dHr1CxfTV6yVIg39DoGkjen6SBVqo7wuwb+KgdO+/XiVi
D7ij1XvfoSwlXqHDCAEcAXEp/hZA9kFUpMTsbngZPePbFeSj9Rk4VkoQAHWpnA2X
ES9IZ53a3JfufBdYRl/Ejd3K2f6PmluqUC9eYtwMxRqszgI36cKILvFlB/p2xUJC
WUlI/jt+AqYpB5K3py2yIVzBR85aae8mf43ngFS06zxJp+9LUtbxWEUJIYudrC1x
LR5FvBvA5yaFWVCDF2RMODUinHMamkEB0hUG97nrXoMVOXnwvp0wpBnglDZulBvd
BUbJgPWJbTRDq7m42Oj84FsqGGWOyFJEpn7K1TYgQhdob2Jrx9s=
=/XG/
-----END PGP SIGNATURE-----

--t1+CDH/9lb9qj1Ji--

