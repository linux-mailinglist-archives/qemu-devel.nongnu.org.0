Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C103A6F8353
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:55:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuwy-00053N-5f; Fri, 05 May 2023 08:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuwv-00052R-K8
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:54:13 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuwt-000597-GP
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:54:12 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bc37e1525so3304264a12.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683291249; x=1685883249;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gIaB6wxaHA8JX27HckklAFPn5k8+MPI9gGbFFNuzkfo=;
 b=ALsoxFt8FoBKtvQ+ysp7go2iTs5HqNxBNsQd7SrhDCqCPdrRTUsaS2/BxT38BLygrs
 XMVYH8AstKJwtTNyLd8DXrloaC+mqUlfGYvKvwM8ON6PkNwvjkt56jtt64hdzAyOqHy2
 LwRmdo9yq6j1rTYkeF/oiIkNeLmBPE1AyKv4HL6JG6YHkmV5u6oSePsew3hVIdRSCA6W
 s+xbJ0DYB/vHvjsoZ14S7kFYdVjJIGj6HwKItFMGvitnosEvKZw01TVV3aCt9CmnyD8s
 ZwlOVpZOQRvJh6gZiZ/maISPksHSjI/EtVpGfBcIzQ0JcO5yHN+6px3PzaCTvQCbqBuX
 t/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683291249; x=1685883249;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gIaB6wxaHA8JX27HckklAFPn5k8+MPI9gGbFFNuzkfo=;
 b=bhQWVuyYuh5D9A7+tQ8IRU45XoqpG/hes+m8WVJkdBNSm7jkxgI6xQ3vrcSSYwSBnX
 WUSuo0XY9evWoOm6Cm4oCqSKeWML2ZmRy77tRUzj5EazaG/E3/NOBYaJC/bbh7HqHviy
 ZZDU30ke+i30ef2Bt5BqksYXWs/Vcfkca8wuK8HDVkr/6WOPP/AlB8ZxjxR0rAVDKih/
 Tntbg8vpXvE3Kr+CgayVZV8LKtnUu/GWvxKKjjYft35Md/K8mREP53EuFAt0Vop5BzRp
 r/rXckGfqwkVDmAhVkaKPHxXmBG2SqUTWazQUNe4hv2XUPQl/vGwEb1puX02LxjgkGe9
 jGLA==
X-Gm-Message-State: AC+VfDzBcjtnCYIb/Ovk9Rv/n4zdCgqBBSrKQoOKPOeCa0o3E2LZo6sB
 IQey+nZpF5FXKweVBMB7CVQ1dAMjRAhsNORKCqvIbg==
X-Google-Smtp-Source: ACHHUZ46J6X4PgQpkAgNX/6du05GIQ2727ddfU09NQhmS69Olk3kB/WuiSJqqJCfFmaE6HRWOhLz6Vem23Of036uEio=
X-Received: by 2002:aa7:dd0f:0:b0:50c:4b1:8912 with SMTP id
 i15-20020aa7dd0f000000b0050c04b18912mr1286060edv.15.1683291248738; Fri, 05
 May 2023 05:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-42-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:53:58 +0100
Message-ID: <CAFEAcA8PfOFt6+VfanS+hAhtugSmXo+V8KQd=z-P8vKFN8WZgg@mail.gmail.com>
Subject: Re: [PATCH v4 41/57] tcg: Support TCG_TYPE_I128 in tcg_out_{ld,
 st}_helper_{args, ret}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

