Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586B46D0146
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:32:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpYz-00047c-TK; Thu, 30 Mar 2023 06:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phpYw-00046k-Er
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:31:22 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phpYt-0003rJ-DY
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:31:22 -0400
Received: by mail-ed1-x52e.google.com with SMTP id x3so74450316edb.10
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680172275;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6j5tKtWtgjVcee30MA/GvCiq1FDILEDXA9D/KFXqD/Y=;
 b=ePcPsT2xkAcEPhhiqHXnXt15lS3tSsRUBS+B7LGtFb2lK/Cd3tLXBtUm6/J3Yk2LdE
 OrKIQ3U1tzw+3nYWjvl06i69x7YJ7GxdScuiEi0V8wRILcJTaRv5JJzJH8E//3KVjpXo
 aTzEZykcuFWFPnjzhirW3u5TwtoHzNMGAdJ6uNQxiue/s5Ka+0g7J1wdi0ULH7r/noZi
 ZgZspwQVt+bzqgsh47y02qOTGK36MgrAv3TE4rMKB2de90+mz4wbaYF86SEsYwE29L5b
 ErlVhXc/UJJ7SJ0otPp4JLlw7YQB3YC2/2kP11uhUhVpB8cCTX7OQ500Zp84xPzy3/fY
 kbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680172275;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6j5tKtWtgjVcee30MA/GvCiq1FDILEDXA9D/KFXqD/Y=;
 b=XDR2rJMwcIQFf+ndkbNrpxzCj7WpK1xndieDGKsW+Ys2e3MRC2egjE+okdwQozUOw1
 /OnuJJkaNmUoC3sUKMZdI1REN0e0V2SgCynOSu/lZHSS9SQsK71XWpWEM0NQFb/cVZip
 9pywDZGVqUqefgoMhf3RWLmE3C6SD+h6I0jmdGr6kHHTVR1d5lS09AInEEEVb4ayJgNA
 V41dyi9Qed9eo6Y6aUXuavsDJMGMUActspz/8dnXzMTTs9rZZdHoYu+sFSfRzeN/or9r
 3+EfFzK9mozr+TcaOe6n35tzEDXK6HqErK/szcNfnjvmb5fQ5/qw3qJJImv2BrrS3iRY
 XuRg==
X-Gm-Message-State: AAQBX9fih7KDs0gfCx2K5xrcdzCWb9wS0GNhKaLR9q2GNyaQf6kCbBOY
 28T+2B/e3xRAm1hB+VsVng8C1uFLLv/W3TF9Oquy7Q==
X-Google-Smtp-Source: AKy350aDTQQsQFJ6XGXT10JB/68gcSqjaV0iCJUo22jcMgbWWxlNS+X/Zvd5DR2RHxD83PqiLZvZgGMezkKSRwHRzhE=
X-Received: by 2002:a17:906:8683:b0:939:a51a:dc30 with SMTP id
 g3-20020a170906868300b00939a51adc30mr2711398ejx.2.1680172275299; Thu, 30 Mar
 2023 03:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230328212516.29592-1-philmd@linaro.org>
In-Reply-To: <20230328212516.29592-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Mar 2023 11:31:04 +0100
Message-ID: <CAFEAcA_yP9ibO2NOC0pL4SNbPmHtB+TfPm0A06YfC4Mwec5xAQ@mail.gmail.com>
Subject: Re: [PATCH-for-8.0 v3] target/arm: Fix non-TCG build failure by
 inlining pauth_ptr_mask()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Tue, 28 Mar 2023 at 22:25, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> aarch64_gdb_get_pauth_reg() -- although disabled since commit
> 5787d17a42 ("target/arm: Don't advertise aarch64-pauth.xml to
> gdb") is still compiled in. It calls pauth_ptr_mask() which is
> located in target/arm/tcg/pauth_helper.c, a TCG specific helper.
>
> To avoid a linking error when TCG is not enabled:
>
>   Undefined symbols for architecture arm64:
>     "_pauth_ptr_mask", referenced from:
>         _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
>   ld: symbol(s) not found for architecture arm64
>   clang: error: linker command failed with exit code 1 (use -v to see inv=
ocation)
>
> - Inline pauth_ptr_mask() in aarch64_gdb_get_pauth_reg()
>   (this is the single user),
> - Rename pauth_ptr_mask_internal() as pauth_ptr_mask() and
>   inline it in "internals.h",
>
> Fixes: e995d5cce4 ("target/arm: Implement gdbstub pauth extension")
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> Supersedes: <20230328133054.6553-1-philmd@linaro.org>
>
> Since v2:
> - Rebased (patch #1 merged)
> - Addressed rth's comments
> - Added R-b tags
> ---
>  target/arm/internals.h        | 16 +++++++---------
>  target/arm/gdbstub64.c        |  7 +++++--
>  target/arm/tcg/pauth_helper.c | 18 +-----------------
>  3 files changed, 13 insertions(+), 28 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 673519a24a..71f4c6d8a2 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1389,15 +1389,13 @@ int exception_target_el(CPUARMState *env);
>  bool arm_singlestep_active(CPUARMState *env);
>  bool arm_generate_debug_exceptions(CPUARMState *env);
>
> -/**
> - * pauth_ptr_mask:
> - * @env: cpu context
> - * @ptr: selects between TTBR0 and TTBR1
> - * @data: selects between TBI and TBID
> - *
> - * Return a mask of the bits of @ptr that contain the authentication cod=
e.
> - */
> -uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data);
> +static inline uint64_t pauth_ptr_mask(ARMVAParameters param)
> +{
> +    int bot_pac_bit =3D 64 - param.tsz;
> +    int top_pac_bit =3D 64 - 8 * param.tbi;
> +
> +    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
> +}

Any reason for deleting the doc comment ?

thanks
-- PMM

