Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DD7546701
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 15:02:56 +0200 (CEST)
Received: from localhost ([::1]:35906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzeHu-0006qT-2b
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 09:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzeBU-00032Q-2n
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 08:56:16 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:40734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzeBS-0002cu-LM
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 08:56:15 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-30c2f288f13so271104937b3.7
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 05:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G1Oc6rDcqy2v5Vl2fN5odtAtmPY8T0X3y07z9CzodkQ=;
 b=wVn2xV2xRaUilBuux9O5AMTaXl3dqcMqoSV2k3ytoj/lXDs8YFq+LPg5GwhjOrIyCZ
 yk1xbTv+xAgBuUD99e6UbzZpXbLaXsSI5G+/ArZQCyPzCPJkEaRoIb2qugURd1vbC5Cw
 gfahXminzdkX9EmgiHgH569hPliWRVcop7l76xtxjhioyzH5PaIjhqdRT9eEEuOg710Y
 I3HLyCP7RAVDnr/pdiWsC0Bgz8l5jzqo2rlUldes80IAulI+G3lInIrGOLDn8KI7BNwJ
 hVv+vxpil7CKUTWhlhVujyU7sS1Blbu4A//IrdlhQNfWJXFO0SQGxsGtCF7F1zpqUqb+
 UqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G1Oc6rDcqy2v5Vl2fN5odtAtmPY8T0X3y07z9CzodkQ=;
 b=e/Rnk3+uOUY1qhgNCXUI9Lyig03jine8LaXYahY+y4prN3WUAkUuvtL3SZe6qkFcad
 apTnYiKRv00Xq/E41n1w/+8P4gE/bb0qO5o5KTHlHxCDPlZLidygKCgqEesxepk99U0y
 uYmkL4QireGifgyHbMPzFhQEOKTy4rChrFxEAe14BxeErsFSk16nqUQY1aL+w7fNiCRl
 /MLmsEmXR4LAfrFCNtK11aVa/vgkQVD9WC7z4+ZisdHnhUXX3R6CFnCh/4lGH9iPGUIc
 jLElm5VhAUxn9QdlaLZjfeG7ajAvKYh/9B7qEUrO50TVCzkgRWOP9pX2noM2KrKS8z/w
 xX1w==
X-Gm-Message-State: AOAM533e/PHZYJvZZh7Mu479q2kzVh26wJ6EiC9RxY9xAzHtX7M7mowG
 gLEfy42C9Kxz5qk8ch8bn/7Cn5JFtLR9zWZSH5Ki2w==
X-Google-Smtp-Source: ABdhPJyCecnKMIovlwN27zPp2ASC2cAXC8uYauslZV0sEG6+GeFwq01/vK35CLnGLHpW+j+hqdZ92ZoQZvmgUW27eVQ=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr48630816ywb.257.1654865772639; Fri, 10
 Jun 2022 05:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220609214657.1217913-1-richard.henderson@linaro.org>
In-Reply-To: <20220609214657.1217913-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2022 13:56:02 +0100
Message-ID: <CAFEAcA_STWv-LLcoQjjnqbLoHJjcoSrB5HRz5Ea_f7d9ed=RdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] target/arm: SCR_EL3 RES0, RAO/WI tweaks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 9 Jun 2022 at 22:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Adjust RW, fixing #1062, and adjusting bits [4:2].
>
> Changes for v2:
>   * Fix patch 1 vs reset.
>

Applied to target-arm.next, thanks. (Fixed a missing space
at end of comment in patch 2.)

-- PMM

