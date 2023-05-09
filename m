Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57BE6FC7A3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 15:15:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwNB2-0003w9-Q3; Tue, 09 May 2023 09:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwNB0-0003va-OA
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:14:46 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwNAz-00065Q-1G
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:14:46 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bc1612940so10983960a12.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 06:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683638083; x=1686230083;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lJTLn0PX+cLxPGBhHyz4EBgRSKfqtlwrLA/4WgJIkbY=;
 b=pr/fsjyzJR1beTDHMfKzBJIZKu37xxJfg5Pf+GV2J4Hs3fMpKB/QsilvHkqDA5W5A3
 u1ezd7G8w0HZOScGu63xI3eyzbcu3IKI0HsV1KVaxT9iEJb/uhtJTzvVm7bByEaCZxZc
 I6OOl8hAQOg006ljyNZ67pTmjaqTl4V2c+VoCRuvOOucUCMBhoZ3HYkCmn8aujIPfIUj
 +uW2e9fRWVWohIZK6TXTlmi/T/pHm58kv1vf52qaDW19fhNM1VGy+jpP9DbevbINVd4z
 xAcqDfnrTUGYuHkvhWZGyI+dQ452NP+mDyfcuPNJ1eiQj9dWC3L5e67dQ71lOe8CP0Rb
 57aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683638083; x=1686230083;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lJTLn0PX+cLxPGBhHyz4EBgRSKfqtlwrLA/4WgJIkbY=;
 b=N9PmGG2STzU5I+jaR5xGwqm09SX9w1u3b2jT0tpyzHLViPnwZEjfYFl6xetk9rBqMa
 UT9SqLR6cbmROC0xr/PU4XCGZdy0Ugn2SFH9Ht71Czur5zdj0Z2QhF6nMo7v+pb9KHFh
 883Mi2pZET9FQMbXUkMCQCZkxXXAM/TPd8KHUhmmYLnodvf/efrm55DDpIjUgihpAc9U
 aq/+wDWbAs7Ziu2WZX37wq/ioOxUMsrUuPwDo3gcO+GguGoJfvEexGqwEGGZYFZDeqNx
 /o46fnnUOnpm4NfhSQ66R+pcEmPEeriYBWcrqY58MofCbpuk+mlLgoDKXdxsCeJx7gTV
 7aDQ==
X-Gm-Message-State: AC+VfDzG5ljO6wTmV6MxMSLQQ+zXAjLj3P1CojPihqpX75+jP++vr+dM
 SXtguDdmojlKgOtXxq5uf3D75OjNUspjHr3L5sHVDg==
X-Google-Smtp-Source: ACHHUZ7+uGGCktZtQ8EQaCRrE13AWDYzNtuqhS87Pie2etj2ZrYBu/Re11d1jvS0//uLN+6CyPRz17i21bmNlNvMG8w=
X-Received: by 2002:a17:906:fe44:b0:969:faf3:7dba with SMTP id
 wz4-20020a170906fe4400b00969faf37dbamr1246689ejb.52.1683638083200; Tue, 09
 May 2023 06:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230505204049.352469-1-richard.henderson@linaro.org>
In-Reply-To: <20230505204049.352469-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 14:14:32 +0100
Message-ID: <CAFEAcA8+R1B3kDTU+5xiigAVA9QYVEeHxv+1F6MDEsvT+=0zig@mail.gmail.com>
Subject: Re: [PATCH] accel/tcg: Fix atomic_mmu_lookup for reads
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
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

On Fri, 5 May 2023 at 21:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> A copy-paste bug had us looking at the victim cache for writes.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> To be inserted before patch 3 in
>
> https://lore.kernel.org/qemu-devel/45cba357-ba20-399a-27e6-5e99741179d0@linaro.org/T/#m5dc55cf04d564f4a8f97bc95e7f0e427c24a4f0b
>
> r~

Should we cc qemu-stable on this one?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

