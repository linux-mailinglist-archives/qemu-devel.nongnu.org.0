Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A3D69AF8E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:32:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2iB-0006bC-Rd; Fri, 17 Feb 2023 10:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pT2i7-0006Wx-PQ
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:31:45 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pT2i6-00077O-BL
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:31:43 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 q5-20020a17090a1b0500b00229ca6a4636so1838086pjq.0
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 07:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GrHZ7Ej3VH2mZmEuckH77TcTUYrBeEs8vw/6zO9j1aM=;
 b=sfxvzDdejijcv2Lq/M5nVwzMWnbrgGtsIlVdqZUdkxOCAJInvfLNO44UgHu40Yk5Dj
 WNATwglAz0MrGF5ZpvmPYGfNirFn+7aamTI8w33oPvhf20mp7VrWoqgQQ6eIMxW8TC5X
 3Sny6S3hr18iFagpTqNLK7oaGyq78ghqFDAmVLMgt6qqRGLJJLd1DHENtLm98bINoP/L
 piRM2MoNvE1fz3mpZBpyMlqUyxD9t6bpJkeLHFqEwl50tdLGCqcaRvfa4m3fllMHQtK1
 WBwMnrgacsfYw3xwkDoM/792Jl8OzhFSsFonMrlPL3L2232RbV+stfI1KubTbzFBtShx
 c84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GrHZ7Ej3VH2mZmEuckH77TcTUYrBeEs8vw/6zO9j1aM=;
 b=FQotF7/8Rbi/2snlkacqPUW//rBWzv7Sk5mJk29GqzYQktZwrCZe7tx9I6GKZ/Eri4
 Nxs29QVX1YsamYC2O+cmN9re6BVKw/F1pVRAY1E5yGjnB9KCJwscJc9Sjy+lD2rneAEF
 pzSO7s8CQuCtCMGOqv3Eq6d3lcDbiTUwXD+LcLv9g/CFClOgc1q0ZB0fRUQ2LMAs+V3D
 MW0HhXdbkRCufs9fYm9Ldi6+tEoqsOnwZfVU6GNqgPsv+72XribfQOm00Hahm67u7zjo
 pckOHKjqJmZBuwWeC57Ymw0C/ya+op6nvWLLPBHqzHc+DM2mYSkZu//M8I+TtnGJxifV
 Kv2Q==
X-Gm-Message-State: AO0yUKWwxHNox5jrFKCCmDxqqrkjv9tOYSZ5QlnPtyekcFC0yb2A4Yjb
 XwKRfj1GksZwgjF72NamyjuV8QyffUoB7LXfFcTDQw==
X-Google-Smtp-Source: AK7set+tEzuLHbJ+97EoQI0KGaOmGbIaaDUoTjX8fjf8wXponFJpbjBk4e1IEk+hfgE4CkwZo6NpPSs98NPUZij64U4=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1732525pjb.92.1676647900229; Fri, 17
 Feb 2023 07:31:40 -0800 (PST)
MIME-Version: 1.0
References: <CAPWd1mzg0rWgpf_D+NC+yAosx8oJnA+tR=NpsuFNtWP-j25=pQ@mail.gmail.com>
 <CAFEAcA8dH+DDPHWg6xRmT=3oCu1rwyb1gbyVCXFTSDSzBrGg-w@mail.gmail.com>
 <4ea862746a066107573650d04f4eee6992e0ede9.camel@infradead.org>
 <c2011213-8c8b-95c0-9565-47eaf7d33688@linaro.org>
 <5c7026171d3ab5d530784308a5ce71d32e6760c7.camel@infradead.org>
In-Reply-To: <5c7026171d3ab5d530784308a5ce71d32e6760c7.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2023 15:31:28 +0000
Message-ID: <CAFEAcA95DdTcRXQQTC1vKrnD69S1YuEfnPC6uga7_=fjepBMsQ@mail.gmail.com>
Subject: Re: Runnig solaris binary(32 bit) on linux(64 bit)
To: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 ginu samuel <samuel.ginu2010@gmail.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Feb 2023 at 19:39, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Thu, 2023-02-16 at 09:29 -1000, Richard Henderson wrote:
> > On 2/16/23 09:02, David Woodhouse wrote:
> > > It wouldn't be beyond the wit of man to extend qemu-user to support the
> > > similar personality variations for SCO/Solaris/etc. using that as a
> > > guide.
> >
> > Not beyond wit but perhaps beyond patience.
> >
> > It would certainly be possible to emulate the "easy middle" of one POSIX guest on a
> > different POSIX host.  But the dusty corners are going to get in the way, where we
> > currently rely on guest and host having identical semantics, and pass the system call
> > through to the host.
> >
> > It's a big job.
>
> True, but the existing iBCS / linux-abi kernel patches should highlight
> a lot of those dusty corners.

linux-user is pretty low on maintenance effort as it is; I
just don't think there's any likelihood of anybody with the
time and interest in doing Solaris-on-Linux emulation showing
up to do the work, especially given that our user-mode infra pretty
heavily assumes same-host-same-guest-OS.

thanks
-- PMM

