Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558E05450BB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:25:21 +0200 (CEST)
Received: from localhost ([::1]:54784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzK2C-0001Bg-DO
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzIev-00047O-EH
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:57:13 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzIet-0007Cp-Nr
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:57:13 -0400
Received: by mail-pl1-x632.google.com with SMTP id f9so9846429plg.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 06:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XYDr/e3ufo1fWnqJnMV/ksG+shJcKHoajDda7z/Rckw=;
 b=VlijxXBUM0SFzG0dpVjPEUeTwO2cs9k2atLRxt97s9c9AImD/f21Fi607FykdwX0Si
 BoryxggvQ0CXE8cj7Jp10lRe9vxnN9gGQ7yIa7c0on+rnEX7FOE2F3F7GsIWmomVjRoR
 XJmyHJZol2p5m2VNsbbouQl9vuRe66V/Roqbs4uoAw/wzxOndtiRRHByn3Grve6wDaNq
 Lb1WnY3C818CdDJiBbqN+lIIDCWZAZ5EREuwwxEjljM9/eWXAgrZz7JZZDNxb2OZMCuM
 V5G+TKlk1RQWh9o74Tj5SXBNXBG6+s56+16P/8IcdPl8Z8Ks5KzpwJyuvHQNZCEA3TQ1
 bjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XYDr/e3ufo1fWnqJnMV/ksG+shJcKHoajDda7z/Rckw=;
 b=Ed0EQISybuzhEAQtVd4cmuErxKOHWwnF/NCSvG66Cd8TNAHMz55MxIF1Z8CKjRTSk5
 EcyU3DAvc+wHyG/ZJv7/s1Wt3VFMK8av+Nh0WEfP5UfcFVEhX8YCZXiCC/4lZKSK/30Y
 nrK0edsALxVtWzqhjLwK0snF6ibWJ/RXdAyGx4KgQEkOkEv0suwN9M+hqr8j7SSdy4hS
 AgltFEsol02aO5ZBFUM4v3fly5flHipZO9Hk9sHXQWpqYg7ydaAk6wO/XxlGEmlw+tcL
 N5heDMLERWmV3NMRcdnodEXhFgfVoFa2xOIWwRJ4TqfLwAHay741DsJiy6agNW3tSrWY
 wC6Q==
X-Gm-Message-State: AOAM530Jz/CuAJ7COmxHflAXK4jB9pJj5yRqIn8UflOSqys2/2OP5H7F
 SiLM8tPjKeYNX7JlFuoKWpTULnhkM49a6/UBiirAJA==
X-Google-Smtp-Source: ABdhPJy4tS9PwhdvZZpW38mlDxFayVWTJo08maUhf2GPgaVOxA7eQxvG0HoUSNPTblcZzNGu11Yuv7Tcl2esJodIrw0=
X-Received: by 2002:a17:90b:1e47:b0:1e6:7d04:2f4 with SMTP id
 pi7-20020a17090b1e4700b001e67d0402f4mr3530751pjb.93.1654783030437; Thu, 09
 Jun 2022 06:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220606143419.656598-1-lucas.araujo@eldorado.org.br>
In-Reply-To: <20220606143419.656598-1-lucas.araujo@eldorado.org.br>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 14:56:59 +0100
Message-ID: <CAFEAcA-yMZjJW=AJm=XLbrub1D-8iX0OKE78V_TzQmfC2RdXyw@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND] scripts/checkpatch.pl: Change line limit
 warning
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Gan Qixin <ganqixin@huawei.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x632.google.com
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

On Mon, 6 Jun 2022 at 15:34, Lucas Mateus Castro(alqotel)
<lucas.araujo@eldorado.org.br> wrote:
>
> The QEMU documentation mentions that lines should be up to 80
> characters and that the script checkpatch will warn at 100 characters,
> but the script warns at 80 characters and throw and error at 90, so
> this commit changes to warn at 100.
>
> As to why extend, the argument that resulted in the change of the
> docs was that trying to always wrap to 80 columns could result in less
> readable code, so sometimes not wrapping was the better choice and in
> those circumstances checkpatch could nudge people into creating less
> readable code.
>
> A 132 error limit is put to catch overly big lines.
>
> Based-on: 20201105154208.12442-1-ganqixin@huawei.com
> Signed-off-by: Lucas Mateus Castro(alqotel) <lucas.araujo@eldorado.org.br>
> ---
> Currently there's a disagreement between the checkpatch code and the
> documentation, this RFC just changes the checkpatch to match the
> documentation.
> But there was a discussion in 2020 as the best way to deal with this,
> some alternatives mentioned are: change the warning to remind people to
> not blindly wrap just because of the warning, change to warn at 90 columns
> (which would mean changing the column limit for the error as well). If any
> of those are preferred I'll send a next version updating the documentation
> as well as changing checkpatch.pl to the preferred behavior.

The reason the code doesn't match the style docs is partly
my fault I guess. The style docs were updated with
commit a998de0dcd ("CODING_STYLE.rst: Be less strict about 80 character limit");
that commit message says "this goes with the checkpatch changes to warn at
100 characters rather than 80", but we never committed the checkpatch
changes. Those were this patch:
https://lore.kernel.org/qemu-devel/20201105154208.12442-1-ganqixin@huawei.com/
(which started the discussion out on an awkward footing by not including
the rationale in its commit message; it was prompted by a discussion on
a previous patchset:
https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg05653.html

Equivalent kernel checkpatch.pl loosening:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f867ea4d75fa59ee87a7f48be144

Anyway, I think the main objector last time around was Markus, and
there's kind of an unresolvable difference of views here:

(1) I want checkpatch not to warn about line lengths that in fact
we'd be happy to include in the tree (because it's noise, and it
pushes people into wrapping the cases which the style guide describes
as "awkwardly wrapped" and better not wrapped, to silence the warning),
so I don't want checkpatch to even warn on less than 90 or 100 chars.
This is effectively also the position that the Linux kernel
checkpatch takes these days.

(2) Markus (as I understand his point of view from the 2020 thread)
wants checkpatch to warn about anything over the "this is definitely
fine" 80 column mark, so that developers are reminded that
they might want to make a judgement call there.

The coding-style text reflects my point of view, because I
wrote it, and therefore personally I'm happy to update checkpatch
to match it :-)

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index d900d18048..2c2d7b31ab 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1639,12 +1639,12 @@ sub process {
>                 if ($line =~ /^\+/ &&
>                     !($line =~ /^\+\s*"[^"]*"\s*(?:\s*|,|\)\s*;)\s*$/) &&
>                     !($rawline =~ /^[^[:alnum:]]*https?:\S*$/) &&
> -                   $length > 80)
> +                   $length > 100)

Gan Qixin's patch has the advantage of putting the max length into
a variable rather than continuing to hardcode it.

thanks
-- PMM

