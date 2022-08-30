Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538E55A60DF
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 12:36:05 +0200 (CEST)
Received: from localhost ([::1]:43760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSybC-0006F4-6T
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 06:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1oSyYI-0004p4-If
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 06:33:02 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:41869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1oSyYG-0005hT-Hr
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 06:33:01 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id k2so11012154vsk.8
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 03:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=czO2/+5kdg9gDwJInJD2Tg+lv//sSducerUSGvt92Uw=;
 b=GVSJiin0TtAgTnBWQPcmxNjeyhRbeJLc4faRdrCMil6PFJjOMKLqcV/PYm/FkNPFqU
 ECJbbzoR5FWw8r9uVuq31d4YKM+bhLnfWMB78lYfKXLSjalxwjDWEU0qjd9E4BtGgaks
 y5oJnA9VR1GLVR/xK+d8cjYbGpEMlV/OYpM2scj28XTQkSTAtOxkmtP6kKXzkTtkB8vR
 4PPvfr5p7hB3ee6EE/k6T8U6e54jyBl6bsyOX6/4+OUB2AJtlhKzpX2c6IXkhFq2toGw
 6pxMwxCTKzua584SqsPhJAGbidBiUlGV9rDv9v5YtVZKIG8NI7sbHh1B2tdOT3GqmHDz
 VQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=czO2/+5kdg9gDwJInJD2Tg+lv//sSducerUSGvt92Uw=;
 b=ofY8NhS327hIJHYZstINu3LROVVQfzEnk0b6RlsZddFA1HrXWEuxi45ZkVr8UuyY5S
 eQEHOiBRqCvN+3YxMCCaaC54Yjh5URPLimZbXgC/Fdm31NxI588gwgghbDZK+g1nnyYR
 RzpIfjHIJlYh/BejlXSokB+2grvqV4MslcrunBVU1n8C6nszWloYQ92FTur+EAXkaLVg
 ANgmZHspp6mBUprwfBWCjJZ331i1WFouTPkXWaCpXalK8mCPtGX+sxz5qO7Bx/6Wggmf
 HT+r+CswF/eDSfumf5A50La8jXeC91dLdNkDrAbEmCwtk3Scx0yLIywuj/zMqbIXBUQJ
 CNwA==
X-Gm-Message-State: ACgBeo2j1CcBx5mbnTGJc/QA+/7k0kU1b1a1y9z4mRO+7/CEmyqcKfz+
 duUsUPjovQfpBJNg5n9XrZF7GGl4dYEEnWsjhhw=
X-Google-Smtp-Source: AA6agR66rVMSLvQcnwozHWDkMBiqKMSZZxfmgTJfGVAandVGFuLwq7Q+h8hhf+V0n0QK2UG8g/GDeBSpn5XTibe5Zdw=
X-Received: by 2002:a67:ac09:0:b0:388:70e9:63a0 with SMTP id
 v9-20020a67ac09000000b0038870e963a0mr4692720vse.56.1661855579386; Tue, 30 Aug
 2022 03:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210906153103.1661195-1-philmd@redhat.com>
 <14239d0f-e720-0225-c6be-1befeb2098a6@redhat.com>
In-Reply-To: <14239d0f-e720-0225-c6be-1befeb2098a6@redhat.com>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Tue, 30 Aug 2022 18:32:48 +0800
Message-ID: <CAAKa2j=9WFyi5p3Ko2Wrq36UFTNq-wiDRs9B=o9kwv=T=HB-HA@mail.gmail.com>
Subject: Re: [PATCH] hw/display/ati_2d: Fix buffer overflow in ati_2d_blt
 (CVE-2021-3638)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>, 
 Ziming Zhang <ezrakiez@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Gaoning Pan <pgn@zju.edu.cn>, 
 Mauro Matteo Cascella <mcascell@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Salvatore Bonaccorso <carnil@debian.org>, Qiang Liu <qiangliu@zju.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=cyruscyliu@gmail.com; helo=mail-vs1-xe2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

I found this patch is still not merged. Should we merge this and close
this issue?

Best,
Qiang

On Tue, Sep 7, 2021 at 2:20 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 9/6/21 5:31 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > When building QEMU with DEBUG_ATI defined then running with
> > '-device ati-vga,romfile=3D"" -d unimp,guest_errors -trace ati\*'
> > we get:
> >
> >   ati_mm_write 4 0x16c0 DP_CNTL <- 0x1
> >   ati_mm_write 4 0x146c DP_GUI_MASTER_CNTL <- 0x2
> >   ati_mm_write 4 0x16c8 DP_MIX <- 0xff0000
> >   ati_mm_write 4 0x16c4 DP_DATATYPE <- 0x2
> >   ati_mm_write 4 0x224 CRTC_OFFSET <- 0x0
> >   ati_mm_write 4 0x142c DST_PITCH_OFFSET <- 0xfe00000
> >   ati_mm_write 4 0x1420 DST_Y <- 0x3fff
> >   ati_mm_write 4 0x1410 DST_HEIGHT <- 0x3fff
> >   ati_mm_write 4 0x1588 DST_WIDTH_X <- 0x3fff3fff
> >   ati_2d_blt: vram:0x7fff5fa00000 addr:0 ds:0x7fff61273800 stride:2560 =
bpp:32 rop:0xff
> >   ati_2d_blt: 0 0 0, 0 127 0, (0,0) -> (16383,16383) 16383x16383 > ^
> >   ati_2d_blt: pixman_fill(dst:0x7fff5fa00000, stride:254, bpp:8, x:1638=
3, y:16383, w:16383, h:16383, xor:0xff000000)
> >   Thread 3 "qemu-system-i38" received signal SIGSEGV, Segmentation faul=
t.
> >   (gdb) bt
> >   #0  0x00007ffff7f62ce0 in sse2_fill.lto_priv () at /lib64/libpixman-1=
.so.0
> >   #1  0x00007ffff7f09278 in pixman_fill () at /lib64/libpixman-1.so.0
> >   #2  0x0000555557b5a9af in ati_2d_blt (s=3D0x631000028800) at hw/displ=
ay/ati_2d.c:196
> >   #3  0x0000555557b4b5a2 in ati_mm_write (opaque=3D0x631000028800, addr=
=3D5512, data=3D1073692671, size=3D4) at hw/display/ati.c:843
> >   #4  0x0000555558b90ec4 in memory_region_write_accessor (mr=3D0x631000=
039cc0, addr=3D5512, ..., size=3D4, ...) at softmmu/memory.c:492
> >
> > Commit 584acf34cb0 ("ati-vga: Fix reverse bit blts") introduced
> > the local dst_x and dst_y which adjust the (x, y) coordinates
> > depending on the direction in the SRCCOPY ROP3 operation, but
> > forgot to address the same issue for the PATCOPY, BLACKNESS and
> > WHITENESS operations, which also call pixman_fill().
> >
> > Fix that now by using the adjusted coordinates in the pixman_fill
> > call, and update the related debug printf().
> >
>
> Forgot here:
>
> Cc: qemu-stable@nongnu.org
>
> > Reported-by: Qiang Liu <qiangliu@zju.edu.cn>
> > Fixes: 584acf34cb0 ("ati-vga: Fix reverse bit blts")
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >  hw/display/ati_2d.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>

