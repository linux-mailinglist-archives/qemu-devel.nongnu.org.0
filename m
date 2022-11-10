Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EC5624802
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 18:11:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otB4U-0005UZ-6U; Thu, 10 Nov 2022 12:10:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1otB4M-0005Rj-5Y
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 12:10:26 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1otB4K-0006Sh-LY
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 12:10:25 -0500
Received: by mail-pf1-x431.google.com with SMTP id 130so2732948pfu.8
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 09:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NSYuEgHOKnvrf8RxoCkAIOB9iL2gWL6v0rXXb0Ylt/E=;
 b=RJrzAPp/1Eg/lkSbgGqbryDsMA411qSta0w2n+TRy65sWrxs8gln7HoAT8YWrLd6Hk
 5JCtUfR/cN9qvj8fn1E0tIoabTYY+AydlKc0OCH/JVnWm4UnpUE61HoOPX7iBU6EZh6X
 3uJN0MAPCmKjMnO8HeucNoBZbotSZfh3N6SbBhqcXqTFkap51kSfSjffCdZpqJ+Yu4Ss
 wW5JJG0NKkTA13F1ml2kvxNtM630sNtcUiaUrQeZVlsAYt8Pv2Uz4Wa2AUSzC/8Qedtm
 3SYxXQCVrgmcVbmHRpaBcS59nv/Q+++38JSUH/AeBrRda7KfsCqaYXFBPK4PL2YdiSZY
 FXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NSYuEgHOKnvrf8RxoCkAIOB9iL2gWL6v0rXXb0Ylt/E=;
 b=u/yUBqgt+0r5foF3DxJ/bbZWI8GscdQEzBx2l0kJTRtTKVnLe08RM+8ZNi8PX8BReZ
 Cj3hR/q13cWubaLDmXdkbLVVtzc60ZHcQP6TkVaM/isBsX0JB5omyEfx6O5FUoC8bqjt
 ns2LW3YSzKTt+wLjwatElpSkO/DLHULlSpaaLl2zTRnPtuWu5KNE4H1zcY9tLIBbMkn3
 EmRrV7FpN8NGFYc/9QdPabtoIXBIxmOVuItSwSXOvFfL2GxDjPs+Yf7phJKiLoXxoK+Q
 9kotQlMDwA2i4XzPkDfEddkDUim1w2atRfsxv1+MSkLAFqDTmAWi4T4KjwUXVnz7C+45
 qkRQ==
X-Gm-Message-State: ACrzQf21OlIcZJazEwJUv90Lhl/8mF7ERas67IWEnlqSUgXgWCEN4eBZ
 2lxnVJC007w735A0X8IJgcV4uOJ0Jm0L10bz7SN2PQ==
X-Google-Smtp-Source: AMsMyM4j4WMPdOZfNAUEpWlFH8YltlT8PT+IR7M6t6xCQyFZ1rWFMuuFVWHA3ZTMNUQdfdJ13Xd1vS7Y7NzghxGWWKM=
X-Received: by 2002:a63:5459:0:b0:43c:7da:e64b with SMTP id
 e25-20020a635459000000b0043c07dae64bmr2946764pgm.231.1668100222031; Thu, 10
 Nov 2022 09:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20221022054746.28217-1-vikram.garhwal@amd.com>
 <20221022054746.28217-5-vikram.garhwal@amd.com>
In-Reply-To: <20221022054746.28217-5-vikram.garhwal@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Nov 2022 17:10:10 +0000
Message-ID: <CAFEAcA9KUUWMipiHLFi=EQFS86hg7JMvDRwHEn9Ggva18tDhXw@mail.gmail.com>
Subject: Re: [QEMU][PATCH v2 4/5] tests/qtest: Introduce tests for Xilinx
 VERSAL CANFD controller
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, francisco.iglesias@amd.com, edgar.iglesias@amd.com, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
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

On Sat, 22 Oct 2022 at 07:20, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>
> The QTests perform three tests on the Xilinx VERSAL CANFD controller:
>     Tests the CANFD controllers in loopback.
>     Tests the CANFD controllers in normal mode with CAN frame.
>     Tests the CANFD controllers in normal mode with CANFD frame.
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Acked-by: Thomas Huth <thuth@redhat.com>


> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +
> +/* Base address. */
> +#define CANFD0_BASE_ADDR                0xFF060000
> +#define CANFD1_BASE_ADDR                0xFF070000
> +
> +/* Register addresses. */
> +#define R_SRR_OFFSET                    0x00
> +#define R_MSR_OFFSET                    0x04
> +#define R_FILTER_CONTROL_REGISTER       0xe0
> +#define R_SR_OFFSET                     0x18
> +#define R_ISR_OFFSET                    0x1C

Please be consistent about whether you do or don't capitalize the
A-F in hex values. Mostly we use lowercase, but upper vs lower
matters less than being consistent within the file at least.


thanks
-- PMM

