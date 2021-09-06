Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2564020C9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 22:52:05 +0200 (CEST)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNLay-0008KY-7P
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 16:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@redhat.com>) id 1mNKB4-00012s-DK
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 15:21:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@redhat.com>) id 1mNKB1-0002nr-Fa
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 15:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630956061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uMCg4uX1wq7l7kuwPndBnEhtQ8FzShNJDRrJ2sVqpHM=;
 b=ThjN1CNsWnVyduitUTlj9ZB+cWsueUUAvSnkKeO9uc0EHU6p9Ee7/z4oMd7eG6iyuOZNKJ
 TH6xjNb+wDOLN3JDO9dU+wtuLAev0UQN2TP7hDMFE6sOKDbSF+RCqdRAbwPPyBpMrAsR2+
 EJi+9U7LO4b8gosgWc2/oZI7oaHtxmA=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-fMM_3ywJNr6oTBhR_BO7BA-1; Mon, 06 Sep 2021 15:19:32 -0400
X-MC-Unique: fMM_3ywJNr6oTBhR_BO7BA-1
Received: by mail-il1-f198.google.com with SMTP id
 h11-20020a056e02052b00b0022b4906c172so2722792ils.22
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 12:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uMCg4uX1wq7l7kuwPndBnEhtQ8FzShNJDRrJ2sVqpHM=;
 b=klo83bsTSs24NMHxBJ8i+jozQBw8FTxAeh4Dgs1ZTGKV0vMHVr10mhRwBhV3pIVmBF
 KevldAVrwNvq3W7u9p/ZCxEkAROAwbQ2S6Lx3usjNRAHUG4Q9r2xZ1J7D+V0kaWOcb4H
 w1vr7sbrIRX8iT05WloTszA67SlKnJiVxuF5ib+EpDm5rc5bDbrl/3+VEQ7+kvOWWa2n
 gXQaXggh3YGDxgOZJw84Bb/zsdGhvWJxk3OzfjyZJ0HyL7dxdCcC978hrYx19bRn7psZ
 4G/bHcI+StplvMOE40FUduUQ6BHyiYwms+zbwQBk5lhFPXGpf1vSaKjVbToWCjpiRLhT
 jL+Q==
X-Gm-Message-State: AOAM531cK1LL4kUihODPA+hXRODlcSGDdbuAS1AC2Yrn+UCfYdxJPs8j
 bQXgPwwj3V5SaAaKF3iAdpt30F0Qyqmra0KedJfEfJTat1IYH72Ujew7sCPR5/ZHSIHqNXmxACl
 2mlIFeIi/sE6wdDI=
X-Received: by 2002:a05:6602:1493:: with SMTP id
 a19mr10589799iow.55.1630955971102; 
 Mon, 06 Sep 2021 12:19:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+vMpge8IymrznzvmdaOyXaGZbTE5DNSHFlGhze4Z7s9s64Wb5pBkREA+jA0afMTk9AMfQjg==
X-Received: by 2002:a05:6602:1493:: with SMTP id
 a19mr10589780iow.55.1630955970815; 
 Mon, 06 Sep 2021 12:19:30 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id l19sm4903564ilk.26.2021.09.06.12.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 12:19:30 -0700 (PDT)
Date: Mon, 6 Sep 2021 15:19:14 -0400
From: Alexander Bulekov <alxndr@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/display/ati_2d: Fix buffer overflow in ati_2d_blt
 (CVE-2021-3638)
Message-ID: <20210906191909.r4kva7grskpyzb6d@mozz.bu.edu>
References: <20210906153103.1661195-1-philmd@redhat.com>
 <CAA8xKjXkDwPYxSAeRb+2mfHRrbiL_kh9unVkemFXLfF68UXePA@mail.gmail.com>
 <3ef43b0d-4b89-85a4-f2bf-b7f8a256d1db@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3ef43b0d-4b89-85a4-f2bf-b7f8a256d1db@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alxndr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=alxndr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 06 Sep 2021 16:50:04 -0400
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiang Liu <qiangliu@zju.edu.cn>, Prasad J Pandit <pjp@fedoraproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Gaoning Pan <pgn@zju.edu.cn>, Ziming Zhang <ezrakiez@gmail.com>,
 Salvatore Bonaccorso <carnil@debian.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210906 2019, Philippe Mathieu-Daudé wrote:
> (Forgot to Cc Alex for eventual reproducer)

Here you go. Should we be fuzzing this on OSS-Fuzz?

============= 8< =============

/*
 * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
 * 512M -device ati-vga,romfile= -nodefaults -qtest /dev/null -qtest stdio
 * outl 0xcf8 0x80001018
 * outl 0xcfc 0xe1000000
 * outl 0xcf8 0x80001004
 * outw 0xcfc 0x02
 * write 0xe10016c4 0x1 0x04
 * write 0xe10016e4 0x1 0x58
 * write 0xe1001438 0x4 0x0400001a
 * write 0xe100143c 0x4 0x01000015
 * EOF
 */
static void test_fuzz(void)
{
    QTestState *s = qtest_init(
        "-display none , -m 512M -device ati-vga,romfile= -nodefaults -qtest /dev/null");
    qtest_outl(s, 0xcf8, 0x80001018);
    qtest_outl(s, 0xcfc, 0xe1000000);
    qtest_outl(s, 0xcf8, 0x80001004);
    qtest_outw(s, 0xcfc, 0x02);
    qtest_bufwrite(s, 0xe10016c4, "\x04", 0x1);
    qtest_bufwrite(s, 0xe10016e4, "\x58", 0x1);
    qtest_bufwrite(s, 0xe1001438, "\x04\x00\x00\x1a", 0x4);
    qtest_bufwrite(s, 0xe100143c, "\x01\x00\x00\x15", 0x4);
    qtest_quit(s);
}

