Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F23340EED
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 21:16:55 +0100 (CET)
Received: from localhost ([::1]:60562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMz4g-0003p1-EW
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 16:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMz2e-0002o5-Uk
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:14:50 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:43650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMz2c-0004SI-8a
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:14:48 -0400
Received: by mail-ed1-x52f.google.com with SMTP id e7so8212787edu.10
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 13:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Slz3Sk8F3I1jFQEZGdButOahAHA1k5lJ+yNinAJeJY=;
 b=GMMAlZ/m1QnBTvg3c4ddZ8y1L/nJll4Zn3t9rJaqPBrgmAsGwLFvE7sZFWfwjuW4vU
 QYH0AIKJSL/4nD6iFin0Ichhnl1aVzhi9NpR4/waIFJ2vzIGyvatlka5xQPuDJn5DYzd
 iUZMU7gJAGKjXDO4uAmCIdGppIGq2skG+GJai5bFWjgRgYO9HkRZCsRbRNi+ln7dQSEL
 XOF+NmjYeiD3JHHctyOHjqQFnIYVQPaQ6DHmBTFm02dYZK/fibcBlYdSC2axFiI1dQQ0
 ZwuQQA06HIptIYX1sPKmBOolcCEoTsUx0Kjb3CBQmUd3zS2JnhGj/7L4+9r9CHkJ0sX6
 Spyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Slz3Sk8F3I1jFQEZGdButOahAHA1k5lJ+yNinAJeJY=;
 b=spF+RJyc6gFD5xvWNYTPnXn3PAua+wPnueh3jIMLE+oINai4pkKLgRMiTBJFuBW2j0
 oK2k47g9JEePnHfM685bj85PTQ/d4g2zRk3qVSgPU54FbMLXbAS/aYpDAHWLf9h7HIGv
 eCgIjmq+V2okFJJvDge2XR/hDSI05NqVHQ4bEtHZdaQXH0nBRjHh7laRwNS6ixjEm2N0
 VvD8Va8eV6TF1ObPUCrDOP5yX2CqLaEzJCc8h5/GhGUhcGC+Z2iBYT7hLL0S6snkx39q
 tUa8AEU+Gps4HMaSS/ch3ZhEd0eJrZWldkOOhOQB8C2bKbII+eT64ibDDBV49JGPDzuw
 gwkQ==
X-Gm-Message-State: AOAM533ZXjNcks0hmtA5n8TtlfWbyarWS4LxtyD1t8XChYfP/hx6KtnN
 AW6786HiVz8Tiry1rMAWWJmBiRDICKGkv4KEgc1uGw==
X-Google-Smtp-Source: ABdhPJw5YdkOIR+2WdvbBo4NDSTmibLQil+cuC3wMiAqCWCLpVd1HBYobvZfL0j763TyvPnXhDlyPj4TC7MnOK4YKEI=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr5666277edt.251.1616098484753; 
 Thu, 18 Mar 2021 13:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <YFJjIq45ggSZz0CX@work-vm>
 <CAFEAcA8aifakYwKn0umNbuCVtAsa_1svEGEq-coj9iVo3b1WPA@mail.gmail.com>
 <YFMpCPtMJzXUeeIk@work-vm>
 <CAFEAcA_+Yvn5S8P3zwPcsO9HF=0rXCJrfUZKs6RAQWhdyG_-fQ@mail.gmail.com>
 <YFMqmDmwDZwRQviM@work-vm>
 <CAFEAcA825k8uttjmJuwNM=rDa-m7nOWJZEAQzP9Zz3e7yyS9Aw@mail.gmail.com>
 <YFMvO/79vcSFOEix@work-vm>
 <CAFEAcA8+FfNaQ+26cSKYP8X05F-hqZ+0CxF7cS0hj=AW2M6O6g@mail.gmail.com>
 <YFOybOQAk6IXCL0R@work-vm>
In-Reply-To: <YFOybOQAk6IXCL0R@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 20:14:20 +0000
Message-ID: <CAFEAcA_h93Ta1oNPz0mQEchSw0dT-Bxi_UUEyC9L22G5f+oV5w@mail.gmail.com>
Subject: Re: of AVR target page size
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 20:05, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Thu, 18 Mar 2021 at 10:45, Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > >
> > > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > > Also, what does the
> > > >  /* 0x80 is reserved in migration.h start with 0x100 next */
> > > > comment refer to? migration.h has no instances of "RAM_SAVE"
> > > > or 0x80 or 1 << 7...
> > >
> > > It looks like it got moved to qemu-file.h a few years ago
> > > as RAM_SAVE_FLAG_HOOK.
> >
> > Could we put the define of RAM_SAVE_FLAG_HOOK in migration.h
> > with all the other RAM_SAVE_FLAG defines ? It looks like the two
> > places that use it already include migration.h...
>
> Do you mean move the rest of the RAM_SAVE_FLAG_* from migration/ram.c
> into migration.h?
>
> We could do - although they're never used by anything else.

Oh, I'd missed that the other RAM_SAVE_FLAG_* are in a C file.
Yes, I think they would be better in a .h file, so the whole set
of definitions can be together. migration/ram.h seems like a
plausible place.

thanks
-- PMM

