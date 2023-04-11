Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF0B6DDB8F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 15:03:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmDe8-000215-38; Tue, 11 Apr 2023 09:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmDdx-0001zQ-6F
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 09:02:44 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmDdv-0007gK-EZ
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 09:02:40 -0400
Received: by mail-ej1-x62d.google.com with SMTP id jg21so19812244ejc.2
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681218158; x=1683810158;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hXykwCqjiLdlCUU9P9qkJ+OGA5U2MZoBCG6BgzNYwm4=;
 b=Jo4j+DUjc3vO7MvVjYFJqERFsUVq3QausR5Y1slqgpU1yvxiOGtSYyBS3qlV/DPeZt
 ZycS7Cih/SgVrM6FsI4KBegKmdfXUlFl3xTRu7RFyfitujEpBLEjR7gLNnFfa38k97vl
 tt+t0uqwLcmNO+QzmvgyxgTV//tV6CIFMNCZcOSDWo2KB2lQqtg+iUd10xkLig18iU4j
 dIEOytb2di0rqQClhiWEPpjVIjQ6Hmk+b4FrY3Y3DDpbOwVB36LcK6t59Mn4WIOnRtz2
 sGMBljLEWn9D1izm1iMu6sfVFuNqM9LrCccyN7SJqtP/zyRI2r2L6O3UzHPywsTqkFes
 ucTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681218158; x=1683810158;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hXykwCqjiLdlCUU9P9qkJ+OGA5U2MZoBCG6BgzNYwm4=;
 b=PdlMPh1Pq7fdsK2u0f0cNSznHo/hfj4FtuuaW2ihpEOt/FitMeSVzQzmzVEy16ZoIC
 sfTxCkFfojoTl7f3rD7E5lQ0vgnP7kSEzdh6DhbRX55i4x9iD/640gTqrEaxn8hywQyb
 TxuxQ7SO6WNxmxQ//gNfECv4enj/Sp5/XGnnifbc82JejfCoAE6h+doBBLFbYyUO8nM8
 xgA0AW4ouuLWTOY3tqpgWgefnbKGMm9Ns/RVt4Rz+nUZvMkH7WtnLojOwRq/I8dZdcFR
 QYG24QIe/KvzMV5ztlDPiMSWJwNTrNTNUOPBjidFEFCZgPsl1fpMntInFvGfMIuC+oSl
 4/jg==
X-Gm-Message-State: AAQBX9dEJPBL06loORjGmUkYHl7HT1GwLNkbVf1Cc2H0lx5xVhZQ+dKe
 YG7hGTxr+0DsWQ7vUGCoqCX0H38HqsViVAYJcBCbaQ==
X-Google-Smtp-Source: AKy350ac/XnagYotaO0RBpcPk/4KdHdYAATUU1Z9gkkm0Yez7bRcM1CiEyV17tLgM/iPV17i3v6F1AMuZXjOWm5Io+8=
X-Received: by 2002:a17:906:2a48:b0:920:da8c:f7b0 with SMTP id
 k8-20020a1709062a4800b00920da8cf7b0mr5465613eje.6.1681218157913; Tue, 11 Apr
 2023 06:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230404074506.112615-1-jiangfeng@kylinos.cn>
In-Reply-To: <20230404074506.112615-1-jiangfeng@kylinos.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 14:02:26 +0100
Message-ID: <CAFEAcA_VP-Y2x9efKW8atddUL64D03eSE8A7h3hk8N7s9spMhg@mail.gmail.com>
Subject: Re: [PATCH] exynos: Fix out-of-bounds access in exynos4210_gcomp_find
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: i.mitsyanko@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Tue, 4 Apr 2023 at 08:45, Feng Jiang <jiangfeng@kylinos.cn> wrote:
>
> When 'res' equals -1, the array 's->g_timer.reg.comp[]' is accessed
> out of bounds.
>
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> ---
>  hw/timer/exynos4210_mct.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Only happens if you change the source code to enable the debug
printfs though, which isn't the default. I'll tweak the
commit message to make that clearer.

Applied to target-arm.next for 8.1, thanks.

-- PMM

