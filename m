Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4964975E4
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 23:04:47 +0100 (CET)
Received: from localhost ([::1]:49062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBkyd-0005XV-4E
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 17:04:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBkwp-0004UW-9m; Sun, 23 Jan 2022 17:02:55 -0500
Received: from [2a00:1450:4864:20::42d] (port=38696
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBkwn-00057U-RW; Sun, 23 Jan 2022 17:02:55 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h29so7537952wrb.5;
 Sun, 23 Jan 2022 14:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=paYB/Q6sHWbMlBy+KJX/aC9uubIuJQ3S5lxm3HXEaVA=;
 b=Wo/R2WR4RXXpZ1+fcFEHtR2TwknREtgo4wh1XKi1msmh1tqgqECeVANs0pd+XHb+cX
 3vDUx12+T6bIDcMlAVXlvZhgVOxnPJvN4MxPqc26UloaHm/b9j/Htd9v/sZescyYcFTj
 lBkaH00fllJy49Ov0nOmizUgTx1sy1X4xYN8HxKmUv0LlnshYCappq0PemfM0gcE8Ytn
 1gES6xSBeJnaL11kB8AVcyzEya5jzuhBVh3PYW3gVaMGUorMzQ9/1KJwTQ0AUxWhE/Q8
 5tcquOOU1evhDyIfbOQkqwvFzzudrDqXR+wVVj/O2tW9UPHU24jWsNE0mETeVfYQ11QP
 cs9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=paYB/Q6sHWbMlBy+KJX/aC9uubIuJQ3S5lxm3HXEaVA=;
 b=QgbXaBE4tiXWsfQtz57HTT9tY74Jo6HRzx4N/hbKOsAMUWv2TWBovaGXuHOmf8+AnN
 R45jWf3zocMhaPQz+I2bMMtyQyuekcTPoxk8Nf1TejYEEQlKBH/Bwyr38bYwLyaqc5Op
 KhPREjW6qL4lIg92rQrIFyOWMk88eoMfsT4FRF1fYJJW4mCY/FHBJQnEvD8EovzPWExq
 DXbtQSw3eS3er5UitXx4sku/JdGMo9X3Djf8muIEvaQqrOYS/4We6ZNKiWBBY4oWnWpd
 WJdiNAEnik1fMLiVSZ9QocQjcDPD2dbAbPPIFWIHtD5I0E5StqkP+NS1gauuBud/jMPy
 GRcQ==
X-Gm-Message-State: AOAM532B97VJf+v0jWxxknXvNMbIOYYi+Y0Qmg9GWLBpsX5Xh88QUuht
 BMWEsEQJDrRA3NeW9CduW6I=
X-Google-Smtp-Source: ABdhPJzL9zSAcEXm4mYos6QD9+2YiqhSHQDMHYFpOfkW3G5QjBjIjlPm1cU6IUUxxWQjs5gnSXRhJA==
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr12500828wri.695.1642975372188; 
 Sun, 23 Jan 2022 14:02:52 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id r8sm12511102wrx.2.2022.01.23.14.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 14:02:51 -0800 (PST)
Message-ID: <781ffad4-5e25-73bc-64b2-1e66ae5adba8@amsat.org>
Date: Sun, 23 Jan 2022 23:02:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 07/14] hw/intc/arm_gicv3_its: Sort ITS command list into
 numeric order
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-8-peter.maydell@linaro.org>
In-Reply-To: <20220122182444.724087-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 22/1/22 19:24, Peter Maydell wrote:
> The list of #defines for the ITS command packet numbers is neither
> in alphabetical nor numeric order. Sort it into numeric order.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

