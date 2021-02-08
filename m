Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE833313ABE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:23:03 +0100 (CET)
Received: from localhost ([::1]:42948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AFa-0007xD-5G
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l93R4-0003MM-DC; Mon, 08 Feb 2021 05:06:27 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l93Qr-0005hg-ND; Mon, 08 Feb 2021 05:06:16 -0500
Received: by mail-wr1-x42f.google.com with SMTP id g6so3345032wrs.11;
 Mon, 08 Feb 2021 02:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hj87a0gAimsxHUhF/y0RBMNy5DEZgbtxKEol6ONkxb0=;
 b=Kgyyj4pmemWXVytJqbyzbHwXgmQGZVwOmmpCGlauPuuuVvH31AI2xhDqAxqaKuCs9j
 DsGvHIn4EbKQno0lHh+X8UTxqJr7m+m+m+JoayGjMQzCJVTQ42aTG34NgE8XNM+lOU66
 ZgGj7XkpwT7IVDPmvQpmyoF4pHa39yAFKH9itTIUsEUeGagow0LO7zEq4jMyohW6qLdr
 5bOG0nAUydjj6Lg3ajZYPCleLjpvBq/g2uhjh3DWAUKoYLSH5zvJHmt0bdTysISgUB8H
 CgHuf7UgRJbpQSApMgKJXlokC31TzI0O/wHjUIxhqc/+xFLK0vAOw9xBYeBzJvLef5Ki
 XVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hj87a0gAimsxHUhF/y0RBMNy5DEZgbtxKEol6ONkxb0=;
 b=cPm1vXS5jcJTOHpviUt+FpVsMUydZrIQyKprPO88WZsVz1X6cEdwREM0phpXa4kRiC
 k30WwcPuCTZh4flt8Q4Z55BnkGSsCS4qFCu2c/5HdTLdNnUGmwSNgsXngJ1WUsAvcIbL
 9w8Ut8j4wBt2yWPjKmK981grNcqeQBG8aFYBZWj+AxOL4giSj+3fcg7ZSO4BuIaLfEM1
 i2xox0LqlStWlWNMo+AcHsWD6zaVXSwYeEW+9KmGNkVeyI2Htqys+3AATmB+JIfW2bsJ
 +x5aX2M4F/jL8fmcT4dV7grmV2eNs7qdtKa292kSea1Fp8RwChOeKmlf/rSPxo1skkS/
 OCvw==
X-Gm-Message-State: AOAM533jdPOaC3xz5zAmYFMUQZNJSS+ZbFXPXl/0T+y5E3WViHbUr8Th
 7LmnRhflPdBSKUGpdPea6+o=
X-Google-Smtp-Source: ABdhPJwM8ImT6BQiocjTX8iG7AJEwtBPl3r8wBQs73G69mxyhFI23m7gwFxJy6I2X96baxKv/sSILQ==
X-Received: by 2002:adf:ecd2:: with SMTP id s18mr19246493wro.311.1612778764620; 
 Mon, 08 Feb 2021 02:06:04 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s23sm19525813wmc.35.2021.02.08.02.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 02:06:03 -0800 (PST)
Subject: Re: [PATCH 1/3] hw/sd: sd: Fix address check in sd_erase()
To: Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210128064312.16085-1-bmeng.cn@gmail.com>
 <20210128064312.16085-2-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ed12dfd2-8842-bbde-b0fc-2e2162f4078d@amsat.org>
Date: Mon, 8 Feb 2021 11:06:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128064312.16085-2-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 7:43 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> For high capacity memory cards, the erase start address and end
> address are multiplied by 512, but the address check is still
> based on the original block number in sd->erase_{start, end}.

Oops, good catch.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Fixes: 1bd6fd8ed593 ("hw/sd/sdcard: Do not attempt to erase out of range addresses")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/sd/sd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

