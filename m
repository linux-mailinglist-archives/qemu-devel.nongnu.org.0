Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A45345E2F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:31:43 +0100 (CET)
Received: from localhost ([::1]:51680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgCE-0004DD-9O
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOg8d-0001Qd-4D
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:27:59 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOg8b-0005iV-7d
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:27:58 -0400
Received: by mail-ej1-x62b.google.com with SMTP id hq27so26775388ejc.9
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 05:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YUWeZv6EYVYn4X6YJwPyxI9zJ3tzVHLfSu3vTw/tqD0=;
 b=KnnL6JcP/Z+DcnDdjYcWoEr6yzKuxjWp8H8u49ry2AbAG0nsH+GT2EfpvFGMvKhO4K
 xSPoccmvf5Kwv7CwUFqxye5jlZjglTgUHrFzDbBhUojuV4MC4rKfl2Z3uV8NzPeJXZPY
 RwpaanucqSEyjJLSl2kBLo7heBw5hrRuKCbAfZUdgb617Re5uD2H1z24tfip5NAufWkA
 VeaqVqvgUgL9Pzyak/nWC9xItotpAouf+TrcW2IUTusReuJB6qt7BK3ilief83hCJCf9
 j31C3zyG5w7oJNYxxHdSshTn+gczhy1UQt35Y7dZ9uB1HysQJXYf74i4C86Ep6bjPR0h
 jl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YUWeZv6EYVYn4X6YJwPyxI9zJ3tzVHLfSu3vTw/tqD0=;
 b=Ca/h3g9hwIJYlPuF0X7obbvbolmv4H6jH89y2jO26UgebNGcHDBtZF1WFC4eAgQWTD
 7NMco8Hrdt5G1CIbr/HQWk4kYscUouuPGQefab/g09CTKBUIyqF45CjscWO+W5/k8Azv
 gVzQhIFDChBOuXHoIcn7d6pXiRMTwa/G4ArABpL0Yq/sWyS0YJ8offLkjWtAIoc0UEw2
 xzrJrTvP3ObIBLReJNgYG9oQKCwKrWdiKfpgBH4trPPNFqfHwiS8YHP5hbfqj7KhsdXU
 pFUEgZBx9RJYM2QUWbul5Lciikl8LM/byfDD6EgV9ZeuvGAU7qUm3Oe/4NnlYo5TMJxa
 Q7bg==
X-Gm-Message-State: AOAM5303YxwdPOEyx+L35ucCMtPEA3OrQ0BorFRDrCG3eNiSw5R4IeJC
 gKcXfez6UWvl74X04uRzu+OJ6IJ6SdU7P7YPNUczzA==
X-Google-Smtp-Source: ABdhPJwE8jBD8PqbojPn8I5mqCibB6Y8Pq+lDXo1xZue7vefeAuOmQQdx/gnnJAVAVmaC1w1tbA+xAoUwGmV9JxXNv0=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr4756350ejg.482.1616502473222; 
 Tue, 23 Mar 2021 05:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210313170131.2116837-1-f4bug@amsat.org>
In-Reply-To: <20210313170131.2116837-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 12:27:24 +0000
Message-ID: <CAFEAcA-8agmT_SpO7MYmWX19XhKrAz9TCgiCzo4S-uL-V4Pf=Q@mail.gmail.com>
Subject: Re: [PATCH] hw/display/bcm2835_fb: Remove DeviceReset() call in
 DeviceRealize()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 13 Mar 2021 at 17:01, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> When QDev objects have their DeviceReset handler set, they
> shouldn't worry about calling it at realization stage (it
> is handled by hw/core/qdev.c::device_set_realized).
>
> Remove the pointless/confusing bcm2835_fb_reset() call.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/display/bcm2835_fb.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
> index 2be77bdd3a0..445e8636770 100644
> --- a/hw/display/bcm2835_fb.c
> +++ b/hw/display/bcm2835_fb.c
> @@ -424,8 +424,6 @@ static void bcm2835_fb_realize(DeviceState *dev, Erro=
r **errp)
>      s->dma_mr =3D MEMORY_REGION(obj);
>      address_space_init(&s->dma_as, s->dma_mr, TYPE_BCM2835_FB "-memory")=
;
>
> -    bcm2835_fb_reset(dev);
> -
>      s->con =3D graphic_console_init(dev, 0, &vgafb_ops, s);
>      qemu_console_resize(s->con, s->config.xres, s->config.yres);
>  }

