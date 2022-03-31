Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4182D4ED631
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 10:49:46 +0200 (CEST)
Received: from localhost ([::1]:45600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqUz-0002bW-9E
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 04:49:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZqRf-0000LS-Hp
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:46:22 -0400
Received: from [2607:f8b0:4864:20::1135] (port=46822
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZqRc-0007e4-Uf
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:46:18 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2e5e176e1b6so246183507b3.13
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yPfi4Nn6/SbDf3IxbFxR3rP/TkP5Fezknc9qXsLwshg=;
 b=aY+RJf30wwbTQBV7744EOksxsthY3UUHayxxon3BDVz51ZDF4XyU0xSsHIEL70qFCR
 IH6DN98a9BPDWaxE3HE6HOuFYQZG/Th2mN2VQBmwZKeGTgkLRZ0ei7oiAaif4g4BXBtw
 vCLNVQSDn+DlUVYfwXvHXhQ61eEtvh4egGq84gt6vDViNFnFKNW6+vopwxoEQG6WvbN1
 pasSfgxHZLAZT6acNBSJ337FP7Rlj8xNeXYXw6cGb0whz4tDhen8w3V1073SV/vajSxB
 Msg3k9Rn4wFS5FqpK/F6KjNo7R0CAlVNjbURowMTCi4/34AdJITzdaZrjhOChYG3MCaW
 qSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yPfi4Nn6/SbDf3IxbFxR3rP/TkP5Fezknc9qXsLwshg=;
 b=GoTiL3UrI24wF4F392m1brR51fUnFuurMoFC1+tsXkF/PT1VbbZ+CXC3WQvRRjuqzE
 WpQl114ymoE1Kd3lEGsLnYAoxvPUCLVZQv1r32NBDAi/p/9Yl8LY2YKZeDhfOouMgowU
 CyK9sdn3kRlqfgvi3ah8nx9NU8nPsNbSq0/i5bts3eCys8zimkKT+B+azsTy45ghM9oA
 wpDELkBQ4SM7W2NDBO9dfxMIcfcw0/qw3XfScAiYaonjbb30S08I000Bn0ICY0onfG44
 LvNWL52ySudqHGtCsUUamPDHSAT+a4LD38qpcaXrKQn/2LH4GRVKhS4q4REzDUSaPTYC
 y+sQ==
X-Gm-Message-State: AOAM531TSs/0pQvROlf/ef7S6qKReR17eZsXbh9azHmV0B5BI7Zmf/Yy
 BwyiVe/sT5rPoPXW22z0b6gGV81sxyX5l7nI90Z3hg==
X-Google-Smtp-Source: ABdhPJzaLg/dF6SxuukGTnrh117QcKbolPXt9xYM4vF6ttuvqjaeVp0ZbdV7JnBr7UEavlQfl2UL6lhA1/gYJxY4iV8=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr4006605ywf.469.1648716375904; Thu, 31
 Mar 2022 01:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
 <20220327093427.1548629-4-idan.horowitz@gmail.com>
 <ede38e3b-5207-52fe-4c02-72a4bbe1cf20@linaro.org>
In-Reply-To: <ede38e3b-5207-52fe-4c02-72a4bbe1cf20@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 09:46:04 +0100
Message-ID: <CAFEAcA8eycaT-ESi8Fopj7LxH1aZyyNCcL6whvNpQDqt9VEVug@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/arm: Determine final stage 2 output PA space
 based on original IPA
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-arm@nongnu.org, Idan Horowitz <idan.horowitz@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 at 20:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/27/22 03:34, Idan Horowitz wrote:
> > As per the AArch64.S2Walk() psuedo-code in the ARMv8 ARM, the final
> > decision as to the output address's PA space based on the SA/SW/NSA/NSA
> > bits needs to take the input IPA's PA space into account, and not the
> > PA space of the result of the stage 2 walk itself.
> >
> > Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
>
> I believe I follow: because the walk uses walkstate.address.paddress.paspace, the ipa
> input parameter is unchanged, and it is ipa that is passed to
> AArch64.S2NextWalkStateLast() to form the output address.

Textually, this is described on page D5-4802 of DDI 0487H.a;
the security of the output address of the memory access isn't
affected by the security of the output address of the translation
table walk.

-- PMM

