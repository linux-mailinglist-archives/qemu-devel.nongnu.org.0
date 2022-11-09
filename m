Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08E562295F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 11:58:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osimp-0005mH-2m; Wed, 09 Nov 2022 05:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osimf-0005iv-NN
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 05:58:18 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osimd-0003G3-DI
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 05:58:16 -0500
Received: by mail-pf1-x42b.google.com with SMTP id i3so16332626pfc.11
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 02:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pbY438MvfbCAMLXbRRmVzpwHbmCAEqbkhtDF7/Uydi4=;
 b=wkwohFmBnl4Hq4HOIn2ttnnGAEl0XbuJN3nqjeub1txPSc5ppUx+ArndMoLJ0d1POt
 uZrnJ722uprVqBXnwaO2s1+Pwq+oaWQb7wB9gQ9FuMPrzn506N7JkXbbWlsy+OMCi2mg
 SW7fIj6Jh/5W1ov0aYRbVM89ilmbekKyuFKGj38yJ1QeKpa0rAMVMinu7G3d0+3QVJ3E
 U9+vrhvYEv8d+P2NlY60NAtXuuMNDCpfYfLGue5y+jK18GI5dcXuA1KRgO5jeC//Oiz5
 l4+LJ//aklQqb1fQAMUk8oZOMMDIkiVwZNwNdtj4VRlhgxPEEn5pS9HwbJ+ysaNkchfN
 v9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pbY438MvfbCAMLXbRRmVzpwHbmCAEqbkhtDF7/Uydi4=;
 b=to8+zJndAavXi7613oq3N1AeVfI/hxt2Wn5WOHQgmqktMjayUIVDC3d/Q1MIp2Tahy
 sV8UbOwStDGOghSbzWAkrdOMgtft+KDHffTI34/fb6dgVceDNZUYLS8ICN/UfM7CTu9x
 1vyw3+mxn0ZVKsKk9YGggvnn7e02/Vv1rMuslqileiERiGvbEngw5daofDqU5Ld/J2DF
 zVwnNX7sDD+dGhQd3k92EQMTgOKoXO75EIWHhtEAINeWcWFisg4GSfkT4i0ngkjMx/jJ
 CVORGEW+i02cTFQfOIgyeNmJPs81+b9jmvNBVq6uTjRh+UA/ep6ghFz1+hgJbXlS9tSR
 p89A==
X-Gm-Message-State: ACrzQf2SE50zIsM2UAzYJmg0LJnsvGnTkvYWICo3iI7uBuSe9ZYjFKI5
 8iYtrKuIzCdAPI7lQ46gkrhqSt7joDMlofUE0qtjDw==
X-Google-Smtp-Source: AMsMyM6kKhGeo25KJF0+2eCnkSO94JCaM9VWYNFG+EJD1ui5B7tq1/mKLL9Dhv5W3dwuNkwdiDA7R4kG4JrJV/w7jbk=
X-Received: by 2002:a05:6a00:1595:b0:56d:e04d:e0ab with SMTP id
 u21-20020a056a00159500b0056de04de0abmr41857633pfk.51.1667991493786; Wed, 09
 Nov 2022 02:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-3-fcagnin@quarkslab.com>
 <2B918171-9464-40DC-AE11-D25E60858370@ynddal.dk>
 <CAF8_6KmwMCiNcC-romHoGZhcpPph71b3qv7yn9RHQArV3Q+nDA@mail.gmail.com>
 <D86C8F4E-517E-4ECC-A66D-E57F551FFECF@ynddal.dk>
In-Reply-To: <D86C8F4E-517E-4ECC-A66D-E57F551FFECF@ynddal.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Nov 2022 10:58:01 +0000
Message-ID: <CAFEAcA9jVVQhouS7uhmh+gMs328M_0r9Nz3npzrbmBoVhS+=TA@mail.gmail.com>
Subject: Re: [PATCH 2/3] hvf: implement guest debugging on Apple Silicon hosts
To: Mads Ynddal <mads@ynddal.dk>
Cc: Francesco Cagnin <francesco.cagnin@gmail.com>, qemu-devel@nongnu.org,
 dirty@apple.com, 
 r.bolshakov@yadro.com, "open list:ARM cores" <qemu-arm@nongnu.org>, 
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>, 
 Francesco Cagnin <fcagnin@quarkslab.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 8 Nov 2022 at 11:51, Mads Ynddal <mads@ynddal.dk> wrote:
> I also noticed you are adding 1 to the WRPs and BRPs. As I interpret the
> documentation, you should subtract 1 instead, given the value 0 is reserved:
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index dbc3605f6d..80a583cbd1 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -39,11 +39,11 @@ static void hvf_arm_init_debug(CPUState *cpu)
>  {
>      ARMCPU *arm_cpu = ARM_CPU(cpu);
>
> -    max_hw_bps = 1 + extract64(arm_cpu->isar.id_aa64dfr0, 12, 4);
> +    max_hw_bps = extract64(arm_cpu->isar.id_aa64dfr0, 12, 4) - 1;
>      hw_breakpoints =
>          g_array_sized_new(true, true, sizeof(HWBreakpoint), max_hw_bps);
>
> -    max_hw_wps = 1 + extract64(arm_cpu->isar.id_aa64dfr0, 20, 4);
> +    max_hw_wps = extract64(arm_cpu->isar.id_aa64dfr0, 20, 4) - 1;
>      hw_watchpoints =
>          g_array_sized_new(true, true, sizeof(HWWatchpoint), max_hw_wps);
>      return;
>
> But the documentation is a bit ambiguous on that. Maybe we can test it?

Adding 1 is correct -- the field definition is "number of breakpoints - 1",
so the number of bps is "field value + 1". You don't need to open-code this,
though -- there are functions arm_num_brps() and arm_num_wrps()
in target/arm/internals.h that extract the fields from the ID registers
and adjust them to give the actual number.

thanks
-- PMM

