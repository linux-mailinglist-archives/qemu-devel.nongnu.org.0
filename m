Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07635F7BD3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:53:21 +0200 (CEST)
Received: from localhost ([::1]:42270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqbA-0004fR-Lw
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogpKz-0008RK-W3
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:32:34 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:44932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogpKw-0007xk-Qo
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:32:32 -0400
Received: by mail-pg1-x52f.google.com with SMTP id c7so4931691pgt.11
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 08:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fBlxAcVyKdmy+sbnCnD0Ius7jbmrAMca/hw40oT9yW8=;
 b=bmxfxwS1OaO/ViL/Hs+2IGNvEWcWVn21Y2NWolU9oyJCxU1dLTst9RlOwbcqYtkp2n
 u9b7VmZAh3jFLP7iLLTYX3Ph6YQogcaFzP2dnI6El/ynGL3U4Wq1GPWoQDqx3Zvw6U0g
 rLw7vzGpO/g3P9/j0g0vQ2hkMP4SSQ9Ep96kBkWR3UMBAE5J166cBmVsY8HjsWfubV6+
 mp2XRepKaAFR3cgcvYuPTgAyrjblROjpol/sbF3Qt/lxZZdNQT7YKasnwpUZ/yC9VU+Y
 1TMyqsEu5x7UBqT2cVwy5hzXa8iAPmZK3JtLT2eDrm7BZpk1cYhpcMSJ79K2U7M5Fr+B
 DPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fBlxAcVyKdmy+sbnCnD0Ius7jbmrAMca/hw40oT9yW8=;
 b=RgEe1f2LOa39OmtspgxfRrvM8Q6Bq2072wXx9vrgYRYBMQhd6ibcKtDhCdzp9FAmlv
 5rPWOGo1PYmM04oqHgOShXyZau2GXPMgpyXBzI9VLDPJPQS+Z0pjZSqkf9pjiz821J3T
 HeXos5TO7aPhmlnl8G7ASG8HpKu7G36WvXyvTPvZdtpOWNKwkDW4e3gi6XRXfR+LSVe2
 vVbLFqYNMVKkK5W1rU+J5yPhZ361QN0XY0BXp63cT6PJLAPphJbA27qWrm2VS6RA/RUD
 UqzaCmtmrkmw8Q4grd0PahTXCi/wFkkLCenBBZifIB71hp+BCLSACdqvtEEOWF2uEuSl
 k0fQ==
X-Gm-Message-State: ACrzQf0TM9E/WRUHt09dcsYipp183uGkDpcrXEazW2QuPwIRgZ62lwgf
 w1oufSt9qzDPRMaU22kh+D6yEVv1u3BN4Igjj6jBzDuTCNI=
X-Google-Smtp-Source: AMsMyM4CkMvpqw3Ew1e1Yl83JjLGqVayvq3+0dT9MPGeHB2MWWVQyV/I7hJ/QXHl2dDiVc6hoETR19Q+Xw4eWW1i7SU=
X-Received: by 2002:a05:6a00:b4d:b0:561:b974:94b9 with SMTP id
 p13-20020a056a000b4d00b00561b97494b9mr5725510pfo.26.1665156748892; Fri, 07
 Oct 2022 08:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <CAAJ4Ao9M8CnfBtiricqteAfhPhV9sOhiicSYVsrqtCp7CisK_Q@mail.gmail.com>
 <CAFEAcA80d1Qd3VrzV79_ywEryikfLrLNMbe50hjMEP8_HKNBvg@mail.gmail.com>
 <1727925.InMztqvFxb@silver>
 <CAFEAcA9PcDk5pnRrKQf2zRaX8h8KSA9SDHODS102iK3jd_fpUQ@mail.gmail.com>
 <CAAJ4Ao8sxnuxgeUFwvdwceMn6=xy_QxYuOzhAJcGthnSd1pRgQ@mail.gmail.com>
In-Reply-To: <CAAJ4Ao8sxnuxgeUFwvdwceMn6=xy_QxYuOzhAJcGthnSd1pRgQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 16:32:16 +0100
Message-ID: <CAFEAcA-jRHEGyW-oA1rSXDuYa81x2SNt+vqrvUPtgK6Wr93sJg@mail.gmail.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
To: Nikita Ivanov <nivanov@cloudlinux.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Oct 2022 at 12:44, Nikita Ivanov <nivanov@cloudlinux.com> wrote:
>
> Hi!
> Sorry for such a long absence, I've been resolving some other issues in my life for a while. I've adjusted the patch according to your latest comments. Could you check it out, please?

Hi; thanks for coming back to this. (I'd been meaning to re-read the
thread but hadn't found time to do so; sorry.) As Christian says,
you should send the patches as a proper new patchset thread of their
own, but for the moment:

> From 5389c5ccc8789f8f666ab99e50d38af728bd2c9c Mon Sep 17 00:00:00 2001
> From: Nikita Ivanov <nivanov@cloudlinux.com>
> Date: Wed, 3 Aug 2022 12:54:00 +0300
> Subject: [PATCH 1/2] error handling: Use TFR() macro where applicable
>
> There is a defined TFR() macro in qemu/osdep.h which
> handles the same while loop.
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/415
>
> Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>

> diff --git a/block/file-posix.c b/block/file-posix.c
> index 66fdb07820..7892bdea31 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1238,9 +1238,9 @@ static int hdev_get_max_segments(int fd, struct stat *st)
>          ret = -errno;
>          goto out;
>      }
> -    do {
> -        ret = read(sysfd, buf, sizeof(buf) - 1);
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(
> +        ret = read(sysfd, buf, sizeof(buf) - 1)
> +    );

I think this patch is doing things in the wrong order. Instead of
converting code to use the old macro that we don't like and then
updating it again in patch 2 to use the new macro, we should
first introduce the new macro, and then after that we can update
code that's currently not using a macro at all to use the new one.
This makes code review easier because we don't have to look at a
change to this code which is then going to be rewritten anyway.


> From 7a9fccf00ec2d1c6b30b2ed1cb98398b49ddb0bc Mon Sep 17 00:00:00 2001
> From: Nikita Ivanov <nivanov@cloudlinux.com>
> Date: Mon, 8 Aug 2022 20:43:45 +0300
> Subject: [PATCH 2/2] Refactoring: rename TFR() to TEMP_FAILURE_RETRY()
>
> glibc's unistd.h header provides the same macro with the
> subtle difference in type casting. Adjust macro name to the
> common standard and refactor it to expression.
>
> Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>


> diff --git a/block/file-posix.c b/block/file-posix.c
> index 7892bdea31..ee7f60c78a 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1238,8 +1238,8 @@ static int hdev_get_max_segments(int fd, struct stat *st)
>          ret = -errno;
>          goto out;
>      }
> -    TFR(
> -        ret = read(sysfd, buf, sizeof(buf) - 1)
> +    ret = TEMP_FAILURE_RETRY(
> +        read(sysfd, buf, sizeof(buf) - 1)
>      );

This doesn't need these newlines in it. If the whole thing fits on
a single line, that's easier to read.

>      if (ret < 0) {
>          ret = -errno;


> @@ -1472,8 +1472,8 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
>  {
>      ssize_t len;
>
> -    TFR(
> -        len = (aiocb->aio_type & QEMU_AIO_WRITE) ?
> +    len = TEMP_FAILURE_RETRY(
> +        (aiocb->aio_type & QEMU_AIO_WRITE) ?
>              qemu_pwritev(aiocb->aio_fildes,
>                             aiocb->io.iov,
>                             aiocb->io.niov,

I'm not sure why you've put the TEMP_FAILURE_RETRY on the outside here
rather than just on the individual function calls.


> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index b1c161c035..6e244f15fa 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -243,7 +243,13 @@ void QEMU_ERROR("code path is reachable")
>  #define ESHUTDOWN 4099
>  #endif
>
> -#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
> +#define TEMP_FAILURE_RETRY(expr) \

We can't call the macro this, because the glibc system headers already
may define a macro of that name, so the compiler will complain if they're
both defined at the same time, and depending on header ordering it might
not be clear which version you're getting.

> +    (__extension__                                          \
> +        ({ typeof(int64_t) __result;                               \

As Christian says, the point of the typeof is to use the type
of the expression. "typeof(int64_t)" is always just "int64_t".
You want "typeof(expr) __result;".

> +           do {                                             \
> +                __result = (typeof(int64_t)) (expression);         \

Then you don't need this cast, because both __result and expr
are the same type anyway.

Also, how did this compile? 'expression' isn't the name of the macro argument.

> +           } while (__result == -1L && errno == EINTR);     \

I think you don't need the 'L' suffix here.

> +           __result; }))

thanks
-- PMM

