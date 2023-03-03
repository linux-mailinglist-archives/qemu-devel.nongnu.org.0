Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E036A9C0D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:47:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8Y7-0002BC-M2; Fri, 03 Mar 2023 11:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8Y4-0001qg-JE
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:46:24 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8Y3-0001Ww-04
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:46:24 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so2838218pjz.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677861981;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sgIMx4JSD5f56bgofErAUur/x1goi7NUTJO95TXtuTo=;
 b=eC9QbTw32CtXpMZw7MxBxjmssW7FVnQ9heJnGwoOomdEjvf/3NjydaugOnklZKp/W5
 JD6sFTI5jJA2GMrJCDnWpFtIm5hy4/51A6I6OzHDGhPheqbNpVD0XPIAw/4BHVABzhWh
 AfxgTm8ubChxep3FGGO+Yx4Rx0Fb+GppDEFGC43ylSvNfulrIJl6uQy1lf8agBcuQq5e
 SYaarellQPDoCLL09XH3iOUaqpn0iiqHkyjjx0GUR6YAewt5C4med0E7stH3eFHL+DlM
 h01Pv9fPgpWGprba2H/3oxNTVobFfMIptWojJJhNgSG4jKI5NVXSDKzqAI78jhQ9IIjj
 WjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677861981;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sgIMx4JSD5f56bgofErAUur/x1goi7NUTJO95TXtuTo=;
 b=pmPDKPRf9pviaDH3BLiRB6lNa2Wh8fnv6M88ZGusaj4Mlk0E8qbxzGajyCrb9/LgoB
 sqbA5nLjWGDJzFoWTp4dgzB2JiaT+eTu7K55BQRfVsTLjlZgQC5TA5DGcMBYxpoqWMLd
 xYT0EjDq10+Xr7oqJCo9AGXR207+bgpvRU0CoRXYyMMiFqEFZD/UxIusqHhyN+2PwE/9
 raiDeDuBCP7zkOHnr/1cqSrn1Q8vC/AND/Xq5zXRNzqy09xVBYdDCxX3EeUOgOyDO0MK
 BZX+5o7x7BQCkCrHUY9Q7NyDxxEM0l4dE8ZstcuYO53SLiFJ3dMVjydv3tAoYMf8fywx
 catQ==
X-Gm-Message-State: AO0yUKWLaT+HTV8Ewpzv09XCP6ma8lcHcIrPShlAK9nv81pMBKe1A/Pr
 nomsTdn23Fx5KFqbHICZ5QGvLe5rgXMfvxZMmfPmwQ==
X-Google-Smtp-Source: AK7set/u2AJugekHBFT+Y7Z3C4VlH1tw34SahtRiv0MmAuPp+0sY0pf+GHFYTh2QmYUnTt8JjNU5oEuoZonCXL3uOYk=
X-Received: by 2002:a17:90b:46d2:b0:237:ae7c:1595 with SMTP id
 jx18-20020a17090b46d200b00237ae7c1595mr848370pjb.2.1677861981406; Fri, 03 Mar
 2023 08:46:21 -0800 (PST)
MIME-Version: 1.0
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-5-richard.henderson@linaro.org>
In-Reply-To: <20230223204342.1093632-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 16:46:10 +0000
Message-ID: <CAFEAcA_oEcs04iDgawLTCZvdBrCHi22X-jSLC5O7f5htuTD3yA@mail.gmail.com>
Subject: Re: [PATCH 04/13] accel/tcg: Honor TLB_DISCARD_WRITE in
 atomic_mmu_lookup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
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

On Thu, 23 Feb 2023 at 20:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Using an atomic write or read-write insn on ROM is basically
> a happens-never case.  Handle it via stop-the-world, which
> will generate non-atomic serial code, where we can correctly
> ignore the write while producing the correct read result.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

