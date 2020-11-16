Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46E62B44AE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:28:09 +0100 (CET)
Received: from localhost ([::1]:59534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keeYC-0003jr-Ny
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1keeVI-0002Kg-9L; Mon, 16 Nov 2020 08:25:09 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1keeVG-0007jF-Ci; Mon, 16 Nov 2020 08:25:07 -0500
Received: by mail-wr1-x441.google.com with SMTP id p1so18640647wrf.12;
 Mon, 16 Nov 2020 05:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2Ow6H+k9oBLjZNGV3A76EvsZIHDDw/grfEuj7xmVHqE=;
 b=eoTE1vAFAzO42zxshhRgRcDF49nIMFNcBnx/VT6mYUwaMTF96xERC6rONugy4vCpLt
 8qnVbl+AjWUDGgwS1SbcRzhsOHgK2Ycl3Q2MFlWk9Fv6oZOaru/mFPmnb8wZXU0cYGZe
 dGjRMNs82cvm+ovRkAwMbu0qW44bFqQFK2rAEdf9g3URXmtodpF99LB5ZDPLg6eVk/Vz
 3Awztyngi8ZRkfyuICLxxJFl55yPYDv3ru328vO5bkRDqOQxC8dT80cx8DvZygP5pKSk
 1mBc2qiLEYdmEBZIDmtWwGkTMZAMQheTFkVvxcf2cxbt+vR92MDPo8Dt1xBv3gEoizrw
 XENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2Ow6H+k9oBLjZNGV3A76EvsZIHDDw/grfEuj7xmVHqE=;
 b=aXVN4hjHX1jWFH8e0UFzaTfSbbkK3oFr76NRywdgIXHPYNYX4GL0kva8x/N2DznML8
 vSHsN59T14YhKa0wos3qUdoc2VJ15zTaneqFtLGW/mZErhNzBJBiFNUYQuRBPaYa7RkM
 rPMbQB6+Um2vzNq5m33BC8aEln2JB3Gz6+GV8HkhLSoDXIh69lnP7o4EV1dRizLMXXiL
 rTklH3ZAvPmDl+A4ZFisIhDNoCQRx1UhHFPaAnxCIAy+Sa0nct7bUJLmfIQ/o+KdrnMr
 CpSzNVws9hKh/OMcnB+ZSRzhT5ghMC51i9pxrV3vlug3Jsih1hARqVe2aDzlqbgmkjkD
 O1Hw==
X-Gm-Message-State: AOAM532BArcmJNgrXDDondtaGYUE4ZceMRjHAOLctJbsWZaMnqO1aKmT
 MDT16wro66T9EUdxROORzEA=
X-Google-Smtp-Source: ABdhPJyY/bFH4rO+6kiV5VZxDpxhR40zmXfPJ3gLWfRqV2gxf31YMN5X3RmYlgGJ9kFKk0LTVaII3w==
X-Received: by 2002:adf:fb90:: with SMTP id a16mr6878307wrr.192.1605533103862; 
 Mon, 16 Nov 2020 05:25:03 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id m18sm21258839wru.37.2020.11.16.05.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 05:25:03 -0800 (PST)
Subject: Re: [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835
 cprman into the 'misc' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, thuth@redhat.com
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-14-ganqixin@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
Date: Mon, 16 Nov 2020 14:25:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201115184903.1292715-14-ganqixin@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: kuhn.chenqun@huawei.com, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gan,

On 11/15/20 7:49 PM, Gan Qixin wrote:
> Some peripherals of bcm2835 cprman have no category, put them into the 'misc'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Philippe Mathieu-DaudÃƒÂ© <f4bug@amsat.org>
> ---
>  hw/misc/bcm2835_cprman.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
> index 7e415a017c..c62958a99e 100644
> --- a/hw/misc/bcm2835_cprman.c
> +++ b/hw/misc/bcm2835_cprman.c
> @@ -136,6 +136,7 @@ static void pll_class_init(ObjectClass *klass, void *data)
>  
>      dc->reset = pll_reset;
>      dc->vmsd = &pll_vmstate;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);

Well, this is not an usable device but a part of a bigger device,
so here we want the opposite: not list this device in any category.

Maybe we could add a DEVICE_CATEGORY_COMPOSITE for all such QOM
types so management apps can filter them out? (And so we are sure
all QOM is classified).

Thomas, you already dealt with categorizing devices in the past,
what do you think about this? Who else could help? Maybe add
someone from libvirt in the thread?

>  }
>  
>  static const TypeInfo cprman_pll_info = {
> @@ -239,6 +240,7 @@ static void pll_channel_class_init(ObjectClass *klass, void *data)
>  
>      dc->reset = pll_channel_reset;
>      dc->vmsd = &pll_channel_vmstate;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>  
>  static const TypeInfo cprman_pll_channel_info = {
> @@ -359,6 +361,7 @@ static void clock_mux_class_init(ObjectClass *klass, void *data)
>  
>      dc->reset = clock_mux_reset;
>      dc->vmsd = &clock_mux_vmstate;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>  
>  static const TypeInfo cprman_clock_mux_info = {
> @@ -411,6 +414,7 @@ static void dsi0hsck_mux_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      dc->vmsd = &dsi0hsck_mux_vmstate;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>  
>  static const TypeInfo cprman_dsi0hsck_mux_info = {
> 

