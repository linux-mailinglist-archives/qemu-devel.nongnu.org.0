Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7D918F27E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 11:13:16 +0100 (CET)
Received: from localhost ([::1]:59750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGK55-0006Yd-HV
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 06:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59174)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jGK3w-0005ok-5N
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 06:12:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jGK3u-0002s5-My
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 06:12:03 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:33991)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jGK3u-0002ro-C9
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 06:12:02 -0400
Received: by mail-ot1-x330.google.com with SMTP id j16so12805844otl.1
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 03:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=POhdYwq26Nc9nXBCt8CaD7KplWdJrAEv/Cd23uY2CAM=;
 b=sFRW66XcdzCscUusc7G2aRwg4bZqTLq1Q35ZRr9cqqNRsyj5C6tQKnohgeK7zSrXiB
 3IV2iUUnhlPD/brFiGRapx0/n4gJ0EFZq0YtwubkZSrnhOyU7NqEAjNyNdZY3MjUY1S7
 ByoIAZc1XmN8KGI4CL7GHEDoxbUAEsQVfi8g5i3QpcVHmjrtMlf7A/cBTh1nJHboqGME
 JRDW+rjklLixEKRBALQLIoZdCCZsG+PiUhel/FJWQ/69zB0GyRA5ss+iEAqRC7g4O9RN
 bKV/eP8dV6YVi+jgQpGuA/BAX+/70bXk/bS9tL0B0WOayyszRsMVEikn/tGcBoJtAAJM
 +snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=POhdYwq26Nc9nXBCt8CaD7KplWdJrAEv/Cd23uY2CAM=;
 b=fpjSDU6SrNz5uie3hL547fTlT5hf318vPCEHqvUSWsebzQX80vqRu8zufWTtE+GD9q
 H9KUXcV51+RU4exMxe0/scdvFlrv599MoUiPU0oTj2cVgTEILebxo2OpEr+FaPAM9HpA
 WMRjTRR3xu74Hb91ael65RbYNoEM0veC5hAbgtJKSUrgCT4cg3gQR2UID4JhGK5orHvx
 5CpI9WxvOz8nV0OkIytHLj/iivTxRoW5K43nYpYsYa1URSc4+QYStznnAOdetUPeC91s
 Uso0CG8Nr9vh1qYZZGzAi1w/5F2mvywld3XDB+kCG+OBe7c1Iu6RqCeknGEvd+S+bhIi
 dFew==
X-Gm-Message-State: ANhLgQ0HSGDmwYxPm/MJbSBTn19Ie16rHx5oqSJS7z/HDhIVmj8Shnek
 5LjfpoAl8RbDfsOH8iVfJVF/Tq5tnPMtf+zXWvFuLw==
X-Google-Smtp-Source: ADFU+vugvCakjC478bxtbKV+a2HriGYd6bxws46m6QYC7g0RmJX8cuNG0oDEVvHvJyrMMwKCTF80VhwPOY3Pg87DDdU=
X-Received: by 2002:a05:6830:1f39:: with SMTP id
 e25mr2328456oth.135.1584958321386; 
 Mon, 23 Mar 2020 03:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190529044020.27003-1-kraxel@redhat.com>
 <20190529044020.27003-6-kraxel@redhat.com>
In-Reply-To: <20190529044020.27003-6-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2020 10:11:50 +0000
Message-ID: <CAFEAcA_+3w+ctCE5Bm_LVNi+xWmgSmOudRsSQp0O5OfWkme7MQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 5/9] contrib: add vhost-user-gpu
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::330
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 May 2019 at 05:42, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Add a vhost-user gpu backend, based on virtio-gpu/3d device. It is
> associated with a vhost-user-gpu device.
>
> Various TODO and nice to have items:
> - multi-head support
> - crash & resume handling
> - accelerated rendering/display that avoids the waiting round trips
> - edid support
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Message-id: 20190524130946.31736-6-marcandre.lureau@redhat.com
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Hi; the latest coverity run has spotted a mismatch of
memory allocate/free, where memory allocated with malloc()
is freed with g_free():

> +static void
> +vg_handle_cursor(VuDev *dev, int qidx)
> +{
> +    VuGpu *g =3D container_of(dev, VuGpu, dev.parent);
> +    VuVirtq *vq =3D vu_get_queue(dev, qidx);
> +    VuVirtqElement *elem;
> +    size_t len;
> +    struct virtio_gpu_update_cursor cursor;
> +
> +    for (;;) {
> +        elem =3D vu_queue_pop(dev, vq, sizeof(VuVirtqElement));

vu_queue_pop() returns memory that must be freed with free()
(as documented in its API doc-comment; it calls vu_queue_map_desc()
which calls virtqueue_alloc_element() which calls malloc())...

> +        if (!elem) {
> +            break;
> +        }
> +        g_debug("cursor out:%d in:%d\n", elem->out_num, elem->in_num);
> +
> +        len =3D iov_to_buf(elem->out_sg, elem->out_num,
> +                         0, &cursor, sizeof(cursor));
> +        if (len !=3D sizeof(cursor)) {
> +            g_warning("%s: cursor size incorrect %zu vs %zu\n",
> +                      __func__, len, sizeof(cursor));
> +        } else {
> +            virtio_gpu_bswap_32(&cursor, sizeof(cursor));
> +            vg_process_cursor_cmd(g, &cursor);
> +        }
> +        vu_queue_push(dev, vq, elem, 0);
> +        vu_queue_notify(dev, vq);
> +        g_free(elem);

...but here we free it with g_free(), not free().

Coverity spotted this as CID 1421887. The use of vu_queue_pop()
in vg_handle_ctrl() also seem to have this issue, though Coverity
hasn't caught that one.

Would somebody like to write a patch?

thanks
-- PMM

