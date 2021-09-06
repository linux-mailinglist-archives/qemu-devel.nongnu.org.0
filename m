Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92957401EAC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 18:46:41 +0200 (CEST)
Received: from localhost ([::1]:55962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNHlY-0001DG-7P
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 12:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1mNHjp-0000UT-64
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 12:44:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1mNHjm-00043g-A3
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 12:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630946688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=no3YxYmkC7U8U3hHHaQrGt3J0uOMIeyGJar17+sM1Vw=;
 b=ftRYC5IUPQNKqclL/ojva38FPzsozvfePoW1haCYcpZ9g8Dl1QvRsr2Da+xL/ONAXNgbvl
 3O9iHRtzg9nt8MPw61LBqv/XTqlkGkQhBztSiFywG0kVek7xztBRu6iWCCv2YzVieToYXF
 qIyoKCkc3n2gt/zg906d7p1ZyKCNwg8=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-PLW3lHX7Ow-4aLJfmi9kfw-1; Mon, 06 Sep 2021 12:44:47 -0400
X-MC-Unique: PLW3lHX7Ow-4aLJfmi9kfw-1
Received: by mail-pg1-f200.google.com with SMTP id
 a16-20020a63d410000000b00268ebc7f4faso5211305pgh.17
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 09:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=no3YxYmkC7U8U3hHHaQrGt3J0uOMIeyGJar17+sM1Vw=;
 b=SNlnNbGMayG1O1SKzgwKW/HDwt0Gj2MjPFWumLiCkDJZbd5eH7JFOYn1vmunb9NgGH
 N05iBWqgO3PRB2wc3VkS/usLxuqVdVrwjJCJUl771D+QxXZEPx8pybtFPKIzzS8/KnMb
 RD0Hsl6OgTs7k9Kdg8RkN4pc7nmaFMeTZw3TKPuTy/nZhxZjB6GQ4a/IbY0V+mPQdRJy
 2F3Zy3msrgf5CUy8YQWYFgVxUpk4rkvZtoU0mOrt/JDCP1EpjN8EyCH5Yfw2crzGNgNI
 eKzNhDNb9NL+/XPWuRqNOEDFri3hVONHwjP37ZEGs7hUPkZWPOvSPd4QnmL6rCpxzXgp
 qDyg==
X-Gm-Message-State: AOAM532MzK5YVmePbhwgQNfFTGcxSqAulNDCOh3loWbTi3IxXWpx+f10
 YnBmFcqZIv7942yqfj+OU2jqxTls9vKk/qE/HJUJgDWxQAOHSZZhnmIXduGxWbVa1vEuKVOVxyc
 CGZ/J8gx4AnIwpOs+FE81qxw65z7RT8w=
X-Received: by 2002:a17:903:2284:b0:13a:fad:7723 with SMTP id
 b4-20020a170903228400b0013a0fad7723mr10405659plh.54.1630946684942; 
 Mon, 06 Sep 2021 09:44:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzB3DMILVZc4TPpt2vYYT5U/qQidPdb8rEiaqdBXw4BvKzAKWIajAaPKLSnCKXss7/MpEbvzC1wTRhagOKLuSQ=
X-Received: by 2002:a17:903:2284:b0:13a:fad:7723 with SMTP id
 b4-20020a170903228400b0013a0fad7723mr10405633plh.54.1630946684533; Mon, 06
 Sep 2021 09:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210906153103.1661195-1-philmd@redhat.com>
In-Reply-To: <20210906153103.1661195-1-philmd@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Mon, 6 Sep 2021 18:44:33 +0200
Message-ID: <CAA8xKjXkDwPYxSAeRb+2mfHRrbiL_kh9unVkemFXLfF68UXePA@mail.gmail.com>
Subject: Re: [PATCH] hw/display/ati_2d: Fix buffer overflow in ati_2d_blt
 (CVE-2021-3638)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Qiang Liu <qiangliu@zju.edu.cn>, Prasad J Pandit <pjp@fedoraproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Gaoning Pan <pgn@zju.edu.cn>, Ziming Zhang <ezrakiez@gmail.com>,
 Salvatore Bonaccorso <carnil@debian.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 6, 2021 at 5:31 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> When building QEMU with DEBUG_ATI defined then running with
> '-device ati-vga,romfile=3D"" -d unimp,guest_errors -trace ati\*'
> we get:
>
>   ati_mm_write 4 0x16c0 DP_CNTL <- 0x1
>   ati_mm_write 4 0x146c DP_GUI_MASTER_CNTL <- 0x2
>   ati_mm_write 4 0x16c8 DP_MIX <- 0xff0000
>   ati_mm_write 4 0x16c4 DP_DATATYPE <- 0x2
>   ati_mm_write 4 0x224 CRTC_OFFSET <- 0x0
>   ati_mm_write 4 0x142c DST_PITCH_OFFSET <- 0xfe00000
>   ati_mm_write 4 0x1420 DST_Y <- 0x3fff
>   ati_mm_write 4 0x1410 DST_HEIGHT <- 0x3fff
>   ati_mm_write 4 0x1588 DST_WIDTH_X <- 0x3fff3fff
>   ati_2d_blt: vram:0x7fff5fa00000 addr:0 ds:0x7fff61273800 stride:2560 bp=
p:32 rop:0xff
>   ati_2d_blt: 0 0 0, 0 127 0, (0,0) -> (16383,16383) 16383x16383 > ^
>   ati_2d_blt: pixman_fill(dst:0x7fff5fa00000, stride:254, bpp:8, x:16383,=
 y:16383, w:16383, h:16383, xor:0xff000000)
>   Thread 3 "qemu-system-i38" received signal SIGSEGV, Segmentation fault.
>   (gdb) bt
>   #0  0x00007ffff7f62ce0 in sse2_fill.lto_priv () at /lib64/libpixman-1.s=
o.0
>   #1  0x00007ffff7f09278 in pixman_fill () at /lib64/libpixman-1.so.0
>   #2  0x0000555557b5a9af in ati_2d_blt (s=3D0x631000028800) at hw/display=
/ati_2d.c:196
>   #3  0x0000555557b4b5a2 in ati_mm_write (opaque=3D0x631000028800, addr=
=3D5512, data=3D1073692671, size=3D4) at hw/display/ati.c:843
>   #4  0x0000555558b90ec4 in memory_region_write_accessor (mr=3D0x63100003=
9cc0, addr=3D5512, ..., size=3D4, ...) at softmmu/memory.c:492
>
> Commit 584acf34cb0 ("ati-vga: Fix reverse bit blts") introduced
> the local dst_x and dst_y which adjust the (x, y) coordinates
> depending on the direction in the SRCCOPY ROP3 operation, but
> forgot to address the same issue for the PATCOPY, BLACKNESS and
> WHITENESS operations, which also call pixman_fill().
>
> Fix that now by using the adjusted coordinates in the pixman_fill
> call, and update the related debug printf().
>
> Reported-by: Qiang Liu <qiangliu@zju.edu.cn>
> Fixes: 584acf34cb0 ("ati-vga: Fix reverse bit blts")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/display/ati_2d.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
> index 4dc10ea7952..692bec91de4 100644
> --- a/hw/display/ati_2d.c
> +++ b/hw/display/ati_2d.c
> @@ -84,7 +84,7 @@ void ati_2d_blt(ATIVGAState *s)
>      DPRINTF("%d %d %d, %d %d %d, (%d,%d) -> (%d,%d) %dx%d %c %c\n",
>              s->regs.src_offset, s->regs.dst_offset, s->regs.default_offs=
et,
>              s->regs.src_pitch, s->regs.dst_pitch, s->regs.default_pitch,
> -            s->regs.src_x, s->regs.src_y, s->regs.dst_x, s->regs.dst_y,
> +            s->regs.src_x, s->regs.src_y, dst_x, dst_y,
>              s->regs.dst_width, s->regs.dst_height,
>              (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ? '>' : '<'),
>              (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ? 'v' : '^'));
> @@ -180,11 +180,11 @@ void ati_2d_blt(ATIVGAState *s)
>          dst_stride /=3D sizeof(uint32_t);
>          DPRINTF("pixman_fill(%p, %d, %d, %d, %d, %d, %d, %x)\n",
>                  dst_bits, dst_stride, bpp,
> -                s->regs.dst_x, s->regs.dst_y,
> +                dst_x, dst_y,
>                  s->regs.dst_width, s->regs.dst_height,
>                  filler);
>          pixman_fill((uint32_t *)dst_bits, dst_stride, bpp,
> -                    s->regs.dst_x, s->regs.dst_y,
> +                    dst_x, dst_y,
>                      s->regs.dst_width, s->regs.dst_height,
>                      filler);
>          if (dst_bits >=3D s->vga.vram_ptr + s->vga.vbe_start_addr &&
> --
> 2.31.1
>

Tested-by: Mauro Matteo Cascella <mcascell@redhat.com>

Thanks.
--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


