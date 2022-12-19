Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD31650AC8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 12:36:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ERB-0001nc-9A; Mon, 19 Dec 2022 06:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7ER8-0001lr-Kt
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:36:02 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7ER6-00043A-Dc
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:36:02 -0500
Received: by mail-wm1-x331.google.com with SMTP id v7so6230463wmn.0
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 03:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2EB0JSQ4k0d/tH8pEDkh/rNaViZz/rYgYcq2Rg3dhME=;
 b=QozzCAFBKPDbPLfMTXq9llrV8kda1iiezkqQH6/GoCe53lBSRXzioEFZ++q6ylMB6g
 1hkieaiZIYw+GaGeDbbmJKhnHJU9Zp7KQjf6aaVa4RicyQX0shbXGG7tLKbrp7QScPbc
 7dirHB3J/dIyP+pJDwo5J8/2tEwp7vSPYluXkz3ZAOnO6jPQfBFHXLJa6Ug6asABM9kF
 RBGdPLrIO8VZ7i0SJsujdmKgvCf2QYx+9cwmR8rTBcZEZV+WLlO3/gv5DGnyfwYiy0xP
 CUR/SnXjfXB5oFOjgCcdy66dB/yEHanD1zqV2wok1apUefXMtBLNZIyoaou0aeC9xDHN
 7ffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2EB0JSQ4k0d/tH8pEDkh/rNaViZz/rYgYcq2Rg3dhME=;
 b=Clqirp4h2xvf55S82g0rIDzoTbTLFLhd/bNUOkGo/PyeB2cVhxzxWc+OK9rKzJDZ85
 Vtj8qJwvetE4lZB1TbOK9qsXzWSSHRdMA94arOL1MI8n8ZyUy0w1VWBaoUs8U7CrkSXH
 qrRd60dt7i6kXgTPMmLs5q/boiK7MaCLH6J02rikEPOWztO4JEdntIFd70FDS0b85qVV
 k11D0MGoDA19y+DbbZXdYdY4Q6gilqLapqRoIF7FzuRO0/ct1qyefswgiRCx/mwp7nw7
 e4topOhbUzki1UQgEwtqPX/AaqPykZzVyhS/vIwEEW1qNDMvEZxM7MMHqtHhG9d9bLvu
 NpsA==
X-Gm-Message-State: ANoB5pmomeXLqgYx8Dg5XsGh9bY+uQrhbYN1csHV0QeqWOwPJ6z1GwbI
 n71UqG6e961Ag0E8wQjJf2joyQ==
X-Google-Smtp-Source: AA0mqf7AP2SwWs/vfQumXaWUfZtlId8odglzVAWB1maspM2C9y6MaI69Q3dYC/XRzspiOQzYkQ11pA==
X-Received: by 2002:a05:600c:688c:b0:3d0:73f5:b2c0 with SMTP id
 fn12-20020a05600c688c00b003d073f5b2c0mr32698362wmb.20.1671449758830; 
 Mon, 19 Dec 2022 03:35:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c204f00b003cfd42821dasm11925111wmg.3.2022.12.19.03.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 03:35:58 -0800 (PST)
Message-ID: <f74b3d7b-9f57-59c0-1208-18b23e1e7ce4@linaro.org>
Date: Mon, 19 Dec 2022 12:35:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] meson: Clean up some dependencies regarding qemu-system
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>
References: <Y5zB+5t5K0AEj6Rn@p100>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y5zB+5t5K0AEj6Rn@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 16/12/22 20:07, Helge Deller wrote:
> Reduce amount of compiled code and installed binaries if just the qemu
> utilities such as qemu-img, qemu-io and qemu-nbd have to be built.  This
> helps to make those tools easier available on hosts where qemu-system or
> qemu-user isn't supported.
> 
> Reason for this patch is that qemu fail to build on debian for some
> seconday non-release architectures (e.g. hppa, sh4, ia64), as can be
> seen here:
> https://buildd.debian.org/status/package.php?p=qemu&suite=sid
> This patch helps to clean up the build so that these tools
> can be provided on those platforms in future.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>


> index fbdb442fdf..4a499db441 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -51,12 +51,12 @@ qapi_all_modules = [
>     'transaction',
>     'virtio',
>     'yank',
> +  'qdev',
>   ]
>   if have_system
>     qapi_all_modules += [
>       'acpi',
>       'audio',
> -    'qdev',
>       'pci',
>       'rdma',
>       'rocker',

Why do you want qdev out of sysemu?

