Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2B334EF31
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 19:17:51 +0200 (CEST)
Received: from localhost ([::1]:45714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRHzy-0007yK-9k
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 13:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRHwg-0006VH-5u
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:14:26 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRHwX-0001UO-C2
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:14:25 -0400
Received: by mail-ej1-x636.google.com with SMTP id w3so25983195ejc.4
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 10:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Yl9YWt8XBuWEIu0uz2X+U3Ey0tlOtaB4TPBDzoWFIRc=;
 b=M9Zrw4hmC1+nZ2bCOXkUdSsi4VQBj6vDfFWHwVBYzjwriqkUKiGDgYEP9jcQqbbr0i
 I1xztUwnpb6tzbRQBrNR/RbxfKtRBr6NEHM6esNkqMONeFk7GJ4PKodWszBN0HgZz/vB
 pLB119OZVfH7WJda+nalaj3oE6JPv1EEHXoOe4ID4I/yZ92BMctfDz8S1jaw/3msHzEe
 ddcj7LFUUXSH6IIvetF8YZJXXSenYNljg60LSpThnQ3Nx9gFyKqU9VQTj+bXG8diXadd
 6LmaiqmCde5YqpG7QjpUF/Bna+DYTNz3OTDq86BEsa8xLXZSVR9eK4nNxkMU41r00d48
 l4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Yl9YWt8XBuWEIu0uz2X+U3Ey0tlOtaB4TPBDzoWFIRc=;
 b=Ht9ooCE8ebuCrtT7QhYYoO12WDtjhELHkXFIAdD02YORV9swcO1RLHvZXx/YTaUz4g
 WGKhTm/sLegS9J27UBPR3eBFPRVnct3foHZP0YsayuEnwYelqgPCQYIjdFmebC+iKB5u
 Te0d09XLEpwzBnAi/dbFoEmycbEdH1V+c5jjIfxiLbvernu/YgzrbDRYsXea7iKfFuoz
 Hucu+KBOXpqCB0BoPclw7BoQHoY9Yf+VuqnW89CYSIMUKtG0odka/4yMsZAiv8J77+9u
 BXZKN4p7SXirwPGLcI36xnbEV1EDO0CzW9Aq9zpc9Icyd8w+DWbngEQ5em/Tb62zgv+2
 weng==
X-Gm-Message-State: AOAM531iIJN08V4s2VJeDGG6hbPXhqq+U4eWGDimJ1yG0wHE7xx6uebP
 NBnGK1lU9fizNzQympeFt/lFnRGvmwZRutOmAYmkC6n82V62uw==
X-Google-Smtp-Source: ABdhPJwt6AM28GftdpPuNa6RPgtlIMPMfPHeAb7MB8Dn/pp/ckA23HDShSICGOCGyFJ7twVNVqc7YP1I32BJD63TViM=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr33986628ejc.407.1617124455739; 
 Tue, 30 Mar 2021 10:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210330132555.8144-1-peter.maydell@linaro.org>
In-Reply-To: <20210330132555.8144-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Mar 2021 17:13:44 +0000
Message-ID: <CAFEAcA8P5p5KmS4R_7=MV6uHeEq8QyfYSPE2bGG+9fxgtuvB1g@mail.gmail.com>
Subject: Re: [PULL 0/5] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Mar 2021 at 14:25, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit 7993b0f83fe5c3f8555e79781d5d098f99751a94:
>
>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-fixes-for-6.0-pull-request' into staging (2021-03-29 18:45:12 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git pull-target-arm-20210330
>
> for you to fetch changes up to b9e3f1579a4b06fc63dfa8cdb68df1c58eeb0cf1:
>
>   hw/timer/renesas_tmr: Add default-case asserts in read_tcnt() (2021-03-30 14:05:34 +0100)
>
> ----------------------------------------------------------------
>  * net/npcm7xx_emc.c: Fix handling of receiving packets when RSDR not set
>  * hw/display/xlnx_dp: Free FIFOs adding xlnx_dp_finalize()
>  * hw/arm/smmuv3: Drop unused CDM_VALID() and is_cd_valid()
>  * target/arm: Make number of counters in PMCR follow the CPU
>  * hw/timer/renesas_tmr: Add default-case asserts in read_tcnt()
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

