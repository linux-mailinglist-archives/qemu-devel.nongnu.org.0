Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F362ADD95
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 19:00:00 +0100 (CET)
Received: from localhost ([::1]:33900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXvz-0002uT-Qy
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kcXuC-0002Pt-H7
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:58:08 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:41813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kcXuA-0000Ab-Sd
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:58:08 -0500
Received: by mail-io1-f66.google.com with SMTP id t8so10674449iov.8
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 09:58:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Y4hoB5m2LDQ5lEOluKdi4w5+1cMvmlUv1nNDsnsk3bk=;
 b=n9SxlC5c900BNpWFI5giDWNt4WoQeieOyiBs/X7erk8cN9SfvH1ndR0rQqVDqhvXjR
 +otW91gmL/7KMCpQ4O5V15KZ2l+1qRiEW1gd+vXSjnRtZUd7IzyfXd+jCjbiPLN9Qgvu
 8flfE1WQ2npLGXcP9oJydrvJe1l/fh49gu5fZIHr5AVa0dxEo6uyKFCJ7zDhrdApoDnc
 aBH5agrbOWKQ8wz0sMA9FSo5aX/SdEW/dFaXKixk3Nf7x7SlwDWrjPo9KCl0hx7JN6Qw
 VsWp/YzNsXxc7L0dSQCpSvMK9VtXYV++ZnLYS6qLcURJQxuMXMmQaJw1Tp5vg0DzoR9y
 qjUQ==
X-Gm-Message-State: AOAM531EZNzwAAMwlwCOzGuSnk1NBdzh9W7rHCo6tccaRWu1Z85kj3kw
 KosYLgnDqgxAz55zuOd35EglfSkOww0=
X-Google-Smtp-Source: ABdhPJyjCda4UAhVwF/y3ArKIZvYVpO9cPqmqMegX0yAcb0+BzDIdZS09Kvv78RYZrjX9D15twMtWg==
X-Received: by 2002:a5d:89ce:: with SMTP id a14mr14774760iot.85.1605031085456; 
 Tue, 10 Nov 2020 09:58:05 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id i3sm7704608iom.8.2020.11.10.09.58.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 09:58:05 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id p7so15174407ioo.6
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 09:58:05 -0800 (PST)
X-Received: by 2002:a6b:6610:: with SMTP id a16mr14928990ioc.193.1605031084830; 
 Tue, 10 Nov 2020 09:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20201106032921.600200-1-richard.henderson@linaro.org>
 <20201106032921.600200-17-richard.henderson@linaro.org>
 <87zh3p6rl4.fsf@linaro.org>
In-Reply-To: <87zh3p6rl4.fsf@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Tue, 10 Nov 2020 09:57:54 -0800
X-Gmail-Original-Message-ID: <CA+E+eSBBsPxhga3ALBaVeGzyLved5gs9emOQvvyPPk+GGRdzfQ@mail.gmail.com>
Message-ID: <CA+E+eSBBsPxhga3ALBaVeGzyLved5gs9emOQvvyPPk+GGRdzfQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/41] accel/tcg: Support split-wx for darwin/iOS with
 vm_remap
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.66; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f66.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 12:58:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FWIW, it's a syscall that's been around for as long as I can remember.
In macOS 11 they added a new mach_vm_remap but kept the old one for
compatibility so I don't think it's going away any time soon.

-j

On Tue, Nov 10, 2020 at 9:37 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
> > Cribbed from code posted by Joelle van Dyne <j@getutm.app>,
> > and rearranged to a cleaner structure.  Completely untested.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  accel/tcg/translate-all.c | 65 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >
> > diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> > index 1931e65365..17df6c94fa 100644
> > --- a/accel/tcg/translate-all.c
> > +++ b/accel/tcg/translate-all.c
> > @@ -1166,9 +1166,71 @@ static bool alloc_code_gen_buffer_splitwx_memfd(=
size_t size, Error **errp)
> >  }
> >  #endif /* CONFIG_POSIX */
> >
> > +#ifdef CONFIG_DARWIN
> > +#include <mach/mach.h>
> > +
> > +extern kern_return_t mach_vm_remap(vm_map_t target_task,
> > +                                   mach_vm_address_t *target_address,
> > +                                   mach_vm_size_t size,
> > +                                   mach_vm_offset_t mask,
> > +                                   int flags,
> > +                                   vm_map_t src_task,
> > +                                   mach_vm_address_t src_address,
> > +                                   boolean_t copy,
> > +                                   vm_prot_t *cur_protection,
> > +                                   vm_prot_t *max_protection,
> > +                                   vm_inherit_t inheritance);
>
> Our checkpatch really doesn't like the extern being dropped in here but
> having grepped the xnu source I'm not sure we have a choice. I'm curious
> how stable the function might be given it's not in a published header.
>
> --
> Alex Benn=C3=A9e

