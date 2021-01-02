Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6612E8863
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:07:33 +0100 (CET)
Received: from localhost ([::1]:57106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvnBU-0007gD-Ei
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvn7y-0004vO-Ek
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:03:54 -0500
Received: from mail-il1-f170.google.com ([209.85.166.170]:36973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvn7x-00077I-3p
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:03:54 -0500
Received: by mail-il1-f170.google.com with SMTP id k8so21736404ilr.4
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lVSaQ8Bk6XGFw6dGid96cyZAaUnsqFuub7yOWLpuyCs=;
 b=jCKGnRfVx22BnPiNvppMYrjhdAz0YzVS3sUoClGOJ6CHWnoj6eYiq9O0yT+xSms6Pz
 3KsyUjDx2t3WY7hbLaMqtzfxaox8pDqFT7CAr99w3ls2g+jqAQ9MAzjH33dTQa16Mh4u
 NwJfFtNoZaUlAnGfE5CLHteuIahX7s0uV9JxZ4ySQAYp3jack7JFvCSta1qedX9RMuEw
 exPjDBfHvk5kWDM4IKWM5sN52oHq5uhpK1Mcy8M7sMNvcPciZUq2dNgXfbdoz+PFiPII
 SWDXRdHV0tYWSSkugPDBb3S0qwnRtm+/bJNnpwR/a103D+nLB38mVvr3ORUQdf+XnFu8
 OrjQ==
X-Gm-Message-State: AOAM530O5kZeJcCCFyt189+6nlu54jqW859NRyxQNCSta1vNvCXF7nDu
 hqWXOI98X4lDdg5cdPtJm4UNFBzamUo=
X-Google-Smtp-Source: ABdhPJzc0kk1hpSD5h5kK1vm4Uwnl3tW3ZE5efyvJw4K0j6Ab2v29L4XY30k8LdcUtegx1MjeUgacQ==
X-Received: by 2002:a92:2912:: with SMTP id l18mr63961858ilg.173.1609617832142; 
 Sat, 02 Jan 2021 12:03:52 -0800 (PST)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com.
 [209.85.166.175])
 by smtp.gmail.com with ESMTPSA id h2sm35238935ili.56.2021.01.02.12.03.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:03:52 -0800 (PST)
Received: by mail-il1-f175.google.com with SMTP id k8so21736395ilr.4
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:03:52 -0800 (PST)
X-Received: by 2002:a92:2912:: with SMTP id l18mr63961841ilg.173.1609617831850; 
 Sat, 02 Jan 2021 12:03:51 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-13-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-13-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:03:41 -0800
X-Gmail-Original-Message-ID: <CA+E+eSCj4U+wHxBa71SxrZBUFftDTw8ytxctDs=TO7a22xQ-8g@mail.gmail.com>
Message-ID: <CA+E+eSCj4U+wHxBa71SxrZBUFftDTw8ytxctDs=TO7a22xQ-8g@mail.gmail.com>
Subject: Re: [PATCH v4 12/43] tcg: Adjust tcg_register_jit for const
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.170; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f170.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 6:02 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We must change all targets at once, since all must match
> the declaration in tcg.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h            |  2 +-
>  tcg/tcg.c                    | 10 +++++-----
>  tcg/aarch64/tcg-target.c.inc |  2 +-
>  tcg/arm/tcg-target.c.inc     |  2 +-
>  tcg/i386/tcg-target.c.inc    |  2 +-
>  tcg/mips/tcg-target.c.inc    |  2 +-
>  tcg/ppc/tcg-target.c.inc     |  2 +-
>  tcg/riscv/tcg-target.c.inc   |  2 +-
>  tcg/s390/tcg-target.c.inc    |  2 +-
>  tcg/sparc/tcg-target.c.inc   |  2 +-
>  10 files changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

