Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB21565490
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:12:22 +0200 (CEST)
Received: from localhost ([::1]:60492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Kw8-0003Kb-8X
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Ksh-0001FJ-Q1
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:08:47 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:34680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Ksg-0006YN-0s
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:08:47 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31c86fe1dddso32486747b3.1
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gzIwh2o+dAH+8TWNJkpXMmsyVSE7z3cPGYQGFbtfn3w=;
 b=QEh7S8J1XCplvZRFAG+VoNLr5Y8A8wGU5/2X72x6jTPXQiqBpUB16Yz3WgXwsS2/t9
 ijyONRFeKyeGkSCrv1N2gGhoDwBZ3fIIWeZUsTRH6BergL0qqvz47Vg9XjdnQK3Ev1d1
 uOtJm5yihM2QwM0h2NY8MuvWZrenFDfpwFOfS7DNnTjdlIiZwQNehalEgw1YwrKhPlya
 Lh3w72jn+u/w4uVzFMktQ34VbV0byS9KFVCulAoXi00CfJiCQysNbD2NH6Web6jFt9gJ
 WlcvupI54GL89T21WQC/mplkxAkk5JuSbR0lnfgG6PNYBd1CIZS3Q3ie3E3luUX1Ifuu
 NOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gzIwh2o+dAH+8TWNJkpXMmsyVSE7z3cPGYQGFbtfn3w=;
 b=IdECIznO1ZCDEkSdX/wFLeQ8Re1BxsYukQcLeQuUBtIMAFCdM7RrY+2fhLH1pLGiSx
 w0HIuWcAiuhJxgJ24LSNqMUV6OWir+Yc9A6gXZtxRJ3mVMACb4HmpJJ55qyUKtry0DVh
 NdP9tBKVrwcjKSdPxjzGv9bgnZWYpEO7azFV22LItPwUozvsM9GkC1HyinRXspVJDMPi
 7HVuQqgonXq4YFM0T1+K0CNaFXe/00yN/uVGRJJdeCe4vkV6JONIHrYoQOocLFIFzxd1
 BUDCvnbZJthIYO2DJaTxmnqSu2A8xRiGlIWwP6xAYDVjYjPOFuiUy6E2cggQagvnU+5J
 PFrg==
X-Gm-Message-State: AJIora9ixZPKda0xadWSDj79iOygjWZSH6+H74JUQBBmz5bFphYW5CbN
 BLcLjVRgiA6zx918QkwQ78nPfswGqAEQcJDV3VMgyA==
X-Google-Smtp-Source: AGRyM1tLYJhs1DbohK7uazIPsuLThWsIcsMxO6wZuYcowJCPYMysNIrodpfgBJfs6L7IlFIkmidaTHS//0TcDJesHt0=
X-Received: by 2002:a81:6585:0:b0:31c:b55b:dd36 with SMTP id
 z127-20020a816585000000b0031cb55bdd36mr421817ywb.469.1656936525037; Mon, 04
 Jul 2022 05:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-38-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 13:08:34 +0100
Message-ID: <CAFEAcA81Xc0kXrYTeq+Ck4b9vwu7jOAMerS0s_L0HaqyvfUcJg@mail.gmail.com>
Subject: Re: [PATCH v4 37/45] linux-user/aarch64: Do not allow duplicate or
 short sve records
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Tue, 28 Jun 2022 at 05:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In parse_user_sigframe, the kernel rejects duplicate sve records,
> or records that are smaller than the header.  We were silently
> allowing these cases to pass, dropping the record.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/signal.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
> index 8b352abb97..8fbe98d72f 100644
> --- a/linux-user/aarch64/signal.c
> +++ b/linux-user/aarch64/signal.c
> @@ -318,10 +318,13 @@ static int target_restore_sigframe(CPUARMState *env,
>              break;
>
>          case TARGET_SVE_MAGIC:
> +            if (sve || size < sizeof(struct target_sve_context)) {
> +                goto err;
> +            }
>              if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
>                  vq = sve_vq(env);
>                  sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
> -                if (!sve && size == sve_size) {
> +                if (size == sve_size) {
>                      sve = (struct target_sve_context *)ctx;
>                      break;
>                  }

On the other hand, the kernel seems to happily allow records
which are larger than the SVE_SIG_CONTEXT_SIZE, whereas we
ignore the record unless there's an exact size match.

I notice the kernel has a bunch of signal frame test
cases in  tools/testing/selftests/arm64/signal/testcases --
do we pass those ?

thanks
-- PMM

