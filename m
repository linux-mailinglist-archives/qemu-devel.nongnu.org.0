Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C9D6671A0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:05:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFwKY-0000xB-Jx; Thu, 12 Jan 2023 07:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwKW-0000wp-Hz
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:05:12 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwKU-0003n0-Kc
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:05:12 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h16so17850859wrz.12
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 04:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EazlHa80VYzhqtLwoIr3vjoAK6ZMYx6rOzsg/SF43fM=;
 b=oyWE18LTkxnV9BcqlGBeILR3/esMQ/01ghCpDawQ1LwKKrajti3+rkZ0FIdc6kF/B0
 x6cjexpDFlXpBsKFykYGtt/rjK36tETXHNgC9RsODwhVeta+g1tBjrPRRbZNKbT/9Yog
 +JCjCB7vA7pT7S4CuuTWh7Dz0oBY8/1TvQT2+ztoWjL2adCqxT0yRzKdXNfJJWwZtVg6
 lVqQanT0J/qLYB3BK4kvv3WjmT4aRUV61VpnrHZwf28JGg8BYekVTjRTMtHHuV4cMH4C
 jBnOChsluCef8AVQq+WXwuTqCE8Pl5blNq2RzYgija6vfDJPmGgXorP4IbY8dAmOTTc+
 eu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EazlHa80VYzhqtLwoIr3vjoAK6ZMYx6rOzsg/SF43fM=;
 b=ne9SHLm+QPsrbX3/jnOUXy2F40vtdU5HCCZYtKMUjYzeN5pUDLiB7mDsTWsxt2My1F
 9PF3gzBwSdi9UpW2Dciby855hbx1wi8+D/U0IokqrL7eE12kqytAy82ucalhQ+tOFwBy
 TNefJsMjw5VcX8O6GeJsIkX9j/z8X0pR3QRK/iWhBeFGm8l/30AlTANK6p167bU743p2
 eohWyBkpWsiTZdw7z4A6KTrxLW81CzGfoG65yZkG6OPuMeVmT+gETWQldPWlyVZ3usqN
 HT2Jppc1qKkh5jsSLgg9G00KrgJNQO4RCbuOeiwi1Tk0qkSx2/c31i+G0/OsgEFJDFo4
 IlHg==
X-Gm-Message-State: AFqh2krgQJwOY49RUTKZhf81CDVgS1E51+yexiD2w6cOND1Z5xihicUQ
 cWjH0D3pSrrxJBKY53QjblSJyQ==
X-Google-Smtp-Source: AMrXdXsEJ3BkYbGyq8qe9KUo94n8Boe1aubS4gCalDN8g23zDvX7GjBxQBWQSGOimRSHSGoIO+VkrQ==
X-Received: by 2002:adf:ebc6:0:b0:242:9e8:84b6 with SMTP id
 v6-20020adfebc6000000b0024209e884b6mr44738432wrn.13.1673525107910; 
 Thu, 12 Jan 2023 04:05:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l8-20020a5d6688000000b0029e1aa67fd2sm15999624wru.115.2023.01.12.04.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:05:07 -0800 (PST)
Message-ID: <667c43cb-b304-c3d3-9fee-78bd8f0c8a5d@linaro.org>
Date: Thu, 12 Jan 2023 13:05:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] virtio-rng-pci: fix migration compat for vectors
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, mst@redhat.com, eduardo@habkost.net,
 stefanha@redhat.com, david.daney@fungible.com
References: <20230109105809.163975-1-dgilbert@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109105809.163975-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/1/23 11:58, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Fixup the migration compatibility for existing machine types
> so that they do not enable msi-x.
> 
> Symptom:
> 
> (qemu) qemu: get_pci_config_device: Bad config data: i=0x34 read: 84 device: 98 cmask: ff wmask: 0 w1cmask:0
> qemu: Failed to load PCIDevice:config
> qemu: Failed to load virtio-rng:virtio
> qemu: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-rng'
> qemu: load of migration failed: Invalid argument
> 
> Note: This fix will break migration from 7.2->7.2-fixed with this patch
> 
> bz: https://bugzilla.redhat.com/show_bug.cgi?id=2155749
> Fixes: 9ea02e8f1 ("virtio-rng-pci: Allow setting nvectors, so we can use MSI-X")

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   hw/core/machine.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index f589b92909..45459d1cef 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -45,6 +45,7 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
>   
>   GlobalProperty hw_compat_7_1[] = {
>       { "virtio-device", "queue_reset", "false" },
> +    { "virtio-rng-pci", "vectors", "0" },
>   };
>   const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
>   


