Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEBE2FF4A9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:37:43 +0100 (CET)
Received: from localhost ([::1]:42060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fm2-0007Wl-SL
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fTL-0004sj-GB
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:18:23 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fTD-0001vI-K3
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:18:23 -0500
Received: by mail-ej1-x62c.google.com with SMTP id 6so4235269ejz.5
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EHQSToLLCz/Ds+S6q6GkkI5JmUFrTRO4JGT0jGauKk4=;
 b=RO67KpIuIQTSpG+zto3osFYJwdCXLTnktRKZw21UMeE3rFb0TUQZZQ6IVGeuQrGC2p
 QNMepd/NHkZqY9h9NJ1x6mjzH/UXFEQJd/1bIN3RsuRdLAJtaBMdDGT9sC96BII7ZVug
 uM7n8xDgB3xjmnvVRCegkNQm4DpoE4z3lHV6qkDdW8pY9w62Hezsi+NV6ZrW/wFEF20S
 lkzKoYpcTDC0X8C82UgYO/y/DnNeZecFRDpWfOyO7payq3/aNlvb77CK2GWrAGkppu/E
 kQe9GodPEIOdLgnFkd9GaC6RT9b8xLnbdGyYe0LkeKvAilQaJ9VYtovBZT91umTSI73b
 R4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EHQSToLLCz/Ds+S6q6GkkI5JmUFrTRO4JGT0jGauKk4=;
 b=Q7dQ7zVlUDfC3GfTJ9iay6Tq6BzAj19L7uJk6U/cDkYr09OZuuslS5gfqjkFna8Tup
 sRj1HdJJ6lU4FgFCMWYleJiYnANQ5rjMgY3TzP04YwxK4DZe3tt6rP2TdjmUdzC2kb6R
 8pvy0Z0dabF1wEo6OOQoMH/0w7LJO+b3W0iIGrzpHMThFfii8pLrgzJ64hGCoKJAUd2u
 YmXsUa5TzczOhrGIh8IGgI1lpfabm6I1l48fuNH2Qf7g99ouwBOmNwdu7akWBArLev7N
 GBJpti7exd2pWIPhuo5KFfLJN4VizQzicyM8JtSC4ezu7/eBvhQOcaHvgTA3j06odT9Q
 pcvw==
X-Gm-Message-State: AOAM532I0OBeaRfKDK81TbS/jVLsVXtN5wfOQwFvqJcPz75YgIe86LHX
 C6Vv8uJm3U8SglkDXd1WdTSDQiIOEh6lTzWThKg5DA==
X-Google-Smtp-Source: ABdhPJwVAipAeE6Y5owjqGC+1ytLJ1N9Rgtw44+KQPc9s3slWI1V55fClnD9NSMGMFQtlcAZeOqN0msVFvNE34d1THM=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr679216ejd.250.1611256689343; 
 Thu, 21 Jan 2021 11:18:09 -0800 (PST)
MIME-Version: 1.0
References: <20210120031656.737646-1-richard.henderson@linaro.org>
In-Reply-To: <20210120031656.737646-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jan 2021 19:17:58 +0000
Message-ID: <CAFEAcA_9ji4VYMKb=BPpaNDWur0o6C0VPNpNXGCuVreFJkSEiQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Conditionalize DBGDIDR
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jan 2021 at 03:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Only define the register if it exists for the cpu.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> I've pulled this out of a largely defunct 2019 branch.  This will
> be required for the cortex-a76, which only implements aa32 at el0.
>
> This did get some review, back in the day,
> https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg05171.html
>
> but it has changed enough that I didn't include the proffered r-b.
>



Applied to target-arm.next, thanks.

-- PMM