With this patch applied, I get a clang-sanitizer-build failure
in "make check":

$ QTEST_QEMU_BINARY=3D./build/arm-clang/qemu-system-arm
build/arm-clang/tests/qtest/test-hmp
/arm/hmp/raspi0: ../../hw/display/bcm2835_fb.c:131:13: runtime error:
store to null pointer of type 'uint32_t' (aka 'unsigned int')
UndefinedBehaviorSanitizer:DEADLYSIGNAL
=3D=3D23006=3D=3DERROR: UndefinedBehaviorSanitizer: SEGV on unknown address
0x000000000000 (pc 0x5599adaf839b bp 0x000000000000 sp 0x7ffd81ee77a0
T23006)
=3D=3D23006=3D=3DThe signal is caused by a WRITE memory access.
=3D=3D23006=3D=3DHint: address points to the zero page.
    #0 0x5599adaf839a in draw_line_src16
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../hw/displa=
y/bcm2835_fb.c:131:30
    #1 0x5599add82e8f in framebuffer_update_display
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../hw/displa=
y/framebuffer.c:107:13
    #2 0x5599adaf7844 in fb_update_display
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../hw/displa=
y/bcm2835_fb.c:203:5
    #3 0x5599ad9e7800 in graphic_hw_update
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../ui/consol=
e.c:279:9
    #4 0x5599aea450d3 in aio_bh_poll
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/asyn=
c.c:164:13
    #5 0x5599ae9e5d73 in aio_poll
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/aio-=
posix.c:659:17
    #6 0x5599ad873d2c in handle_hmp_command
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../monitor/h=
mp.c:1117:9
    #7 0x5599ae368594 in qmp_human_monitor_command
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../monitor/m=
isc.c:135:5
    #8 0x5599ae996101 in qmp_marshal_human_monitor_command
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/qapi/qapi-comma=
nds-misc.c:266:14
    #9 0x5599ae9de39c in do_qmp_dispatch_bh
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../qapi/qmp-=
dispatch.c:131:5
    #10 0x5599aea450d3 in aio_bh_poll
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/asyn=
c.c:164:13
    #11 0x5599ae9e332b in aio_dispatch
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/aio-=
posix.c:381:5
    #12 0x5599aea4799a in aio_ctx_dispatch
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/asyn=
c.c:306:5
    #13 0x7f74a0a35416 in g_main_context_dispatch
(/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x4c416)
    #14 0x5599ae9dc8f4 in glib_pollfds_poll
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/main=
-loop.c:231:9
    #15 0x5599ae9dc8f4 in os_host_main_loop_wait
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/main=
-loop.c:254
    #16 0x5599ae9dc8f4 in main_loop_wait
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/main=
-loop.c:530
    #17 0x5599ae42adf6 in qemu_main_loop
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../softmmu/r=
unstate.c:725:9
    #18 0x5599ad5bbf0a in main
/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../softmmu/m=
ain.c:50:5
    #19 0x7f749bcf3bf6 in __libc_start_main
/build/glibc-S9d2JN/glibc-2.27/csu/../csu/libc-start.c:310
    #20 0x5599ad59c519 in _start
(/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/qemu-system-ar=
m+0x1335519)

UndefinedBehaviorSanitizer can not provide additional info.
=3D=3D23006=3D=3DABORTING
Broken pipe
Aborted (core dumped)

The patch is correct in that the device shouldn't be resetting itself
in realize, but this is presumably masking a bug elsewhere in the device
that we need to fix first before we can make this change.

It looks as if what happens is that the GraphicHwOps methods can
get called before the device is reset. I don't know if that is
something we can arrange to have not happen -- certainly it's
a bit confusing to have to deal with the device not having been
reset yet -- or if implementations just have to deal with it.

thanks
-- PMM

