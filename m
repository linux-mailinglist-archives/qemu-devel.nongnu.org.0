Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3911062E1D1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 17:28:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovhjZ-0001dq-Oj; Thu, 17 Nov 2022 11:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ovhjX-0001dI-7H
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:27:23 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ovhjU-0001xz-OD
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:27:21 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 u6-20020a17090a5e4600b0021881a8d264so126530pji.4
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 08:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MR9tGfrL1VBYwPSJJQkmNqM4sStY8GWmSD1I8QabVsk=;
 b=OID2gcncz1xZNtLiHp+t+gZy8zHmZoH3Aw0DpaDKKRh+iW7KE1vrYVqCV1l/PsY53T
 3UX5jId3jr3DrluHh2WFvo8zPrmt1SjvmhXcpJqQxd4sYS1/W5P7ul0evDzHftJWNK1C
 s55npwMp7QQDEy6gGAEhiDDWNPVLcR4ALU5P2ScuGKZIoc6Bsb8xmAwqAu/WYi5FfWiU
 FCikjaUH/o+3Zo/GurwvibnKpXVMnYODSV/joZMm4EAdL6UbPX9VAuVxncNDzcQv6dEK
 M0SMFgumOFQH8fQ8L8j339yI+5x0gqhRYB5PCeHjSLJYZTT/bl+QQBspFAF4imZq59us
 LGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MR9tGfrL1VBYwPSJJQkmNqM4sStY8GWmSD1I8QabVsk=;
 b=cSlv2WlzmSRiwsFy7baIfFZt9zUoxpzBBvLHPOpzhgViOCTUEKp5w2Ui8YVaW6XT2F
 mdZxlVjhEUBGCJtFz6MczjJAJgk48zgDMZrWau6/Qdl1kqNDYQH/Ck8PFPQnjT+3q80h
 3pnWfOiRx279vSqcW5jL+/9jtoS6Whn2JP53lXPHUoYcevfT86ghUhewZWejSgus4IAC
 jVSke7rZ3QT+5x8LOJRqsOjw8QJrEj7Zzat+PMFdMtWiRa7IDeZQJ8Hz2vZhp/pEPk0b
 Hu2EtK8QoaYvNQoqHV9C+fNDbJ0FvxOiz8U7OmLOPzNseW1Wd8zJQFNhcSxShjHXAjcr
 wQdA==
X-Gm-Message-State: ANoB5pm73hF1+x1UFBtqppp7ScN8hAw1za5IVz3nhl8VFGUOV5YTGsfJ
 RvcDuZUtH4MmQITWqWkETkdKXy0eIHq+Np1cX0JKug==
X-Google-Smtp-Source: AA0mqf6+G/LQkgLSNuQJuKZb6MIzz1I8s0eC6jKz3DSlnDW4W7PL2z7iMYvc6EAvdN5sLx7Tx3jp7dn//tncN1vSEQ8=
X-Received: by 2002:a17:902:bb8b:b0:185:4ec3:c708 with SMTP id
 m11-20020a170902bb8b00b001854ec3c708mr3498038pls.60.1668702438968; Thu, 17
 Nov 2022 08:27:18 -0800 (PST)
MIME-Version: 1.0
References: <20221116170316.259695-1-ardb@kernel.org>
 <9fa748c0-975a-09d9-4f09-942f18cc1a31@linaro.org>
In-Reply-To: <9fa748c0-975a-09d9-4f09-942f18cc1a31@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Nov 2022 16:27:07 +0000
Message-ID: <CAFEAcA8Bq12o7GYAG-4rTajBLwPtA0COMPxH1cPj4NYe_BzweQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Limit LPA2 effective output address when
 TCR.DS == 0
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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

On Thu, 17 Nov 2022 at 03:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/16/22 09:03, Ard Biesheuvel wrote:
> > diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> > index 3745ac9723474332..9a6277d862fac229 100644
> > --- a/target/arm/ptw.c
> > +++ b/target/arm/ptw.c
> > @@ -1222,6 +1222,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
> >           ps = MIN(ps, param.ps);
> >           assert(ps < ARRAY_SIZE(pamax_map));
> >           outputsize = pamax_map[ps];
> > +
> > +        /*
> > +         * With LPA2, the effective output address (OA) size is at most 48 bits
> > +         * unless TCR.DS == 1
> > +         */
> > +        if (!param.ds && param.gran != Gran64K) {
> > +            outputsize = MIN(outputsize, 48);
> > +        }
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> I thought about moving this back into aa64_va_parameters, similar to how we bound tsz, but
> since this is the only use of param.ps, this placement is as good as any.

Applied to target-arm.next, thanks.

-- PMM

