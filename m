Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94325131A3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:52:24 +0200 (CEST)
Received: from localhost ([::1]:57354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1l1-0007AJ-K9
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0x5-00021A-2x
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:00:51 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:41878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0wz-000293-WD
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:00:46 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2ebf4b91212so46852547b3.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6kIO9FCCHj+hMXMfWhUrDz4/r16wzGBAm/zJPF71ee8=;
 b=qkFFmiVGPbUNQkVVpqUjw89C+7VLT7k7MiO67aQmKq17pxk7oCw2BnUYlhxJh/ms1D
 xusCk7ASNWZzcyZL0LrhyQA7jrqyoxtR5do137CAvU3y46QmMbKsExVXmYYv1IyRVt3G
 jkJ5ROU7odAGWoR4IxuOX1OChFw5inqVf/RGcBvt+bTU4cUyeaE96YBPooJcAGZR9PK2
 NeKsNc3g3qpDSCPq636fkUc6dtn2AiuOdX4lMuz+Oe7KVMlj3qVUFQ8q3/stikl7PFyc
 PE4jAjLhjh69kyuUctL+ZLranjnTGDfG7QKUIKloSwZrS1tAsguhfa7XFV9wwr6x+LQq
 GF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6kIO9FCCHj+hMXMfWhUrDz4/r16wzGBAm/zJPF71ee8=;
 b=anFvlmeec0++suFSQhDit4dtI95pDHgxLf6WxkuJQ4xzBSkYYPIKWw/XMuBh54Qysj
 IuayaN+DsHFiyToaLjkr+ReHVB1altEInZY8OxCo3uV+ChuLGTp+udSClhTNwPH+37lz
 s83N133C5NF1H0P7jTYR5BgyaOP3CWIfcIIPgbkz9a0ePddHfop7NuAmtJ/ThBE/ARJB
 R9fYUnAT1j3zV0+MZ3lYNZTvYwWJ1dZY3l6256KFd4o8rSsko+Ir/8V81W2xVHY4OfPF
 3u1QqBsxtDvBOK6ZT7242eji9cjIIs41kHip1AablS/TXCxlgt7FFY/iCJ+Z1RISQxHG
 Js1w==
X-Gm-Message-State: AOAM530sONSKmxyjCVSbjtHLR/oa4Pgt8HkCUOr5aNDue2ABQgsuYSyR
 Udxo82CGTlVhU4kQRHsuyJn44Z1yRBYBIzX0/wvZ3g==
X-Google-Smtp-Source: ABdhPJwnMXQfLt8FfNiqfxtjUTsCsTXkXqcyt597Od/lV5j7O6hLy7cIzlED7rZbrr6Cbo4z/rMoMhtD09VIFe4PrSo=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr32056758ywf.347.1651140040991; Thu, 28
 Apr 2022 03:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-16-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:00:29 +0100
Message-ID: <CAFEAcA-2H3fyjstzk64M0Z7y+6ie-15eWE2f6zhOXBtThCsPrw@mail.gmail.com>
Subject: Re: [PATCH 15/47] target/arm: Use tcg_constant in handle_{rev16,
 crc32}
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 7 ++-----

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

