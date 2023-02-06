Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642B868B87F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 10:21:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOxfr-0002u2-Rd; Mon, 06 Feb 2023 04:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOxfi-0002rd-Tw
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 04:20:23 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOxfZ-0007qG-2o
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 04:20:22 -0500
Received: by mail-wr1-x42e.google.com with SMTP id g6so1709416wrv.1
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 01:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fGqdE+3KwLKtPmhzyHHh5LIzl/ziJDYhK3nMq9ftjqo=;
 b=zaKvzXtHlpmVIk8lk+gmIAIpw2Y/GuyI+QJsC9wbcR93oqbAh7//3U1G9y0hXJLbgl
 s1sXRyqAl1m7Nj3PTjFuEgGyFFNWajI88/Qkrj9SRlyjPIDNciBbgEb+Xc0aO/NZjgaf
 jwrio2xDTunOP3h16x756BL9mQgnaZBpXWW87hsSWM3zJwPf/wztIz6EW+J9pqCyv6f8
 0YYprPN8Ly2XSq51v9jIa/67mGcpN/797efUwjZak/LL+HVBsRP17qWGVdR1Rph3WEyi
 FA/NyZGffdKsxH1RN4Yv6zsW7YWVvhV4ZgGEJ5hB1POXJ+Qhb3JTFocJsGMR1iF3pXML
 4lHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fGqdE+3KwLKtPmhzyHHh5LIzl/ziJDYhK3nMq9ftjqo=;
 b=4Slx5/NxW/fueQL52+8ZDou3Rt3aJ68BVkYY513/CO/IBjCKbbmIznmvhTznwlsm9s
 R56oEbDctQsxGQek8PKGUm7K4IMsbD2xuSm7Hr/7y7EdwAYF4zAkltJ1WNjD/xOTtBas
 TXZR7jNhxYyMB3SV6WuVwQ+cHaFkvyHEYuf23hp8AZLIxEhhkRCyvbHEhGiwMhONC5Vo
 YLVnX98pC8QjbvyhevokB3CS+oGcw+78GU2nviNE6Bfm39joevhcruICd/y2NZH8trRR
 em580BDjod8ib36h3YI3XzTShg7wUVMstlOvv5dwXL5ke80gUrln1D5anpvDjqyXRBqj
 Jb3w==
X-Gm-Message-State: AO0yUKXYl84wJSsAdhTH+3W4W/6MoZZixBpRpApYJ0jaJiu4xqJDirrC
 /uAWMBPhlk/yi1YH7hpIG3r55g==
X-Google-Smtp-Source: AK7set9HW756wmsNXNvLwyeOvZHrRmTmR5svmoQd6MtALGXDgcce5lto/CSukFDIUe5YIG56/3ONlw==
X-Received: by 2002:a5d:5c01:0:b0:2bf:ea34:dfe4 with SMTP id
 cc1-20020a5d5c01000000b002bfea34dfe4mr18989097wrb.42.1675675209838; 
 Mon, 06 Feb 2023 01:20:09 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h10-20020a5d504a000000b002c3efca57e1sm383655wrt.110.2023.02.06.01.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 01:20:08 -0800 (PST)
Message-ID: <a441ba3c-a454-8680-bf52-9d71a0f9df7a@linaro.org>
Date: Mon, 6 Feb 2023 10:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/riscv: virt: Simplify virt_{get,set}_aclint()
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20230206085007.3618715-1-bmeng@tinylab.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206085007.3618715-1-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 6/2/23 09:50, Bin Meng wrote:
> There is no need to declare an intermediate "MachineState *ms".
> 
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
> 
>   hw/riscv/virt.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



