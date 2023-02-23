Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DEC6A0E1D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:38:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVEbH-0003JE-S4; Thu, 23 Feb 2023 11:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEbF-0003F9-TN
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:37:41 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEbE-0000j7-E3
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:37:41 -0500
Received: by mail-pg1-x52a.google.com with SMTP id q189so5793150pga.9
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bgNup2kZZsnzFwgCpi/xBc7Y68kv0vqYeEF/Akq9nVI=;
 b=XseukFfb2nezka3xVfoOiDblvkBFXmX73Kx74t56tISh9LbE79NqhACFs4FPBJK0o5
 2spXYxceW6Kx4YzzajTlKDHchEIc6zyQIYU4pb6mWNVWW6F/RIa3U2/QHDzM+SHc8vxW
 z7nLe7pYXHIYj8I5CU2bBpehDQ0tDk58dwZzJDpY9A64LnVnqCucx14k7GON9AfOmiuU
 Eqaa++mefgvCDtTXll77MgjBC0c/F3Qbz6uPhPjR7FOVaB5Y7ApR2L+SeE+ocB844ALE
 EwSWFqyqSmoPfKZ607X3Wn3zuU7+ejgqsq8L+nRvKWhUQbnSm1BEsym9G1SRU1QtFWAK
 JPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bgNup2kZZsnzFwgCpi/xBc7Y68kv0vqYeEF/Akq9nVI=;
 b=l1jLnFSplD0JkkuHeImVuMpTS90Pr6TWsiWCecYf1aXOKkTSUBRqfrUZ9k7pHZlDws
 08N4LHlByCVkZGAeaj2ZTq3h6wGUDjJrEY2s6THDmg32GBAyj+aQKOYliF0t1jAx1ddB
 Dl9f7YtQ60vOJzXasM39N36O4TsLJgKFS4S8ZMqnlwGK7hQHzMh8NbtekypAvu5SYBMZ
 IT8IVRRF16xbohhWaPu76wizHZG8oIcBK6Th0In6hV1T0D+ngLt9aW5f6u/EqXsW6W9r
 MZDYZcdJ89lsoYOzRo2efFDlnmbzZyIGURE/cVRGVL880y4La50+w8Gtt24MQWwubgwf
 tIsg==
X-Gm-Message-State: AO0yUKVRzayXnFfrEMaEPp7DtWhBzau7NKZ3ZYrQvO/pFByCJtsiJnQa
 x9Eqx4RiFD6OEpT5O7jTjxPk7GMOVDf2ezQPpBXMgw==
X-Google-Smtp-Source: AK7set9XdC/SIyiCfiH/QR9KUAUGiPSj6ssaScX6yUu4IlYZcEq+IosrwFdjKSF0vCz3sgKlGcqKlRG+veJ2i+crFiY=
X-Received: by 2002:a63:364a:0:b0:502:f4c6:305c with SMTP id
 d71-20020a63364a000000b00502f4c6305cmr495025pga.9.1677170258849; Thu, 23 Feb
 2023 08:37:38 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-20-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:37:27 +0000
Message-ID: <CAFEAcA-=HWRJXmjAvk7VnA5JCCJS7+MOSGFNu4kfMrATF9kDRw@mail.gmail.com>
Subject: Re: [PATCH v1 19/19] target/arm: Enable FEAT_LSE2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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

On Thu, 16 Feb 2023 at 03:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  docs/system/arm/emulation.rst | 1 +
>  target/arm/cpu64.c            | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

