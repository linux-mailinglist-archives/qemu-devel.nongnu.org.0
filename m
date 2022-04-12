Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C294FD40D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 12:01:01 +0200 (CEST)
Received: from localhost ([::1]:37274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neDKW-0006tL-B6
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 06:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1neDGd-0005l4-MF
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 05:56:59 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:43789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1neDGb-0001zq-Vw
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 05:56:59 -0400
Received: by mail-yb1-xb31.google.com with SMTP id f17so1269697ybj.10
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 02:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w7clKU9sN74dQrRObTelEA/B+gN/EFRyOVTm0veQeNc=;
 b=OcFKyJYbxR36Bwn8MMJI7lohphRRqRHquKivA4l/rLRrKeBtNX9UEopSDX3HLIM1iI
 vwrwOUcf1dIQBU/ZKIVuKvMVpIx5hQmDiqOF8Nj89brOB+PrirAbSNsCMDXJVQ3CN500
 CBAjvvYmB+1e56nkVQ0AbKLCC/bDmalSYQgDaOa622OXURS6eiYlbZ4D3bHtqks6Csp0
 FTfGnCE/udhES1ieoRMSjgVAiCmugeflDaDInENthGSAxJvV1yK/NinRUz7ihG2UdulA
 NvcsSu0YSDndq19diLSCL2QP5PDxye4T+KH0dQLf7GsyZBmQBJQYvSan3MyCZGdOzCZy
 2k7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w7clKU9sN74dQrRObTelEA/B+gN/EFRyOVTm0veQeNc=;
 b=HV4Fcpu2Z4kgPWvIjhb5445KLj9ICImxXLNG9EMb8bRC0RJLwHb598IWospVMLF+C1
 HdLOnA07DH8qXOEzSSouz/KB6WcmW5Be3pYti8HRwGPo6gclRa7vNRuuswlh9qHXMM6m
 p8/0qPZx57GQCki2wdXoaTyc0q+D6I3qlz+V3QerpR0EsCILM+zJAcY2z6Z35/wpan/T
 Nh51VhLXyjxrQCPIu4yLgPNrXzYNdWxAJAfn23t4wy6sZi+DbCCGk3rPvbOO3/X3fqIF
 QwKISQqVccdSb7RpeoOXT/b0+LdDGCoa/Yk6yHjsErk05QulYayQN1ZQwaCLWJU8296U
 njHA==
X-Gm-Message-State: AOAM5336LDbRkhqY4ZqJfqpbSzkE9Bl6wK7cvrRsVPuHRKQVFrWMICYx
 Al3iXAojsH05ZaKqdET7aAhiKWbjlkfzEatmu1Jse8Lze6w=
X-Google-Smtp-Source: ABdhPJwqSCUL6H5ntiePFSLaXnvfPLXoCyy9pZm9ioQXZnf9g6K8/gg46W0IZdZ1oJz4Fw0cgQtqal7Cw6UEhk3mHWM=
X-Received: by 2002:a25:488:0:b0:641:1c71:b0ff with SMTP id
 130-20020a250488000000b006411c71b0ffmr10717949ybe.39.1649757415812; Tue, 12
 Apr 2022 02:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-15-richard.henderson@linaro.org>
 <CAFEAcA_9Eu-WZn_yMhjj23GRkz14huEVSb8xckvRyygDngwXEQ@mail.gmail.com>
 <78faaf43-4304-ff1e-1c8a-0102725eecbf@linaro.org>
In-Reply-To: <78faaf43-4304-ff1e-1c8a-0102725eecbf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Apr 2022 10:56:44 +0100
Message-ID: <CAFEAcA9VHK_YLnZ2FAgdg87uF5Bk4op7kvL9e8DAZp27jvfjiw@mail.gmail.com>
Subject: Re: [PATCH 14/16] target/arm: Implement ESB instruction
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Apr 2022 at 23:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/11/22 09:18, Peter Maydell wrote:
> >> +      ESB        ---- 0011 0010 0000 1111 ---- 0001 0000
> >> +    ]
> >
> > Why don't we decode bits [11:8] here? I see it's the same
> > as YIELD/WFE/WFI, but I'm not sure why we're not decoding
> > those bits in those insns either...
>
> See page F4-7074 in H.a, where bits [11:8] of the imm12 field are described with 'xxxx'.

Hmm. That just means "decodes to the NOP/WFI/ESB/whatever
instruction-description whatever the value of those bits",
but when the specific instruction-description then marks
those bits as "(0)" or "(1)", that has the usual CONSTRAINED
UNPREDICTABLE meaning described in section F1.7.2, where
we get a free choice of UNDEF, NOP, ignore the bit, or
any-dest-regs-are-UNKNOWN. So we're within the spec to
not decode [11:8] but I think it would be more consistent
with how we try to handle those (0) and (1) bits generally
if we insist that [11:8] is all zeroes here.

For this series, I guess go along with the current way we
handle hint instructions, and maybe fix this as a separate
cleanup later.

-- PMM

