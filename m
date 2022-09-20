Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E455BEF09
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:16:55 +0200 (CEST)
Received: from localhost ([::1]:52342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakbu-0004xy-8r
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaflL-000638-Pt
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:06:30 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaflJ-00061v-A5
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:06:19 -0400
Received: by mail-ej1-x62e.google.com with SMTP id dv25so7229260ejb.12
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 09:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=9ojjqBxQHKKGvGj+ykyDON44Vw63oMk4X8s8tx2/iDc=;
 b=QRfvI5TOb8F5I0RlZA+Nfg56Kl1/FOWUpxLRKtiAfPeIuI66qKrfdCqJ0CNlByDNVG
 iKcNYrvUEJBPQ7Rh1EVLJUWsME170iA7M0QVRChAdMQQdWOr7Pym9tXj+9ZbtZGN8EKm
 2hiXzLJk2UnMBHngw5umySYpskQ9djEvFAw3w53bfDafc8s1KXsTIDLFEAo2mkW8iZYB
 6fvVZGXTGjuxYG0cK1EHQYHQAW5JTa2zcRoEpgRxoUl7HT3X8MdNiStooGgIzAGxoJx7
 9oPMDmNbvUo7TAljURaafs5/FxmB6iPgyYNyztEiziw+GJulUBvKfmJ6qhGFFiMQ80cd
 rXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=9ojjqBxQHKKGvGj+ykyDON44Vw63oMk4X8s8tx2/iDc=;
 b=6ZGUv/b/21sFGMmMvLrkFeKvZeSswbunfua0yBjNAv+T8HXiiUyUAmNW2Hrssj/6de
 HUR6Kuy0iy/PRZHZZSqFb1I08z5DnpetK7cVSTSpMUtnNUHpDeFxjHJhg1JdEtYnd6rN
 /E2eAJVgndz+S7mP6F7Fu5uJwTAxZKowjbs9SCJoF/3oyoq5lVbmBzFyjCkpQWLLQgrJ
 3ersVlmoRknip1mWYi2kfC/xnJUr+rTRLcQixFXiKabQDlf3RKW3/EeWNCmxd4yABVw6
 6kce12OFVWtSauyUFhK97xdSD556s+u1KYrokBxE+SGlK4pxxG3Ip8Z8M7SYgWIB/MgW
 WF2g==
X-Gm-Message-State: ACrzQf1/ZqyenzrQZvGh0ZKWLAPfpM5SgblkNSbdCxmvyjfCTofR6c+F
 /z9XrSw7zVFQBbhlAq4ibbVlpRoGMoqkWyDEb1/D+HcJl1k=
X-Google-Smtp-Source: AMsMyM5475y33XXEt176hbIBtChyx5PFGKX9Bg7AmfUSs9rIhblqkQdVLrGn3LRSRI1KEl/O/ojyqCDSvleBDIM2ZR8=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr17017183ejc.619.1663689970448; Tue, 20
 Sep 2022 09:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-33-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 17:05:58 +0100
Message-ID: <CAFEAcA8m-PC4L0hXH7rqAUsU5DokPVhxKwx3=LB+_K=G6p3PPQ@mail.gmail.com>
Subject: Re: [PATCH v2 32/66] target/arm: Remove env argument from
 combined_attrs_fwb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Aug 2022 at 17:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This value is unused.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 680139b478..5c6e5eea88 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2171,8 +2171,7 @@ static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
>   * s1 and s2 for the HCR_EL2.FWB == 1 case, returning the
>   * combined attributes in MAIR_EL1 format.
>   */
> -static uint8_t combined_attrs_fwb(CPUARMState *env,
> -                                  ARMCacheAttrs s1, ARMCacheAttrs s2)
> +static uint8_t combined_attrs_fwb(ARMCacheAttrs s1, ARMCacheAttrs s2)
>  {
>      switch (s2.attrs) {
>      case 7:
> @@ -2245,7 +2244,7 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
>
>      /* Combine memory type and cacheability attributes */
>      if (arm_hcr_el2_eff(env) & HCR_FWB) {
> -        ret.attrs = combined_attrs_fwb(env, s1, s2);
> +        ret.attrs = combined_attrs_fwb(s1, s2);
>      } else {
>          ret.attrs = combined_attrs_nofwb(env, s1, s2);
>      }

There's nothing in the git log, but I'm fairly sure I put the 'env'
argument into this function to make it parallel with the
combined_attrs_nofwb() one.

If you really want to get rid of it,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

-- PMM

