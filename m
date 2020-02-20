Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F1916643D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 18:21:08 +0100 (CET)
Received: from localhost ([::1]:46704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4pVb-0002Wb-PL
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 12:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39723)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j4pUI-0001su-ML
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 12:19:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j4pUG-0001Sl-Gi
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 12:19:46 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46206)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j4pUF-0001Rg-Cs
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 12:19:44 -0500
Received: by mail-ot1-x344.google.com with SMTP id g64so4350485otb.13
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 09:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2FeaUImFnWe+ta+AJLPXRCtqLH94AGyAzEfuypqN7OE=;
 b=wYlTtuwdXqXUc8nebPAi9P0g+ZLpKBX2N+A0FxGVlOcI9pz2dkLaJQ3i+u8o1oEmY0
 KW4WtlWIecNHySyrGPWoLyLW24EAn0JMSrKfa+/DiKZZBTF0INjXQ6u9eimF8RnLiXls
 32i3F4bWVBcIxoZvew6lyPNIwL8RIk3FHcuZAYXl3Rp7cxJCzU9NeKymameTRoXcqZUb
 PRRH5KHqHJuNNmsk1Wq+QUbWhZN+eoLe40gfndR+bFftxaQfCzwmBoX3jrXdv5d2kjhP
 gpI/0yvMkubWcticBj3CvPHMzFO0PSXJHNbEHBNoqXH1FW5Lh8YOq13CqU6UG0Z9mFd8
 qtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2FeaUImFnWe+ta+AJLPXRCtqLH94AGyAzEfuypqN7OE=;
 b=FP1TOE3mB6rqjQU5SAVAZh/HSoadHDZRb1OLBeRLui9YwAGjJZG9IlSYPcjwPMqeoZ
 wGyNK4dfkK9VV3g50C6FnB1kz5XSzw+VDzxv6A2dlft1VEjw14syMIZb4xZTJOpSUQhf
 RIvzFSOfD1ClkU6Rm5ovu0oPIbNEMAULlJJEwQVDXLRSaVgQa1W6MloaJzjLoESsnSxY
 bkrducBJgyXCoy3KtOPBg1mHRiW1eK1PSUbc0UWsAqsvc63pSpC43SykRfVChiNwvUy4
 4mes4Kv4aT/gfRxNsj7i1aiKvXBgLQQPo5GecTiGRgYm2S4qN+01zunZLd7Rv35Zf/AW
 KpVw==
X-Gm-Message-State: APjAAAVkWmPVSqoPOF5dB27tjvkbD6qdKozyE8FE7847tEBNWrb7IAjh
 C1nmjOxxkAJx40VKglmBZzGZY2iBIyPOqW1AdJ6teA==
X-Google-Smtp-Source: APXvYqwu6MYQI32qf6xDbY8JhaYF4JzZSQvo/lQ0iahpVAR1ZaS6VGYIMQgv//+Xpg7B2D3doCvb6dM1TQTYuoEEMYU=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr24700298otd.91.1582219179130; 
 Thu, 20 Feb 2020 09:19:39 -0800 (PST)
MIME-Version: 1.0
References: <20200214181547.21408-1-richard.henderson@linaro.org>
 <20200214181547.21408-13-richard.henderson@linaro.org>
In-Reply-To: <20200214181547.21408-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2020 17:19:28 +0000
Message-ID: <CAFEAcA8Up6CGPB9jWCdtGKfqSzbnXrzfoq_dQ94aBC8sV9mWmA@mail.gmail.com>
Subject: Re: [PATCH 12/19] target/arm: Remove ARM_FEATURE_VFP check from
 disas_vfp_insn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Feb 2020 at 18:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We now have proper ISA checks within each trans_* function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 0da780102c..e8c3d4f26f 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -2652,10 +2652,6 @@ static void gen_neon_dup_high16(TCGv_i32 var)
>   */
>  static int disas_vfp_insn(DisasContext *s, uint32_t insn)
>  {
> -    if (!arm_dc_feature(s, ARM_FEATURE_VFP)) {
> -        return 1;
> -    }
> -
>      /*
>       * If the decodetree decoder handles this insn it will always
>       * emit code to either execute the insn or generate an appropriate
> --
> 2.20.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

