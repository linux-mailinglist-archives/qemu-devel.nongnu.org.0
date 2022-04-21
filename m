Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54860509E1C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 12:58:34 +0200 (CEST)
Received: from localhost ([::1]:55362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUW9-0004MZ-5M
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 06:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUPx-0004Al-MR
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:52:09 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:36858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUPv-0006U6-G5
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:52:09 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id f38so8039691ybi.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 03:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ng+HmJR4YNJXom9+NbV80owzEQyxRDy275hcV3DpIQI=;
 b=KYBUb56bKWl1AXvjFBnfyT/EPrE9yMHDTd5Q1pexAW9tjWH4qv2xwB9IZx+NugDkab
 zoUekHg1ZwD4qR/uBKL98Naw9Ipi40a8WrPlN+jrx0dOaY8s5nyl7KZLqAM8bjvD6jU4
 o40e5yzoqiYH9hOMWV4O4as1H1QOiySEkdFMDTaeYaM2zhB8vhzK0tYoOuuT3ReJbxaK
 lGNfGkBlmGczjh3e9faw1roxlDnd5ee0MBtCPIRzmWXkmfzgfUzg25PMcPSDdj87n0vx
 0ZDUNAP5fKmJTt9s4P7ZM2LOvkCJ4ErEPfR4S+hL3xgYFsvS3uzM55rWVRaYVZ+njjF/
 DHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ng+HmJR4YNJXom9+NbV80owzEQyxRDy275hcV3DpIQI=;
 b=4uyAm1vZJ/1EMatQ0onWFtK12b6JddoIlPkQywLwIwRDc92YSkMTK4S/Fv12lNDy0H
 1XigsgUuaGj5JVmZQDrmmRSxeVoyWxCfOfiPp8y9bhIXMVDJ4DMm8nQp09qorSzbFib1
 kWMtkbFHbkTsLV0sPonbuwrhzZKur2o9EJcdoBP/l1uW0FzlHjFJo76uCvhUJkwv0LMl
 lSPzymIF/PD/8NQ73MwYUZhRmGelkOxpOlCQJ9AMbyDiSQ46GbKg3pCCzvak++Afdk/Z
 F9NEAFBVDiydBWz9itrvcEcL6OZSHEeijPCvBAuvU7MRkFxsi2WUjJyCQzNuRGUu/Pan
 XhmQ==
X-Gm-Message-State: AOAM532Hv2/HoEmIpM82D9dPbcLbBmJEvU8BcaoyF3KwE+/oJwsTIZVh
 YRdzTbCq9e11uwjO8O61LpQ8Cdm25ZLwHnxjuKkfgg==
X-Google-Smtp-Source: ABdhPJySYVADVeu1NRB7xwk+9QLD4VnwQzToeLb5eUycxpsMTWUjT4REy/3vRkfE/Ht7H5w29pGkk6aJd6+5BKxpmww=
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr10736541ybs.39.1650538326516; Thu, 21
 Apr 2022 03:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <20220405223640.2595730-4-wuhaotsh@google.com>
In-Reply-To: <20220405223640.2595730-4-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 11:51:55 +0100
Message-ID: <CAFEAcA_0c7Lb1ryT3J+XCvLrSUKXbVkenfRxo2CCV7m1nhJM+Q@mail.gmail.com>
Subject: Re: [PATCH for-7.1 03/11] hw/misc: Support NPCM8XX GCR module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Apr 2022 at 23:38, Hao Wu <wuhaotsh@google.com> wrote:
>
> NPCM8XX has a different set of global control registers than 7XX.
> This patch supports that.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviwed-by: Titus Rwantare <titusr@google.com>
> ---


> diff --git a/hw/misc/npcm7xx_gcr.c b/hw/misc/npcm7xx_gcr.c
> deleted file mode 100644
> index eace9e1967..0000000000
> --- a/hw/misc/npcm7xx_gcr.c
> +++ /dev/null
> @@ -1,269 +0,0 @@


> diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
> new file mode 100644
> index 0000000000..2349949599
> --- /dev/null
> +++ b/hw/misc/npcm_gcr.c
> @@ -0,0 +1,413 @@

I'm not reviewing a patch that implements this as "delete 250
lines of the old file and add 400 lines of new file" when
they're clearly very similar. Please split this up in a way
that makes the changes visible and reviewable (probably this
is one patch doing "rename file" and then one or more patches
making the code less 7xx specific and then a patch adding
the 8xx type).

thanks
-- PMM

