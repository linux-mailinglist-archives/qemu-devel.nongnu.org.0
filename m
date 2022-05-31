Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0CC53907C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:17:34 +0200 (CEST)
Received: from localhost ([::1]:60606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw0oX-0004oH-8a
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0eJ-0005z7-KV
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:07:01 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:43891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0eG-0002NT-KN
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:06:59 -0400
Received: by mail-yb1-xb35.google.com with SMTP id l204so12797629ybf.10
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HQZU/fMM0N/MNSQv0aTjlDgDx8N4xPVAe2/qhXj6ATE=;
 b=F1TlzknksgNwyzoRjx2vEFOm5vWT4ZsmGa39Bt9h9vQQ0ZJ5R0OZc9VoBoLdjyYKEm
 9AJ81ix66xcTRBTgA/fF/gBeMVunTKxss8dMcdep0T1B1nc0W9cv5fZ/XqFq7aiT8y8i
 JGzLGfuFWJkvjhpMhSa47+WWzwp50P03CLhbr9Cj6vk5DjkATTt1lnDWCDNJy4ENTs38
 PUVuafew22MmrnIT5qlscpUWqNTkVzIk0v8TyXfIhVw97HcdFtJaAPS7zXEHeWj2+cnC
 SnYU51K0r8ytV8L2uCwea5975K+d3TO4f9E8fPG7Gw51VBCb+X3f32WQWwv+KuJk1DGt
 PJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HQZU/fMM0N/MNSQv0aTjlDgDx8N4xPVAe2/qhXj6ATE=;
 b=wkUyhbyky73PfiV5+s0hwuQ6nwF0vK1z6sVIJXHmDUSgnJ4iyPWTGWiFqk6j9nFRSc
 kVpSC4SU6fO2ASt4C2VFvSXJkniPGAo2itNQvFEk1htHRdhcn63eA6sLvvu3HGjp/Vg5
 CCE3LxFcvIfvXcSsjWoxjMNLF+UrEN3//ZfOqt0jj3skVHDgeTzvYQR0Utw7yiLMEwRM
 PN5UPHN7bUGarFpx6oeCLmnPl63XwSkIwFRela+1TJfuCIR4O+ExSXTWHV1DxRl2FdA/
 w6FTFYsVtXWmb9OEtheW4vl/sJe80jreGr14PWvR5qMhudgev07SL3zlaEHwBkpZSNz1
 ituw==
X-Gm-Message-State: AOAM5323X7nLwmHMsa7iBD/q0HBsXRCBInX6hfB3YwId1jgQsh42LbEv
 MCzem+BqyRTysPFLzyADu40i9SOpPgwdSsO6wS5LDg==
X-Google-Smtp-Source: ABdhPJwG5GEmXF4sdaohKizbqeb2HvWOFGWhiP/vQu1qvotuGyoFWbkQTjxwn5NDDvh19Uj/HmXY6iagwc5gwIdfiC4=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr58483653ybq.67.1653998815533; Tue, 31
 May 2022 05:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-15-richard.henderson@linaro.org>
In-Reply-To: <20220523204742.740932-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:06:44 +0100
Message-ID: <CAFEAcA8K2GUDixkZue2Sf2UWeRBU1DxjPy=A5RVU_yYD35h3dw@mail.gmail.com>
Subject: Re: [PATCH 14/18] target/arm: Mark exception helpers as noreturn
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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

On Mon, 23 May 2022 at 22:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

