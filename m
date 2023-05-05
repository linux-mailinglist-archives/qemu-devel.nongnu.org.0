Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E9B6F8002
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 11:30:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1purke-0006X9-JL; Fri, 05 May 2023 05:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purkc-0006W5-E5
 for qemu-devel@nongnu.org; Fri, 05 May 2023 05:29:18 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purkZ-0007T3-Lq
 for qemu-devel@nongnu.org; Fri, 05 May 2023 05:29:18 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bc4b88998so2615217a12.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 02:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683278955; x=1685870955;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y2gGeqvfK9F8Jd3DrHbnl2FNriX0MKsW9BqFzfFd0Ww=;
 b=pcFOf46VUTqNQ5u7sIZEvYzovBmd73vjId1ekEyum0lQxU66RNyuynzQQPA4kFJJeq
 XVwrIs1NXJl5TiD4G86uTJPex31+109Mtv3g2YwETLebbvDEsbMla8pcrtyH100cOgdT
 z6ZFI0JuOZe5HraJ4pyYfPaNba8+XGxP2HxmcKSXxSYVGMTtib55cbfHUZW/STLy11Qf
 uXWQROZQsD/IrReNYI4me+Q/G0CVmtgvJb0vct0LIueRHhxCewzZL4jwGd/lY4/QSAR4
 S7vsk0TIUVz4mDVRzyRXFpgNKNi6j6XKu+PgL7dDnuowXH/Ad/o7lc5Lx1ItPOPhLLif
 Gl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683278955; x=1685870955;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y2gGeqvfK9F8Jd3DrHbnl2FNriX0MKsW9BqFzfFd0Ww=;
 b=at1P8QKU+tiCj7wqgRDWc0FVdBAQoqzYzjs7GJoMpXZ+4KctUziwxVpagdTxb8n5G5
 mbpTvpzMWhDHI/8IPmeUTPMKiLwBLdJm4yrGiWp5n94kIb6m75EXz7rh+SCUCbdsaaeX
 s47Mrod2+Oa/om0vC4tiX4Csgjy3OABOVYlvPMqqfNsQKKd70xGFi9cmxjOlc8AaJxCS
 n/7wS/rASnkFuq/sXil0HRj9iEt3KMtCdoPYnkWa3qFg679W9Jz7v/Z+zVsvrf+N58hB
 OUApm/KtyZijnnJ0ue3XztFsQgD0/hISN1mwOP8pFglm/aIIz9X0mJYrxbm5UMSEs0ZZ
 JftQ==
X-Gm-Message-State: AC+VfDzoQCXMWKl6dgG43evsT6y2W2ZWdUHPBFadF7zYsrZ8mDUotJBj
 OY1pxCUZ0QT5TflvvohqHlUPISs9dGxOQ0DCiPg2Xw==
X-Google-Smtp-Source: ACHHUZ6+y4l6QNfmUGyJNRcBYb9MiNQz66pVG3EAb79InSVed7rj06fLBaDTmu9hMN1kdPcszX2T2oHTtughLAMrD8o=
X-Received: by 2002:aa7:ce18:0:b0:50b:febd:3cde with SMTP id
 d24-20020aa7ce18000000b0050bfebd3cdemr637811edv.42.1683278954904; Fri, 05 May
 2023 02:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-9-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 10:29:04 +0100
Message-ID: <CAFEAcA_JyABKoiywXpM1qOss-bcAfO1185TBa4CwNtxkKuQGqg@mail.gmail.com>
Subject: Re: [PATCH v4 08/57] target/loongarch: Do not include tcg-ldst.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 08:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This header is supposed to be private to tcg and in fact
> does not need to be included here at all.
>
> Reviewed-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

