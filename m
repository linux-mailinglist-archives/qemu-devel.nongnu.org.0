Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D24355FAE1
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 10:44:41 +0200 (CEST)
Received: from localhost ([::1]:33166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6TJQ-00079h-Lr
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 04:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1o6TFl-00040T-M5
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:40:56 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:35420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1o6TFh-0008Eg-Tb
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:40:51 -0400
Received: by mail-pf1-x42c.google.com with SMTP id x4so14465927pfq.2
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 01:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XhPGM+zqQ4BsHHxsbMXA5cEEKMG6B7hju0GWrwl0ToY=;
 b=bo3krBPwur7n59cUrUgo9AohEfwIWCIl+JEAspIG4PjUMPJMfn/+nQEteeHQpazKZ6
 +J6wCU6Ndk+QIYBBSNv+hNAlF8/4yL4gglvzvW9/LLa0DQzLQpSsGS3cICs9A7REI79I
 AnTWEy0DWnuXaWrrGmx91qNtO6/BkrUwOXTW1R1NYS6FWJ2bMKs5IO5FdeirTurk0exE
 7/7TjtcQH2CuXaZT4IsWEJ4uRwyN3+oi2b3Ob92usmTEgdQAQxqKMOzKrI1EGr2XM6xl
 9036CRKr1+iMIqrHdsB6BXiJtwn7dfCIE0C5NlcFvKTjBPW1LztqhdEn5U+BdTNH/mvk
 bdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XhPGM+zqQ4BsHHxsbMXA5cEEKMG6B7hju0GWrwl0ToY=;
 b=L4RihSc3M2JiyQTvKiqE5/kaqw+Fbfa8dKAyEu9BZNVmjy/BC2QAlcoYIsU4l1ijH/
 UXg/VnzkfHtz1Ukdo4TuypLNEa07K+DHtwElAK5rDvsyPbwa7XjwCziz44zOUcRJhBPg
 Il7q2lrHGyggnUx07dZxbZMml5NcVA7mJcPnZwKTwCTqGM7K/W+o22Ia97N7lL8hakUR
 aypnmo6jRpqHglmB/f4XPPe0BIkrXrrIb5oLaaAt1dghVYcRYYN02/CY9yuiGpywUSwB
 xH+rXXr0gMrNhnacqucybJSd+4+XJzwrihV5sfhQPPkc913M8Blrcmq9vo7QrsAIqZVg
 ASVQ==
X-Gm-Message-State: AJIora8vjht+Ewx07XdKxViyuKk5sN7J6GI8xkEcoL87bIUw/QMtvOtV
 kYm6+OnraXsVxyCTfn1WJt9EvJqp0JC3BkD2pg4=
X-Google-Smtp-Source: AGRyM1sleGHDSVtSBPsiLAFkz0tIZxzU+P1ixyoVXvF0khjEfmxOTcUXWOjAFdvyxbVsyYDrJDNad96aXQgvyFSRHS8=
X-Received: by 2002:a63:6cc8:0:b0:40d:e553:f200 with SMTP id
 h191-20020a636cc8000000b0040de553f200mr1996398pgc.166.1656492048437; Wed, 29
 Jun 2022 01:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220628114307.697943-1-richard.henderson@linaro.org>
 <20220628114307.697943-3-richard.henderson@linaro.org>
 <CAMo8BfJgo184TYxr0O-t5x68Ac1U3t9LWWvPeUEwm-E_qizGWQ@mail.gmail.com>
 <b4f49f9d-769d-e307-b01d-aadc5df70642@linaro.org> <87tu83j3gx.fsf@linaro.org>
In-Reply-To: <87tu83j3gx.fsf@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 29 Jun 2022 01:40:43 -0700
Message-ID: <CAMo8BfLmQFKh-BuFXWqU2w+T_nVmBjXZ24THHneyJmdgcYPZ5Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] target/xtensa: Use semihosting/syscalls.h
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pf1-x42c.google.com
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

On Wed, Jun 29, 2022 at 1:09 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> Richard Henderson <richard.henderson@linaro.org> writes:
> > On 6/28/22 19:08, Max Filippov wrote:
> >> On Tue, Jun 28, 2022 at 4:43 AM Richard Henderson
> >> <richard.henderson@linaro.org> wrote:

> >>>       }
> >>> -    if (serial_hd(0)) {
> >>> -        xtensa_sim_open_console(serial_hd(0));
> >>> -    }
> >> I've noticed that with this change '-serial stdio' and its variants
> >> are still
> >> accepted in the command line, but now they do nothing.
> >
> > Pardon?  They certainly will do something, via writes to the serial har=
dware.
> >
> >
> >> This quiet
> >> change of behavior is unfortunate. I wonder if it would be acceptable
> >> to map the '-serial stdio' option in the presence of '-semihosting' to
> >> something like '-chardev stdio,id=3Did1 -semihosting-config chardev=3D=
id1'?
> >
> > I dunno.  I'm wary of having xtensa be unique here.  Alex, thoughts?
>
> Is semihosting *the* serial hardware for xtensa-sim or is it overriding
> another serial interface? I'm wary of adding more magical behaviour for
> -serial as it can be confusing enough already what actually gets routed
> to it if not doing everything explicitly.

There's no notion of 'serial hardware' for the xtensa-sim, all it has is
the three standard stdio file descriptors. But it was convenient thinking
of them as a serial port. I agree that no magic is needed here, but
the change shouldn't be quiet eiter, so xtensa-sim should warn (or
maybe even quit with an error code) when it sees the -serial option.

--=20
Thanks.
-- Max

