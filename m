Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3074C6834A2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:04:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMuzC-0000Jy-Le; Tue, 31 Jan 2023 13:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxP-0007CE-MU
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:02:15 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxN-0000nD-Hs
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:02:11 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so11302385wmq.0
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 10:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2szvPcKRPC9pwG7IsrFPcPmBzYbmXCTANnM8sJK8zRY=;
 b=nKqsKUjg15ks+VlRcUEhG+EvFy4yNQELZPO8Z7Wt0MAL/Ziiph2dU7qDgkQ0+eEZDe
 oSIxX0htO28Fg7xgftSs+eRJastKr+sr2gGN+P9KUMI8CaaMORbF7Ow7jm+6DyMvwLQp
 3g8dUCrpkyEAurd16hsPfplw+cXE+LuNxGU/zXMtPKl6GwNQcoJtjz4GosqudTh8OHNj
 SBemrXfMZw+7v2uJ912suLl51JhHM6mpnIXtl8g26pNIC8Q/CAWE6JtkRlQXsUnbvdJp
 8lN9D0RgWZ4YSrj4JMy4nNwNd2+2Tm6BTAXvsBrniYIMzXjKGevlWk8nKjOXBcRHiUCr
 4meQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2szvPcKRPC9pwG7IsrFPcPmBzYbmXCTANnM8sJK8zRY=;
 b=JNf91qzfG+RTzetOauP5AUw66m9zT9G28LT8si0JAAzbWCYpuinESvFRSuYdc1FDyt
 6XgIIiqHrb54J9ZO4b6Var9iTCpNMa1i8Ltt8lO++uA87CE8VH2DdtRdCKLOZOdvvvl5
 /43brAd70CdLGysve4BNY8dQRrxwehseGtX5wssvYS6q5JlV3fuwxSqwmkq7ZiFfpggR
 NxtGji/VjI25Ib+5plGStcsbJ651ItV0zP3DA61tiivLiK5+ZzmHZrWRsGAfepbsmJTF
 mmY7jMrsTXn00SNIpjN2V9zcg+DrcqBBTb6178FRtoo2VOFxA/NDoa+T1FVJ4NMxAIOR
 hFDA==
X-Gm-Message-State: AFqh2kpoRRXSdjMRN9XRUbE1aaD3CU3TlRlVSTu6aiueqVyP9Zo1X6Od
 NELTAAdLJyyFT/5yor6qKJ2/6bCChTRrVP5nwI9cTQ==
X-Google-Smtp-Source: AMrXdXtxaWvTK5c3I40PWfsimXu0sfMRtTMCQgqC6sHoM4/qUNuR2iKTYR0ZhS4FyFqmSc3G2A4wvYd+PgFreWDd04Y=
X-Received: by 2002:a1c:f217:0:b0:3d9:f704:8eac with SMTP id
 s23-20020a1cf217000000b003d9f7048eacmr3122537wmc.74.1675188128266; Tue, 31
 Jan 2023 10:02:08 -0800 (PST)
MIME-Version: 1.0
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
 <20230124195945.181842-13-christoph.muellner@vrull.eu>
 <64af1437-b910-e5b3-c462-0ef0c416ba39@linaro.org>
In-Reply-To: <64af1437-b910-e5b3-c462-0ef0c416ba39@linaro.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Tue, 31 Jan 2023 19:01:54 +0100
Message-ID: <CAEg0e7jH2Y8=2aKABAdL0JkMLOgJyUL1ciwDsA4ePaAt=bRSeQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] RISC-V: Add initial support for T-Head C906
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Nelson Chu <nelson@rivosinc.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Cooper Qu <cooper.qu@linux.alibaba.com>, 
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>, 
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Jan 24, 2023 at 10:26 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/24/23 09:59, Christoph Muellner wrote:
> > +++ b/target/riscv/cpu.h
> > @@ -27,6 +27,7 @@
> >   #include "qom/object.h"
> >   #include "qemu/int128.h"
> >   #include "cpu_bits.h"
> > +#include "cpu_vendorid.h"
>
> I don't see that this ID is required for all users of riscv/cpu.h.
> This include should be limited to cpu.c.

Fixed in v4.

Thank you!

>
>
> r~

