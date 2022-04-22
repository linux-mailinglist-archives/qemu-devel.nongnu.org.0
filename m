Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3B250B478
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:57:16 +0200 (CEST)
Received: from localhost ([::1]:46426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhq2N-0005AH-9k
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpug-0007RY-4J
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:49:18 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:33070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpuc-0000I1-KX
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:49:17 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2eba37104a2so80123757b3.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OZe7+eLUTIPHvw9ZeULdVp/qrjoKl4WUm8ow6eQlx60=;
 b=W2pmfpqQj0fF4Imve4c9pj7M6JYxePf9dpJ46/u8zuxV3/EGt1lRPQxg26PkapGHkJ
 k39MEyvUPYWnkRju20siWzT+M80J+rNebGLadd2TCq2FmgIdyjCpNSECD8h1hD4UsmvD
 PFL/a4lIDL0Lpm6jxWqDcO6MFwR8xi0Ye/+AG3plIGtiZMHPIOBQ4fZy7OJi7fmlKhA9
 medG6d15nDJyTXYOLKV96r8lnmG2OHSJJDlMLTbd8g2LfxgYZ9DDft984KusiZNgrgWG
 EZDT17jZJY/S0PMLiQiuGu9ixT9l0VQEDZYWzffGiSr9+G9WFM5N3rpYYFcpw094AGsK
 eSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OZe7+eLUTIPHvw9ZeULdVp/qrjoKl4WUm8ow6eQlx60=;
 b=Lm5iWUvvIagbMOF/R1FWUzIjL2uvKjcP//83pFx9U/iSPNZUGSXpMRYAZNn6BcFXTC
 xywjHXfVxxyJwUx2zrH7qQIhrd7n4WshgY8yOnzLEXGbQYboTiGPN3fEW4ULA1GEg+sX
 M7XsOZxReA7fiV2RL5nYT8/2MC1cSHol+Ng0RO2JMpxqvjkWLlVf0nJF4B9SFUWWvwxH
 q11HuHNMrDXaEcnD+4JM+/sGef3k6N2Mn2jCvzJAe0RQ0bideO2qz8zN9W0fhDiSn5Mn
 bsSojXvSOU7r2xbHr3OoB71jq7WDEqktQN86KWnlBwpTMOovdHEiqfJkXjqW5ED9IYv2
 E4Rg==
X-Gm-Message-State: AOAM531pAMGSbz4TayeKhH/F8B/v1FB52/GRsItDIzfvc4GigjBp5URD
 8urmzcrFKpKuhRCfBFelklJgppEACt5S/wuGigCnBQ==
X-Google-Smtp-Source: ABdhPJzBjXmt3xVbJdp791CueEBcFeZBKlmZ3GBQW0N2/3h3hWFLA1zSuQ2XL04wRKWEM5ayhoQxj5zKt9LmD9+S4gw=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr3847194ywf.347.1650620953229; Fri, 22
 Apr 2022 02:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-29-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 10:49:02 +0100
Message-ID: <CAFEAcA_q9zA_Zr7q4MRxu1uYrZ-1OnWhQf9jEaePe7Qq8jbNvw@mail.gmail.com>
Subject: Re: [PATCH v3 28/60] target/arm: Reorg ARMCPRegInfo type field bits
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 19:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of defining ARM_CP_FLAG_MASK to remove flags,
> define ARM_CP_SPECIAL_MASK to isolate special cases.
> Sort the specials to the low bits. Use an enum.
>
> Make ARM_CP_CONST a special case, and ARM_CP_NOP an alias.

This is a behaviour change -- read of an ARM_CP_NOP register
currently is "do not change the destination GPR", but
read of an ARM_CP_CONST register does change the GPR.
Maybe that's OK, but we do have several r/w NOP register
definitions at the moment, and if we do think it's OK to change
that behaviour we should do that carefully in a separate patch.

Also, currently we do not migrate ARM_CP_NOP registers but
we do migrate ARM_CP_CONST registers (and this is important for
KVM --migrating the constant ID registers is how the check for
"is the destination a different host CPU to the source" works).
So overall I don't think it's safe to squash NOP and CONST,
or to treat CONST as one of the SPECIALs.

thanks
-- PMM

