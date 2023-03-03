Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9066A9C32
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:50:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8ax-0006eN-VL; Fri, 03 Mar 2023 11:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8at-0006cR-7N
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:49:19 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8ar-0002NX-MB
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:49:18 -0500
Received: by mail-pf1-x434.google.com with SMTP id fa28so1937859pfb.12
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677862156;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gYqUDK5QCWo5zUjaVokPHL9/Kw7/CqfGFL4kZ/hEAFk=;
 b=n+05wIbm+dRGwZg4X95UwcBJ/az0BCYH2wcdbCnWVIOe079ZThwHcVm1BjCWdak1qS
 qY7WzH7w5wfftefW6F/rJe+AyqDTIurnR24ShHArcFNMkYm6eYOGZII+iWcQhCJRTBKm
 lzUaCBgFXhJJ9UUlhMNlgh4qG9nIkrhpCP9qd/eU0MiMd1bSNcWkhiqMQCvfViK8K6TH
 9csA5GqB7OxNZPeN3luGerGoISrvze6sdTUH/3AQcRZf3jR4j8T2AGfn95LSnznnShqe
 dIdjlAGifsemMzpUqtihtArCxS53m/W1GM5V1AnCCB4YcdHCmiuELGbZAS7T4HgDJqoK
 GPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677862156;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gYqUDK5QCWo5zUjaVokPHL9/Kw7/CqfGFL4kZ/hEAFk=;
 b=fN0+a+f22Y1OES5hPzakf0rg7mUV+bhQ4mtrCDc/OBsCYMMBtZJdo7UE5LMntolmkd
 0FoLLwTJTa9MFQVcoMjmMgY/oOnRc3T0gmGFYR/FqYqsUy1nHbyYnXupHkSKswSyxKvo
 vKg91IZdZzC1reSs2yvE45NrfvlvO+1G5iOpgIu/Rk7uda+LR2mdx4y8vxYn53Lz//SY
 oiYg1sqyYrIZWub4CdVO/4GPGm1bG+8wCqfubD49F2JHSBcoH6sOeG9h1EV0HV87giRy
 nt6+QN2DQWEJWrVydBNwqk+1+wBbIq7jkGucnZ4dxrn1BuVD22kthOULfxJ/5Tk/FVAb
 Imuw==
X-Gm-Message-State: AO0yUKXW7t2vlx4HuXA2KxqgZo/3CQWVRnBRXKCuKynGGZMoNvdEm9vp
 RpAQ1Ed6UfaNoW2mimCFSuPHvs72xfv54FzNmI9nmPG0+GejNQ==
X-Google-Smtp-Source: AK7set9hFgkmBs6AGzYCAIJ40r6f9cZTGBE3wdFZCADYzLIEHHE/WbvYYuiOdoswwY2K5XIImSiWwZOf9fZlHQcdqys=
X-Received: by 2002:a05:6a00:225a:b0:593:c9dd:9069 with SMTP id
 i26-20020a056a00225a00b00593c9dd9069mr1189541pfu.5.1677862155919; Fri, 03 Mar
 2023 08:49:15 -0800 (PST)
MIME-Version: 1.0
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-7-richard.henderson@linaro.org>
In-Reply-To: <20230223204342.1093632-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 16:49:04 +0000
Message-ID: <CAFEAcA-PnmGDjWY6OfyKw+XY94e2j6vb5_rWM3oqnia4BN3Ogw@mail.gmail.com>
Subject: Re: [PATCH 06/13] accel/tcg: Trigger watchpoints from
 atomic_mmu_lookup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
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

On Thu, 23 Feb 2023 at 20:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fixes a bug in that we weren't reporting these changes.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c | 40 +++++++++++++++++++++++++++++-----------
>  1 file changed, 29 insertions(+), 11 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

