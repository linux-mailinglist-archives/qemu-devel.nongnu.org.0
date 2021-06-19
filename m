Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4280B3ADA84
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 17:12:34 +0200 (CEST)
Received: from localhost ([::1]:34988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luce9-0000GL-Bl
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 11:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lucaD-0003l3-UX
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:08:29 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lucaA-0001UL-TI
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:08:29 -0400
Received: by mail-wr1-x432.google.com with SMTP id n7so14254222wri.3
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W/EN9wu/ntlYKscSalFj6QmKaIrrBAjEPyprFAuJD08=;
 b=MeuhUCN/7iRTC4rWct+sh/if86Mi6C0FWDj60IdWx9jwyVu79bqLLcAe1AzOEOWIOF
 QsmVp7UxtT3d9CvZbimHv8qhUAtF3egPc/C/qOHHlCTWCS1HCGKkBq/gD2B9mIEMahHY
 fr6Hl4ULWeerM1k+hgjlRroZMN0oG1ROLhwvJM/V4JkZOtZRjEmu+lcENLbHnIaTZ2qw
 JqG1vyn0nueW1aJVguvs4goLQGvS+uOckry3AWYIA9f8XiCPsUtMr7pD77UVcpnBmVFS
 nHBS7gPh36xd98+qsmhR4uQlyuzGzZ7fqtWqcnX9yduXR/Vds0WMELaA0iwyco46ZA6E
 pKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W/EN9wu/ntlYKscSalFj6QmKaIrrBAjEPyprFAuJD08=;
 b=KHYk9EPjYf1ncY0yFMeYlJYBSA1R2VryEzE5fwva0imhzqXZP4xtQPRmDZf/MEWkxu
 Of7WbJ5yWhYZDd2KM12sHPBxESg6MMqyGMRbf8bDqgoyiBa6gWIR56JvsstQ4Yo8gdQt
 OaMPj8pb1leDwZKxNJJp425mZFyawGwOfwqaF8LpMKYRpajfsBROKwv+T0RsK8QiH5hV
 muId7p/5N8HjckFM/ClO4QSsntB5BfHkvVz/NtrYV7bKDCAv+lwDXj+exoie3upyVQDX
 e/NQHSw342CF9SdM+jUfvFff3lR/KMgrZ8R5Gyg4QCAt5KeEAGcW9pywf6ApVVmUi712
 kM2g==
X-Gm-Message-State: AOAM532rDdI6sMdEzntB6KKavI/fROe/DlUBfekL6n6T7Bgg9irwGj5a
 h1mrAlSnHdCkGW74en4B6Mc=
X-Google-Smtp-Source: ABdhPJw89If5J5O60+gC/QfVTAX3nSi/KGCerpVdrqydAGIwxq/uqB55ncoBOgYWGPUmUkr87CPjMg==
X-Received: by 2002:adf:fe86:: with SMTP id l6mr18744425wrr.106.1624115303345; 
 Sat, 19 Jun 2021 08:08:23 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n13sm13159224wrg.75.2021.06.19.08.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 08:08:22 -0700 (PDT)
Subject: Re: [PATCH 01/11] softfloat: Rename float_flag_input_denormal to
 float_flag_iflush_denormal
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1e7ad295-cbd4-56ad-6e75-7c15f28de0b2@amsat.org>
Date: Sat, 19 Jun 2021 17:08:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210527041405.391567-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mmorrell@tachyum.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 6:13 AM, Richard Henderson wrote:
> The new name emphasizes that the input denormal has been flushed to zero.
> 
> Patch created mechanically using:
>   sed -i s,float_flag_input_denormal,float_flag_iflush_denormal,g \
>     $(git grep -l float_flag_input_denormal)
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/fpu/softfloat-types.h |  2 +-
>  fpu/softfloat.c               |  4 ++--
>  target/arm/sve_helper.c       |  6 +++---
>  target/arm/vfp_helper.c       | 10 +++++-----
>  target/i386/tcg/fpu_helper.c  |  6 +++---
>  target/mips/tcg/msa_helper.c  |  2 +-
>  target/rx/op_helper.c         |  2 +-
>  fpu/softfloat-parts.c.inc     |  2 +-
>  8 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

