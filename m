Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E024B364AE0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:58:56 +0200 (CEST)
Received: from localhost ([::1]:36662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYa2o-0005ER-HR
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYZfr-0007kT-SA
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:35:11 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:33767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYZff-00082t-R6
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:35:11 -0400
Received: by mail-qv1-xf36.google.com with SMTP id ef17so11809620qvb.0
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vtweZXpFmSQUe1OgksQa+q9EUyKuQCXyIFzv9judwik=;
 b=H1GViRaVv+GoI2VYONWZQLWlbyzgxOE7AmSn5fI2Whnjpq4PX6hkGM+LqLuj7fuTor
 b84bLapteWUwVXuI+1Q2CcRLSKgOY8vmx92Te72KyameUbJDSFG6ldVJnsK/xDWOXvQR
 2OGmBHiOd1xQrCBY4FKm4jtIIJKyXP/p817mqjZYgrNWimzrhF0yqnQLw5hHBWPQlN5f
 nIEsaZGSJasOE0yrMps9Gu6HWhpKBGm8LdEk+2EFQAfJ/+TcOEcsf3HNBRyoFFUCgNu4
 TBFqem8jbzw/FdgQGIJoNFpXhuzGdEVvHATIg7OHahwMuPaoZCB/uOkTbyCKRpxCdfLQ
 74Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vtweZXpFmSQUe1OgksQa+q9EUyKuQCXyIFzv9judwik=;
 b=Uk8r2jvNtNHOkezRgCn5unvQyhOBDai61jJdfQHAe/YZNw3bPtvgjNciMJdQM09GJb
 plFAle1djbi0Ps/96ZYxigWrSVQAOnbzswVo10KRyt7iowyOhKDxhDt8F8R//WrX3g6/
 rkxra7CoaCd9vfVHBxBLjm1e6coQ2PPC1ebGfq59PGb3EzXmaRvGHze54afO/euwv23b
 n2MwrrBEj5LcHNWV6E65zryeW1RQN7c48nTi5XL5ltiAdq9vz65O9q04D0wp8rcTZz70
 Bw75SjFvaxQ4qePMSXB+AkYXEyoyvejte1+scbejV6W2eXwG6gqnqcsFlxo9qo35hSBA
 rK5Q==
X-Gm-Message-State: AOAM531t3dNGWIOl12vl/N9g8Qfhj7wKv3FxHGCE6Msa2U6zzIcduMDj
 uQcB5RGwEdr3IQAzleOYCNF23Q==
X-Google-Smtp-Source: ABdhPJxceptJBKPSoyqlSoK0bj34cIAIF0L7L6PI3Ug8q8Me/5p5xDfHkvVcHH6ZRNh1PM/CO5R7qg==
X-Received: by 2002:ad4:4e45:: with SMTP id eb5mr11598135qvb.12.1618860898129; 
 Mon, 19 Apr 2021 12:34:58 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c7:aba4:3594:91a:8889:c77a?
 ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id l16sm10492884qkg.91.2021.04.19.12.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 12:34:57 -0700 (PDT)
Subject: Re: [PATCH v3 19/30] target/mips: Move sysemu TCG-specific code to
 tcg/sysemu/ subfolder
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419191823.1555482-1-f4bug@amsat.org>
 <20210419191823.1555482-20-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2f088e2c-f599-309e-8806-582b10509e8f@linaro.org>
Date: Mon, 19 Apr 2021 12:34:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419191823.1555482-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 12:18 PM, Philippe Mathieu-Daudé wrote:
> Move cp0_helper.c and mips-semi.c to the new tcg/sysemu/ folder,
> adapting the Meson machinery.
> 
> Move the opcode definitions to tcg/sysemu_helper.h.inc.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/helper.h                      | 166 +--------------------
>   target/mips/tcg/sysemu_helper.h.inc       | 168 ++++++++++++++++++++++
>   target/mips/{ => tcg/sysemu}/cp0_helper.c |   0
>   target/mips/{ => tcg/sysemu}/mips-semi.c  |   0
>   target/mips/meson.build                   |   5 -
>   target/mips/tcg/meson.build               |   3 +
>   target/mips/tcg/sysemu/meson.build        |   4 +
>   7 files changed, 179 insertions(+), 167 deletions(-)
>   create mode 100644 target/mips/tcg/sysemu_helper.h.inc
>   rename target/mips/{ => tcg/sysemu}/cp0_helper.c (100%)
>   rename target/mips/{ => tcg/sysemu}/mips-semi.c (100%)
>   create mode 100644 target/mips/tcg/sysemu/meson.build

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


