Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533496A4133
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:52:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWc2u-0000qU-24; Mon, 27 Feb 2023 06:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc2r-0000gB-HI
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:51:53 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc2p-0008Vl-VE
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:51:53 -0500
Received: by mail-wr1-x42b.google.com with SMTP id j2so5884973wrh.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HugWlrbRoL/So/4weISUdTEFYSurkh9e/8eubi4Fs3Q=;
 b=KphXfKDqIPwI60ED5o4Oh4VnMKcPlk0CpUI8ITwtNx/MnbKWsyahgZvqMwYDUcrc22
 KAwTqQLcEXJz9ykwvhTc1IlFrBFPN27BBzb5nkfLaT2wgQJWtfm4mevCF1p6FcVcQFD2
 fD6w42lRS77AKKv+8uEvnojiF+vIPme9BOp1CBbj+XJi6k68wdXiYhd28dCaaSZHuYGa
 Jqx2hortKybyFtYXWMzJJfhNc8Ndl1Gq1kcQa5gPgCX3bdvbryfFwoUfoW2o9P2ogpO+
 kyfjyiUfRzMsfecDIovfXDuwRrQ6Kfsk0blwFzCJ3IG81aw3C/GevPUNhakdJGzQKRmD
 LhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HugWlrbRoL/So/4weISUdTEFYSurkh9e/8eubi4Fs3Q=;
 b=D96sNU35scwTcPJ3YdNBWO77rOSbkhoQbkej9lcZjqH+YPW7Y2SorW8cZZpZ5dkh95
 JHmU46KfulAyvHgTozz8kWh+2gC9GE94Jsfnszw9DJbq5xTDfDr6/+mTSXICz2BhN9gg
 GGLwNwBShhlgLRVcJ0etpbD0Cuqx1tP7NjhBQQVw4oPhZxUxJH98EW/RimHVz06KtAVt
 xCMgBBVVQDdG8DtVaayM9RLxnEDLX7dtP4UD3uZQSj6+IP8zfp80fkbqhN4MkwOcXLYk
 m2ts1b+0bt+BiiWipSZRoKCafKZEzpi5ORb+1+AjvckZYyI00ayWmxJqJkSUkx7+b0nR
 k35Q==
X-Gm-Message-State: AO0yUKUyx3V1ckhKBp8KtE6t4+uoN2yioeldLIE6XrpXDllUictfSz9M
 +c+rtyu0v8eFhhBHD4oLLwyGjA==
X-Google-Smtp-Source: AK7set/5LFvG4nKsorPmQ8qJPWpJ99gEhksuOk40ZpaqMPZYupz0m6FTC7mU/vY1sZckk/bJ3zWafQ==
X-Received: by 2002:a5d:4c4b:0:b0:2c9:993a:ec2a with SMTP id
 n11-20020a5d4c4b000000b002c9993aec2amr5023117wrt.40.1677498710414; 
 Mon, 27 Feb 2023 03:51:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x16-20020a5d54d0000000b002c71703876bsm6885800wrv.14.2023.02.27.03.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 03:51:49 -0800 (PST)
Message-ID: <457775fe-0d75-b5f7-ff78-9a1f4a173a74@linaro.org>
Date: Mon, 27 Feb 2023 12:51:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 03/12] hw/isa/lpc_ich9: Eliminate ICH9LPCState::isa_bus
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213173033.98762-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 13/2/23 18:30, Bernhard Beschow wrote:
> By using qdev_get_child_bus() we can eliminate ICH9LPCState::isa_bus and
> spare the ich9_lpc variable in pc_q35, too.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/hw/i386/ich9.h | 3 ---
>   hw/i386/pc_q35.c       | 4 +---
>   hw/isa/lpc_ich9.c      | 5 +----
>   3 files changed, 2 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


