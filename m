Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648A431CCB8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:14:24 +0100 (CET)
Received: from localhost ([::1]:52362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC23T-0008Ba-FF
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:14:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lC21o-00071L-ES; Tue, 16 Feb 2021 10:12:40 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lC21m-0007GP-Ej; Tue, 16 Feb 2021 10:12:40 -0500
Received: by mail-wr1-x429.google.com with SMTP id n4so10518425wrx.1;
 Tue, 16 Feb 2021 07:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9U+8kdwOD6jV5PolfEGw5egJMdW4GUNPrLCIJReKgmY=;
 b=kmzWtwaCmJSj2+CGDx65X3SMM9dCfvW7mz39dAybttoiiC8Jg3R2qtO3094YEBRqiq
 1r7gjtAHpxWv7I8XkStcofN8td6ZISxuASd1J6hAnFutkS4dEjYLvqFue1Yc94s8TALa
 IdXcQGxQmNHXJ4TUBmvFyvvB0ACl0cWc3pvOVwbsNZDJAiobHHchRba6ES6IJMjFtFeu
 EADbZLG8WljmAZ3P8I3G71jHPBIdgEBxtDdnRSvJZNYS0xIPMCsd76IWN7VKt2S4FMYG
 yMCd8s96GDFXAc7rEhqDdFgEuLtwiFH9I08hxJ5pnRZJUhNx4LrHhbl0k+9Hk0BTcro9
 HvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9U+8kdwOD6jV5PolfEGw5egJMdW4GUNPrLCIJReKgmY=;
 b=KGdkPDL6yISAbO1v35VBmQaGmN/d6K4C8MSXPnHXAnGL0/L3fOTsqjtXqWX9CNpxWH
 OEFnRy8dZBx6KRbgke/jrTH7nCdwZvoqmLJdoV5cRIO2i63Zw+V5R8WaPOZztNRK/UYB
 uGqT2Il+gzDVNnp1ItaSCLFKXbsIUzRkVfGPe5ZoNoRLSww5zsHQrS4x/X4J9xfYRGfr
 eNSP0a/2+XhlV1ObeU0iWkv7Ccq13RB9ooQ5h72LeA9BeDz8SbSCe8CrH2CIOLBzBWh0
 KZwL8R4VuwR+Kj2/82YSv7PTGH+azCGw1YMt8fH0IMjYqJAuUeYW1D9oGma12imcoXpX
 ob6A==
X-Gm-Message-State: AOAM5329dr1MswZsBf3stj3ZfIYC+MwTWlQbDD3JeH4XynXgfPzYfb8h
 UCystNm52SHssgUB5gvu9V7rOlfdCZg=
X-Google-Smtp-Source: ABdhPJzranZnx4h70uRNdA/dw+ZETzhkqCVYHpNZym4ZQvrhfh7GtMR1v8AfXXZgt0+Tt8lKr+EDPQ==
X-Received: by 2002:a05:6000:108f:: with SMTP id
 y15mr24389634wrw.195.1613488355876; 
 Tue, 16 Feb 2021 07:12:35 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l2sm4027994wmf.15.2021.02.16.07.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 07:12:35 -0800 (PST)
Subject: Re: [PATCH v3 2/2] sbsa-ref: add 'max' to list of allowed cpus
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-arm@nongnu.org
References: <20210216150122.3830863-1-marcin.juszkiewicz@linaro.org>
 <20210216150122.3830863-3-marcin.juszkiewicz@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <97fdcf07-9394-fb8d-4875-9aed09ce7fa8@amsat.org>
Date: Tue, 16 Feb 2021 16:12:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216150122.3830863-3-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.19,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Rados=c5=82aw_Biernacki?= <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 4:01 PM, Marcin Juszkiewicz wrote:
> Let add 'max' cpu while work goes on adding newer CPU types than
> Cortex-A72. This allows us to check SVE etc support.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Acked-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  hw/arm/sbsa-ref.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


