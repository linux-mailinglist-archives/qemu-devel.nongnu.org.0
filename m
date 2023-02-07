Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0808A68E005
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:31:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPSjK-0006Ax-6S; Tue, 07 Feb 2023 13:30:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPSjI-0006Ao-Mu
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:30:08 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPSjG-0005sc-Rz
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:30:08 -0500
Received: by mail-wr1-x42d.google.com with SMTP id g6so6492934wrv.1
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 10:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GuNduTY6LTMCYVJeloT7jisXnrm/ekOdwrSg9ndvIxY=;
 b=g8+F9hVDC2DTRhqgyGOfZhutE1oMn2bmYtWwo0opnKsERsmWwJ/t98oOY6ov2Igcg2
 s0h28a5Cbv5mKNrhnL4gKjZV2RD2ID4IoB5I85zheE3ObXmK6l1Tkg/q+YeVSraHc0gs
 5j2uKzkHUwz2iD7IL+kLIV7ezTlRl0/shoqTgAr39fxQbk7PH7oFzoqSvip2wzyqSoEH
 we6gIYvQ2rZd0Wr2UD5J/hu1UFbX7oiJIfcDx7WjN2cvajBBgVOyHwmnSJDkZIlHtV3z
 Vy2R9gGtJEaoRJ9rpSpc+DJHgT5Zfq7Yjkb1KyBQYLBsLFUgW0raeBLQ246vAGJBVGg9
 VvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GuNduTY6LTMCYVJeloT7jisXnrm/ekOdwrSg9ndvIxY=;
 b=ac4TbzsN8458/QyzmVSTRREal0MQJKn3xkfuLGCm0ZFr3SwSNoQQ3sVf9oooNpo+lp
 1gt6HE6iM4EVuaPd/qAAaWKGncRHJuTonSfExnvvoemea7pdWOj/2el6+djFycQqiXZm
 WSHJiHcf3DL7tVigRn/8yhBHMMX7iqg369CxBD4l4dJpnCp2Glstxpb0hBHlxFC9v33P
 Zl7Xlo7cr3a2Nrw0FY4cOf//tMBrGM2Vf1bQhofR28FBxrmYDuecp5ZnJ4XYK3DEHnTk
 rzLwp7JA/CQDhXqV37zkjBX30vAzwOklNl1uWMGgMGE3AZLUHMjMH+WeqHdGnD+sQqpE
 W7NQ==
X-Gm-Message-State: AO0yUKV6AFPTXe8FaCkVMeU8VGvzhhFrJwhRAV0O794Qahv0CL3u5w0K
 KFmsQTrCg16TmXvrnCRv2hcoeA==
X-Google-Smtp-Source: AK7set+zw5uW6Zy1myjUpjpOEJOW2sgR8UZ++5BG0KHBN7/cbtUat/+nYl+GYVUfpZoxs77LxgIS8g==
X-Received: by 2002:a05:6000:1814:b0:2bf:e31a:26b9 with SMTP id
 m20-20020a056000181400b002bfe31a26b9mr3639265wrh.63.1675794604939; 
 Tue, 07 Feb 2023 10:30:04 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u2-20020adfdd42000000b002c3ec1fbc0bsm4700269wrm.94.2023.02.07.10.30.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 10:30:04 -0800 (PST)
Message-ID: <659136d2-206b-0146-086a-09388c96ce45@linaro.org>
Date: Tue, 7 Feb 2023 19:30:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] virtio-rng-pci: fix transitional migration compat for
 vectors
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, mst@redhat.com, thuth@redhat.com
Cc: david.daney@fungible.com
References: <20230207174944.138255-1-dgilbert@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207174944.138255-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 7/2/23 18:49, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> In bad9c5a5166fd5e3a892b7b0477cf2f4bd3a959a I fixed the virito-rng-pci

Typo "virtio-rng-pci".

> migration compatibility, but it was discovered that we also need to fix
> the other aliases of the device for the transitional cases.
> 
> Fixes: 9ea02e8f1 ('virtio-rng-pci: Allow setting nvectors, so we can use MSI-X')
> bz: https://bugzilla.redhat.com/show_bug.cgi?id=2162569
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   hw/core/machine.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index b5cd42cd8c..4627b274d9 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -49,6 +49,8 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
>   GlobalProperty hw_compat_7_1[] = {
>       { "virtio-device", "queue_reset", "false" },
>       { "virtio-rng-pci", "vectors", "0" },
> +    { "virtio-rng-pci-transitional", "vectors", "0" },
> +    { "virtio-rng-pci-non-transitional", "vectors", "0" },

Ouch :(

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   };
>   const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
>   


