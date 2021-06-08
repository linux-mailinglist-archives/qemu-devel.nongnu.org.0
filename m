Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29E539F31F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 12:03:45 +0200 (CEST)
Received: from localhost ([::1]:33210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYaG-0000aJ-DA
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 06:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqYXf-0006ge-V0
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:01:03 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqYXa-0006IM-Eu
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:01:03 -0400
Received: by mail-ed1-x529.google.com with SMTP id s6so23813984edu.10
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ubzMnTxIMvfIXo//3ITMrgf9s5cme1eyCAS1oiWmEdE=;
 b=Q0ZW/jO0DXlo04YQtyB3Q+XooiKFMKW0OIM/O7TJ63CVMCm4DYoA1d8ScdMfJpVW4g
 +iWNJULhcHC6hbmWtLSx7lral/Hm9xOof5dJFgeuxmzz8Hx+6zT0stdOEwIrPrLlvgmH
 Y7AkH4yi85TuKuFTVxo1v/yyqKqTQxqvGcM2vn5JfQBP61nIpSAWOrZpqCCtQrQZzr1U
 8oCA4MRGf5tIniGLhJNLRjjrG3jKWSW/fxBmOtW+kJZS89cgmDGPmA+i2si37A1/cmL9
 /Zfq7Rbev6E3a4hsfcPhIzMWlxIVMV08918sIgdnAe+/JC0j296gUKto3vewE24ilo01
 HyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ubzMnTxIMvfIXo//3ITMrgf9s5cme1eyCAS1oiWmEdE=;
 b=h3qBuzICBH5Q8k8LSvla46a/oTIszxKORVqtQ8Dccf1iCu3d4N7CjZK8qHxa5lY7Fz
 mfKgEP4zEK+yfbWhX3ZFssYFNIVebFfQ0cRDK4B82CGAG2mTw4Y9ve2HYvWpfer0JUvb
 bfu4v8MLGPN0aHJk8Z3e/TPds5f7cmOH8B2eOMglOQDH2/ToJ1d07smpTjkvIkV8yyfR
 Ak2V7MGmLLH0FcUcRAgzYxbwBZadfSJK4Xc3oJ0r2h2WlqadYjXtQ3jeDBejM7raQL9L
 Y6bDErjFdY+TER/721sZA0ytiIeezOqYwwdC4xU4mcXX53mhmT74j1g2Ziwu8xTzX0Zo
 4OZg==
X-Gm-Message-State: AOAM532RWVlhj50ftrN9qeVwAex94nnASlGcapBoV1M0GPK9/V/c0BkP
 lz38E65yhE3UDqxCJjKbZ1WeFKAzHFCWBUYB3Y8lwg==
X-Google-Smtp-Source: ABdhPJwPAbFAG+ia0j8cn9HZ9EjpDBRP/bgLUg/lQCFVVgm77nvCtFEGIg/efZeLU+wfm9gy7RKdikvs97u5L+b8Hgg=
X-Received: by 2002:a05:6402:1216:: with SMTP id
 c22mr24442606edw.36.1623146455888; 
 Tue, 08 Jun 2021 03:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
In-Reply-To: <20210602180042.111347-1-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 11:00:22 +0100
Message-ID: <CAFEAcA9eLkv2u+qV9409ThLFQgLvZ2Nz+OPygPkRCp62rQ3ytw@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] GICv3 LPI and ITS feature implementation
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Jun 2021 at 19:00, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> This patchset implements qemu device model for enabling physical
> LPI support and ITS functionality in GIC as per GICv3 specification.
> Both flat table and 2 level tables are implemented.The ITS commands
> for adding/deleting ITS table entries,trigerring LPI interrupts are
> implemented.Translated LPI interrupt ids are processed by redistributor
> to determine priority and set pending state appropriately before
> forwarding the same to cpu interface.
> The ITS feature support has been added to sbsa-ref platform as well as
> virt platform,wherein the emulated functionality co-exists with kvm
> kernel functionality.
>
> Changes in v4:
>  - review comments addressed
>  - redesigned the lpi pending priority determination logic to scan
>    LPI pending table and config table right after lpi pending
>    statechanges(SET/RESET) through gicv3_redist_update_lpi() call to
>    determinethe highest priority lpi among the active lpis and save
>    the details.The high priority interrupt determination logic in
>    redistributor now usesthe saved high priority lpi details
>    (alongside other interrupt types) instead of calling
>    gicv3_redist_update_lpi() everytime(as in v3).This
>    significantly reduces the call overhead associated with
>    address_space_read of lpi config and pending tables.
>    Testing with this new design showed no boot delays.
>  - profiled execution of gicv3_redist_update_lpi() using perf and
>    framegraph to confirm execution is within normal limits.
>    Also,specifically measured execution time to be an average of 175us
>    with linux distro testing.
>  - All kvm_unit_tests PASS

This still fails to build with clang, in the same way as v3 failed.
Also (as noted in my other email, you need to integrate the updates
to the ACPI table test data into this series; 'make' and 'make check'
should work at every step in the patch series.

thanks
-- PMM

