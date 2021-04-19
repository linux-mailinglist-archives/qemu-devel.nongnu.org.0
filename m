Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC5F3648C8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:10:35 +0200 (CEST)
Received: from localhost ([::1]:54974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXPu-0001DT-Nv
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXKn-0004He-ST
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:05:18 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:42984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXKg-0004Yx-L2
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:05:16 -0400
Received: by mail-ed1-x52b.google.com with SMTP id d21so21527301edv.9
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aVPhSohj13RY2ubCrOD/7pMisW0+KCkn1s2cajpB/nM=;
 b=vIYeRV6kEXq9w6IWOZwsRJyyspPG/KQBgJSqDvOH7t2VCiHYqk8swLR16q5q0zDMAG
 2GoWg25zv4TSseURbheeVsQxmClhj5uF9mVKquAAv79OUSZiEIGuOu7kd9xdEtEoNmLF
 jerdVJqn9L8n4B6SCa1PjQkZ526MrmLSKNH093cgnsM90jdDtf8Raprgx70YEbyz5J4h
 rD5sLGta7MB2VQoj3cMtfW4CVzuS6jNwrUaAOcmbRL6z/XFVbikHgMTD3+XArKSvQyMF
 ctpRBCg1gN6csWRNsfg2A3820D1E7gUES9XS0oT2hNU7GA+lzgvUIItj0/AG08xI3dWy
 XquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aVPhSohj13RY2ubCrOD/7pMisW0+KCkn1s2cajpB/nM=;
 b=GUxmMdrqeD7D8dgWYiMk+RUKtsUgk3gtlQm32LvkF53SkrpOVZ3blw8qnv5pTNV/JZ
 cUvuF2J+4iDyWskfJn0OJDy+wiDHiFEocLFXS8PYj0LyD/cToTpjUjiIEAm1n0+JDqud
 40CXuLuc1rf6wkV29eZp+fous9lSzYh+jZc8OUbMF6xYMH3KpgBSDEfQV2VkT02ktGNL
 AjTsy/bfBOWFGVa3omXZVcEzGxlTQ54oHxTv9u21XmlsAOQCSolTARdOvAOmtU65VzG8
 wFEMWVtTUW/urVoTyfc3zbSiXHRSPQDZ8YX8I28eMC75EKRU841PPnop+sqCJPbyqr9F
 zVUQ==
X-Gm-Message-State: AOAM5333uCyCuqQX74fi4FPjOHBw/kUduo67EWZhIp7w+j/vdKYbhI3B
 j7HYc2Ozh4UJDRFTUzF3wZB+f1mWFGZKzbYvtiRIBA==
X-Google-Smtp-Source: ABdhPJyTSrBt+dW4ee1hqSvkFjsRKatEtiaiaGmFKhHUXqvonbTrV1iLt1AhaBMzGaWydU/dEuZ5b072OiLW3SY4M+w=
X-Received: by 2002:a50:fb0a:: with SMTP id d10mr13919146edq.146.1618851909255; 
 Mon, 19 Apr 2021 10:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-4-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:04:17 +0100
Message-ID: <CAFEAcA89=Xi79OTXGHkbR2S+v_PpSiKst=9xcbmWLyQ-+5A7Yg@mail.gmail.com>
Subject: Re: [PATCH v4 03/30] target/arm: Rename TBFLAG_ANY, PSTATE_SS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Apr 2021 at 20:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We're about to rearrange the macro expansion surrounding tbflags,
> and this field name will be expanded using the bit definition of
> the same name, resulting in a token pasting error.
>
> So PSTATE_SS -> PSTATE__SS in the uses, and document it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 2 +-
>  target/arm/helper.c        | 4 ++--
>  target/arm/translate-a64.c | 2 +-
>  target/arm/translate.c     | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

