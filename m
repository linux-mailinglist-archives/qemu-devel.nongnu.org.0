Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BEF51F859
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 11:40:52 +0200 (CEST)
Received: from localhost ([::1]:42628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnzsp-0004AX-Kj
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 05:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nnzpK-0001lN-Oy
 for qemu-devel@nongnu.org; Mon, 09 May 2022 05:37:14 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:40533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nnzpI-0002Vy-7m
 for qemu-devel@nongnu.org; Mon, 09 May 2022 05:37:14 -0400
Received: by mail-yb1-xb31.google.com with SMTP id y2so23811326ybi.7
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 02:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t42B0+fUQDaDgT/KNs0Fcmtg8k7s+EXDC82ddQ1iehg=;
 b=BayDUaOWw32JjAKzt7XfhTB7+LT4swIhOTGbIKdaHBtpIAcHju31PpYMCeYJKjrHwf
 qCtBsJ71MpB7oIbjWx6hxqD0o4JUnQwclMfyRjWfk3+1ZcRH8rbUNzzXEr7DTkVY50i+
 PMttjl4pzfMnDp4jrS1re0G5zlv18iIiUP4j7KQLZeqCqcrc4hoyD9vwhbMIAgGPAU8f
 WN6aCfZ5moKPCUfwJyfY0rPgza460GSCgxaVA1Un1e+pRIlQpnIzHHai4ufNB6qjPWeN
 5ObHke2AFm9juitp0xcC8fJJMSs0dmbQ9wqoNtl9TOQDsh9659uJVo98CLo3dgyqSM+V
 ct4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t42B0+fUQDaDgT/KNs0Fcmtg8k7s+EXDC82ddQ1iehg=;
 b=WY1hE40twiN8TaLNjf3P6YSvJ26cXDFMa6ezXJwa3d5vCPShZQdXJWy9z2iREm5FcR
 2ljIXILFRiBpX5fSKiYGL7b1+FKvbqmaAq2NCEcL37IqevEZ+yBPHk7iqffe4t801xV2
 RBIleJdCXIAvzg8FaP0rlSFj1EodbrcFxzTXjVoW8MyUj2+kQQm3kj6f6WfMVrL7s55l
 4ogEiKQ73ZLpnZ6jrZkEkmlR0XOArt1iO5yqzxppg6hqmLFmKCxZNCTtXN1/DIszLBIM
 Phc0l2FlXC+dCo49nRG82GqU1hEMzFXsiGdSOU8uoN0Vl8JmZt2zgQ/+tTBjhQNPEwiw
 qipw==
X-Gm-Message-State: AOAM532ZdMueB9gydbpefhM4fh/uVUool/Cc+8cSs6KNJQqFJ2KZF6kz
 qzUJAkvWwTkdGL5vw0VcuN6mu7oOXNeRroHCXxDK0Q==
X-Google-Smtp-Source: ABdhPJwRi19DDZQ+92Uw8JcovSpRvG35rNAA6t76mmSq7NgBl4QENfJ3xZk5o0VlO5kP8+/rKraupeY+Awt/d2c8isk=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr11564420ybg.140.1652089031148; Mon, 09
 May 2022 02:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220506180242.216785-1-richard.henderson@linaro.org>
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 May 2022 10:37:00 +0100
Message-ID: <CAFEAcA9qZh_t=YsCEHeKZVWPgVWhAnBUZUrqPu5Hw9gK2zxA2w@mail.gmail.com>
Subject: Re: [PATCH v6 00/24] target/arm: Cleanups, new features, new cpus
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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

On Fri, 6 May 2022 at 19:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v6:
>   * Expand the commit message for "Drop EL3 no EL2 fallbacks" (pmm)
>
> All patches are reviewed.
>
>
> r~



Applied to target-arm.next, thanks.

-- PMM

