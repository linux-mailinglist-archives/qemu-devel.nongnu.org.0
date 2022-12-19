Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF78650F41
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:51:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IQA-0002PC-MW; Mon, 19 Dec 2022 10:51:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7IQ5-0002Mf-Ti
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:13 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7IQ3-0000YE-GF
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:13 -0500
Received: by mail-wr1-x433.google.com with SMTP id co23so9106489wrb.4
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 07:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=27K/oEADLjCIvYpbpXqyoXCqtosYfECuaL6ZQEu7+Tk=;
 b=CLzcQCsbhdZ5so94Z/KiZFVF2gSM1qHO0W3dccc5ERDg9nzijv8hWRbzChhR1dtbU5
 WHFrL/UG1aR98oIrXPzI+jZ14bF6Sxy2ZUysyEA+X6xO1Ey2aBnyX8J7Hp3Wyw35lnS6
 0Llx5QAA5tk61tgG1D0ei9/GEUBlNzJCLM4ScsBupN6duTONF9qQoLSuFhk0bOt9Wo3Y
 6XGoSXqS/fZD15wd8TBwm/dXVrxft6icWUhWAMezt7TdoGN/mqmqt7YmZdbbctJ+Pzme
 o/8xBKdSZfq+4HOPAaljfQWltcM21KtahpiSwJLXxKhTgX8uRG6WtbKRgd8Ht8XkE7Re
 F4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=27K/oEADLjCIvYpbpXqyoXCqtosYfECuaL6ZQEu7+Tk=;
 b=ir+6SRyGGN9mvSNp4wb5RiFqlsRPoATGnWDYpkoSxfoI4JdHW6Wb9Ipgqfng3tpwRt
 adj8OBU+XSRBEMXrfCE4mUTyBg4RyCaGe5Hjm2vPtfU7TiWv3abScFc3q+6SkDlTCQ7S
 qLEciQyoThCEyKzqeCT3S0oqfsZzetDoX+CkLvVMMmY/yDGrDN5wVUlGlRnelLavKvKm
 Qk4BD7w7x2ALCu1ToUcSb6qu8uF7Vh5HBU6q066E3lPwVwbbvYA3BIQ5l06+b6h7we5c
 WcMx2LMb75mhKvKMssXwWuZU4qKgb2PjaFcYVizDKgpGVDGPjqsH6patfUig2wYg4mlv
 ZFHw==
X-Gm-Message-State: ANoB5plMeiaGKiSZkDWjvKdt2yCw6MV42xyMGfqqhrhJK4Jca0QTAcON
 qsS2+fDi7bMUAP2O7sX/9VQcdg==
X-Google-Smtp-Source: AA0mqf6rwmzvNZd8Sub0cbJ6ZMbP43n+KKVLHpK8laoWqD/koJG5sxs+Kgc35uIPnICivLFnCqN8Dw==
X-Received: by 2002:adf:fe46:0:b0:242:1d48:e047 with SMTP id
 m6-20020adffe46000000b002421d48e047mr26542016wrs.34.1671465067761; 
 Mon, 19 Dec 2022 07:51:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i7-20020adffc07000000b00241d544c9b1sm11932240wrr.90.2022.12.19.07.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 07:51:07 -0800 (PST)
Message-ID: <c4173d60-6635-899d-28dd-f82c9008eb0d@linaro.org>
Date: Mon, 19 Dec 2022 16:51:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 05/11] contrib/gitdm: Add Ventana Micro Systems to the
 domain map
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Sunil V L <sunilvl@ventanamicro.com>,
 Rahul Pathak <rpathak@ventanamicro.com>, Anup Patel
 <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>
References: <20221219121914.851488-1-alex.bennee@linaro.org>
 <20221219121914.851488-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221219121914.851488-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

+Drew

On 19/12/22 13:19, Alex Bennée wrote:
> We have a number of contributors from this domain which looks like it
> is a corporate endeavour.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Sunil V L <sunilvl@ventanamicro.com>
> Cc: Rahul Pathak <rpathak@ventanamicro.com>
> Cc: Anup Patel <apatel@ventanamicro.com>
> ---
>   contrib/gitdm/domain-map | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
> index 7ff511d5c6..727df18879 100644
> --- a/contrib/gitdm/domain-map
> +++ b/contrib/gitdm/domain-map
> @@ -39,6 +39,7 @@ siemens.com     Siemens
>   sifive.com      SiFive
>   suse.com        SUSE
>   suse.de         SUSE
> +ventanamicro.com Ventana Micro Systems
>   virtuozzo.com   Virtuozzo
>   vrull.eu        VRULL
>   wdc.com         Western Digital


