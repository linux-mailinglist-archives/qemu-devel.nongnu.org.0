Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0822846ECA8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 17:07:21 +0100 (CET)
Received: from localhost ([::1]:34862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvLx1-0007Vr-JG
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 11:07:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvLuE-0006TO-7H
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 11:04:26 -0500
Received: from [2a00:1450:4864:20::434] (port=36653
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvLuB-00079z-Cv
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 11:04:25 -0500
Received: by mail-wr1-x434.google.com with SMTP id u17so10553326wrt.3
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 08:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AMAYXSoKkZcZfAa7Hb5guK+706Ox6dJ7TeNjd/uUq1s=;
 b=hPHJn2FGJbWJ2rz6Kh8mgbfLwItrNKPL0gP5e8jmj5BdNzhfoNs+GGKrWZ6nL/kIuV
 wxMs9khIm3qzD9QshFphQhHGB+Rg3SS1Aq+gOogDxMZ8Vjdjf+swLbfrSfFr/ceBULgj
 dF1yP3HWMlksvK+RkiTaQIylzEq26yeLgL2NVRdUTVmf9aOew60PGNmCZmfC/pPWgSeB
 i5tc84wPgwpTa2Tr1UYRP3FPXjYQBghEi5aJ2QfqItRDhZJahGHWPgMILgrBgxPblwNi
 htvVywkgu4fsw4jv73dOLhgsb17G8+iV3xQ1v5vsZG9NeG284oNkHyKIU5HjZDB8/9qR
 RK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AMAYXSoKkZcZfAa7Hb5guK+706Ox6dJ7TeNjd/uUq1s=;
 b=Qf/aA2reb4g4RLDY8CEDYlp+i3gKnw6uH4yQtqCDrV5cleyX3IfY6DET9KUyge+aT1
 V1uiuTWxB6RtH9fYvIVWSLLzzX2HPlvFU9DzlupSXnAjLYdEbCrsvg4hb556wUqV1Fxj
 7C9/DdZG+sJ6fnPqzS/rXIVZrWlqQoSeVxoLRHK3RNlMRlupBkp7CoTjmA9Rx6DnesVt
 qjE7U3Hgj8ece/CYxohKygYdUSu4WWWdCehQkHbBMZduTWNMZlgpxMWm5pI2gIZxLRN/
 93f3vhj2f6C/ngbhqZdDrLSNEe6UciwTpte2u1q5mA1QQAgi6tupvsohWYdo/s3VUViV
 P9Ww==
X-Gm-Message-State: AOAM532XJxRVzPcHaaUs7VqU7fpemb0WrO+jp0UKrZd9TBiqd1xDidqN
 4YqDE37m7fR8QDAVBjnJk9DGWT9RcBA7vbDOLVAx3YgqJlc=
X-Google-Smtp-Source: ABdhPJxKLwitzuYma36DWX9u+vh/6Lyy+fQ09IAoP6N83qOfw3f372bCueMhPNNyCOChwdbLDJdshawplCO4xDkyrNQ=
X-Received: by 2002:adf:ef42:: with SMTP id c2mr7145734wrp.528.1639065861712; 
 Thu, 09 Dec 2021 08:04:21 -0800 (PST)
MIME-Version: 1.0
References: <20200317163616.30027-1-f4bug@amsat.org>
 <20200317163616.30027-5-f4bug@amsat.org>
In-Reply-To: <20200317163616.30027-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Dec 2021 16:04:10 +0000
Message-ID: <CAFEAcA_nY2yF=rCPnjQ3B+hHf5y5Dae8Yg2Tgj6Tub61P4YXiA@mail.gmail.com>
Subject: Re: [PULL 04/13] target/rx: TCG helpers
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Mar 2020 at 16:43, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> From: Yoshinori Sato <ysato@users.sourceforge.jp>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> [PMD: Removed tlb_fill, extracted from patch of Yoshinori Sato
>  'Convert to CPUClass::tlb_fill']
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Message-Id: <20200224141923.82118-6-ysato@users.sourceforge.jp>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Somewhat late, but I've just noticed a bug in the helper_set_fpsw()
function introduced in this patch. The function has changed a little
since but the bug is still there in the version in git:

> +void helper_set_fpsw(CPURXState *env, uint32_t val)
> +{
> +    static const int roundmode[] =3D {
> +        float_round_nearest_even,
> +        float_round_to_zero,
> +        float_round_up,
> +        float_round_down,
> +    };
> +    uint32_t fpsw =3D env->fpsw;
> +    fpsw |=3D 0x7fffff03;
> +    val &=3D ~0x80000000;
> +    fpsw &=3D val;
> +    FIELD_DP32(fpsw, FPSW, FS, FIELD_EX32(fpsw, FPSW, FLAGS) !=3D 0);

FIELD_DP32() does not update its first argument, it merely reads
it. It returns the new value with the field change applied, so
you need to use it like this:

    fpsw =3D FIELD_DP32(fpsw, ....);

Would somebody like to write a patch ?

(I noticed this because I just made the same mistake in some new
code I was writing, so I did a quick grep of the codebase to see
if there were any instances of it already present. I think the macro
magic used in the definitions of FIELD_DP* to provide a compile error
if you pass a value that's bigger than the target field has the
unfortunate side effect of suppressing the compiler warning that the
whole statement has no effect.)

thanks
-- PMM

