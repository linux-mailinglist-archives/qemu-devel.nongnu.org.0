Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD01A54529F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:06:35 +0200 (CEST)
Received: from localhost ([::1]:56992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLc8-0001oS-VE
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKVG-0006GF-IC
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:55:24 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:43978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKVE-0005z5-3i
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:55:22 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id l204so42466175ybf.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ikKQqkTslRfmByz3MtPoB4To+8mOQUUDaCK1YKpd4FY=;
 b=AedQ5FbNTjp3pRJkkqBJtlcKCKLG9lTkEnrGEV2Smgq9ugIFolN4ewzKxTi52yS3MK
 UhP834bviNDOpXrem5+LP7fIeAyAWo/gWw2biSaQzx5l4yWbVL4UpZG8nbJuZZomdjMx
 po3+M3d2472IwIs4j5koTJWFHC+YIyoRHCFEokIRnx/vk94vObqTQ92z0fPdlHXJdhKL
 WT7IpD5UteoDyQgLBn8Hk8vzorYDRuueco0gWeJYacn4XN9ytLJfrdAsNE2E5Kmj7bpU
 E+jp5uwavtuw5SJutA3znpNsJVjpT9MFZCeMt4GoBY/mRsu3HhWRAHRICTYS+WXXET2y
 f8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ikKQqkTslRfmByz3MtPoB4To+8mOQUUDaCK1YKpd4FY=;
 b=f3n2ghyJzekdFKwNrzjKYzHWwzohfRdyGTTKfia2B0fEvW9SAo5GERJUb/lh7/EYfb
 IT5lQnnFtOrOixUwAgcrZE09NoMX+MxPxfDLHsY7gksfX7VX7QCJZlGFi8nwbOHbN6Eh
 5wPHIE29UH56ChrTw4nr2P3JIon+2Z43KM0ZJFQyfzkfk4ePGPt1Dyk/rrpUubc/KbKT
 icGQxLZNXcThrVS5PFdVHFiiSam/TA07MAT/EOS8+WWmKuE54JO3kqKQl/iXEywxtvOG
 evZc8+aW+yYanfohrFwdgpIU0anNhdYTeHk9mPwdIGwi04vnM7Vzu8Ydq9eIjwRdhAC6
 rP5A==
X-Gm-Message-State: AOAM531l80LUgcwEXDlHJhrpoB+yV1pYo2tZvy7XOFxs9UKNv3DEREw/
 kC8vsu46iP7m6qkCESUJYBNbO57L1vtGOjUR40/ysg==
X-Google-Smtp-Source: ABdhPJy2Wjl5Hlvn/uKKEebEJoXOQ/kVDGrxH+GIXFuvuDpjY9aPkYGQMTnDr3ixGnvDC5RCDeTBM+ggL+7pYh8GT9w=
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr38582891ybb.140.1654790119034; Thu, 09
 Jun 2022 08:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-3-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:55:08 +0100
Message-ID: <CAFEAcA9xy76OvwECNcxn38CP+sXu7=Q=NC=TVMNyEZmPpSCTTg@mail.gmail.com>
Subject: Re: [PATCH v2 02/25] target/arm: Add coproc parameter to
 syn_fp_access_trap
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Tue, 7 Jun 2022 at 03:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With ARMv8, this field is always RES0.
> With ARMv7, targeting EL2 and TA=0, it is always 0xA.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

