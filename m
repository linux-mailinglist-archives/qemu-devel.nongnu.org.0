Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A9841FAEA
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 12:41:52 +0200 (CEST)
Received: from localhost ([::1]:45048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWcSk-0000Dk-SA
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 06:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWcRr-0007R1-KQ
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 06:40:55 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWcRp-0003YE-Ds
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 06:40:55 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so13293553wmq.1
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 03:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RcaVKLRK/WpAUu93Kd4bgPtSbqLLGOigzCIf6JDMp/U=;
 b=bDNyPOxFC0ohji65B18o5JRf9z7K8L8BTwc/dhe8mnYZglXSgn2Z3KQDw11MA8Qirr
 KNlUiMzWmxOiUQjyecCTSrwri4C2T17VUgtmVXturw9N3l+0mW2BNqUfqtilNxI9+rL6
 vfj2XJpEj0DkWsY2Gt3lVRK80eqn59xBww73X90NzItESKCIAIzEKevea7pWfbgc1C/a
 DZkcGF/g30UFBTQJX6LnWA6ijdIaPFPctOQYmkGF2hDFiXYF74wfoqr61/xNc70lyuSW
 2kyeHrrhbzj7xjD+IL7FcpAhX/UBqKE5+IIm7CLdbb5ua0jGZlFrzUVwv5R8ubi0PBQ7
 KNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RcaVKLRK/WpAUu93Kd4bgPtSbqLLGOigzCIf6JDMp/U=;
 b=6oKx2xVbbL0HpH8tHvYx5alZpRJpw7iyJ67atbSdUXCaiX1CSqLiGX0Jg53VcxWU+0
 ONQ8ojlSbNsk05ltWOl+TJ5qT4fPnSRXLeJXXQwDo2iDYvW6QvH4Zwu4X9hCew52aRox
 T7E+ebPzyN6fVzpiXnXpbnjAY85Wex7RcnObc/TJoIbn+dyf9DmFYKGQoZsIgQ9U9J8l
 j0HivpOSVOHLp8j+Lku9ijtsLuh/2I7z4jx+B1lTWZ/Nx2B0P1ppu9exuzw+kU3kdI3f
 40SrkovDWWmntVoOCyK6AldnK8uP64RWfFLlOw7UZWfrF6B3kJSpQ93YensXl5MOlaIw
 rteA==
X-Gm-Message-State: AOAM533exzjgr/lruhBgJZx7LoHSU/F7JZcSB6IG75ohX5Hgl4foDCqn
 014ODai6RQaea80VQkDwEkM9U1SCZ8SlmfGtMLjIzw==
X-Google-Smtp-Source: ABdhPJzMVbeqnVwFfIFCajCNFrKfbV/F7CfSMW2A09Z7Uku4hOq7z1eKSQlU8UG4ZdhKvUMN3XZIBFtnAfbGpNnjkbU=
X-Received: by 2002:a1c:9d42:: with SMTP id g63mr8583013wme.32.1633171251359; 
 Sat, 02 Oct 2021 03:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
 <20210930054426.357344-34-david@gibson.dropbear.id.au>
In-Reply-To: <20210930054426.357344-34-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Oct 2021 11:39:57 +0100
Message-ID: <CAFEAcA8AxuMRRjxpya3_H+57SmrduD1dVqg7vjSOadV1pCQaSQ@mail.gmail.com>
Subject: Re: [PULL 33/44] target/ppc: Fix 64-bit decrementer
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Sept 2021 at 06:44, David Gibson <david@gibson.dropbear.id.au> w=
rote:
>
> From: C=C3=A9dric Le Goater <clg@kaod.org>
>
> The current way the mask is built can overflow with a 64-bit decrementer.
> Use sextract64() to extract the signed values and remove the logic to
> handle negative values which has become useless.
>
> Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
> Fixes: a8dafa525181 ("target/ppc: Implement large decrementer support for=
 TCG")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Message-Id: <20210920061203.989563-5-clg@kaod.org>
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Hi; Coverity complains about dead code here (CID 1464061):



>       * On MSB edge based DEC implementations the MSB going from 0 -> 1 t=
riggers
>       * an edge interrupt, so raise it here too.
>       */
> -    if ((value < 3) ||
> -        ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && negative) ||
> -        ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && negative
> -          && !(decr & (1ULL << (nr_bits - 1))))) {
> +    if ((signed_value < 3) ||
> +        ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && signed_value < 0)=
 ||
> +        ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && signed_value =
< 0
> +          && signed_decr >=3D 0)) {
>          (*raise_excp)(cpu);
>          return;
>      }

If signed_value < 3 then the first clause of the || evaluates as true,
and so we will definitely take the if() clause. So if we're evaluating
the second operand to the || then we know that signed_value > 3,
which means that 'signed_value < 0' is always false and in turn that
neither of the other two '||' options can be true. The whole expression
is equivalent to just "if (signed_value < 3)".

What was intended here? If this was supposed to be a no-behaviour-change
commit (apart from fixing the 64-bit case) then the condition should
have stayed as "(value < 3)", I think.

thanks
-- PMM

