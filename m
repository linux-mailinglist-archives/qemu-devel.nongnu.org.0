Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6A8633BD8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 12:54:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxRpP-0006zo-VL; Tue, 22 Nov 2022 06:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxRpI-0006zO-8z
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 06:52:32 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxRpE-0000Qy-NN
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 06:52:32 -0500
Received: by mail-pg1-x536.google.com with SMTP id 130so13873494pgc.5
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 03:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CdXpfV5FIPQFRx57C+bT14vm6M52J5RCk44OAtcgtaE=;
 b=Gl/sZ2d1ljfaxoGUN7e4UgPp2408qoSU7URnM6OXqMdx/npxOCsghAeEusmFgDuN3m
 oOolKCXpRxxi+3anX83gSzOSAUPAPm5+7Br2bAqrSa/GsdJ40qbmnOVffGlu3fVh1u0M
 nfNRcvEVQJsad/uFkjgRjojVuAkvaj1rNjz2FO35Vg1CtsQAosSeho58RxtR5eDYI7Vf
 NuwYU4V9v0MEaFQGLM60ROtfAUcXNKbEmYkwi92sSt8IfhuF2S8uckmj7m+wj116ZO00
 6mBmAR/rcDor6TYAffAhQoP7VTNhsc0RyPohld+8RBz192vbg8VqUmQkagz+zOdhYcSQ
 7cEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CdXpfV5FIPQFRx57C+bT14vm6M52J5RCk44OAtcgtaE=;
 b=E7rzagHcee+Ei1zBG7SP93AIDz/t5ST8SKIIGVEEZbN4G/qlONO/vQGEy4pHzBlFuK
 zXdQUH8mkBXkbTXGnAL+DcWXi6zhCKbBga6cZOjOA4YUATHtgA8y5BRsZ61YgSicpkyG
 MNK695vLX/szkgA3TiU4Hsu99AEqJaJ5D926YYWjNGE0Vqg5owpOdDCd0a++WNN318bx
 z2NG6yDx2dgTRaeOc+L/7W4JmeZ4/01qfZ55z3HV1jjrqk3vzntZITRySODgv9coRQBF
 SqNEuuv6bCMNZjNgGSDG8x1NQbnuK9b2Ip9k2gGW1w9uDAWKcVnRmxCcj1ALdRXgem4E
 4Oow==
X-Gm-Message-State: ANoB5pm1yjEjZbvJlsTl28/Gy5BJiMCFtIaTT8QnG7aaNvT7+SUq1EZA
 gZTg21fZxYQjNhvicfZOFEX86nMfieB4pBTnLH9TLg==
X-Google-Smtp-Source: AA0mqf565HqbiZ8rSP88AjN33tnvRZF4NPATsx43PceGmeyFBKm+U+vI9UFMdtH+m03qopuqGHHxo8WkPQynWyTb9Kc=
X-Received: by 2002:a62:b501:0:b0:573:1959:c356 with SMTP id
 y1-20020a62b501000000b005731959c356mr4480044pfe.51.1669117942320; Tue, 22 Nov
 2022 03:52:22 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9tnOCij+OKV8Mpe37g9i5Sd4oYVTA4642SAY9MfCBLLg@mail.gmail.com>
 <CAFEAcA_gDzyucBEq2pQJVmgZkLEP5hhW7k6_LmY7_mO3gEGHhw@mail.gmail.com>
 <b8a21f61-cf25-87c6-694a-c9623a9d9c43@linaro.org>
 <6e8844bb-9880-a504-1fc2-f5a43a363241@gmail.com>
In-Reply-To: <6e8844bb-9880-a504-1fc2-f5a43a363241@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 11:52:10 +0000
Message-ID: <CAFEAcA8KAbhbZp8ZVJAGcfkbONAKtGV4TYCfi2eZ-VEJSZcacg@mail.gmail.com>
Subject: Re: UI layer threading and locking strategy;
 memory_region_snapshot_and_clear_dirty() races
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 BALATON Zoltan <balaton@eik.bme.hu>, QEMU Developers <qemu-devel@nongnu.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
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

On Tue, 22 Nov 2022 at 08:04, Akihiko Odaki <akihiko.odaki@gmail.com> wrote=
:
>
> Hi,
>
> On 2022/11/22 7:37, Philippe Mathieu-Daud=C3=A9 wrote:
> > Cc'ing more UI/display contributors.
> >
> > On 17/11/22 14:05, Peter Maydell wrote:
> >> On Tue, 1 Nov 2022 at 14:17, Peter Maydell <peter.maydell@linaro.org>
> >> wrote:
> >>>
> >>> Hi; I'm trying to find out what the UI layer's threading and
> >>> locking strategy is, at least as far as it applies to display
> >>> device models.
> >>
> >> Ping! :-) I'm still looking for information about this,
> >> and about what threads call_rcu() callbacks might be run on...
>
> I briefly checked the code, and it looks like rcu has its own thread.
> Search for "thread" in util/rcu.c. Looking at call_rcu_thread() in the
> file will tell what kind of context the callbacks will be ran on.

Yes, I can read the code to find out what it does currently.
I'm hoping for an authoritative answer from the designer
about what the API guarantees are...

> >>> My tentative idea for a fix is a bit of an upheaval:
> >>>   * have the display devices set gfx_update_async =3D true
> >>>   * instead of doing everything synchronously in their gfx_update
> >>>     method, they do the initial setup and call an 'async' version
> >>>     of memory_region_snapshot_and_clear_dirty()
> >>>   * that async version of the function will do what it does today,
> >>>     but without trying to wait for TCG vCPUs
> >>>   * instead the caller arranges (via call_rcu(), probably) a
> >>>     callback that will happen once all the TCG CPUs have finished
> >>>     executing their current TB
> >>>   * that callback does the actual copy-from-guest-ram-to-display
> >>>     and then calls graphic_hw_update_done()
> >>>
> >>> This seems like an awful pain in the neck but I couldn't see
> >>> anything better :-(
>
> Converting memory_region_snapshot_and_clear_dirty() asynchronous is
> nice, but also don't forget about reordering things in
> framebuffer_update_display() so that the DisplaySurface reference
> happens after memory_region_snapshot_and_clear_dirty(). Even if you make
> memory_region_snapshot_and_clear_dirty() asynchronous, the bug will
> remain if you keep the stale reference of the DisplaySurface and pass it
> to the asynchronous callback.

Yes, it would need to either rearrange things, or else just take
a reference to the DisplaySurface and hold on to it until it's
done (which might result in a harmless write to a surface that's
no longer being actively used and will be thrown away when we
drop our reference). I think you probably need to take the reference,
because to identify the right arguments to take the memory snapshot
you need to know various properties of the DisplaySurface (eg its
size), so you need the DS both before and after the snapshot call.

thanks
-- PMM

