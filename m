Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C923314493
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:08:24 +0100 (CET)
Received: from localhost ([::1]:42700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GZr-0002s9-La
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9CN1-0007qh-Dk
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:38:53 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:41737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9CMz-0003Z0-Jz
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:38:51 -0500
Received: by mail-ed1-x534.google.com with SMTP id s5so20185849edw.8
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 11:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SV73rMCRhcPb7a7npiuqrN3j0c7ZWheJ5QHeS7AlegU=;
 b=XpbxY2TCDj16przFLBb78aDrfT1JLLFj+18sz7FbLsW5qj2rBYGwrUWH0wQnR8tak0
 WZrJ1QfsY7C572FFG0F1fu8FR1cFLVGxqdEvTlYLENQTnCwCaWm0WmJSSgXyMJCZROga
 WiN3EvqW7lW5+WVa10kbFN3Ideg7EyCwrp/mbYrajbWhuG6Dae2pEfwjJs0dph8UI/WG
 XZ6jr6vhQ+xj1fTgBRlHdZ0Dc8ad9d9BFG0Y4/gkfnuWgh8azB1OlrPmVflAHinETP6f
 8ApVJRH4eOHqW4b1MNLm3mRLUegOnCI082o2mNvW64EE2I5c/YXmPJwbrZ7M+YaPBVwM
 YXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SV73rMCRhcPb7a7npiuqrN3j0c7ZWheJ5QHeS7AlegU=;
 b=Lsv7WXzGVt2d1XdG3O5N0Dto7/bhCnICsFfRrnh75/zDYeIBNjORHVoP8StBmkMDsz
 aTGRiuIfbam15oKFgzOPzjxYZuYV+I7Usu3hr9jCPW3IusZr1JqBuzTkwQhNZBcOXMAC
 K4swduCK899sfsMkYuiizD6mP0738vO5uXWJTBxBa/bKSRTlO2bhHDpHQxPO/1OH3XCv
 CYIY0GL4XekgELQIVG8KzW21kajG0n8SJceq/1kM4rIRG3c3hTXV8nWJv64set7oTZpu
 vudnelpvc9uBxhJ7x5K61CHHg/NFMZ7Sm0f6RX9cPiIH/SxFn8jc4mQyL3iyFHVfUXy0
 sU3w==
X-Gm-Message-State: AOAM530SxWreybow5NkbhyjSs9zIq006yn7kXuvyn3dB1LhLLHmjvCDR
 H+lLGdlaoaLcXqETH1z1PPIFgBmOdTO3VJ49Sv3I2bikqnw=
X-Google-Smtp-Source: ABdhPJyLz/HddV1AdRQ979sxfUuUit/0ucHT2FEKv86MGk1+AuWrz55mYh1Ld2LkiRfRjF9tvGnPwklcGCqBtoHM5bw=
X-Received: by 2002:a50:e80d:: with SMTP id e13mr18425575edn.251.1612813128207; 
 Mon, 08 Feb 2021 11:38:48 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-12-richard.henderson@linaro.org>
In-Reply-To: <20210208024625.271018-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 19:38:37 +0000
Message-ID: <CAFEAcA8eAFOCuJXEA5QheM7Watta7Y+p9O3wz2meW1TnRjKu1Q@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] tcg/arm: Implement TCG_TARGET_HAS_minmax_vec
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 03:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is minimum and maximu, signed and unsigned.

"maximum"

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

