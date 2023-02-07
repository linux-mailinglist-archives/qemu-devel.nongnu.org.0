Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5880668DEFA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:32:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRp7-0007Ok-29; Tue, 07 Feb 2023 12:32:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRoe-0007Mu-Kn
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:31:51 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRob-0002qK-Rk
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:31:35 -0500
Received: by mail-pf1-x42f.google.com with SMTP id 16so1545647pfo.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 09:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WQgXI9DojbfH3tijTh48ESjl/pq2kv0Z/aVqoHJC/eo=;
 b=fWQ6VndeDOZGXItu6MDR3stxgfqeIJlRWVsGKkA20Z6+Kt8RrOy8Gx9ehxSQPcvtO+
 WmPdh/ajQ/iIEFsCrrugIa6k2YPS2wipstxzBvqun1x0WvrVkSUg64u+HOvGuhyh2JKM
 sV24cfEJlv20V/72FNPOJLXw6AIZgn3bzwEvdgVo7+35t7ayDwYIvwIEyUJlUWJRuVSs
 KMVjIrml5q5NGuR9ETmxbVkE1exFdXZnMizY/lmR+W0YEs2H0pFgxzN+KLYEYCMUMFCZ
 31nFMN99Ic43EL4BvKD07TvyNY98vVQ8RuyvlJfTX1cVW3EwqLOHPupn/688/A1q4T/p
 4EUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WQgXI9DojbfH3tijTh48ESjl/pq2kv0Z/aVqoHJC/eo=;
 b=xQxTJr2qXmaHsMn3Q9FFsDo1hQzyaGxILeBiK423AitEKfhi5DFa02XFHfhzm76Ovv
 N7hjhyic56NmTnLPSczD011fYlW8LFAatcAGzbFujS3JcKxXaY/lcsF2t4qdWP1xqB0Z
 LOblHp2B4tTYUa6On+hdwN3pECuzEfAatpRyVd8L/lmSl99gt+ZJUYu9+/aXGjExO0p6
 95qDU22zRqAj2ULu4XVHyepXspIpufS/yU6zrDONxpr9vVE8c9xEckiI7kTf7Rm+EXP4
 Gks7Svgibp0cclwewqTjn9Y2z+639eC2aNXncT2DZWQtszcT8PowQImep7cV/Il/TSk8
 0ZQg==
X-Gm-Message-State: AO0yUKWf/TU5+DdngoZ4EMq9v8j2CtFaIneIRzQsUp6Jo8GEgcjhziyx
 zLpxUznAM/sUQijmj01T1R0N+RKtUNemA9zKyxWDYQ==
X-Google-Smtp-Source: AK7set97wnZlA0tJUYXGkoRouXnUZj4GGOhR8ZH7icG5tAwOLEbkW+jDHE5iprufsfPfnhPFTowaRhXjiRnqI0fXV3s=
X-Received: by 2002:aa7:9a48:0:b0:58d:ce70:4683 with SMTP id
 x8-20020aa79a48000000b0058dce704683mr934834pfj.39.1675791091310; Tue, 07 Feb
 2023 09:31:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675193329.git.balaton@eik.bme.hu>
 <150f19f5299dd2c2261fd189f1d477ee9c0690a2.1675193329.git.balaton@eik.bme.hu>
In-Reply-To: <150f19f5299dd2c2261fd189f1d477ee9c0690a2.1675193329.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 17:31:20 +0000
Message-ID: <CAFEAcA9kOdSr6dWqRhN3E1LmHQiPpN+Nqc1rp6Koj7xABZD3Hw@mail.gmail.com>
Subject: Re: [PATCH 3/6] usb/ohci: Code style fix missing braces and extra
 parenthesis
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Howard Spoelstra <hsp.cat7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
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

On Tue, 31 Jan 2023 at 19:38, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/usb/hcd-ohci.c | 106 ++++++++++++++++++++++++++--------------------
>  1 file changed, 60 insertions(+), 46 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

