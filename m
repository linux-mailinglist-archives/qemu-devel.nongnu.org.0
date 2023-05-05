Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119CF6F83A5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 15:16:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puvHa-0004co-QD; Fri, 05 May 2023 09:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvHX-0004Yl-KQ
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:15:31 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvHV-0005Pm-W5
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:15:31 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bceaf07b8so3358306a12.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292527; x=1685884527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UJfpiI/BusVIoGn22BVs1aP0RIeUKUfatkmR/TQCDxw=;
 b=vKMG8Q3RdXfgKfEJw1opUK9Oa2+2gv6MxQ/ZVAKbfMW40Z7riFuKFev+D3GH/GjJfp
 NP6n9j3vX16W5w+uxnbuv4G8jxOkuQcXHjZlhrJAtU0e9oCQXkQsuvJOBCnWqwNuHvLh
 F9C5YeRirypXubGtLiB1vz6IMGPVpD89G17HqEReXtg/XmBNAJdQLSGSvbmKFA071wD8
 djiZ3sztKubkardC5LMgUwT+/XdXL8ULkb/hjNMXdmTDCb5nk7IO2U0CrTeGnov8/qT2
 JPCiGcZTavAWFpyNGeBSgaoGudLuVCq1iouvvc69O1r9z8yRvlxItX07S1rfwsa8AC3H
 Nj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292527; x=1685884527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UJfpiI/BusVIoGn22BVs1aP0RIeUKUfatkmR/TQCDxw=;
 b=FpSl0+a2d5QqjQvr+Rp8bHUKYpIeGy2jL6HkBVkrW6p3xOekLPB/kZC16MkYvp8YoH
 iY/GLbxJYqMjE4WyAqlmJj4YFae1whp+IuVPtk/UTweforxIYEHAkngPAVlxvFLuXZCm
 z2xUjXP3h7o5559oJObZuTc4Oraiaob74Ek6LvbCAyVewLRMdcAukTJxfV4MH4h1pCxK
 WYDoqP0009mOfxmqeYbvZAYKWLBI4vX/C2uzDXhjXcXiG2zAMiPE/rktCIhVEqn94wXG
 ikSmdR/1sbpWk2HJJYERvFWe82bEZhJ6dut8SaAQdg7+uoZcMpO7XqcDRBHfHVmufV8C
 NrZg==
X-Gm-Message-State: AC+VfDw5Y2w+gJn0ZhPCCS+gAtxu+tqibS5F5dtVzZfAYBz46nT75c2O
 +JHR+19yYZOv5CETauKscnppbgn0gCBcvQ6mDhazVw==
X-Google-Smtp-Source: ACHHUZ6ibs+//7vJTHSF7xMiLaFT3gaJ1fMdadKcVsuytYi/5kxw6KqDqmtsaoW4amxOak/zJCIEMywvtxBlwDCXao8=
X-Received: by 2002:a05:6402:1343:b0:50b:caf9:4b85 with SMTP id
 y3-20020a056402134300b0050bcaf94b85mr1278854edw.18.1683292527550; Fri, 05 May
 2023 06:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-45-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:15:16 +0100
Message-ID: <CAFEAcA9a8L=FgECxpdk=4N9Uu_p-Ah=s2wa5bLsEebX6oijC+g@mail.gmail.com>
Subject: Re: [PATCH v4 44/57] tcg/aarch64: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 3 May 2023 at 08:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.c.inc | 38 +++++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 18 deletions(-)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

