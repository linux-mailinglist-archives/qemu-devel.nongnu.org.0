Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E864CC11E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:23:05 +0100 (CET)
Received: from localhost ([::1]:37980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnIH-0006Ei-05
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:23:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPnAV-00033M-4T
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:15:03 -0500
Received: from [2607:f8b0:4864:20::1130] (port=44489
 helo=mail-yw1-x1130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPnAT-0003pW-I9
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:15:02 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so58992257b3.11
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 07:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uVYtaPeuca20SiBZvEaBw5/2H45uT9Svffn7+JrWlng=;
 b=EQcRhxbvLIdreRHPtuh/bE1jPgcMOOr5L4S4/2/jSMhAO7+HB9YAqjaHk4TbQSOIAf
 pHg54o1dZPxYD12QptMkDQZ0ysYTUuf+epvqwrm+CQQTJZPuo/ColTgdfar6ws3MANyY
 9FGnNun878vZNtSUyk5myIlEtfVxA11LzUwuFrB3N14TAFAaK9m98XT8vXOzzt95tEv8
 1RJrbwm5eRxDqtKMSwt4uu6ad+lRvfU7rl7ceObE6i0IHr8IrGJipxsAHQefTqeCWSVk
 vmaZazeEmjOL6uxCOFHixsr5A5Jms+z8UgwNfTpOAoj80KaxZ6+1Xs4CKMQ+FrIwPsPe
 5LwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uVYtaPeuca20SiBZvEaBw5/2H45uT9Svffn7+JrWlng=;
 b=nRGlqLMyPpCUakASrC4ei7G8n5AOV4H4EwkuL2z3fqPNEJZzU7RD0vqBRJyhn4Rdnp
 jhfPLp+dBMQ/eXhwvaXzC9ismueaviq2/KuF3/7Up7F8lj61gcyOaDvv+kLVhUB7psY1
 rQHTEjjjWZ9JezHSc3SfADiX7cxPmMRq3pIMsSKxf+3LTcfnPy5EGpjV+9wjhPQFAHVI
 w5p1NzTch0Hk3xK5XXIdHrJSSyZ4mObZo0pGk3MuCoRbRli2/IlDwW9Xr6RnIVurp0bh
 lo0mXCIX5kRwpJinxvzLdTcBGqM1ZQGm+q5QpO7/DaTWMEn1hRgxbvSobJcV5GtHzNZ6
 1KwQ==
X-Gm-Message-State: AOAM533tTnrbRhzvSE8SWpewI5oINflmSClMw1eL9XTAb7aBHk3QkXy4
 z51Fz4JblbyrrTV/LPLdhEoDkQbyflPdOBMEPRrS7Omktd3zew==
X-Google-Smtp-Source: ABdhPJxgT4sKlzis7NhTMmnZEsK5AfcHjuvDC5cZM6FmLTa/JgELwsZVjRWc7JD3eQQysIgvd9Tsl7gDlAC7wBnPQCU=
X-Received: by 2002:a81:b49:0:b0:2db:f472:dfca with SMTP id
 70-20020a810b49000000b002dbf472dfcamr11858417ywl.455.1646320500373; Thu, 03
 Mar 2022 07:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20220227020413.11741-1-richard.henderson@linaro.org>
 <20220227020413.11741-4-richard.henderson@linaro.org>
In-Reply-To: <20220227020413.11741-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 15:14:49 +0000
Message-ID: <CAFEAcA-rjPp9uKgMcDDTn4Y09nV2bZLHvMjNLc9jV6NYeum+Fg@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] accel/tcg: Support TCG_TARGET_SIGNED_ADDR32 for
 softmmu
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 27 Feb 2022 at 02:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When TCG_TARGET_SIGNED_ADDR32 is set, adjust the tlb addend to
> allow the 32-bit guest address to be sign extended within the
> 64-bit host register instead of zero extended.
>
> This will simplify tcg hosts like MIPS, RISC-V, and LoongArch,
> which naturally sign-extend 32-bit values, in contrast to x86_64
> and AArch64 which zero-extend them.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

