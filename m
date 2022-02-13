Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331934B3B2B
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 12:41:08 +0100 (CET)
Received: from localhost ([::1]:56756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJDFa-0002Hz-LD
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 06:41:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJDDG-0001ah-73
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 06:38:42 -0500
Received: from [2607:f8b0:4864:20::32e] (port=45960
 helo=mail-ot1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJDDE-0000TI-Lj
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 06:38:41 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 w27-20020a9d5a9b000000b005a17d68ae89so9666835oth.12
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 03:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sGy6+YA6Lv8KVw+rOUVLJDd2D7buJACZzak81xW9KKo=;
 b=p/fgOu3m900W/rw158RPGAl6q68tw63j/bzw1f/cElxOhFtNagDXCfqf5yGAvCD/Er
 R924kwWh95t8Dt3g3bXZ2OnDjcqE6gGHX2Re27mI77ucAt7GFpgEYglSiC0x7bzFqIlq
 wLU9nYAaZKjhFFUSQjVu0yAh79wj/2PzSrlRNjAwDDjhQf+C/tACUFw2VNMoiuoR6zOl
 mndvyTT2p8UwdJWf12IxfDeh87ZtUtLMMKhgtR3N1IHN3OQXM25WoJxMoDnLPZ8anfr0
 mzS737LkIxHlxHcUwMcHBGCLib8iVo3F5TOVjYCY/TMEfDsAw2IrAemK0coc62Lt4+IC
 VyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sGy6+YA6Lv8KVw+rOUVLJDd2D7buJACZzak81xW9KKo=;
 b=hUVgJkImPvWvQCZBG0VQFHo8xiIPVQOcYfy/rcpcOyMtGZAeVIUejNC1n7+AedzV61
 evEkkSNkeq9c842kriRMpAdtBtfqC9nXjuDRTxeSXUB5YSdxwKnrGrnEble6A8NbQlf9
 lgIbIIgIi4zh4V1sZzGOeomchswxGtV4qyFRfqJEmWwOYthVanhA00QKUdp5MdzAcZRl
 ULSD924chLaDw92uWGHNZIaECO5OvmF/5qNRgXMJ1C/fizVAtaR63rZ9RyXZpYOXCsLO
 4TAqj1J2o6RIZAXpaFjSdhMI4vkoJ8/7UBXPI4AmF2LJ63xf/jCqCepgwbh82Hl5dXVf
 RvhQ==
X-Gm-Message-State: AOAM530wwFiwBMWgQkAOtcRVcihvzS2PMtswT9kEYev3LKXMc//h9Jt6
 TSvjRbmH+NZX9jyeho0gFmLMRy1gi3suM+Vu6fQ=
X-Google-Smtp-Source: ABdhPJy9wQzjQ3nZFfJ26JTm2zWAhExrPxP3STsy2GXOuB4wb6fVRTBG0UIZjTS5ZkLfuJEsp+7rGu9LO5N8VYolfDE=
X-Received: by 2002:a9d:7cce:: with SMTP id r14mr2532351otn.235.1644752319499; 
 Sun, 13 Feb 2022 03:38:39 -0800 (PST)
MIME-Version: 1.0
References: <20220120123630.267975-1-peter.maydell@linaro.org>
 <20220120123630.267975-19-peter.maydell@linaro.org>
 <3f4f5e98-fcb8-bf4d-e464-6ad365af92f8@gmail.com>
 <87iltjxdz6.wl-maz@kernel.org>
 <CAFEAcA9yR4=PNCGJk6iMEq0EHejwwt-gQJfvByEk-EN6ER5o_g@mail.gmail.com>
In-Reply-To: <CAFEAcA9yR4=PNCGJk6iMEq0EHejwwt-gQJfvByEk-EN6ER5o_g@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Sun, 13 Feb 2022 20:38:28 +0900
Message-ID: <CAMVc7JWUm7v6gt48TP+ugzEeHwo6FA66TeE3h3fqyHmHsShoig@mail.gmail.com>
Subject: Re: [PULL 18/38] hw/arm/virt: Honor highmem setting when computing
 the memory map
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, qemu Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 13, 2022 at 7:46 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 13 Feb 2022 at 10:22, Marc Zyngier <maz@kernel.org> wrote:
> >
> > [+ Alex for HVF]
> >
> > On Sun, 13 Feb 2022 05:05:33 +0000,
> > Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> > > Hi,
> > > This breaks in a case where highmem is disabled but can have more than
> > > 4 GiB of RAM. M1 (Apple Silicon) actually can have 36-bit PA with HVF,
> > > which is not enough for highmem MMIO but is enough to contain 32 GiB
> > > of RAM.
> >
> > Funny. The whole point of this series is to make it all work correctly
> > on M1.
> >
> > > Where the magic number of 4 GiB / 32-bit came from?
> >
> > Not exactly a magic number. From QEMU's docs/system/arm/virt.rst:
> >
> > <quote>
> > highmem
> >   Set ``on``/``off`` to enable/disable placing devices and RAM in physical
> >   address space above 32 bits. The default is ``on`` for machine types
> >   later than ``virt-2.12``.
> > </quote>
> >
> > TL;DR: Removing the bogus 'highmem=off' option from your command-line
> > should get you going with large memory spaces, up to the IPA limit.
>
> Yep. I've tested this with hvf, and we now correctly:
>  * refuse to put RAM above 32-bits if you asked for a 32-bit
>    IPA space with highmem=off
>  * use the full 36-bit address space if you don't say highmem=off
>    on an M1
>
> Note that there is a macos bug where if you don't say highmem=off
> on an M1 Pro then you'll get a macos kernel panic. M1 non-Pro is fine.
>
> thanks
> -- PMM

I found that it actually gets the available PA bit of the emulated CPU
when highmem=on. I used "cortex-a72", which can have more than 36
bits. I just simply switched to "host"; hvf didn't support "host" when
I set up my VM but now it does.
Thanks for your prompt replies.

Regards,
Akihiko Odaki

