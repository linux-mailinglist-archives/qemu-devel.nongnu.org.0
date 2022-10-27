Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678A560F81A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 14:53:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo2JP-0004eg-PQ; Thu, 27 Oct 2022 08:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antoine.damhet@shadow.tech>)
 id 1oo2Cj-0000Co-0N
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:41:52 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antoine.damhet@shadow.tech>)
 id 1oo2Cd-0008Ny-Dr
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:41:48 -0400
Received: by mail-wr1-x435.google.com with SMTP id g12so1936263wrs.10
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 05:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shadow-tech.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AWNGVQCrDoKSgM53yuEaxycWiGpPtYNcpto4RGghZEU=;
 b=ej3nbXzrhpYqTBFFolRmhZm0iv4UQAF/Zk6ZKec+Pp0x8nJkz7d9d59zimfOQ9e0KY
 FZwumil9MOT633e4d22VOctUg+aS9MPk62oU5+sTCYM0AWGZ5Ch7xy4Rn8z9R3nupl8V
 4P0gc6+htuMWZfNYjk7oZdWvCwtdez6m4dZo88wnbv+kqp4VIJDrU6ee8GUuvVxL+xXI
 XC3pNJ8hmuGMqEfDZuV9diXjrAl2mUdHlYCiEaP1U5zqIBCHTYUVB0nPJpZs1Cab3h3r
 zBHuzywQpX9rN4l88Fnxij14MW0c2CMEEBM/NjRSuYjT0nabqzONydAsxT4YvHQ/0Y8J
 zvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AWNGVQCrDoKSgM53yuEaxycWiGpPtYNcpto4RGghZEU=;
 b=dBVsTw2QFNEv9X0/X0VOk1YxR/vGK+EEXoHFdsDD9Dxo9P/dOFSistuQnmQvlgLpbI
 mxE+ApHKM1ZKUC8roTWnmn21O/6EeWJHHeym5plWo17kDJMcymde+MjIgyKobPjUqOsS
 zJwHj/cM36NPsql0Eypfs3IgyVqQG6vgsYkuyhdW9u71vtAOhq3u1Pqz+nzXDpJm9EVR
 4guzFU62jGrfVla/ogwebKFUQVjLKjGAB5YwNk5cR3Ec7byhKC39WW/TKXfaiez5RKUL
 DBN+TFIOk2gBAEeKm7UyN8AEOnhzyfNnP1RrEhiGD/b3rageEXe0Fxs/BNOwZuGDWJWZ
 h5NQ==
X-Gm-Message-State: ACrzQf32QHb6Ay57Xgq2jH4HJmuME8mmHvNI9a/TH16SCxcAOBJg9oy1
 Bf2y022KN1+jlmVK+PWnnMu3GA==
X-Google-Smtp-Source: AMsMyM7EHzlKyV8XUzYIjjMk7TVh7n9DWwTJfh85PjISYy9pE7V3GeUsdOJG7qGBtb6HsuqcHig0gQ==
X-Received: by 2002:a5d:644b:0:b0:236:862b:9ef1 with SMTP id
 d11-20020a5d644b000000b00236862b9ef1mr7585739wrw.691.1666874501193; 
 Thu, 27 Oct 2022 05:41:41 -0700 (PDT)
Received: from localhost ([185.123.26.202]) by smtp.gmail.com with ESMTPSA id
 t13-20020a5d42cd000000b0023622d65d4bsm1341698wrr.81.2022.10.27.05.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 05:41:40 -0700 (PDT)
Date: Thu, 27 Oct 2022 14:41:40 +0200
From: Antoine Damhet <antoine.damhet@shadow.tech>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] block/block-backend: blk_set_enable_write_cache is IO_CODE
Message-ID: <20221027124140.cdepgecdgrysis5o@tartarus.xdbob.net>
References: <20221027072726.2681500-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="afgdlskus564m43e"
Content-Disposition: inline
In-Reply-To: <20221027072726.2681500-1-eesposit@redhat.com>
Received-SPF: permerror client-ip=2a00:1450:4864:20::435;
 envelope-from=antoine.damhet@shadow.tech; helo=mail-wr1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 27 Oct 2022 08:48:41 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--afgdlskus564m43e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks, it works for us

