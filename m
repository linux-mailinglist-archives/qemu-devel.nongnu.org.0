Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F109F6F82EB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:28:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuWp-000799-3e; Fri, 05 May 2023 08:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuWn-00078t-0S
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:27:13 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuWl-0002m2-A2
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:27:12 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9659443fb56so260174666b.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683289629; x=1685881629;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IU0MO3r4uwnLNpenuOEWtLhN3N9yQXXBloyD9mOU9jk=;
 b=uR2KMBaPV8825gRuNGzmhYFr13Xb5HtXkNX3RkeWXQs7Pr0bqaSVrCxL9LO0N7lpDq
 Su7hD9vDLeIyeh0KWqrhEnlN0bovDtOPnVubJOrdoYCeHXu/hIk/WwJfRucDXJWa4RLb
 H/3W/molE/wR5ZnRWaXWAgSOANZGThvIpGhuqE5AwokDn0jFizcaliRS7lLIjAZCSSvi
 pn7aYyk+Y8T35EoCFVKHi/rwylizaT9vxPfc+N2Wrlf3cNrDmw8UoBlvnxKyOMU0HVQJ
 WkWIzdoaASgzNon8X532iUquDaqvU4wWZ+MLYDp8XoRM8cnELTeT/c8XVU3ldQycS3gE
 kjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289629; x=1685881629;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IU0MO3r4uwnLNpenuOEWtLhN3N9yQXXBloyD9mOU9jk=;
 b=YKBipULhat+FMx2hkGOcnPBmDVfVcXr8X9rZvUWcNCIpPBnHSudBhVfOUSSnMvZEAz
 HzHkIiwh1B45n+Z1GnJrpK0WzO/tW1gKQXRoGDx1GQz8xO1x7TaZfy8RME3QK7sEkEQl
 yCGf5cOyW3CMca3+tSshf8cOmNsBo0RkFN65Cz6lLVdVkB8VPacgh1idgVALxPtsX3RX
 xEXr/4HgCIBKeZwa22UvHxLmW+XJYfin4cEUvgpwNBosaZfh4gWZ+lSHyA8TaXh/BD/8
 RU4lRTcX7omouR0FLYfSfpYlgoZLdDLolEQHNJnh2THZhCorxMrTg8NvWjpcPNxfn85W
 G81Q==
X-Gm-Message-State: AC+VfDyfkAaQ9fTiP61cB3LsVrHTtyh2aA+vOjzcCglP01bilzhpy+8B
 12rq8R8m6nAq3JXv7Ors8MnQlwOpLcRXmlrOmPd7kw==
X-Google-Smtp-Source: ACHHUZ6LFPn6TbFXDqcwJ1xIkxuynmVjqExw2XoSer9jMdWtiaRduSiGjGaY4ioMc7FpIyzC/U4OfMlUPcE7zGyQWIY=
X-Received: by 2002:a17:907:724e:b0:953:9b27:8f00 with SMTP id
 ds14-20020a170907724e00b009539b278f00mr1117237ejc.74.1683289629667; Fri, 05
 May 2023 05:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-35-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:26:58 +0100
Message-ID: <CAFEAcA8bQUdLfS9HNzFwHXPFTc5TNKZOi9KfpQMdFym+xKzD7A@mail.gmail.com>
Subject: Re: [PATCH v4 34/57] tcg/sparc64: Use standard slow path for softmmu
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Wed, 3 May 2023 at 08:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Drop the target-specific trampolines for the standard slow path.
> This lets us use tcg_out_helper_{ld,st}_args, and handles the new
> atomicity bits within MemOp.
>
> At the same time, use the full load/store helpers for user-only mode.
> Drop inline unaligned access support for user-only mode, as it does
> not handle atomicity.
>
> Use TCG_REG_T[1-3] in the tlb lookup, instead of TCG_REG_O[0-2].
> This allows the constraints to be simplified.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target-con-set.h |   2 -
>  tcg/sparc64/tcg-target-con-str.h |   1 -
>  tcg/sparc64/tcg-target.h         |   1 +
>  tcg/sparc64/tcg-target.c.inc     | 610 +++++++++----------------------
>  4 files changed, 182 insertions(+), 432 deletions(-)

This is a pretty big patch, and git diff hasn't done it any
favours either. Perhaps I'll have more stamina for it in v5,
or maybe somebody else will look at it...

-- PMM

