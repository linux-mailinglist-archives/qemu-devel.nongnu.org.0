Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61841597D0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 19:11:43 +0100 (CET)
Received: from localhost ([::1]:55076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1a0c-0004w4-G1
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 13:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55412)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1Zx5-0001mc-Iw
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:08:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1Zx4-0008Mj-O1
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:08:03 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:45825)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1Zx4-0008M7-Iv
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:08:02 -0500
Received: by mail-oi1-x243.google.com with SMTP id v19so13646196oic.12
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 10:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dwkkUPqGDdR/wWJtwxvHi2VmYaPkaIbZdAek5Ju+HNU=;
 b=BHNBKsUt3gJ02ECYVlI2Njg7iWsQxihGdKPr7C/ylWwnn4cZoqMolgpghWDSVzGIQP
 IG0EY8wh8stJ5Gki63y8V0AnN+SyM3dw3MnLSSc5nCZaUK3lQtOesvDvI4OtlGqn4hTd
 FgPThDybczPM4vvLRyZCoIqjfO5E3Loq8HZNEGmdw46nyJrPArkZfVWDyk7NOfhQyLtd
 WRjOINXY8TLv3CWZ4yxGSi65SkJ7BXQWhO67NJ4jd3c+n4WLfS5UcZ8Hog76n0Ah9xK0
 DZW/HoEusLAkxtG1env4d2gq35mfYEjs0j0DThZcLTrxvNEK1+xFQGCaFfqsu3dxCe3F
 w1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dwkkUPqGDdR/wWJtwxvHi2VmYaPkaIbZdAek5Ju+HNU=;
 b=td+OmRfg/RRhjtj0805VMrILnhNMDFd+504+L20VNzHO+A77o3uQ8FpjyHAl4GRnvn
 Dz3ZZkkffxD8vDqpmcB5lquvLjTuvOyfX23jE8tylwQU9vuE05rBHi6h57fGyXeOgHKC
 S8BCLGTU6Lg0zmWE8pBKNWrfQpShDimU2rQKHmrH42a0AowbQ8Oswusi8ymysDBoW/Iu
 KCBF7fPCpjz6/q006MXaDi3zH3QbUaJqCYLpPRWSv7zfZlCfawdKfzHBI1AP9xCC557b
 0XoDKxJpGMai/3WagZkArHrSK5TcZbfKaNkBqNPzZPAxtReclsLvZGFvD+kekuE/1CMv
 VIlQ==
X-Gm-Message-State: APjAAAUyN+kt6bZz8FARwmhTRx+jqNFlg2qlpq1Ev447Bvtb6XOldSax
 ERf7zX4VqsxBl3PoNERrbSyUd8diqKtZbQLTsBuDNw==
X-Google-Smtp-Source: APXvYqyztVL89I2poCtt6uF4VgGJEQS3eawGKb/E1SaItQXkCUbbZb9v4oVEBEFbTflHTtYok1VgQn3PDMYw2FyKG/A=
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr3575813oic.48.1581444481948; 
 Tue, 11 Feb 2020 10:08:01 -0800 (PST)
MIME-Version: 1.0
References: <20200208125816.14954-1-richard.henderson@linaro.org>
 <20200208125816.14954-10-richard.henderson@linaro.org>
In-Reply-To: <20200208125816.14954-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2020 18:07:51 +0000
Message-ID: <CAFEAcA_bxGXGvwbYSv=M9o97UGYfGXn23rTC_jkqfGf=8w0Q+Q@mail.gmail.com>
Subject: Re: [PATCH v4 09/20] target/arm: Remove CPSR_RESERVED
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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

On Sat, 8 Feb 2020 at 12:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The only remaining use was in op_helper.c.  Use PSTATE_SS
> directly, and move the commentary so that it is more obvious
> what is going on.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h       | 6 ------
>  target/arm/op_helper.c | 9 ++++++++-
>  2 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

