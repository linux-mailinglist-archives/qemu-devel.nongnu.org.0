Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC73110E4DC
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 04:28:39 +0100 (CET)
Received: from localhost ([::1]:58424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibcO6-0001Ns-Ck
	for lists+qemu-devel@lfdr.de; Sun, 01 Dec 2019 22:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37906)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1ibcNH-0000tk-L6
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 22:27:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1ibcNG-0001LV-M9
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 22:27:47 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45508)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ibcNG-0001KM-Fu
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 22:27:46 -0500
Received: by mail-wr1-x442.google.com with SMTP id j42so16486485wrj.12
 for <qemu-devel@nongnu.org>; Sun, 01 Dec 2019 19:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6DrhXA32SLkGKTmIsSabnIpn41gn+qBQSq6Oxjn8KpQ=;
 b=QmxRj4a9FvC6inQ3PGyrXNC1dgi08F1HaslCuKIQREvKxI7oMbF3fKQkQcoa4dezro
 oGB998zNzKAQC8czxQckJlO1asoWrVTEbEtMwTiAeuwJzM8jJ6NQzyWxT6srMCQrPhS+
 bsXY2sOgGRapFHS9KAC0PA/M9UReS+OdvH61EmrgILmsz8LcCULDLNnBJ7PGwUiu1g1G
 kQHAo0VuZm4IVFzfM6DhZHj/yru7SJLUL+hIM9enoTkJkrS5Pmhw5gSNW7ItbQqGj4FM
 0UAFN5DDvzUVJdeqTHiOKqpxoLkI21VYq0/TKOezBcIHTKxF/i6rzWOfYcuzQV2Ls1KJ
 mOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6DrhXA32SLkGKTmIsSabnIpn41gn+qBQSq6Oxjn8KpQ=;
 b=Q5hNlm1lepegJk8IoCxW6gUotaVMHOjtXB0DN0IIcvejVJ6e9R99GWBwne2TZyXMtw
 +xzeUAsnEEb/xQvsf/WgeP7GW9of5p1EUTTJgRotyBOIcTWDtSEUwDtbFnhwgW5kXYKN
 UofNbr++OMRpPP+oJP42QqH6vkKkC8CPG7A3ZqvTgUHiZwOh6hUVtWB8LsN3uKagFaYJ
 SDrXb9wbDqhWKZzN5LkjoW3VnBXVt6b0ubPD+cnAF362nzRzNyJD2FU14Hly6/a0QZ5T
 LYTPSAS5e86iJ2qwHs1RX+R2HKYWpxLASK+dBHV9QBMoRiDwhDFsD/JyD4hFH5yDmgul
 yfEw==
X-Gm-Message-State: APjAAAXoVL9gzXNCfOa1NZyi/awcx1Vpnsrw61cFYSCrle9+3wRb7K9o
 qtotrrfXM5a4/tH/oGMke5Upn1wwIrbLfJU/RA0=
X-Google-Smtp-Source: APXvYqxrqzxow1i8u8Zt2dvZenhXJm/Q6jkrjQketVclFXj5qAnssXVNCr8wCgecK78/8fCsnakQ/6aTjeN70q0D4D8=
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr5385039wrw.370.1575257264791; 
 Sun, 01 Dec 2019 19:27:44 -0800 (PST)
MIME-Version: 1.0
References: <1575249568-52136-1-git-send-email-pannengyuan@huawei.com>
In-Reply-To: <1575249568-52136-1-git-send-email-pannengyuan@huawei.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 2 Dec 2019 07:27:31 +0400
Message-ID: <CAJ+F1CJE4nHxjOW3NuHVLMGBJbp07X2ZoEVbXCnEmz4r8--sbw@mail.gmail.com>
Subject: Re: [PATCH] virtio-input: fix memory leak in
 virtio_input_device_unrealize()
To: pannengyuan@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: liyiting@huawei.com, zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 2, 2019 at 5:20 AM <pannengyuan@huawei.com> wrote:
>
> From: PanNengyuan <pannengyuan@huawei.com>
>
> vdev->vq[i] is forgot to cleanup in
> virtio_input_device_unrealize, the memory leak stack is as bellow:
>
> Direct leak of 3584 byte(s) in 1 object(s) allocated from:
>     #0 0x7f84a49f6560 in calloc (/usr/lib64/libasan.so.3+0xc7560)
>     #1 0x7f84a3b3e015 in g_malloc0 (/usr/lib64/libglib-2.0.so.0+0x50015)
>     #2 0x559c0f0b33e7 in virtio_add_queue /mnt/sdb/qemu-4.2.0-rc0/hw/virt=
io/virtio.c:2327
>     #3 0x559c0f205c24 in virtio_input_device_realize /mnt/sdb/qemu-4.2.0-=
rc0/hw/input/virtio-input.c:262
>     #4 0x559c0f0b06a7 in virtio_device_realize /mnt/sdb/qemu-4.2.0-rc0/hw=
/virtio/virtio.c:3504
>     #5 0x559c0f1ba031 in device_set_realized  /mnt/sdb/qemu-4.2.0-rc0/hw/=
core/qdev.c:876
>     #6 0x559c0f32cedd in property_set_bool /mnt/sdb/qemu-4.2.0-rc0/qom/ob=
ject.c:2080
>     #7 0x559c0f3314ee in object_property_set_qobject /mnt/sdb/qemu-4.2.0-=
rc0/qom/qom-qobject.c:26
>
> Direct leak of 3584 byte(s) in 1 object(s) allocated from:
>     #0 0x7f84a49f6560 in calloc (/usr/lib64/libasan.so.3+0xc7560)
>     #1 0x7f84a3b3e015 in g_malloc0 (/usr/lib64/libglib-2.0.so.0+0x50015)
>     #2 0x559c0f0b33e7 in virtio_add_queue /mnt/sdb/qemu-4.2.0-rc0/hw/virt=
io/virtio.c:2327
>     #3 0x559c0f205c3f in virtio_input_device_realize /mnt/sdb/qemu-4.2.0-=
rc0/hw/input/virtio-input.c:263
>     #4 0x559c0f0b06a7 in virtio_device_realize /mnt/sdb/qemu-4.2.0-rc0/hw=
/virtio/virtio.c:3504
>     #5 0x559c0f1ba031 in device_set_realized /mnt/sdb/qemu-4.2.0-rc0/hw/c=
ore/qdev.c:876
>     #6 0x559c0f32cedd in property_set_bool /mnt/sdb/qemu-4.2.0-rc0/qom/ob=
ject.c:2080
>     #7 0x559c0f3314ee in object_property_set_qobject /mnt/sdb/qemu-4.2.0-=
rc0/qom/qom-qobject.c:26
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: PanNengyuan <pannengyuan@huawei.com>

This is already upstream:

commit 509ec36c1e4c559e90115a16403dea8d92dff335
Author: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Date:   Thu Nov 21 13:56:49 2019 +0400

    virtio-input: fix memory leak on unrealize


> ---
>  hw/input/virtio-input.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
> index 51617a5..da94da4 100644
> --- a/hw/input/virtio-input.c
> +++ b/hw/input/virtio-input.c
> @@ -288,6 +288,9 @@ static void virtio_input_device_unrealize(DeviceState=
 *dev, Error **errp)
>              return;
>          }
>      }
> +
> +    virtio_del_queue(vdev, 0);
> +    virtio_del_queue(vdev, 1);
>      virtio_cleanup(vdev);
>  }
>
> --
> 2.7.2.windows.1
>
>
>


--=20
Marc-Andr=C3=A9 Lureau

