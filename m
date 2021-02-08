Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF01314475
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:03:41 +0100 (CET)
Received: from localhost ([::1]:57606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GVI-0005gy-IP
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9CK8-0005oI-BA
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:35:52 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9CK5-0002P1-IU
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:35:52 -0500
Received: by mail-ed1-x52e.google.com with SMTP id df22so20203424edb.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 11:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vPlXFGmPdIy35/5fNAZyKIL3EFKfteeebY872mdceq4=;
 b=hO195erXbTIV+66O9nu1nhxXkEvRCM7SLaTavcrLR+lqnOBoxDWO4tZYnsVztcjLyY
 n3Us30cLW/MQLsky1C8Vf2KEekXdzX8UgmgEOugUw4RH3UL1xJ9rt0TeiF+FTmTTpcxm
 Wfyuaf+iJysERRR6aoPNvCYs26s+w6Qa/ryLY2Ebmbceq3zLzcanMUiQApmascjS2/Og
 zfyrR5hwVpCdgAbWgsBXERbVpEziDfNsh5ShiBv7Ehgj7OlDxYgYWaQQbd3zlAEDYE4N
 qWgHLGGscYEvDSt/qlMPOPSy99i8J0dpOXsyIK5Nat2o3rI5b7KDlw8kd75EFZHSl2qB
 4z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vPlXFGmPdIy35/5fNAZyKIL3EFKfteeebY872mdceq4=;
 b=N87Tt3AQwguVWhv2HBi719M7P0chXxOArAZMhuEDSZGVJ7WDp/+Zqit7WmZoaCHQmK
 lt0lW7+TF2EuE/zRYv0gH8rSOg48CuYADU+i/bG4M2oYFkPqCIx3cnY5Ac0svBlCIiIv
 Pz1w45eNJ3f9jx+zmIXURH2Cv4GODzRBMTiU203apFe5rkQpRMGdF6WAulz2Q/MCEzCz
 thoP1P7/3Rq0flEQw4flm5L8TAX5GF8uJPEdQqI2qT9+wbc8h6Z3JuvBvWoc0NJS0KDa
 FLSW3Uu+rZXBz/eGzUafxs+tfDkCZjLEVWBxILywYbpcWdz17rbYbvT/Umki2wv1CRwt
 +pug==
X-Gm-Message-State: AOAM531bZ/LWE0m13GMGYCYP/LZJn9p8h558/+e/OEOp8u44mkUQj6ik
 uatEZsn/iAifQ9O0edqPf3DR29pDHnhMwUkkW/7AVA==
X-Google-Smtp-Source: ABdhPJx8/IXSJql7UTYqMjcdvrI4PfLKouwJGLLP6R7UBZT9IshunWxKCqrfgyYKjlpMFZjFVnXkrhF3eHnmG1dBC5Y=
X-Received: by 2002:a50:d307:: with SMTP id g7mr17830788edh.204.1612812946829; 
 Mon, 08 Feb 2021 11:35:46 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-9-richard.henderson@linaro.org>
In-Reply-To: <20210208024625.271018-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 19:35:35 +0000
Message-ID: <CAFEAcA-cMCjFFLgLS9-W68RLiNkiOASC+Jmnum2LF3Vd234LZA@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] tcg/arm: Implement TCG_TARGET_HAS_shi_vec
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Mon, 8 Feb 2021 at 03:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This consists of the three immediate shifts: shli, shri, sari.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.h     |  2 +-
>  tcg/arm/tcg-target.c.inc | 27 +++++++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

