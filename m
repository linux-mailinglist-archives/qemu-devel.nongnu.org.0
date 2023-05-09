Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3F36FC73E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:58:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwMuZ-0001DX-Bx; Tue, 09 May 2023 08:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwMuX-0001Cq-Fw
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:57:45 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwMuV-000289-QO
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:57:45 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50b9ef67f35so10610757a12.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 05:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683637062; x=1686229062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DdkgmnSHaeTsxvAVe1eOiLRyYIM/6lU4T+nKMkU1rfM=;
 b=e92IWx+azXcaXYjPho+p5L4quBSKq+aEqmSLTnBEjXGmF/tmb7J8uZnxYYToR9/oHX
 37LCi5/gbcVVu7HQYX3MtlczxANMA552RemT9rCP3XvyfEk8TlIJidkD32EokPUGJcpE
 DHZkbugAM23L6nz23bsUBhNepcWYPA5tL811euA6JUe005JjBfpdEhy0elN0fdE+JOWQ
 +oT6+qwm8QwD4ptSryNtYp/5NYsN1VeAtr6WpX3azt6lAybnagHH1zbSwnBaZiCkOvU7
 ejr2vx7WsaS2LrfL1CXBJwFxam1r3Y/2IvdwZc+MtA19ybH3pubcaWHLUDn3IrI4Rc5u
 sm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683637062; x=1686229062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DdkgmnSHaeTsxvAVe1eOiLRyYIM/6lU4T+nKMkU1rfM=;
 b=ROtf0909PlIBejAptLf/KamODL11O7q2s1t0z+PRt1MRCaOP0vMKH7p6Xu5nc7yj0K
 bXLU4uPOsQoA0vGn2n2nZS15bpIBYlLW3pQtVfkAbIcZWfX3MWdnFJGE2rYrt2u95D2V
 bC7vhfBm8kEKHqbSeJB3XT+1KgraTQEhz9+4Kg4U883AqUv8JEl/TX/14d2Pth3N9VKU
 M6ltHwasiJjiTaF7PyHcDhKJzOeZHqT7uY7YJ5p/CAM6M1bh1TYsevNJB8J4lXave6s/
 /4hRWcoC8px0jQYIclxPQXKKnGhwshaUcfWZpyPkw26vh8SbkgICbLGM/nIWlzEPUN9F
 YPsQ==
X-Gm-Message-State: AC+VfDxifuRWPZOi+7rpVm5oNb7c9Osin/uvCOR16aWkKH3I5NpFp4wt
 b8s7UOeFAoCZVKMqNSLZVTfAHmGiHvJpIfIjcOYzFw==
X-Google-Smtp-Source: ACHHUZ44pexwkpnlbSISfo3URvVYR0+qStrHkGtI/hD+spvMRojFiTjZEo6ePCZ4Ma2RcqfZ1cdzDOHiy9r8qToQjuY=
X-Received: by 2002:aa7:d7d4:0:b0:50b:dcf6:8e6d with SMTP id
 e20-20020aa7d7d4000000b0050bdcf68e6dmr11437829eds.18.1683637062028; Tue, 09
 May 2023 05:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230504110412.1892411-1-richard.henderson@linaro.org>
In-Reply-To: <20230504110412.1892411-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 13:57:31 +0100
Message-ID: <CAFEAcA_+wv+K-_uB8kdjiJtbjT1fYF1OZcDMqvR_u9QqnidJng@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Move more files to tcg/
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Thu, 4 May 2023 at 12:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move 7 files to tcg/.
>
> r~
>
>
> Richard Henderson (2):
>   target/arm: Move translate-a32.h, arm_ldst.h, sve_ldst_internal.h to
>     tcg/
>   target/arm: Move helper-{a64,mve,sme,sve}.h to tcg/
>



Applied to target-arm.next, thanks.

-- PMM

