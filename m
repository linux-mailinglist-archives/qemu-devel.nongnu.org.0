Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC71017A75D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 15:26:47 +0100 (CET)
Received: from localhost ([::1]:50142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9rSY-0008MI-PA
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 09:26:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33996)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9rQV-0004D5-HR
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:24:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9rQU-00052t-MJ
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:24:39 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:36456)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9rQU-000528-Gs
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:24:38 -0500
Received: by mail-oi1-x244.google.com with SMTP id t24so6127326oij.3
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 06:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tNV/JKsgRC4ZNNe/XdPiKH5Cx2UyJVFV6zJT/fjG9FA=;
 b=u753pTUWYh+7oUO2PPdo0m/nmRojHTZ1WIJLVU/w6fShuoC3hFnIVEssXV6FZ50a1g
 zQU3eUQJXCwZCR1SpnI4iGFXqmnBnzmg0xTGvWe1HpFw0UIKyH9cC5+dUhip2Zh9nf46
 Cfv6MZTMVGBOB86RXNTBJjulPzcuPmlfaCQGOpASWhcLkxnqk1PLIkIGSRTa0XuJ0/g5
 v0rbEdRD9immVhB8SsaNrnuf/qb+KJkqplCFR4CFOGilkJ8Nv9en3Fobu5KQgtRpc06k
 G0+duHjvsMPEe6961kSxNdjZQH+J5YIswP3f3fsZtIzB8hKhO/XQg7Aqaz1G4h+BYF1p
 FcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tNV/JKsgRC4ZNNe/XdPiKH5Cx2UyJVFV6zJT/fjG9FA=;
 b=jkp74IM6qeYQBr80MWf+9MACaCdxIBeMXPq94j3lrvEhDbfnblhbeojkQdV1I5ng+B
 CDq6Nl++u4Sqj3zl2X4y1Z3CRbZcEpUGILajjqvp30xyavBCb0Jk8XP2Nmtvf5KasIhk
 J63w0YIiEeKFSEl4/qTzsBFRvjhqbCQQb053m1ULGyJw9L1rUISCRR36KujZgY6pFWuA
 jekL7ydcPuf9Cg0r/WarqRWeBCPPXoai/oFmMDV2WhqEhhH1amZTz1lJcUepqyJ/SUQr
 86Csqc0EFMIBdbxFt78uIICIV5pDzktnfok/0UIVWjUvEz3h0qo9vUwWamAusSg1BIY5
 caSw==
X-Gm-Message-State: ANhLgQ3jdp5YX1N4hpRiRkbh2b9Bsn2d9udOkVg3ekidNHAVA4PLYz7u
 7eabbx/FuxW5ffmATnA3x1gI1vMFesUY9LZkzRrOl1M9QfA=
X-Google-Smtp-Source: ADFU+vtUHYe8h+Ebxqm4vMqH+AQbYkik4BLUQ/PgoZzp1IQR9v6egkxsfGpW4UFwTlPUwigUgQ/ict3cGZVJQW8tlao=
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr5606096oic.48.1583418277704; 
 Thu, 05 Mar 2020 06:24:37 -0800 (PST)
MIME-Version: 1.0
References: <20200302175829.2183-1-richard.henderson@linaro.org>
 <20200302175829.2183-5-richard.henderson@linaro.org>
In-Reply-To: <20200302175829.2183-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Mar 2020 14:24:26 +0000
Message-ID: <CAFEAcA9A1i9QtuM-eB6ZSjLio1CDdtUnBvb5qv8T6=eGi-Fi+A@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] target/arm: Apply TBI to ESR_ELx in
 helper_exception_return
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2 Mar 2020 at 17:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We missed this case within AArch64.ExceptionReturn.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

