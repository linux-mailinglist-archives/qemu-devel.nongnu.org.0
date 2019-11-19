Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DDA1023A5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 12:54:13 +0100 (CET)
Received: from localhost ([::1]:44388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX25E-0004W4-JJ
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 06:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52017)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iX243-000456-TO
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:53:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iX242-00023a-W3
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:52:59 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:41749)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1iX242-00022Y-JG
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:52:58 -0500
Received: by mail-wr1-x443.google.com with SMTP id b18so22032463wrj.8
 for <qemu-devel@nongnu.org>; Tue, 19 Nov 2019 03:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k97L0J/3m5yO1SwyOhBog45WFbZSBao0+YgZmehL6E8=;
 b=bNZcP5V7xgGLLQ3BNppRnitItGJA9ynYprtfdNRILSZzVGZ2QRZAT2wtyM6n8Hcr4P
 soIhHrJE+SDcKFC07ZMywrjAeY2xCwxz8UCH3K5ZWg8TKHasUmUuMLOXYF1PAWr0ILSY
 eC62e6Ic4pIjntSG+TsFveKgJM8LRgVZLSR4fO4bNcCTcsuTBLvCRMIZWtxKKstp2Hcp
 77asuPPF20TG2QwPMJ2alkvbdF9I33+5qijw5qKRRDvo1G5mZ/K26P8LvPwFeT+zIhXx
 PBS9+LDtQoOpewOoABo1sHHyvMEVageHE05vvliOH3AnI/60TxbAYMXnuD1JaakZ1lDl
 WhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k97L0J/3m5yO1SwyOhBog45WFbZSBao0+YgZmehL6E8=;
 b=X0TJrIuN/NhCzLWtfAPqsuhnkgf9IpUwkJrzESpQIsAzhbT2DeA75YDpBZn+BJr3bU
 YK521RaH09j7FNgvOAT6QS5bPXtwJgrpqA+rHAh/0FyDhouLwIWRcB8LSMTApCJBw/qk
 M5bmr3f1i5b24/Zklht5j1wegF4Q3mVo+/WblSOdPwAsAZ4/9Ff59MIBVK8bn6CVIzOE
 /+39kS5SXjwmMk1+xhy44OIfGFC1duFl87G05o0bqfL2EB+fOvbrkhtwo/HL34JZZWvi
 DnPGVT1NvoI9rGQ1GtoPARMH8+YfC2ZlcFRJGpOUbELIH4ZThgbRx/fGy+bGSf65g2JF
 nF4w==
X-Gm-Message-State: APjAAAXnea3kM8GhcXC9CEhRGQUfS4lgutExdV6Y8+fHFBMHntdDOD10
 JUgkezK5gSCVzyQjTVPD966mqWoJTPBv4QC47GM=
X-Google-Smtp-Source: APXvYqzSVu/hQLIxmnYcPCu0HTwwQBVBFLfYFIR3DjrlrmfAo6ikvN2rCmyubmTaqH5nM5WVq62+DK0/7w2ya4pxFkU=
X-Received: by 2002:adf:ed4e:: with SMTP id u14mr37789191wro.132.1574164376372; 
 Tue, 19 Nov 2019 03:52:56 -0800 (PST)
MIME-Version: 1.0
References: <20191119111626.112206-1-stefanha@redhat.com>
In-Reply-To: <20191119111626.112206-1-stefanha@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 19 Nov 2019 15:52:43 +0400
Message-ID: <CAJ+F1C+1z9ikbPHsU+XOYvMxsxvR8h-ReS1-9xUvMn2vOqxQ3w@mail.gmail.com>
Subject: Re: [PATCH] vhost-user-input: use free(elem) instead of g_free(elem)
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 19, 2019 at 3:16 PM Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>
> The virtqueue element returned by vu_queue_pop() is allocated using
> malloc(3) by virtqueue_alloc_element().  Use the matching free(3)
> function instead of glib's g_free().
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  contrib/vhost-user-input/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/m=
ain.c
> index 449fd2171a..ef4b7769f2 100644
> --- a/contrib/vhost-user-input/main.c
> +++ b/contrib/vhost-user-input/main.c
> @@ -77,7 +77,7 @@ static void vi_input_send(VuInput *vi, struct virtio_in=
put_event *event)
>          len =3D iov_from_buf(elem->in_sg, elem->in_num,
>                             0, &vi->queue[i].event, sizeof(virtio_input_e=
vent));
>          vu_queue_push(dev, vq, elem, len);
> -        g_free(elem);
> +        free(elem);
>      }
>
>      vu_queue_notify(&vi->dev.parent, vq);
> @@ -153,7 +153,7 @@ static void vi_handle_sts(VuDev *dev, int qidx)
>                           0, &event, sizeof(event));
>          vi_handle_status(vi, &event);
>          vu_queue_push(dev, vq, elem, len);
> -        g_free(elem);
> +        free(elem);
>      }
>
>      vu_queue_notify(&vi->dev.parent, vq);
> --
> 2.23.0
>
>


--=20
Marc-Andr=C3=A9 Lureau

