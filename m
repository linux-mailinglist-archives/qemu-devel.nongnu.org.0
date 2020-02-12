Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C2415A7F3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 12:33:31 +0100 (CET)
Received: from localhost ([::1]:36154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1qGn-0002OO-L1
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 06:33:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46589)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1qFg-0001lM-84
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 06:32:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1qFf-0000Te-5c
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 06:32:20 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37697)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1qFe-0000RW-Ti
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 06:32:19 -0500
Received: by mail-oi1-x241.google.com with SMTP id q84so1694636oic.4
 for <qemu-devel@nongnu.org>; Wed, 12 Feb 2020 03:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=80zw9xdMPv9hJqgXoS8wWF3chba21JG7tFTCZZ/Txps=;
 b=YtwIrci42SNkejdNjYyIDd+f3rho0WhmwsrHGjifiSRIXjQrU67J7pq63Xb4WtOFib
 +ofqEpwmTh2g0g2YgAe9KvaL4CDaaPgCHhyPZa8ZL2aiQyH2bgBEvk8OtFcoz0f2WVFp
 mpQyBzVCYvtMm6VqvYVMSbaS93qMccpZO21MBBQZ6kzowtyuG4EH4QLDlh024s7jE0Sl
 Q2fJLMsKjRSn6G818oSvs3PlG7L9TxKGACkBWZzdKOkQLJTH0bHBDZnjhwP7RScIRv+0
 UoTieBuV4s3FWsszkqW5bxNGU1aFKQLxhn5IUl4Z1ashVmE9mMUGc2SeAGrIQpZTE/2B
 5OXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=80zw9xdMPv9hJqgXoS8wWF3chba21JG7tFTCZZ/Txps=;
 b=mDX+2dlVdv/knCN7kaxCuXDmoOu3Pa+os1KeTTetoy4gnmTLETNag0U/ZS3wXaB3bu
 ljk+W6EcN4rKxjg8VaEAa8i60yMN0vqE1rcBHmGqmghv+nNTZEF/jc6Oj1o3G1mkQ2Pr
 GmN1VTql4IUPRAGArC21+GiKqVaRFoZ3udi5pBnV2Lbkdl91jKR4w08m0VHuvaiNSNTb
 bAxkIh08wd//yKWQnmnJhrxzRXRHmahXOMeKDWoFS9BzeGFExC8IxtGJSJOx5Zyc85Bt
 pboiEMKMeLxXpXxsOnF/zXurEt/avsiZftjnA+vmUSi+gJIv05AfmH1VhFwsvr1GfOjc
 VR7g==
X-Gm-Message-State: APjAAAURw85uvKVMsNw1p4bBv82wtWPTkeXS50/ioDv/rK2VL8GoIs9D
 05xMjSr5wIdvfBYCECrEv3VVcARAVK2xxea4qwDzyw==
X-Google-Smtp-Source: APXvYqwRlupXBskufDfp3PM6CRXisMioQ9MhvkhQX7L56uKLuicxpL2z9OeqIO3ilJTdUi/2hwFDoVcIqavyPDwX84M=
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr5713362oic.48.1581507137915; 
 Wed, 12 Feb 2020 03:32:17 -0800 (PST)
MIME-Version: 1.0
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-3-peter.maydell@linaro.org>
 <a29a217b-f602-8925-4265-9a78030b6d73@redhat.com>
In-Reply-To: <a29a217b-f602-8925-4265-9a78030b6d73@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Feb 2020 11:32:06 +0000
Message-ID: <CAFEAcA-0_=T4paML4SN6uBYXnE-5-dpExrcdWUhyxVz7_C4yYg@mail.gmail.com>
Subject: Re: [PATCH 02/13] target/arm: Add isar_feature_any_fp16 and document
 naming/usage conventions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Feb 2020 at 06:24, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 2/11/20 6:37 PM, Peter Maydell wrote:
> > @@ -185,7 +185,7 @@ uint32_t vfp_get_fpscr(CPUARMState *env)
> >   void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
> >   {
> >       /* When ARMv8.2-FP16 is not supported, FZ16 is RES0.  */
> > -    if (!cpu_isar_feature(aa64_fp16, env_archcpu(env))) {
> > +    if (!cpu_isar_feature(any_fp16, env_archcpu(env))) {
>
> So we had a potential bug on aa32?

No, because right now we don't support AA32 FP16 yet (so
the aa32_fp16_arith check is temporarily testing an AA64
ID reg, as noted in a TODO comment in that function), and
anyway all our CPUs which have ARMv8 features also mandatorily
have AArch64 currently. This is mainly tidyup so we are in
a position to add a new v8-32-bit-only CPU if we want to.

thanks
--- PMM

