Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBC6441CB3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 15:34:39 +0100 (CET)
Received: from localhost ([::1]:40520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhYOU-00044J-EW
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 10:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhYMa-0002gd-FW
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:32:40 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhYMY-0008M9-5t
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:32:40 -0400
Received: by mail-wr1-x436.google.com with SMTP id d13so28431912wrf.11
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bl9SHcwX3ZRKbW/WS7G6XvB2J6vRDwRcdsGfauYH+UY=;
 b=RJIxOx7rr5QpyIhlp4DjX4fal4DdZ7gcmH6nCdqrkxGUufYWTxGBmU7IyqNOT8OTRz
 RWEvdVKzUaiHIb6dhyUOQ5HLYs53wTgL61SHtPWQe8YGoqOGjar03KH+DjrCvxXf2OKY
 PsLhoH8mditMTIraRmcjYYmcfygxz3UwJhu6w3cZfdVfOBsgVO84B1go3jVteYE/BvYd
 ALHfIkuHwbAT+BD9GjuO+miELR/aDAC/JbkzBQrVaCxl/K4UR0YI+v4+qHFc73KiC9E+
 u9r5SHFcD9dA8nE664fpjU1pa3BNDpGYPcpoz1uuGfHDRhtm81OIsTvfRpfay9+nSUna
 gwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bl9SHcwX3ZRKbW/WS7G6XvB2J6vRDwRcdsGfauYH+UY=;
 b=GzhsWO1JcPENXYiWxHPjR4/wSdsX6LRYLsaSYrcyzWiZWy00a3WawUeQuR+Gqg1Zh9
 o/BD6UareQsK1slmedmkr1Cbddc4Py7Q8/mewVggJskuJ1KJi2i4rQPnyqRWt2VVJyYR
 0uC3H7oCZ7G1psDRH85szlfx6tIvmpHINlIkjUN5YZCq3H6UQsOI0Ne26kDmgbBVm8U0
 07OU/5KDboYiCL8zMpESBmek/RcXdX2u2XiHnKIpXlPBpw9fFctgiqEDEwBWDRkHvO6h
 DemzyPLkELB2ICfJ4+hS00pRaaz1Ipksr7RhxHPhxNVo5folPpZ55QxMTf/NLnMs0KsG
 l+xw==
X-Gm-Message-State: AOAM532KyBxMnjduG1hbN5Yl4eWXrmoUUuElZ9gtUJIu7JJPBB0ypJ5I
 SHipNcQevIrYxwD2p/buuvimTp2iwuty5RBNBNoTjA==
X-Google-Smtp-Source: ABdhPJzyrIAXj44XzrFwBdZnoOQS7NdOUhOOm+MhApwBdpUwfMx8IMEJq6UU6MeTsMw+s/mWm9S6FQskvkJUd4LZap0=
X-Received: by 2002:adf:e984:: with SMTP id h4mr34542905wrm.149.1635777156027; 
 Mon, 01 Nov 2021 07:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211014162938.430211-1-pbonzini@redhat.com>
 <20211014162938.430211-4-pbonzini@redhat.com>
In-Reply-To: <20211014162938.430211-4-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 14:32:25 +0000
Message-ID: <CAFEAcA9-ct1_MngSTeaAwii6SQjx_ode0brH0nE4gW0K51s5Jg@mail.gmail.com>
Subject: Re: [PULL 03/26] configure,
 meson: move audio driver detection to Meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>, qemu-devel@nongnu.org,
 Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Oct 2021 at 17:37, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> This brings a change that makes audio drivers more similar to all
> other modules.  All drivers are built by default, while
> --audio-drv-list only governs the default choice of the audio driver.
>
> Meson options are added to disable the drivers, and the next patches
> will fix the help messages and command line options, and especially
> make the non-default drivers available via -audiodev.
>
> Cc: Gerd Hoffman <kraxel@redhat.com>
> Cc: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20211007130630.632028-4-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Hi; this change seems to have caused meson to produce new
WARNING messages on OSX host:

Library rados found: NO
Has header "rbd/librbd.h" : NO
Run-time dependency glusterfs-api found: NO (tried pkgconfig)
Has header "bzlib.h" : YES
Library bz2 found: YES
Has header "lzfse.h" : NO
Has header "sys/soundcard.h" : NO
../../meson.build:928: WARNING: OSS not found, disabling
Run-time dependency appleframeworks found: YES (CoreAudio)
../../meson.build:964: WARNING: CoreAudio not found, disabling
Run-time dependency gnutls found: YES 3.6.15
Run-time dependency libpng found: YES 1.6.37

"I didn't find some optional thing" should not be emitting
warning messages.

Also, the CoreAudio test seems to be broken (never detects
CoreAudio). According to meson.log we do this:

Run-time dependency appleframeworks found: YES (CoreAudio)
Running compile:
Working directory:
/Users/pm215/src/qemu-for-merges/build/all/meson-private/tmp7k9rfdt5
Command line:  cc
/Users/pm215/src/qemu-for-merges/build/all/meson-private/tmp7k9rfdt5/testfi=
le.c
-o /Users/pm215/src/qemu-for-merges/build/all/meson-private/tmp7k9rfdt5/out=
put.exe
-O0 -Werror=3Dimplicit-function-declaration -std=3Dgnu11

Code:

    #include <CoreAudio/CoreAudio.h>
    int main(void)
    {
      return (int)AudioGetCurrentHostTime();
    }
Compiler stdout:

Compiler stderr:
 Undefined symbols for architecture x86_64:
  "_AudioGetCurrentHostTime", referenced from:
      _main in testfile-96e6d2.o
ld: symbol(s) not found for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocat=
ion)

../../meson.build:964: WARNING: CoreAudio not found, disabling

which is to say, we try to link the test program but
we have forgotten to say "and we need to link
against coreaudio" when doing so. In the old configure
version this was done using
   if compile_prog "" "$coreaudio_libs" ; then
thus passing "-framework CoreAudio" to the compiler;
I don't know what the meson equivalent is.

thanks
-- PMM

