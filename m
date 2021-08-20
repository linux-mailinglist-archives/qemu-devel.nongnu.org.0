Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750683F2934
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 11:32:26 +0200 (CEST)
Received: from localhost ([::1]:48346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH0sz-0008IS-0r
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 05:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0rN-0007PD-V9
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 05:30:45 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:42662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0rM-0004yx-EA
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 05:30:45 -0400
Received: by mail-ed1-x531.google.com with SMTP id bo19so13033736edb.9
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 02:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LgjudgAGewSEWQTx1KnXh/IIg1LLSqi3dNFjPXcoTM0=;
 b=GRngY1pTODIc7gFxy1ZpbLHGnpLR+M7OvErKnbiXoDakaI9i4lcaqiO5dEnxInpYgH
 VsyPmYAgVc3WphlslvJrZccSuu9T+g4xNhSSeMEa6v43SY+BCjx2RdP1iUl2OM6hbn3/
 9J76xaf82YJ2Zc+PWzwfB0/BxDnMrja6YiCqa2spVHMSriS0XJJ0MFEwQweXLaJAFMMD
 8vwv1MT0HY3dtiByEIXsfOJ00DEG86Yt3VX6ExopRlq8OCH55deZ66ZTP8NgzFx1wUfP
 AQ/PF9SLN0hPjeXFeu1d/6+EWbIE05N8EHp3/aZgy48QQPG9sk23wcmPCn15Fui1z6zd
 BZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LgjudgAGewSEWQTx1KnXh/IIg1LLSqi3dNFjPXcoTM0=;
 b=H+ll8l4B4ERciLOphPq0SQfmrT0PaBEr6919d/2kRRJ08x2Lf9NYjulaoTVTftYYcA
 Bix0pHyQ4/7CCC+W5LY/DzefuAwZcXkHVLdN8Kg3J6hx3Xzz35VEJ77XzMM3Yuyn3nfR
 zq41jsErCi9l7x1QI8lVj5PxrpjfGrGNT0O+lm0lepQWL0/I7ZLCRBahriT8rTfVuxif
 u+S5FP7VftC5JqYk6qeB6NHDvd8Tv/wuSwfPJyfVYN6vTen2klsP5XVOFJqM5Kb+NZ/G
 KMkSF2IkTeXPe69JtsplXumjWqtRkqYh2FRTzBqUWpvJE+xaMmUvWtl7MacFypNVRYLN
 ZvFg==
X-Gm-Message-State: AOAM531x+imzKdIYDy5TdbBg9W2Nafj7G64dZqbiJ5PzU5ufu6J/IMo3
 bojCfynHgc9Ut+f2C8BVPt/nBoqiSzDGrczPPmFCQg==
X-Google-Smtp-Source: ABdhPJyyoFMZqYIpYYLBRxmKCMpRHTiI2xyRiBnGZKoj24D8RP+5qTdQomMITBAZS6UfY8YDRhKHwbv4gJ2H6cJqNFw=
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr21213985edb.52.1629451842187; 
 Fri, 20 Aug 2021 02:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-54-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-54-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 10:29:56 +0100
Message-ID: <CAFEAcA-kU_P+zKieWGznVfio7-3h-8Mzv2nQw0jhk+=ZYtjaTw@mail.gmail.com>
Subject: Re: [PATCH v3 53/66] target/alpha: Reorg integer memory operations
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 21:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass in the MemOp instead of a callback.
> Drop the fp argument; add a locked argument.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/alpha/translate.c | 104 +++++++++++++++------------------------
>  1 file changed, 40 insertions(+), 64 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(One of those patches where diff has made an incomprehensible mess
of the change and it's easier to look separately at the "before"
and "after" files, at least for the first half of the patch...)

thanks
-- PMM

