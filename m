Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6AF563423
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 15:11:44 +0200 (CEST)
Received: from localhost ([::1]:50666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7GQx-0000KN-2l
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 09:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7GLi-0002K4-CE
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:06:18 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:38804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7GLg-0006V5-UD
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:06:18 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id d5so3967869yba.5
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 06:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t97n0lowSdRzsZn+ij8zuykceC8ztt3y1D1DUgYzz58=;
 b=jWrzGJz7fMIISqXyf2HmIfI5mT3uZRnYCMcReTRwlraWGKETzvWjtzp0XjGhDc2s2s
 5bOypCKsKC2jKsWtgj5INcKMkS2Hxg/Doe1O3HuInkJ3Je43V8xMGaPB8Vq9JD9Cmrlc
 u4OD0+NfxwLXph2V7imEnkgnaH+jOnYCEj7vikDjmvckA5j/erdwPUvIlbkgW4rTrIUD
 tFPREl6zLSTQH0yzun+oBFg1cfoWvegNj1hEf2/2KK32YWSToyHBromKxEYZa1WK+SVq
 Ot8I+vE6iTZfdw5cQyNIrNYfjJLwV9AwaGHKAsbg4RXXRHeYi8BehcRKHEGDYRY7aH72
 lFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t97n0lowSdRzsZn+ij8zuykceC8ztt3y1D1DUgYzz58=;
 b=X92VAj6XX5xbPgkx8OyqBlO8LsjXODY/C/NrUp4sfkSBPMerjfR0SIqwwAaMSQv4mb
 hPLKvzb8QyjR6zDg1wyjbtMct1hli+ZFZZWVudz4kQBdpDZ4rbk20BLQuqa1hYpLadL8
 llSI7p0j2HzPuwfp9BjDP7TlYQUSOTAawLAwz1gc+s+EOssKljSo/dnsszVoeUiMG/fT
 KssCJ4nAAwM4S3TV1V9wI14WyNuEQ3bQk+jLdAPRGhjVqqs5vPuMTXenqFRuC7KNN56N
 iKXtIqBWgbDgtoRRj6k1K1/lnekRModwTBGvZaGPUeYkHxGAJK9JCjMXtg283gi1VBJE
 p7Ng==
X-Gm-Message-State: AJIora+V/+i/aa3kPT3rJsQBFX6KeeoLkDgoa+ZWnG2g7cA8UG/z3rCJ
 oaeQFRgVP3/EvoTlcocOxzMkqlJV3lnkowVZCQdomnMGtv0=
X-Google-Smtp-Source: AGRyM1sWbUeAxXX/4zb1c5dA6G2J7K1j6dXIdSS9HVCc5BF5tzURD9aiKkjPTdgUYDSB9gtLPHfwa3UG+1z6DPBWQWg=
X-Received: by 2002:a25:d655:0:b0:66c:84b7:df40 with SMTP id
 n82-20020a25d655000000b0066c84b7df40mr16846732ybg.193.1656680775580; Fri, 01
 Jul 2022 06:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-16-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 14:05:37 +0100
Message-ID: <CAFEAcA8d3hJVoiU9VS8_DtG5THpJxH4SQ=-DyjEqgvTnCTVHpQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/45] target/arm: Add SME enablement checks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Tue, 28 Jun 2022 at 05:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These functions will be used to verify that the cpu
> is in the correct state for a given instruction.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

