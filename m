Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001D5397183
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 12:32:53 +0200 (CEST)
Received: from localhost ([::1]:57562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo1hc-0005r1-Ki
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 06:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lo1gA-0004vW-1K
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:31:22 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:41743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lo1g4-0007lR-Sr
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:31:21 -0400
Received: by mail-ej1-x62b.google.com with SMTP id gb17so20870682ejc.8
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 03:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PM6V/8ffXbbgYXotK9ACNapZ0BGTNYWm5iPNjsZ7hjA=;
 b=JrpFqNzEEGBeIFBJLOBFbRwpT5U1+xA79qQL6y4YHJuZQ7QhkxhdRn0DbDz/XfS1X7
 ujx63S8C3SrIvXSLNWW0QaRJGoCuX6bCnhxX/cDBJpEskR/YKkKfy6GwnoLTLVoi2ay6
 LRkfpSHu2slqemHXczw3AAeBWyei4daR0jf2PKCuyTBEO7spbmygfEMWNPB8tjbPtLtt
 ESn4nkKU3B5dvjRroGU07U7MYBq+fzTSiQT6cRDgHj4olHPgzNpiy4Mp27j+L+bIwJpJ
 o0Rx1msttbGVzn8g4U/i5nH9IwqBRQoLgp88xVp0MY3Ui3i2C6ox8H/ZhTo+H9S4vty4
 +Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PM6V/8ffXbbgYXotK9ACNapZ0BGTNYWm5iPNjsZ7hjA=;
 b=UjggOixSloVTmsqfc25tGlEJ6gMRQLr/LrG6CFBt4Y8MATCEYsUpdACvXATD3t68ug
 YMmsh+7vnny9UtzAqkdOYecfSv/UD/2v9YKgprGk+YeIGPKKJccYTdEMY/usRU2oBU8/
 yRmgrQ9e6d47t9wQtYr+K6wb7cC7td6P5OeDWEYXIGrnrQDYB7D4cUK39PlR2MI161i+
 eifWWAmOsXu33SdmtxS03xODjl4Af9aqaa3dyLOCXobn/y74+4kFCTJp5Gewll2mpYrG
 G6aLmMC7GDbc/JMfkLQvjoHTjAPw8ZwJgy9jqkLi3YF7G0Y6i92TAHtINiSV6WSNtcLA
 PLWA==
X-Gm-Message-State: AOAM531QWjvSB2xnVWBWO0/KBWuNIaHPZ3CZb0aVE5QnyUsYcdTahV+Q
 CfCHsUqeSBjkHk3wbzw65NIoVikCcMoLHU92P1sIpw==
X-Google-Smtp-Source: ABdhPJz9YIWeN/GqezjhAwuCBuIA3ER7g+btw5dHSE1Q8t3kyEetxCB3NqtGKfue7OROWEh2BR6x7XvVMNcT+MIQu20=
X-Received: by 2002:a17:906:a458:: with SMTP id
 cb24mr6524568ejb.482.1622543474959; 
 Tue, 01 Jun 2021 03:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210601090715.22330-1-alex.bennee@linaro.org>
 <CAFEAcA-zzg4Yh0pX2q-9OfFKEbX_uGkVb_8kZbQJJETLRo_zOQ@mail.gmail.com>
 <87fsy1dhke.fsf@linaro.org>
In-Reply-To: <87fsy1dhke.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jun 2021 11:30:44 +0100
Message-ID: <CAFEAcA8rre_ADS_x0TJpgeBOx=KeEzs1Q-pSiAtVK77G2tDLxg@mail.gmail.com>
Subject: Re: [RFC PATCH] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Andrew <astrauss11@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Jun 2021 at 11:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 1 Jun 2021 at 10:12, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >>
> >> The previous numbers were a guess at best. While we could extract the
> >> information from a loaded ELF file via -kernel we could still get
> >> tripped up by self decompressing or relocating code. Besides sane
> >> library code has access to the same symbols in run time to make a
> >> determination of the location of the heap.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Cc: Andrew <astrauss11@gmail.com>
> >> ---
> >>  semihosting/arm-compat-semi.c | 19 ++++++++++---------
> >>  1 file changed, 10 insertions(+), 9 deletions(-)
> >
> > This seems like a pretty good candidate for breaking existing
> > working binaries. How much testing against different varieties of
> > guest-code-using-semihosting have you done ?
>
> None, which is why it's an RFC - but at least one user reported newlib
> attempts to use the numbers we gave it rather than falling back to
> numbers it knew from the build and getting it wrong. I suspect any code
> that doesn't have a fallback path is getting it right more by luck than
> judgement though. I'd be curious to hear of code that relies on the
> numbers it gets from QEMU.

Well, newlib is the main one I had in mind -- does it have a fallback
codepath?

-- PMM