On Thu, Oct 27, 2022 at 03:27:26AM -0400, Emanuele Giuseppe Esposito wrote:
> blk_set_enable_write_cache() is defined as GLOBAL_STATE_CODE
> but can be invoked from iothreads when handling scsi requests.
> This triggers an assertion failure:
>=20
>  0x00007fd6c3515ce1 in raise () from /lib/x86_64-linux-gnu/libc.so.6
>  0x00007fd6c34ff537 in abort () from /lib/x86_64-linux-gnu/libc.so.6
>  0x00007fd6c34ff40f in ?? () from /lib/x86_64-linux-gnu/libc.so.6
>  0x00007fd6c350e662 in __assert_fail () from /lib/x86_64-linux-gnu/libc.s=
o.6
>  0x000056149e2cea03 in blk_set_enable_write_cache (wce=3Dtrue, blk=3D0x56=
14a01c27f0)
>    at ../src/block/block-backend.c:1949
>  0x000056149e2d0a67 in blk_set_enable_write_cache (blk=3D0x5614a01c27f0,
>    wce=3D<optimized out>) at ../src/block/block-backend.c:1951
>  0x000056149dfe9c59 in scsi_disk_apply_mode_select (p=3D0x7fd6b400c00e "\=
004",
>    page=3D<optimized out>, s=3D<optimized out>) at ../src/hw/scsi/scsi-di=
sk.c:1520
>  mode_select_pages (change=3Dtrue, len=3D18, p=3D0x7fd6b400c00e "\004", r=
=3D0x7fd6b4001ff0)
>    at ../src/hw/scsi/scsi-disk.c:1570
>  scsi_disk_emulate_mode_select (inbuf=3D<optimized out>, r=3D0x7fd6b4001f=
f0) at
>    ../src/hw/scsi/scsi-disk.c:1640
>  scsi_disk_emulate_write_data (req=3D0x7fd6b4001ff0) at ../src/hw/scsi/sc=
si-disk.c:1934
>  0x000056149e18ff16 in virtio_scsi_handle_cmd_req_submit (req=3D<optimize=
d out>,
>    req=3D<optimized out>, s=3D0x5614a12f16b0) at ../src/hw/scsi/virtio-sc=
si.c:719
>  virtio_scsi_handle_cmd_vq (vq=3D0x7fd6bab92140, s=3D0x5614a12f16b0) at
>    ../src/hw/scsi/virtio-scsi.c:761
>  virtio_scsi_handle_cmd (vq=3D<optimized out>, vdev=3D<optimized out>) at
>    ../src/hw/scsi/virtio-scsi.c:775
>  virtio_scsi_handle_cmd (vdev=3D0x5614a12f16b0, vq=3D0x7fd6bab92140) at
>    ../src/hw/scsi/virtio-scsi.c:765
>  0x000056149e1a8aa6 in virtio_queue_notify_vq (vq=3D0x7fd6bab92140) at
>    ../src/hw/virtio/virtio.c:2365
>  0x000056149e3ccea5 in aio_dispatch_handler (ctx=3Dctx@entry=3D0x5614a01b=
abe0,
>    node=3D<optimized out>) at ../src/util/aio-posix.c:369
>  0x000056149e3cd868 in aio_dispatch_ready_handlers (ready_list=3D0x7fd6c0=
9b2680,
>    ctx=3D0x5614a01babe0) at ../src/util/aio-posix.c:399
>  aio_poll (ctx=3D0x5614a01babe0, blocking=3Dblocking@entry=3Dtrue) at
>    ../src/util/aio-posix.c:713
>  0x000056149e2a7796 in iothread_run (opaque=3Dopaque@entry=3D0x56149ffde5=
00) at
>    ../src/iothread.c:67
>  0x000056149e3d0859 in qemu_thread_start (args=3D0x7fd6c09b26f0) at
>    ../src/util/qemu-thread-posix.c:504
>  0x00007fd6c36b9ea7 in start_thread () from /lib/x86_64-linux-gnu/libpthr=
ead.so.0
>  0x00007fd6c35d9aef in clone () from /lib/x86_64-linux-gnu/libc.so.6
>=20
> Changing GLOBAL_STATE_CODE in IO_CODE is allowed, since GSC callers are
> allowed to call IO_CODE.
>=20
> Resolves: #1272
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Tested-by: Antoine Damhet <antoine.damhet@shadow.tech>

> ---
>  block/block-backend.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



--=20
Antoine 'xdbob' Damhet

--afgdlskus564m43e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEArm1WbQx2GmOsfF83AmjLzzljz4FAmNafIAACgkQ3AmjLzzl
jz7amwgAjJcKGKjkZMixFBhmUGrXwg1j7AJaOI0x47Zu3Qg6MCqFkmPyHGtd4gEf
0mOIIS48EmLx/02nnqYP/DTmKyoj0we3T0cCbty3G6C1+Bb/GNjs/tJ28frhnBGM
jw+Cncvrwh0v1bwxoJ37uhC/qr0HmQZJTaYOST5suleOGoxVLXzipn+g95RvApjl
J2SOpsqRDhSkt0M/Yz+69WVoY4jaPg2WoK25r2cu4k/D85BvcForU7+gKfgiJsat
mfvxsDfz2D+/Edyka+mlPUZ/ianpF7g3GWHrXlRhrk8nbF1eBAuRFa6sBHQu2v0w
MhXVmsLONq+gJ+xbPwInHn5jEUfYtA==
=6Dg2
-----END PGP SIGNATURE-----

--afgdlskus564m43e--

