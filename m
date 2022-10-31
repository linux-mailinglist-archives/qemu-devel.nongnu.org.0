Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A948C6131AA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 09:24:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQ5W-0002Em-OV; Mon, 31 Oct 2022 04:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ5S-0002DB-OR
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:24:02 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ5R-0001zp-8D
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:24:02 -0400
Received: by mail-wm1-x330.google.com with SMTP id v7so918300wmn.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 01:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=islkkldhAl9dT7WoKvtptXgKUBZzZHZxETLs0ckqON4=;
 b=COGtnS3Bzm09r5OsAlamXI74rGofp0VzaWdQm4Gs9rUZEUx6A61TTJYs9+DXI+fbTK
 hyB+ZdrUVH6185UuGmVTwI3/2RWY8y/iXE7BEPm4ytpf8s2IqsmgurfDKmGwh25WTtJ+
 lL4MFabWQxe6dDTBOPIrhM1t6tgZFa0i/62d+xFeP5fpqf2tOgLteVs98pQJDT3644AH
 drAKIdf388pm4Wgco2SvfKVwZsd8uUBmr7myD0VTd9PcHthSmqRd0ChyChj7qGpTyxeb
 V8eDSzeRUYQtYHX/CjhGwi4bIEMgr1EpwUF3WjrXvmhrS9SKxfnB2rZwdPuk9rp1VgyK
 8uZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=islkkldhAl9dT7WoKvtptXgKUBZzZHZxETLs0ckqON4=;
 b=HPeymlTxLk9dP8QUZB30VgSYn5RkaACCvO+hpN+iMALw/6QQIRHk2DlFyh+ISI5Ybq
 evjdZeRo1nTnLQa4AqItPKWDiD22+yh1MsKX/dZ45rXgQjfJfrJ3VDAvLTVNwDV9mVmW
 hg0/8os+wZNAELjvZkGW3Wto/Cwfh1dkzsEuqRH4VQCugSQaJckt0Y+A81+Nu/m+3bC5
 GTz3s6FO8vv8sykrpzpGjZLQ1AREYuk7YnVPMKfVXTtP/NejfR+RTPZbTwKAwIv1JnUR
 VfMs0plntGXTVIlcyPzQpzPp5/IEOPZRqg15aRAPa4kibzKI3kWMBa8F1P2SYXlTaQMf
 Pd9A==
X-Gm-Message-State: ACrzQf0Qj3ygsko8Jh10Gi/eE84+XZ4e0scLXi77IT4A60vIj6RzNltu
 Tq8lvrpLd1abTuHjAU28n+Y5cQ==
X-Google-Smtp-Source: AMsMyM6CH9cv1Swne18ItlV/CT/NcfY8kBXaYPmCLpbto4KD5sMWTMZxkvvgY4b8EWqIHzlv77QTGg==
X-Received: by 2002:a05:600c:3849:b0:3cf:4d99:fd1f with SMTP id
 s9-20020a05600c384900b003cf4d99fd1fmr16290081wmr.128.1667204639882; 
 Mon, 31 Oct 2022 01:23:59 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bx10-20020a5d5b0a000000b0022e47b57735sm6448646wrb.97.2022.10.31.01.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 01:23:59 -0700 (PDT)
Message-ID: <20698509-437d-8490-5f9b-7c34542ef0eb@linaro.org>
Date: Mon, 31 Oct 2022 09:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH qemu.git 09/11] hw/timer/imx_epit: cleanup CR defines
Content-Language: en-US
To: ~axelheider <axelheider@gmx.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <166718254546.5893.5075929684621857903-9@git.sr.ht>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <166718254546.5893.5075929684621857903-9@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 31/10/22 00:59, ~axelheider wrote:
> From: Axel Heider <axel.heider@hensoldt.net>
> 
> remove unused defines, add needed defines
> 
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>   hw/timer/imx_epit.c         | 4 ++--
>   include/hw/timer/imx_epit.h | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


