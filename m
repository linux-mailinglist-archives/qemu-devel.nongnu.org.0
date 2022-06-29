Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FD655FD86
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 12:42:02 +0200 (CEST)
Received: from localhost ([::1]:45414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6V8z-0000pk-HM
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 06:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1o6V5o-0007MC-HT
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:38:44 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:40645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1o6V5m-0003AP-17
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:38:44 -0400
Received: by mail-pf1-x432.google.com with SMTP id c205so14699181pfc.7
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 03:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Vi6RmV636ywMEivqYqMXJmQnuoW575DHSe9jHCZjNA0=;
 b=W44WMfoA0bAcu3Euy3uh/V2CP2zLYpF/3sH7rL2iih4vMIhCTfVakyjpiDK5dgSlUD
 trG4IwkvzaTRdDRLeVHtcOoU6K8BZvepHF+iIgSu/CbfFXAcY33HCZjm2yyjMOAYcYWV
 Cl6QXGmUhFL0nr70xArurTYB6ZyDCTewOd6ll19Vz5dkgRDgQR7iltymTSC+iifztLRb
 XLbak2O/ptTz0H9ncB1rAQ9TZB0OkRSrGzHNrPFa47G5vWURzp/CMoi0nuCDm/4F4wiF
 KT7sZ0rsT7mdwMxqHP58pVGPr+20zurNVvAFVImW9Ro7Qx2qv91ugPnd5Hy1cFzSPWOr
 BR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vi6RmV636ywMEivqYqMXJmQnuoW575DHSe9jHCZjNA0=;
 b=4/JX4VqSeOArYGulinoqJYY0gdd+Gw66CZSoWkNsUfLjIZtge82DDNPlaNtXuTM/Jd
 rq4jNJ+5WrPtb1EsPJAWICRuFMfQL4g+F0wwUkc1M+LG7QWfjemSR6zjl5tBh1bXCzar
 asyMLaAXI0bLhgd1lwMq6Pj7pBIoytzmrF4YZI/Y4UP0r45VBf83dDJ2m4ZIugv1eHkr
 3CWRSDGoBOPsPAbqE0t+82vCWLFdF5L2IJP0u0HGWtPhmVkkp1v3xwatHRomZNsHaWYW
 NK4/THSzJzkc+1MK6tWXfFyTg5+ZbmVPpCjEBXBrRddpSgl/S8mv6JV6XDCLlmKpDseg
 OUTg==
X-Gm-Message-State: AJIora8sfr9oc0wGeRe5grcUlOQ2pMJ3OF9dsvIhdW/yHzFpTDPxO419
 LYtIKVY4Y7MkVEXa7Hkm3LJC+5cDVuArYpSYhr0=
X-Google-Smtp-Source: AGRyM1vE+CUOMwaATfEvhfK0DYZtfSsgMig9Bz8jP12d2ZQqCjdfg5G7YXZU6et11GU6hBhDMe4WYoRZoEFW6iUsXJ0=
X-Received: by 2002:a63:6cc8:0:b0:40d:e553:f200 with SMTP id
 h191-20020a636cc8000000b0040de553f200mr2380916pgc.166.1656499120665; Wed, 29
 Jun 2022 03:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220628114307.697943-1-richard.henderson@linaro.org>
 <20220628114307.697943-3-richard.henderson@linaro.org>
 <CAMo8BfJgo184TYxr0O-t5x68Ac1U3t9LWWvPeUEwm-E_qizGWQ@mail.gmail.com>
 <b4f49f9d-769d-e307-b01d-aadc5df70642@linaro.org> <87tu83j3gx.fsf@linaro.org>
 <CAMo8BfLmQFKh-BuFXWqU2w+T_nVmBjXZ24THHneyJmdgcYPZ5Q@mail.gmail.com>
 <87h743ixob.fsf@linaro.org>
In-Reply-To: <87h743ixob.fsf@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 29 Jun 2022 03:38:35 -0700
Message-ID: <CAMo8BfJ78g9dTvNH=mUJQPZnFdH6RVeTJ7BCbmLDvo=wmGmn0A@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] target/xtensa: Use semihosting/syscalls.h
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Wed, Jun 29, 2022 at 3:14 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> Max Filippov <jcmvbkbc@gmail.com> writes:

> > There's no notion of 'serial hardware' for the xtensa-sim, all it has i=
s
> > the three standard stdio file descriptors.
>
> Which are accessed via semihosting calls?

Yes.

> Are they implicitly mapped to
> 3 chardev devices for stdin, stdout and stderr?

In the absence of -serial option they are not mapped.
In the presence of that option they are mapped to the single chardev
that was passed as the parameter of that option.

> > But it was convenient thinking
> > of them as a serial port. I agree that no magic is needed here, but
> > the change shouldn't be quiet eiter, so xtensa-sim should warn (or
> > maybe even quit with an error code) when it sees the -serial option.
>
> If the default chardevs already map to the 3 FDs then perhaps -serial
> should be invalid because it is more explicit to use -chardev to
> redirect the stream you want somewhere else. However I don't see them at
> the moment:
>
>   =E2=9E=9C  ./qemu-system-xtensa -M sim -semihosting -S -display none -m=
onitor stdio
>   QEMU 7.0.50 monitor - type 'help' for more information
>   (qemu) info chardev
>   compat_monitor0: filename=3Dstdio
>   parallel0: filename=3Dvc

Well, that mapping was done by me, manually (grep for sim_console in the
target/xtensa/xtensa-semi.c), so no wonder that parts like this don't work.

--=20
Thanks.
-- Max

