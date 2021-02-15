Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F205A31C316
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 21:40:08 +0100 (CET)
Received: from localhost ([::1]:49716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBkfA-00023Q-34
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 15:40:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBkdI-0001X6-2O
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:38:14 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBkdG-0003f3-IW
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:38:11 -0500
Received: by mail-pf1-x42c.google.com with SMTP id w18so4830573pfu.9
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 12:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2370xIefxS67sl/RdyAxNHYJE/sVc9Y8DaeDhg/i0nE=;
 b=KouufIcLg/6WECNP5yUu/OdyNfWiYwrHRIgAVotMXRSag7Lzggrm4cR+5x3y6p3pt9
 wbvK3WcV3zIf5ffkBswg3ncfdlioz9NzShwIZDx7RDLvqPTkGh90gVE04lIDqJ1WTJCx
 Lnu9iHrT/FPBMG/GoGWKRi6gdrQRWLqk8UISQ3B9kd/XYxlbjGl+rtoFDr77+rwPuCOv
 nWKEsEhcy/9WqBPJnEZqg8hQrg8Aw2l2EedJH2XLIAgxJaoUsKVvITUnH5zbGZANpHIQ
 j586GjZvSYGXzH9DJYt5gleg+PeXhiqb5dniMKV2ddG8e1S0XQiSxtESxgTjLFXWIgiP
 Az2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2370xIefxS67sl/RdyAxNHYJE/sVc9Y8DaeDhg/i0nE=;
 b=YI1TXUgt84O6DkDEujEhdS8kpke+aqjJq9rU2crnWSfcqfRcQ56p9aGuPo4f7psOnf
 dtZsgC2qNSxNGurJmDJ8PIiqM8g7/an7uCtWwbfR9rRUtwRtCjqR7e7Ohqt6qa3jzNFN
 43/dPCSdUBqxKtc5DstJJcNNNPnVJVovtSfeCnV4p/ShR91aVg3aszcXd3Q2/PDx7oLA
 LwYxlWhaAW9PQLkpQgLV71BhiaZHQ8mhtDNHLzDx3G+KLsLzjsJeP9P9oC9eYFDif6M4
 T6Xm13TrRNiryU1i0L65zayZNU7cYRr3vGlYNT05LBlYV5kFOqu29BVPSjza8IdGHvVA
 hN2Q==
X-Gm-Message-State: AOAM531aZPecKPx9gNhjZ+ZVqN4mEgkpNcQqrep0Hvvcymz1n+C7Ci1x
 h663yOu81YvsXyOEBhf2YOPGng==
X-Google-Smtp-Source: ABdhPJwfhoEK0oLUBQ3G/lWnIhvfG1MVwwlRgwo+EFpiBqKYQQL5eplLXbk4kN4PQIWBwKWDKnv7ag==
X-Received: by 2002:a63:794:: with SMTP id 142mr367664pgh.323.1613421489115;
 Mon, 15 Feb 2021 12:38:09 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id g17sm20706319pfq.135.2021.02.15.12.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 12:38:08 -0800 (PST)
Subject: Re: [RFC PATCH 21/42] target/mips/tx79: Introduce PPACW opcode
 (Parallel Pack to Word)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-22-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <83dcc5cd-4ba0-4852-b35f-f69b0824142b@linaro.org>
Date: Mon, 15 Feb 2021 12:38:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-22-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> Introduce the PPACW opcode (Parallel Pack to Word).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tx79.decode      |  1 +
>  target/mips/tx79_translate.c | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

