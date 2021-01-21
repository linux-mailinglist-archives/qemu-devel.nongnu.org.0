Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4DD2FF536
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:57:09 +0100 (CET)
Received: from localhost ([::1]:58052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2g4q-0001d0-O5
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2fyD-0005SV-Bk
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:50:17 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:37512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2fyB-00077u-Kv
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:50:16 -0500
Received: by mail-pf1-x42b.google.com with SMTP id 11so2160262pfu.4
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a+pmh8R31hNMuSHzoRe90SJdHcIl1Ul8bqPwu1AwCUY=;
 b=uiFNivgZ8TFtEc12UkLD9VwzMRUk3Lsr9T7BMsZ1b0SEqOin4fufB673W8GswIZXPq
 AJv+RVmODV8TfnIjAvPb48jKlaguiJu7UJdW1ky5wlf9Ybiczi3vXIUkTlRJ4xIUHhYk
 Ni2ktobllPywKSz0HhzPKQUfrPhutJVzVhc5A4CSltICgm4ZBsWOjk/8h3Nf/ZyNsK6g
 mk7IDL9oyPgP6ZBsGknOjObWe7EPI1f9RFv7lpcICwVIImOr5QqpRD//UQYobekIff/N
 EnAz9l75aEHrxuFzrFmQNB6Ouhkt24GtmeuVIHMBAVrUzUVAYUSi8qe9AzltXdS2kOIN
 FCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a+pmh8R31hNMuSHzoRe90SJdHcIl1Ul8bqPwu1AwCUY=;
 b=p28+Bsr5Nkl+ZB4hOXoLukBGfHDBhcn+4kbVMb34nZ7KHX10SSQR+FKrIRW5GysWWY
 PK7T4SevI/xSHp6nbfDfB9Tq7dTU+COg452qYvuvZgTgmhveH8vqeopdzQQwRWrNMOIE
 RPZcCs6yPY9u1eVJEvqES9LhEAs6keLFNArwqxDVkqYOeB0HHPL2HKryK6cjqk81y13r
 uWKlx80RrUVQI6IEByIpAJ/XrzWCi9xWqH5Bo9GZMNmonTDylLyc22nuwfYcEP+CF0So
 ptaZqEx9NT/pPBrL/83AG/SxZfENp4MEi8kVYLAPS/tP4PBUiI75365Wxroku/GCrxYQ
 QOhQ==
X-Gm-Message-State: AOAM5331Lb9uwFyzH23fmWdGvQ7/jbMDeOqBVYvOz+GkURrRB+O1rvbl
 yII71dVA5isZIIwJg1VJnxyllQ==
X-Google-Smtp-Source: ABdhPJy0clTfczNyh+iG5UxQvc4SAB8cCRbUJEhpYXa8pZ07jliZqRuX8ma/+jaO9Y4ccOUTlWqHZg==
X-Received: by 2002:a62:5547:0:b029:1a4:cb2a:2833 with SMTP id
 j68-20020a6255470000b02901a4cb2a2833mr1007974pfb.35.1611258614146; 
 Thu, 21 Jan 2021 11:50:14 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id x127sm6254470pfb.74.2021.01.21.11.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 11:50:13 -0800 (PST)
Subject: Re: [PATCH 1/6] target/mips: Re-introduce OPC_ADDUH_QB_DSP and
 OPC_MUL_PH_DSP
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210112215504.2093955-1-f4bug@amsat.org>
 <20210112215504.2093955-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <88651c29-66be-95e8-2a37-2672dc3135c6@linaro.org>
Date: Thu, 21 Jan 2021 09:50:10 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112215504.2093955-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 11:54 AM, Philippe Mathieu-Daudé wrote:
> There is no issue having multiple enum declarations with
> the same value. As we are going to remove the OPC_MULT_G_2E
> definition in few commits, restore the OPC_ADDUH_QB_DSP and
> OPC_MUL_PH_DSP definitions and use them where they belong.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

