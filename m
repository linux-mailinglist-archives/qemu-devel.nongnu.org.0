Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E3D3704EC
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 04:09:55 +0200 (CEST)
Received: from localhost ([::1]:48540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcf4s-0005qt-A1
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 22:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <katsuu@gmail.com>)
 id 1lcf3i-0005IT-Oe; Fri, 30 Apr 2021 22:08:42 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:33548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <katsuu@gmail.com>)
 id 1lcf3h-0003Hf-8Y; Fri, 30 Apr 2021 22:08:42 -0400
Received: by mail-ed1-x535.google.com with SMTP id g10so239066edb.0;
 Fri, 30 Apr 2021 19:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IQ1HyKjMmBYKB1SMhz+mNCbW0/KH0qETd4EbXQvJS5I=;
 b=JWjHMH9q9yqTd15AWmu/1SlKYcLdu0OreaNUy9KpxwTZEoTUpiPX7djmfJ1ViTW2NY
 GfXXrX9iBVAXOmMOtoF9N2cMN86Kc1a38IbrsY7B5JpGhDTWEAwMN6OQ6H8MnHaV4ygO
 Hcu0kTdB8bNGtdt+3A4Xj1JmeOSaExu3idqdda/q2Pr19WxheWUoIVYXUNCDI+pce4C0
 0ciI3zPI528QlV4bA/QgK0TjBl+tyRdFDC9UNMugmaqPKY9jJuBvVKXwjbmODadZQPT/
 lgT6DUal8FUq8/hhnHGgivRm9LGXNA3Hs18tshKf36lR3VbC2v5r6GfGP/xB4+TCfcb+
 Hvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IQ1HyKjMmBYKB1SMhz+mNCbW0/KH0qETd4EbXQvJS5I=;
 b=G7q6ourotkTLkvwdvDsYInN93yyyJ+u1yJ5J+WmziayxJEHoysHhMyIc01FFpgETo7
 U137ZC8k3yVgjH2My5A3hJ8J7P+m6rL3q8bbNBlG8ESfbqZ4vSFY4DiLx4ZMeSM30ioO
 fYnbByITZB0RJE9yoVuy6Y4VjtlD/rJf98XMSWtUDZbTodD58GmZ6M0lNK2TXs6Nioqa
 GkwRY/UIcgtpYUlulYfQQmhYutXRzQFZFBWR3UFO8Htrfq4XLpHpLuVGb+fGD9guozBd
 +fyMRurg//zWPjTSoT1GhHTAV0gRq8wTtjQXDdUvBeb77iCDPvXTxkpa7Y5cjkvLqBbn
 RxEA==
X-Gm-Message-State: AOAM5318vOtwp16Au5eTO33wrF3KYmmr4fO6OmJ3E3R1PVV6viJXAnIf
 u1B8zI3e0p/56EK05BNTj/DoSW1IinB2qH+Y8Pc=
X-Google-Smtp-Source: ABdhPJyh9wNXCKcm9JcnL/HHQURB/rhUtT4f0QtkbeOHprO6BrsoM8QYXMy4FIxegkwJJXVmZ/l1xLLCGhwUak0XsAk=
X-Received: by 2002:a05:6402:142:: with SMTP id s2mr9308949edu.2.1619834918412; 
 Fri, 30 Apr 2021 19:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <CA+pCdY09+OQfXq3YmRNuQE59ACOq7Py2q4hqOwgq4PnepCXhTA@mail.gmail.com>
 <2571b8c3-3e2b-f90e-6077-05232a52c711@redhat.com>
In-Reply-To: <2571b8c3-3e2b-f90e-6077-05232a52c711@redhat.com>
From: Katsuhiro Ueno <uenobk@gmail.com>
Date: Sat, 1 May 2021 11:08:22 +0900
Message-ID: <CANrJRqLyfijWWbrAwpQLrWuH1-hmraGnx2EQO4GaTH6D1TVxEQ@mail.gmail.com>
Subject: Re: [PATCH] meson: Set implicit_include_directories to false
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=katsuu@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021-04-30 16:48 Paolo Bonzini <pbonzini@redhat.com>:
>
> On 29/04/21 04:43, Katsuhiro Ueno wrote:
> > Without this, libvixl cannot be compiled with macOS 11.3 SDK due to
> > include file name conflict (usr/include/c++/v1/version conflicts with
> > VERSION).
> >
> > Signed-off-by: Katsuhiro Ueno <uenobk@gmail.com>
> > ---
> >   meson.build | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/meson.build b/meson.build
> > index c6f4b0cf5e..d007bff8c3 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -2129,6 +2129,7 @@ common_all = common_ss.apply(config_all, strict: false)
> >   common_all = static_library('common',
> >                               build_by_default: false,
> >                               sources: common_all.sources() + genh,
> > +                            implicit_include_directories: false,
> >                               dependencies: common_all.dependencies(),
> >                               name_suffix: 'fa')
> >
>
> Can you include the difference in the include paths (the -I and -iquote
> arguments)?  There are many cases in which we rely on having the current
> source directory in the build path, for example all inclusions of "trace.h".

This only removes -I.. (current (top-level) source directory) from the
arguments. The meson manual says that it also removes -I. (current
(top-level) build directory) but -I. is still in the arguments (I am
not sure why). This does not change any -iquote argument.

As far as I know, this does not affect the inclusions of "trace.h"
because each "trace.h" is in the same directory as the files that
include it, and the top-level build directory, which has the "trace"
directory containing generated "trace-*.h" files, is still in the
include path.

--
Katsuhiro Ueno

