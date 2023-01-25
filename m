Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076CF67C0B1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 00:18:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKp1C-0006GJ-Gy; Wed, 25 Jan 2023 18:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKp1A-0006G0-JD
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 18:17:24 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKp19-0006sE-1K
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 18:17:24 -0500
Received: by mail-wm1-x336.google.com with SMTP id k16so90826wms.2
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 15:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y8BDiINBwSD7It7TkhO32XcJz4B1GuSdShR7bB+F+Ps=;
 b=pCbbWjzs1gTnvcW1PHk6BArNYwJvmWLWnj0xRrHdeiltD1hB9rVeL9eyvR5ywlH9GV
 hsF2jXqA5o8fHGPaqGk+EJXmIDKn5W6wsF2aCdrInTPISF0oJIV8r3vbodP1RxNfcTUo
 01N+89UC+peMf9xKEYGyXHIqhNlW3RWz/695kqvxg0ct5A4dvqkINb0jSEeEqDePCjv1
 5/m16DQSNw6M/1qNjr3ex5ouuQRqzCC+4yMAbLvEXKx8aZBQ5zpEpNALfMAKPDhUnLG7
 5whsDVtMphgiESsG4wla1ahWL9UDTY8QYVlA6j6PZDBYuSlxdYQOWFZG4GspqGG7QGvx
 wPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y8BDiINBwSD7It7TkhO32XcJz4B1GuSdShR7bB+F+Ps=;
 b=S/UKgw3SRTngVSJmwH7A35aYH/uA0ah+bapzKzJ5MCEPPe1+2++y7+sQ4VvzCdFCtu
 ccziTmCJdpZKCRSC5mIGBxylkLb88VzJxElx4CAegw/HxSEFHsPmsLo0Q2hjZ9beM+Tq
 2/UiE6+ThtkTmcC1ou13ut+3yN1LCQmzUhWAuQm8ICqWClIENpWEywx/zUkbyvWIhIeE
 1b7CCAHGkHnQfxdQCJGLjrKD6mVBs4FhKPPom8YcZG+E5aKA9C1s/o/f7beX3J71tWCk
 s/uDljWJ4dU8G+a6QCHwF1BiQdjE+sCi6MLZdGc70wSmeDpbqWX5MOqzv4yrSivwIcc9
 LGYg==
X-Gm-Message-State: AFqh2kqVfMcI5buBduYssfjrKSffnCTDjHMdkIiiMX8bLDgDySk/8b1z
 kHd2NPLJb+9/UHh6HV92W347UA==
X-Google-Smtp-Source: AMrXdXuZAaX5KZzmd5K+MaCU7oCKprcUUe/Fd7WEsJerpJWfFfLs9c0h+rsbZZwLXGBF50i2tuB9Uw==
X-Received: by 2002:a05:600c:19d0:b0:3dc:c05:9db6 with SMTP id
 u16-20020a05600c19d000b003dc0c059db6mr9025513wmq.33.1674688641285; 
 Wed, 25 Jan 2023 15:17:21 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a7bcbc6000000b003d237d60318sm2965294wmi.2.2023.01.25.15.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 15:17:20 -0800 (PST)
Message-ID: <f1cdb635-f02d-3ce0-1123-199293abef5a@linaro.org>
Date: Thu, 26 Jan 2023 00:17:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 4/4] hw/ppc/e500.c: Attach eSDHC unimplemented region to
 ccsr_addr_space
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
References: <20230125130024.158721-1-shentey@gmail.com>
 <20230125130024.158721-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230125130024.158721-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 25/1/23 14:00, Bernhard Beschow wrote:
> Makes the unimplemented region move together with the CCSR address space
> if moved by a bootloader. Moving the CCSR address space isn't
> implemented yet but this patch is a preparation for it.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/e500.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


