Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC42557934
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 13:57:30 +0200 (CEST)
Received: from localhost ([::1]:50100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4LSj-0000xf-Q0
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 07:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4LIl-0004BH-Bh
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 07:47:12 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:40511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4LIi-0003l6-0x
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 07:47:09 -0400
Received: by mail-yb1-xb33.google.com with SMTP id e4so22700787ybq.7
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 04:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b2vozZk82MWrSg5nOJlYytZcI0E9xK26TawTM1Kq6DY=;
 b=p801a0acgNSeV/+tXpkGVxjx8eLfGl6Gaek9cdzLMZeduTM/rp+GHPEH0R8VSlYSmM
 i2/6B/wOb8YFDXrxncoI/Q8xafu8Pw8Wk8R8WtZCVZucRDu4tYXnbUg2feKYnB+vCgkV
 O6O4YrPg8zBREUpHPCzrSrtm0ZRNtDTNEB3yJ6bV7B7rLrqJg3/zkJcuLub8CRVEze4A
 RsljfOB0f7VGZEvwY8Bh2lYBB1UqqsfBtoPMkPWfLCswnkvpFU9xN3aUZXiA1gYdUgEm
 YbFCnC+2lZgDiMPAN5irg9UDwa0ie/yCrTW2xdRh0dyfmSPEUoqBmqlgT8mfScrlVxh5
 9OxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b2vozZk82MWrSg5nOJlYytZcI0E9xK26TawTM1Kq6DY=;
 b=6TzR5qr5XeHd5BqlJpRIaO3mwxKJl4rRhGasR0JBc5+qPHyimb5mWB3J/svaX0LuJp
 fuZGGqFQ4pflOeIrUA1nx3+QUGHUDoYRQPgqmyGWq0XBClFOj/QuFYalS3XRJPshLjNa
 upCofJM+Xy6NnA4cT+zwwNsCfIG4o9tKSNyo/AnCTDPzKdsz+Cp4bP1PcfTs4kHLBNGp
 t5V49gdo4tv22YEjNiqJYdiycROZg8Tox43YXP1OIwj1C3Ln6u8CgKTa3kB6R28LwVWJ
 7kf3Q7oXKRZmq2oupINjtAgsngPOL78B7atBPBIE3HBFT3IBol5F5CXtV8PyRQq4G9/t
 Btlw==
X-Gm-Message-State: AJIora/7Ln76za7N8Pde+xdBI2i1jAJCchXIfWiXMOs6Ab8S0tsYeRwf
 2CLSyktX5ix/t5mkckxpEaGBfAV5evMkjhOFw94vKQaU4rA=
X-Google-Smtp-Source: AGRyM1tXCCuGvdaYtfVT9p91Ikgoh+Dyp0wcVOvM+LhE8VYKCsdFM08fgV2xTyZHTIgwunzPO1HtHXMNX+tnu+My9f4=
X-Received: by 2002:a25:810a:0:b0:669:9f30:7f1e with SMTP id
 o10-20020a25810a000000b006699f307f1emr5964158ybk.479.1655984826909; Thu, 23
 Jun 2022 04:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-29-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 12:46:56 +0100
Message-ID: <CAFEAcA8y4iiB2jeSHzi437Bvs7CdV6fKtKNV9BDjqLNmVN7dYQ@mail.gmail.com>
Subject: Re: [PATCH v3 28/51] target/arm: Implement SME LDR, STR
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Jun 2022 at 19:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can reuse the SVE functions for LDR and STR, passing in the
> base of the ZA vector and a zero offset.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sme.decode      |  7 +++++++
>  target/arm/translate-sme.c | 23 +++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

