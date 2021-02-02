Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A76330C2B6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:59:32 +0100 (CET)
Received: from localhost ([::1]:34708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6x9P-0005TO-GA
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wrS-0008RP-Ls
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:40:58 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wrN-0000Xr-8J
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:40:58 -0500
Received: by mail-ej1-x634.google.com with SMTP id a9so11950560ejr.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h/SpySeyFodIB7F00VfYI8PGZe4jEagsQRXiN768hS8=;
 b=OAV9s9bHddnPkLcnHV/TbrJrcHWjA3EOI5hQoy5jNrIK8n82Q6kQ8HXcSLu+ngS+qN
 OOGGJworasx0lV036AIDQIoSzUqUSI9t1quuWmAyqnQYzkYAPpLDpuTmhSD2n0JQszSV
 pRPP/iwx3k1ER/d8rugkawpCedrrQdlnop+BHzlToEkg7MKuBB3Byy7dBSjHE7IiWwnj
 fo+g9VpjB4UE5vOKTQEXI+sgwcy0x11l59orVOt3l+obzIyLBiq7WcgOddNGMtIj4nNC
 m2sjJCM1P5zHg7NGclBwe1QnYFo64AoVj4ztZ2N12VeLBhRNdr1UCfl+ia1QwxNxq0T6
 01Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h/SpySeyFodIB7F00VfYI8PGZe4jEagsQRXiN768hS8=;
 b=S7Vw/E1DNywF0RY9hNvUPedNrM+1poD2i8UsKVa6NZzKIj2TuaK54wePfGURh7Q1wM
 asD160UB063f9ZmNLTXPJxWGzKouysFlntdxpdvaN0Fm3/wL23Dyzbk5OjD4QjngsReW
 fAIKCAvT0NK9rzzWKuO4WMldROoZgLU99akM5yoqO+QjgCY2kPf+mqa3LLvXdcf4KLQE
 e0JjfvGZ24bvs2MRZN09+ISpOjpsc4Ecs94AQkhi5XE/0SX/Di55a6bbnMfJox2fhAeo
 PzEonV/H164Cr4lDXyu0bBdcxaIo8z7m5R2R+oqMueORFO89iW+lZMEp6dZnxHMkldOH
 D7uw==
X-Gm-Message-State: AOAM532sUyqnzNXp0KLOtbBbT7JnCJSvpbtPhbJZTgcdB2vK4qPzhYaF
 oy43J1neawfsjP36tB60nt+p9+p6cut3iYXAnPtaw8HZSYg=
X-Google-Smtp-Source: ABdhPJyUAUhoE+VNvs5kLCXhLj3sa7P3muip0H0X6tomDDGn6Gh16tTB4nqJlojCKuWPYMOTMPKEYHN9g7ChRvCz37s=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr23521700ejd.250.1612276851857; 
 Tue, 02 Feb 2021 06:40:51 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-14-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:40:40 +0000
Message-ID: <CAFEAcA86a3YhEUOc35iZ90sq-LVDjj+Bknb2=0UhxiCZPerZVw@mail.gmail.com>
Subject: Re: [PATCH v4 13/23] target/arm: Improve gen_top_byte_ignore
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use simple arithmetic instead of a conditional
> move when tbi0 != tbi1.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