============= >8 =============
-Alex

> 
> On 9/6/21 6:44 PM, Mauro Matteo Cascella wrote:
> > On Mon, Sep 6, 2021 at 5:31 PM Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> >>
> >> When building QEMU with DEBUG_ATI defined then running with
> >> '-device ati-vga,romfile="" -d unimp,guest_errors -trace ati\*'
> >> we get:
> >>
> >>   ati_mm_write 4 0x16c0 DP_CNTL <- 0x1
> >>   ati_mm_write 4 0x146c DP_GUI_MASTER_CNTL <- 0x2
> >>   ati_mm_write 4 0x16c8 DP_MIX <- 0xff0000
> >>   ati_mm_write 4 0x16c4 DP_DATATYPE <- 0x2
> >>   ati_mm_write 4 0x224 CRTC_OFFSET <- 0x0
> >>   ati_mm_write 4 0x142c DST_PITCH_OFFSET <- 0xfe00000
> >>   ati_mm_write 4 0x1420 DST_Y <- 0x3fff
> >>   ati_mm_write 4 0x1410 DST_HEIGHT <- 0x3fff
> >>   ati_mm_write 4 0x1588 DST_WIDTH_X <- 0x3fff3fff
> >>   ati_2d_blt: vram:0x7fff5fa00000 addr:0 ds:0x7fff61273800 stride:2560 bpp:32 rop:0xff
> >>   ati_2d_blt: 0 0 0, 0 127 0, (0,0) -> (16383,16383) 16383x16383 > ^
> >>   ati_2d_blt: pixman_fill(dst:0x7fff5fa00000, stride:254, bpp:8, x:16383, y:16383, w:16383, h:16383, xor:0xff000000)
> >>   Thread 3 "qemu-system-i38" received signal SIGSEGV, Segmentation fault.
> >>   (gdb) bt
> >>   #0  0x00007ffff7f62ce0 in sse2_fill.lto_priv () at /lib64/libpixman-1.so.0
> >>   #1  0x00007ffff7f09278 in pixman_fill () at /lib64/libpixman-1.so.0
> >>   #2  0x0000555557b5a9af in ati_2d_blt (s=0x631000028800) at hw/display/ati_2d.c:196
> >>   #3  0x0000555557b4b5a2 in ati_mm_write (opaque=0x631000028800, addr=5512, data=1073692671, size=4) at hw/display/ati.c:843
> >>   #4  0x0000555558b90ec4 in memory_region_write_accessor (mr=0x631000039cc0, addr=5512, ..., size=4, ...) at softmmu/memory.c:492
> >>
> >> Commit 584acf34cb0 ("ati-vga: Fix reverse bit blts") introduced
> >> the local dst_x and dst_y which adjust the (x, y) coordinates
> >> depending on the direction in the SRCCOPY ROP3 operation, but
> >> forgot to address the same issue for the PATCOPY, BLACKNESS and
> >> WHITENESS operations, which also call pixman_fill().
> >>
> >> Fix that now by using the adjusted coordinates in the pixman_fill
> >> call, and update the related debug printf().
> >>
> >> Reported-by: Qiang Liu <qiangliu@zju.edu.cn>
> >> Fixes: 584acf34cb0 ("ati-vga: Fix reverse bit blts")
> >> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >> ---
> >>  hw/display/ati_2d.c | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
> >> index 4dc10ea7952..692bec91de4 100644
> >> --- a/hw/display/ati_2d.c
> >> +++ b/hw/display/ati_2d.c
> >> @@ -84,7 +84,7 @@ void ati_2d_blt(ATIVGAState *s)
> >>      DPRINTF("%d %d %d, %d %d %d, (%d,%d) -> (%d,%d) %dx%d %c %c\n",
> >>              s->regs.src_offset, s->regs.dst_offset, s->regs.default_offset,
> >>              s->regs.src_pitch, s->regs.dst_pitch, s->regs.default_pitch,
> >> -            s->regs.src_x, s->regs.src_y, s->regs.dst_x, s->regs.dst_y,
> >> +            s->regs.src_x, s->regs.src_y, dst_x, dst_y,
> >>              s->regs.dst_width, s->regs.dst_height,
> >>              (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ? '>' : '<'),
> >>              (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ? 'v' : '^'));
> >> @@ -180,11 +180,11 @@ void ati_2d_blt(ATIVGAState *s)
> >>          dst_stride /= sizeof(uint32_t);
> >>          DPRINTF("pixman_fill(%p, %d, %d, %d, %d, %d, %d, %x)\n",
> >>                  dst_bits, dst_stride, bpp,
> >> -                s->regs.dst_x, s->regs.dst_y,
> >> +                dst_x, dst_y,
> >>                  s->regs.dst_width, s->regs.dst_height,
> >>                  filler);
> >>          pixman_fill((uint32_t *)dst_bits, dst_stride, bpp,
> >> -                    s->regs.dst_x, s->regs.dst_y,
> >> +                    dst_x, dst_y,
> >>                      s->regs.dst_width, s->regs.dst_height,
> >>                      filler);
> >>          if (dst_bits >= s->vga.vram_ptr + s->vga.vbe_start_addr &&
> >> --
> >> 2.31.1
> >>
> > 
> > Tested-by: Mauro Matteo Cascella <mcascell@redhat.com>
> 
> Thanks. I wouldn't be surprise if we get another CVE in this code /
> file / function ASAP this patch get merged... The code calls for a
> rewrite, as per this function comment in its header:
> 
> void ati_2d_blt(ATIVGAState *s)
> {
>     /* FIXME it is probably more complex than this and may need to be */
>     /* rewritten but for now as a start just to get some output: */
> 
> Regards,
> 
> Phil.
> 
> 


