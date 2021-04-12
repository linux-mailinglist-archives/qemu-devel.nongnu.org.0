Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191CE35BFC1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 11:20:14 +0200 (CEST)
Received: from localhost ([::1]:34044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVsjs-00035g-Uc
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 05:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVsbH-0006Fg-7y
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 05:11:23 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVsbC-0002tS-62
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 05:11:19 -0400
Received: by mail-ej1-x62f.google.com with SMTP id v6so17772063ejo.6
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 02:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L+HGPKmSWLTGqW706W8/aYENoI2653t1drLd1dZ2Ww4=;
 b=G/Jsc39B4Dfmw1dPeiu3yveDpftVxj0HUulnEAhzfjKMHuxm8CTSBQVJ6jCKHnTjHW
 pNJ64Fyo6HmpFFLzhiWy05qu65UVBslK2PFwXDl0yCjsYx4KoyASBKysvxVDlbBDWzZF
 qO4hB6t3ptVptS5c+ccAMyeLhN/G8YiEk3wTKzxELxP3WsB3rLzvivWp+UW1nUDMPtg2
 nnx89r0hgB15eLjbznyrqEabAYHQUmRL0Z+7OSAi5lQ4R3CGUm+DnJagl8IWjL1g9L9B
 zrCJCZ6wsO3HGiSpeLt4xIIKz5Eg9yMjIotw4VgZ2/FNTre0cCU9jceE9NyLqMdwftOt
 Wabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L+HGPKmSWLTGqW706W8/aYENoI2653t1drLd1dZ2Ww4=;
 b=AvBJVeE4TPP9QXsY49JtC42a9lLKQLminLbi2+uyQGqFf/QQWT6ZwNYyY0TGIQVbKf
 DjrbSSGEPbFw9GGITdeZoGEWp8eE4SCgN/98qWWJnUnhsWkxqDC/uLoX5hcNkH7+9d02
 Tv/m+Mealc6rm+4D4P6nwAB0hPKD8WvLxZB20r1jSQlr0CZLh4poSDVINL2sZbZ4fSXW
 e8d9DcJ3Mtf5aVtRJmh8icm74j1nI0DT/qXrIYmOvGP5nT/TKpiSzXOaFmH3FVvLt471
 WpKONQPnpwLP/HWwEXCkBZwYRkMjk4WzfBk2ern2+pbQPRY41wkFmH5SKfUW8TECXMmH
 VTXg==
X-Gm-Message-State: AOAM530shtQpKSU5i0r8kR8Wxs7bRxihIyxfF/hOU2rEwtLUaOeSGj/8
 MW6afGg5vBJuv/Dzw1P51vbL96das2Bm1wgkSR0iDg==
X-Google-Smtp-Source: ABdhPJxagGT4Il4oKFrwBCZa9502sn6ci84ZWLMuhTQhF1vSBI9/KQyI9L0ZMOpSNoLJDeUdOn2G0fDtrd6GZ81fdqM=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr25817053ejz.382.1618218672861; 
 Mon, 12 Apr 2021 02:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-28-cfontana@suse.de>
 <e49aa062-0958-1d4e-c682-28d0a2897493@linaro.org>
 <87e94d27-a1ec-cd6a-8079-0f975121d479@suse.de>
 <CAFEAcA-hqUehQ9chX_H4M9karU9XksirqC=daekRk=ymDRvzwQ@mail.gmail.com>
 <62c54475-0fe6-042b-cf13-f15490bad525@suse.de>
In-Reply-To: <62c54475-0fe6-042b-cf13-f15490bad525@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Apr 2021 10:10:28 +0100
Message-ID: <CAFEAcA9h7D_LkVfTvJom_afZ44b+uyRvbnaQ8t6wiMKOELjwZQ@mail.gmail.com>
Subject: Re: [RFC v12 27/65] target/arm: split a15 cpu model and 32bit class
 functions to cpu32.c
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Apr 2021 at 10:05, Claudio Fontana <cfontana@suse.de> wrote:
>
> Hi Peter,
>
> On 4/8/21 12:36 PM, Peter Maydell wrote:
> > On Thu, 8 Apr 2021 at 11:23, Claudio Fontana <cfontana@suse.de> wrote:
> >> Mainly for this code here a question from my side: is the current code actually already "wrong"?
> >>
> >> I mean, we unconditionally set the aarch64-capable cpu classes to all use aarch64_gdb_arch_name and gdbstub64,
> >> but what about an aarch64-capable cpu running in 32bit mode?
> >
> > This is somewhere between a bug and a missing feature. The 'bug' part is
> > that for running a guest on AArch64 KVM with -cpu aarch64=off' (ie a
> > 32-bit guest) we should be presenting an aarch32 gdb stub, and we don't.
>
> Isn't this "easily" solvable? Probably I am missing something obvious..

Fairly, yes. That's why I classify it as "bug". It's just nobody's
written the patch.

> I mean we could dispatch to the one or to the other according to ->is_aa64()?

No, because is_aa64() is the "at runtime, is the CPU currently 32-bit
or 64 bit?" check. For gdbstub functions, because gdb cannot handle
runtime switching, the check should be a static one of the "what kind
of CPU is this?" type. (This is effectively what we do today, except
that for the special case of "aarch64=off" we make the wrong choice.)

thanks
-- PMM

