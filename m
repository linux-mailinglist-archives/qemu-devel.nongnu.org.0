Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C174D153E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:54:30 +0100 (CET)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXU5-00021b-DZ
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:54:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXSj-0000u0-H0
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:53:05 -0500
Received: from [2607:f8b0:4864:20::1135] (port=39454
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXSh-000770-Qb
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:53:05 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2dc348dab52so162737387b3.6
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CWeprhmNi7k8eIoajUDX7VV2NkshcLBi2Su2KY/sWIE=;
 b=Q+kJk+G0bHMf4nrBgm5FHHn8i3auglxlce0Ih8KKwCgDip/n5gdIfs8igKtg3qUDCE
 vy8Q1rU1Cm4mMuIVLLdTejfnpl6aWLBwHmGGgtMW//DLlRF1auG7piZ6r/2OmKjTPExb
 t+k2/hWKDmRfxKR5CWFDUsWNdNuRJDZM5EsTB0K9YNdc7Zhvf+yUKSIYC9Fh1wzxSTf5
 mZJYMMeg4/Uz9CiOScz4VP3zjDyspIGPynyqtRPm94bHY4VQSRacuUbBHeT9gmDuZPwK
 64Q+Zg3As/bjgONs2gANkCZNYWqwqvMZonTi9jZVcl2nWFR5O0b8WL0WFALwQtuj/TXm
 wNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CWeprhmNi7k8eIoajUDX7VV2NkshcLBi2Su2KY/sWIE=;
 b=YTZrmuz3odwyCYZaEHCmdxVQSRnp2hEPSHogeLNI4aVhNB9M/bc0Yf5WhlUVUFAfSg
 1C2cY5O1MV0DRB6E+phXMgQOt2DN0H8NZz3ydvvYe+f5qmgfcTfnuqn86RC9GIhr2wR2
 RupypnDZPiXil7q5rhIywHboYcA9L6dE5tbv8upWAdFxrwx7gulIoStyZ78NDrnFTz8B
 ghxJ8thn+m9bpKYhG1aJ5ZQ+PF/QeiEU4sdVGRTrSfob3v4eRojBxBhx0JwovlO0smYA
 6HhdDib6UFd6ufyl73S8t+REHwwhY3Ty7FlAw3nONACgbYuVwd3Y/V6Tvlvie3CanBUQ
 3cxQ==
X-Gm-Message-State: AOAM532d3psZVCs7p5pQVPcffPwqNFZai1i0i35sUgltBfiJ7QxaF7U4
 jEgIiU80CYcIyJ5LzmFHennP/gx2uE913BlANrvurg==
X-Google-Smtp-Source: ABdhPJzeR5q131IXi8mDDrTfPD8CnWwC6vzyBOOWiPhMN+bVj+zHyL5SNNO4l9Gi7smEqJo5w+Vcxqe2VCPK4gArvks=
X-Received: by 2002:a81:b49:0:b0:2db:f472:dfca with SMTP id
 70-20020a810b49000000b002dbf472dfcamr11849348ywl.455.1646736782927; Tue, 08
 Mar 2022 02:53:02 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-19-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 10:52:51 +0000
Message-ID: <CAFEAcA_BYBgpJOe2_gjdpkPHoy6dk68dNYvo=p5wcJnTqWpknQ@mail.gmail.com>
Subject: Re: [PATCH v4 18/33] target/nios2: Implement cpuid
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Copy the existing cpu_index into the space reserved for CR_CPUID.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index 189adf111c..fbcb4da737 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -159,6 +159,7 @@ static ObjectClass *nios2_cpu_class_by_name(const char *cpu_model)
>  static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
>  {
>      CPUState *cs = CPU(dev);
> +    Nios2CPU *cpu = NIOS2_CPU(cs);
>      Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(dev);
>      Error *local_err = NULL;
>
> @@ -171,6 +172,9 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
>      qemu_init_vcpu(cs);
>      cpu_reset(cs);
>
> +    /* We have reserved storage for ctrl[CR_CPUID]; might as well use it. */
> +    cpu->env.cpuid = cs->cpu_index;
> +
>      ncc->parent_realize(dev, errp);
>  }

I guess. This will have no effect as all our nios2 boards are
single-CPU.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

