Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EA72FF754
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 22:33:26 +0100 (CET)
Received: from localhost ([::1]:35634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ha0-0000ue-MO
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 16:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2hXl-00086x-UK; Thu, 21 Jan 2021 16:31:07 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:36216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2hXi-0002w4-OI; Thu, 21 Jan 2021 16:31:04 -0500
Received: by mail-ej1-x631.google.com with SMTP id l9so4737435ejx.3;
 Thu, 21 Jan 2021 13:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4/iUgRtZ+SdfZuLBX06+kzSTOFhrQyTCfQBm5lELLK0=;
 b=oppMkzrSPBxAAvFtwBvggNqVmI/8KkFOYgeniCnvii09RRkM0DY8d8GkrD3LMhVlmM
 vHc1D9ra34BwZuRm9HQYSyfsWFw9/29zvxNAffZk8yTthcccVB0Dj3WqLp8tA+2sx4eo
 FCfcWu5UafcWoOhko+MCyxZKyPK2qRQ5EP4wpbSt5m+zVAVFU4LnSILIRyoOylLM2+X5
 no4Q4e62I+7814VvN1jOPqWKrfUzDQMOAcuk1yrEM5TDsaZIzhSn+acduP44tcjDKwXP
 5arNGgqatXNTHPbkYcb8i9CLFEKHVYUmkk15yYNgqj7zLTrC4IDVWwXfEq0Ku3/OwD4H
 TuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4/iUgRtZ+SdfZuLBX06+kzSTOFhrQyTCfQBm5lELLK0=;
 b=XQd0lZ+VJbSn+itLCc8Y6qywP9Y6ghpgBeAJd2CJuvJ8UriM12bqz6DadyacRsTLtR
 9O6PTrpicsmfifRTOjfZUnQ5B0JfpGxxPsFlU5HAZD1O9jumrrGGvaPRSoeLZdnjHTCZ
 RBD5pz1rYWRdIgwfvoF/+JM+xyKF6eRdgMik8pJI1dp18NK93JMO08v4gPdhs2R0r6Tz
 TBzW02wSUq7z8mzOWSaCSdraSiEFsWKo0SZThgPCp8ZF5kiVyiJwF2FuWHbONS5h2/LY
 uuSk3PJpVRbfAiUql+Sw5M8kTSHiElWuyUkWKw64D8k31qC1EHUvNvblbk1olK/jegNZ
 Nq4w==
X-Gm-Message-State: AOAM531e3InHFQX0pwrDRJyD1gq+VnOrPDfZyQiijjfWMAF6YngvMH08
 l2EuilbbyK9CEZXc5FBLzmji/42vowQ=
X-Google-Smtp-Source: ABdhPJwqz8yVyLgGrfaCwPX5bOJcVTB4iyZSKA9o8huoa84cUKzfsek6TDDIpSg21Us3tUWXZpFw5A==
X-Received: by 2002:a17:906:958f:: with SMTP id
 r15mr923901ejx.360.1611264660808; 
 Thu, 21 Jan 2021 13:31:00 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id bd5sm2970988edb.86.2021.01.21.13.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 13:31:00 -0800 (PST)
Subject: Re: [PATCH 15/25] hw/arm/musca: Create and connect ARMSSE Clocks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-16-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <50daef47-3304-7395-b9b9-c32823c04324@amsat.org>
Date: Thu, 21 Jan 2021 22:30:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Create and connect the two clocks needed by the ARMSSE.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/musca.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


