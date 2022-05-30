Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0ED5387A1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:02:45 +0200 (CEST)
Received: from localhost ([::1]:32968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvkf4-0008EP-V1
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvkdf-0007CL-TK
 for qemu-devel@nongnu.org; Mon, 30 May 2022 15:01:15 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:40479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvkde-0002mN-5g
 for qemu-devel@nongnu.org; Mon, 30 May 2022 15:01:15 -0400
Received: by mail-yb1-xb34.google.com with SMTP id z7so20326107ybf.7
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 12:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7BnUTAt872dtCS7tKctwL+YpoBLVhZEQFwqz14hxo3U=;
 b=Xr1nKKov3as2F8skh9jfCyO5BESGOCAwCxF+sGvk21pPv/pWMRbKOx8XwkIlc4e2/F
 TKekIfvYzQR8mCZfgUQ1XerGYG7YAE1P0hu+0/qC+Kf//40oFWOAqhem3IZdBL4Xs2rd
 I7FLs/N7CwWCGScLgomAnMOwwH93dhbmnynPdTqrNPuUkuiWN/kmE1aGTCZVPMPkme8n
 jS3joqP9cj3bce7mjWhm0lpFgotZcd8ZgcuQ1ISY+kYXdOi/VHI+6lP/mwZrAenLpkor
 gX75obOryfjD+hjOMSkuwV2CctU4uJTdDJTbVUhTo1tIW9+b7Yr31b0v+vpUqa6kExlG
 wQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7BnUTAt872dtCS7tKctwL+YpoBLVhZEQFwqz14hxo3U=;
 b=PWTQxprWJ4jF83gVGGuEPwSbxmmvOrAO/QYSITCVCeK40QERTsVCqIXCFAOvqSeARK
 9ungh3P4FHsq4ftJ6iMB+aq9SGhd5nHB5O/2O5kflCNqee39oJFapsWcSHNBh9xNOO8R
 wa9bZOF/5iagOE07O1wQDbkZKAkkme6kOTrcMcQsmWRb8V/VvDvz/Q3hUOn0n+kQYDLP
 Em6AReUT1KRMOl94QnWM10gu2CtUPPoe4lFuMUdn4IKq/PC9zHLt9UikHX63/QWCzUBU
 c2Fi6lEsGd/yXHO2O/jz91eUUvbs1uoHN31MDPysTxH5nUiOskOhmwu5PFTe2tyHmVmE
 2jBA==
X-Gm-Message-State: AOAM531nxhSbUeg55i3XMTurLpA6JNJ2aVP3nh09NflyrT74YV6qf/T3
 IO6KBoB3qtn90knGpJj1zrtf4Gb/WrLsjoc6w8ZYdw==
X-Google-Smtp-Source: ABdhPJzbvepR90M389B4jdTE8jPULuQw+Gkr93yF0sfxgOYYiN9yw9dYf7NImQfzitFD/NB8HptfKSy538VddPPmz5E=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr54986622ybq.67.1653937272933; Mon, 30
 May 2022 12:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-2-richard.henderson@linaro.org>
 <CAFEAcA9Q8FQpG6RF4rnMS3EXZqBXzOs=n-3oH8iq5gU2wV4Emw@mail.gmail.com>
 <da0ad208-948b-1da0-5c61-039c084d50dc@linaro.org>
In-Reply-To: <da0ad208-948b-1da0-5c61-039c084d50dc@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 May 2022 20:01:01 +0100
Message-ID: <CAFEAcA9bT0_tKH7vS+gt05rr+tskPh4JuzRTMvTN=CokQfFUdw@mail.gmail.com>
Subject: Re: [PATCH 01/18] target/arm: Allow raise_exception to handle finding
 target EL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 30 May 2022 at 17:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/30/22 05:44, Peter Maydell wrote:
> >>   G_NORETURN void raise_exception(CPUARMState *env, uint32_t excp,
> >> -                                uint32_t syndrome, uint32_t target_el);
> >> +                                uint32_t syndrome, uint32_t cur_or_target_el);
> >
> > "cur_or_target_el" is odd, because it's mixing what the architecture
> > sets up as two distinct things: the state the exception is
> > "taken from", and the state the exception is "taken to". I was
> > hoping this was just a temporary thing for the purposes of the
> > refactoring and it would go away near the end of the series, but
> > it doesn't seem to.
>
> No, sorry.  Most of the time it's cur_el, except from cpregs, where we get directed to a
> specific higher el.  There may be some way to split the helpers...
>
> I'll have another go at this reorg this week.  If it still doesn't feel cleaner, we can
> drop it, and I'll make some changes to the SME patch set building on this.

I was wondering if it would work better the other way around, so that
raise_exception() doesn't mess with the target_el at all, and all the
"work out which EL to take the exception to" is done in
target_exception_el() and similar ?

-- PMM

