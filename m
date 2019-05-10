Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A7419C44
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 13:14:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP3UP-0005RY-7U
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 07:14:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1hP3TN-0005AN-8d
	for qemu-devel@nongnu.org; Fri, 10 May 2019 07:13:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1hP3TM-00072v-BR
	for qemu-devel@nongnu.org; Fri, 10 May 2019 07:13:53 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52092)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1hP3TM-00071y-2c
	for qemu-devel@nongnu.org; Fri, 10 May 2019 07:13:52 -0400
Received: by mail-wm1-x344.google.com with SMTP id o189so7153070wmb.1
	for <qemu-devel@nongnu.org>; Fri, 10 May 2019 04:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=84Uu2+OpbjnvVQglvGhrijU4c/RZ+3vIG2QKTQSr1rA=;
	b=Y/qcIVEVIYbSjyH4ajNrEhifwxdXiM6amXYT6KM1HU1/vkr1rg4pgKezvtvLX5Qen9
	DisY+z8aLrY/i0e9U4MN1LaGnMTUd44V0B4RNhMh8pXeU/aIAYlLzQAgJBYfeKr8ofhe
	aT/9xx5871zoqVfnyW05WaaHIvpTV/xbXu6l5Zl35SPZXK6pymJPwHmhfELLH7Qbe9br
	wQY9dbE8IfguEfQN34jNxPU2AT+2lT7izKNgEtxzfqEEqz4LGnRl4TbfjG3cyuSy3kIT
	JHFF9gD1cVwVEFnDrU2enyZkHX6Q3XhCLGLO9/MPcDwoHFI2ffypDydr0Dd98JTnOiZz
	ZHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=84Uu2+OpbjnvVQglvGhrijU4c/RZ+3vIG2QKTQSr1rA=;
	b=st7KjcDXEdXOl3X34mWsSN96MkkUtXKfZxMjiVN39QfhaibVqRVKRXOCM8sWhb+RSk
	JJBl3FRAciC4hBCiUACYdw+tm9RVACBXNf8xzm7/CbibKijXSAtTMRgl8t4A9aruSiP9
	iqLqsEi7Yy4JTJ3tXWY/PSa8WlB/PICZRAI5nDRvT9Waibc0UwZpY0l+XLrbAqV8pjru
	y9W85xQhJezTrmmBjZd/UGxSnFOClkQrvbvl1UrbpgF1szBdgGm1wjWC7mz1kxMPOekF
	k54O5KT1bG4NFRTYzyGRM7TzxihB67bmK7cWb3S3i71dKZdiN7duIogBk+QmIUj1onXC
	wVaA==
X-Gm-Message-State: APjAAAWkcaSU2tYdEq+YQPZw6N7kRUkcVFudb5Q0dnEpsHDVLcnLfG6G
	HY8PN0lC8dCjMQk1Idr8GM0FVGXYAW6QaIdbgKA=
X-Google-Smtp-Source: APXvYqz+B4KZwzRp3u73+qdFuYFPCQch7OYZ0aldx+zW7KvuSUiGyEYytlXGEjx1EDA9ywbsnkx2BaAxuoxH1EJTF4Q=
X-Received: by 2002:a1c:c1c8:: with SMTP id r191mr5444412wmf.99.1557486830049; 
	Fri, 10 May 2019 04:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190510105137.17481-1-kraxel@redhat.com>
In-Reply-To: <20190510105137.17481-1-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 10 May 2019 13:13:38 +0200
Message-ID: <CAJ+F1CLRLc91-F=8GKR2xtJGPxxeEAsN4PRgH2eZv2m3u3N3UA@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v2 1/2] virtio-input-host-pci: cleanup types
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 10, 2019 at 1:09 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> virtio input is virtio-1.0 only, so we don't need the -transitional and
> -non-transitional variants.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  hw/virtio/virtio-input-host-pci.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/hw/virtio/virtio-input-host-pci.c b/hw/virtio/virtio-input-h=
ost-pci.c
> index 725a51ad30b4..124c4f344742 100644
> --- a/hw/virtio/virtio-input-host-pci.c
> +++ b/hw/virtio/virtio-input-host-pci.c
> @@ -13,7 +13,7 @@
>
>  typedef struct VirtIOInputHostPCI VirtIOInputHostPCI;
>
> -#define TYPE_VIRTIO_INPUT_HOST_PCI "virtio-input-host-pci-base"
> +#define TYPE_VIRTIO_INPUT_HOST_PCI "virtio-input-host-pci"
>  #define VIRTIO_INPUT_HOST_PCI(obj) \
>          OBJECT_CHECK(VirtIOInputHostPCI, (obj), TYPE_VIRTIO_INPUT_HOST_P=
CI)
>
> @@ -31,10 +31,7 @@ static void virtio_host_initfn(Object *obj)
>  }
>
>  static const VirtioPCIDeviceTypeInfo virtio_input_host_pci_info =3D {
> -    .base_name             =3D TYPE_VIRTIO_INPUT_HOST_PCI,
> -    .generic_name          =3D "virtio-input-host-pci",
> -    .transitional_name     =3D "virtio-input-host-pci-transitional",
> -    .non_transitional_name =3D "virtio-input-host-pci-non-transitional",
> +    .generic_name  =3D TYPE_VIRTIO_INPUT_HOST_PCI,
>      .parent        =3D TYPE_VIRTIO_INPUT_PCI,
>      .instance_size =3D sizeof(VirtIOInputHostPCI),
>      .instance_init =3D virtio_host_initfn,
> --
> 2.18.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

