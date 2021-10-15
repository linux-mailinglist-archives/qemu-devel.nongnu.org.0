Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFC742E51E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 02:16:25 +0200 (CEST)
Received: from localhost ([::1]:33648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbAtd-0008M2-1o
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 20:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbAsD-0007cf-Dw
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 20:14:57 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:39505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbAsB-0006Sp-Ny
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 20:14:57 -0400
Received: by mail-pf1-x436.google.com with SMTP id x130so6876035pfd.6
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 17:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OKDtdkLVcMqaZDjsPKM7wNPihf3qa+L4h4AOpldtFLs=;
 b=reXm320y24AS0x8wEpxL8oG4XRzKrK3ExmqKK2nosI3yM0KSbF5r1SDWATB5ZyaNzS
 xiqGt/2bB0if7Xm9l8cBQlqXj3g+zVNWmSdlDdNTVOKSN/iMwEBpW39GlCKfbsgaAX93
 S0vJXRNrrXB+ROIVcVk+bjQRPINX9pYXfNwOnRI3LNKcw461eF0nl3pS1/sdNLvdD4zY
 aSmL/LqbMlNdX4HHPtXZBeltaEIcmEFxA31exnl7jPMf2UFHf3lu3GAD/ivC0pkmzEnG
 AlciEkyyLKGbGmHNGYKXJz+ZJc2aO4ZwOo/3Qp6l/QpxPVczMaySecEdsdM/1yrsJLZZ
 yhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OKDtdkLVcMqaZDjsPKM7wNPihf3qa+L4h4AOpldtFLs=;
 b=LZoS5nm+QVddp5kXZMajh1RWpTF6NLjq7/fOpFWGK7/FVYymI6aj9+IhrwSZAOCUf/
 +DN5kzxft5lY7V9fWwHmvoJQ6LMf9Cvfdd5nxhoIGxQD6ume1T92zrl6cxA1/Ok32sOr
 yGtBlQFH2Es4C66cQy9QYSVxQBCF5lOTUm2POGMqhrYnAaMvODXK8Hvf/+BEMaO9DACu
 1c0kypDSJQCbn167bGWzM7v0Hoa0hbq/LGgrIQK9IkAkyTzWOgwGd5ScUbE7VI8FVtga
 kFtqVXs169f/ei7frAdPhOKgJP9KXtcAbc95UMf7X8t2P2uCghQbsQuJKWryRVt3dI8I
 X3Uw==
X-Gm-Message-State: AOAM530ql0yep9WhNQH2YhWvzrLt4kDp6JjJsOSTxv/86afaM1d3QxVb
 ratxJqs/ijUnwmnru+zmWuJM9w==
X-Google-Smtp-Source: ABdhPJzlB5cqhiN1SUDy1l8JyBaOZtsbyj1jJTKUTNOjVFhdzFYEl8cYOwrpipurNFeywEIrjcH97Q==
X-Received: by 2002:a62:33c2:0:b0:44d:ab9:2e92 with SMTP id
 z185-20020a6233c2000000b0044d0ab92e92mr8515249pfz.10.1634256894279; 
 Thu, 14 Oct 2021 17:14:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm3905391pjb.39.2021.10.14.17.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 17:14:53 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Remove unused TCG temporary in
 gen_mipsdsp_accinsn()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211014224551.2204949-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2475438b-a579-3f9b-be4f-5489d00e7857@linaro.org>
Date: Thu, 14 Oct 2021 17:14:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014224551.2204949-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 3:45 PM, Philippe Mathieu-Daudé wrote:
> Since gen_mipsdsp_accinsn() got added in commit b53371ed5d4
> ("target-mips: Add ASE DSP accumulator instructions"), the
> 'v2_t' TCG temporary has never been used. Remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.c | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

