Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D723C2A6C87
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 19:14:27 +0100 (CET)
Received: from localhost ([::1]:55642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaNIg-0007tA-GH
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 13:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kaNGd-0006vH-Lb
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 13:12:19 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:41144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kaNGc-00063F-3z
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 13:12:19 -0500
Received: by mail-ej1-x644.google.com with SMTP id cw8so17511861ejb.8
 for <qemu-devel@nongnu.org>; Wed, 04 Nov 2020 10:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OYXpfjgyGabnn/pJMnWtxxnBy660zDPbW+Q8rIwVfV0=;
 b=lIOW9qyGwTxByenDZTjAOyURK/bozHaYSObx8ZCHIfbMiWa9HHcX9qDGunVupIShg1
 Nh+g25dhH8bgO62AuMvD3IgPhE384KWngwIItY6CUOwo6gmDtOOppCmQYznKVIIU8qLU
 LTegeEZ+vJZ23IetETeAccGwf4ZM8bbjKFEBQdjuk2i25eQCVoF8tWzWdBYaOTzBIeW8
 reexu7CA6j2upFuc9A97f4yStwYg7xL+xvizgahqUkUxRku+kq4kRbAs2UslKENbQeqS
 CyYYvjm8ga3FqM7BlCCiu+/KFWwrLouTXeSpYIMv0k3sK9GvT+4M9A4ipMXZyiVP0+iy
 YuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OYXpfjgyGabnn/pJMnWtxxnBy660zDPbW+Q8rIwVfV0=;
 b=RBolby52zHh70MKe0anQfbhujl//4HpJFuTjbDP+tE8hHje+lT2NT/9s6XS5w22qNv
 e5d7Ru9GQBMv90KiUgxQuPDYe7JqShMuf0LtxOqB5M93vvYBqZEmthnOWU0Ukv9zEFB4
 FuGLTr1vmPGfLNJRrqUXHC0PiCGgPMbbq067dY41r7Hb8uxq/RftIMIWElRkRjC8p75R
 pDWKn8cDpxWKMiRXQpXR/+oLyPW5DlesqUWFMQsTuMJVcMDHSWC0zoPy0ndpSvukdCKy
 TFXzI/Xd+O/iOB/mkf6U46UIhXyil1muz+k6i9rpVmlW5SSZjkHIV/+cVI1daRJBeWUE
 zJUA==
X-Gm-Message-State: AOAM5327Onn8tbCZ4UXDwdXZZ3iNfB8zUnNw/S+//TehW171PK4a/vYc
 sIF++NcWlfkPpjRpkfEgnJGgYH3oKMo3Ckmc2Wqahw==
X-Google-Smtp-Source: ABdhPJxOy+2/Jo7khAN4fu48UCWVgUDtDZTPpJxHTG5cQCU37sMccOuBnaghAfwuHc5Kc4hBLp6bjywdjQq1xJkYaHM=
X-Received: by 2002:a17:906:af8c:: with SMTP id
 mj12mr25328586ejb.85.1604513535830; 
 Wed, 04 Nov 2020 10:12:15 -0800 (PST)
MIME-Version: 1.0
References: <20201103213852.253793-1-richard.henderson@linaro.org>
In-Reply-To: <20201103213852.253793-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Nov 2020 18:12:04 +0000
Message-ID: <CAFEAcA82mtadB8r1kX1TG5Ft3qj0YPLXKebWUkXRG=dWew1SVg@mail.gmail.com>
Subject: Re: [PATCH] tcg: Revert "tcg/optimize: Flush data at labels not
 TCG_OPF_BB_END"
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu@igor2.repo.hu, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Nov 2020 at 21:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This reverts commit cd0372c515c4732d8bd3777cdd995c139c7ed7ea.
>
> The patch is incorrect in that it retains copies between globals and
> non-local temps, and non-local temps still die at the end of the BB.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I assume you're going to put this in a pullreq at some point
before rc1?

thanks
-- PMM

