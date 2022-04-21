Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF68509E54
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:13:48 +0200 (CEST)
Received: from localhost ([::1]:47864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUkt-0003wE-92
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUV0-00029s-Ew
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:57:22 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:43322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUUy-0007MI-U7
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:57:22 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2ec42eae76bso47704487b3.10
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 03:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U8Awzqlv1FfNretMZ6KpeVs2UOw1mEk5H2Fea9GI9pQ=;
 b=i5TMhyFXc3mXXVi4vD9ahuied72U2E2THbOYk82eLPvmxwtuDyFUdVih6hqK8iTIXO
 xFZf8Xmg99FB45kii1k9krwtfA6mV/Hj47dQTayHMgNz0rBdts8TnJQNlv9zvWaoQCVu
 GX4Fk+6JUVAhnkX/lXcBn4qwhaOxqeh5BZDlPjs+cqKKfG9+SGjFD0CSL0k4LIoooVkD
 2dsjdsuuuTDYeByXaB4yj9Y0N1nhssDdv8mWeeVaT8zs1DhCCHLd4GLERQ5ban471Onh
 /EyBFRac0cxSgDKyQiDaCRL0/tCu8iOpe+01EDC2OxYJpUZASS5ibYfQwpLAf3B/Z3Ts
 3zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U8Awzqlv1FfNretMZ6KpeVs2UOw1mEk5H2Fea9GI9pQ=;
 b=IJM54cGLv8iRtWomO5H0wZz6Sy3oqkORiq6tr3jyLj2/E61364i5Jtk2Ug4NVIm+Oa
 2gLwH9cXOU34h1UdoT/QlYrs4of0fSN3eesJWtd3zS56DPukz8R6wYRk2SUIoDsxHypj
 lIRW+b3douz8X9Mm8aWwaJLAsFLgSNq/bqfSBeRVNgI1nIWO7DXxy1BbJTZmsw1N1m9C
 ydcB428tykwe1U0vyVsmF5tOe5OgvKOXfkgZDib60P+cy6va6ZGi5PXqX/iQQ2eipvZg
 tR5tQpLzPXJA0Jq/d56eDGdP/TH8fdZCfWdzlSbXF0+ascprO4qetgHjX4Sk+osDAJcD
 TC8g==
X-Gm-Message-State: AOAM5324F52b478wwI5x+ah4RY5DuVAwzyiOkurHNkb2ZXALPpUrjgFX
 AGKtNyBa+jB6wlYhO94ZHCTLZIVvveURJGyfhttLHA==
X-Google-Smtp-Source: ABdhPJwA/ZwquGSRj420iiRajVdom1WsP5q0hdBss7+w+h13E9Ey/i+LVkZwlr4q4BUGuykcOtxkb9ytrOywtaqy2nI=
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr25231404ywt.10.1650538639456; Thu, 21
 Apr 2022 03:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <20220405223640.2595730-6-wuhaotsh@google.com>
In-Reply-To: <20220405223640.2595730-6-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 11:57:08 +0100
Message-ID: <CAFEAcA_1v0yAscm-6gOjBkCYjOKv53f3-A0-RgVjQ4O2rwrHjg@mail.gmail.com>
Subject: Re: [PATCH for-7.1 05/11] hw/misc: Store DRAM size in NPCM8XX GCR
 Module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
> NPCM8XX boot block stores the DRAM size in SCRPAD_B register in GCR
> module. Since we don't simulate a detailed memory controller, we
> need to store this information directly similar to the NPCM7XX's
> INCTR3 register.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviwed-by: Titus Rwantare <titusr@google.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

