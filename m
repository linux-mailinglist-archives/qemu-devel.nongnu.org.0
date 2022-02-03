Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6AC4A8C8F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 20:38:24 +0100 (CET)
Received: from localhost ([::1]:33094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFhvz-0001Uh-24
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 14:38:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFgw4-0005by-MW
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:34:24 -0500
Received: from [2607:f8b0:4864:20::62d] (port=34751
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFgw2-0006nP-Rv
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:34:24 -0500
Received: by mail-pl1-x62d.google.com with SMTP id h14so2915761plf.1
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 10:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hCl9RYKwQK5fAgFnylrYdZM6dHYfnBgAdB3yuikL1pI=;
 b=XhJu+hSaKMtBgxp6RQ02x10JwgfbSRrJpdDz+lzalr6gYckrPDJxpY1lxg2sbHJdRh
 uf+O23zzMixRH5iZwjR5GWFbmU3C/8p4hAtY283DOEalf30ePJA2GjP2W8SFnMQVQY2h
 CaYwuTk5lpTDr/lgJexkWk4NuLYMXI6k57yDGmb2fu7eF68KKjjr5QDM6AHKDbQ664oz
 V+w3bcYszlaJrtK6OQU9IYCKB/Hu0rfA9EEUfZ0n+fWfk91lUtW9hPwjUpKmqrHTpRy9
 vOpGYMXTStWvCtRQjsUEO5YsqBlfxXLmg+wdwL9LEE6JjzUsK8KhoTI9GwiO+r8Lrb5J
 QcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hCl9RYKwQK5fAgFnylrYdZM6dHYfnBgAdB3yuikL1pI=;
 b=RHti7U9Mx9Kjn66mh1fAxwxeiwVe9Tv8Nkj2ZW1/b9VlUHTpneDAzGCIGBViGyEcsk
 xdkjakU41e1NyAgqRJdDW3dkokch0uhnR+eRACNyilbfJg4xLOQ1CdV08tSh4+uvX3b/
 OKft3rlHva7RSJCqHjgON0qHrN4DU6y81SYvM64G60EgSZzxbmwmA9oVm3cO3KnRhJ/i
 2tJkr8gvmnt6F3S8BoPxvgNtxLnq6O5xcSgEhWCg3u/ei9XEpn/sMTG72ZDyFa8NNWvd
 0HOnsyViHKCi1mq0IjmOKNFx67P2yvoPkoiFGImOjIynAMvQwe4MCjk0vThPcU6fGck1
 zSMA==
X-Gm-Message-State: AOAM532B43zKc0s6BsMi7zL2IGk6HK9U6r4TD3HrI90q8Dx0wiHljpPu
 ARZDGkNNhbgNnUPs4nhfM8E=
X-Google-Smtp-Source: ABdhPJy4AH+j0S5uYtBL1wE9waaS+W9U+XYeVKCf7e7jfFofv4fo4kFQU+JjBTz2xLpMl2vNGl9SCg==
X-Received: by 2002:a17:90a:d58b:: with SMTP id
 v11mr15410950pju.100.1643913257402; 
 Thu, 03 Feb 2022 10:34:17 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id ip5sm11324448pjb.13.2022.02.03.10.34.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 10:34:16 -0800 (PST)
Message-ID: <9b00f402-4262-bee7-9143-0ae60d82986f@amsat.org>
Date: Thu, 3 Feb 2022 19:34:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v1] hw/arm/xlnx-zynqmp: 'Or' the QSPI / QSPI DMA IRQs
Content-Language: en-US
To: Francisco Iglesias <francisco.iglesias@xilinx.com>, qemu-devel@nongnu.org
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, luc@lmichel.fr, peter.maydell@linaro.org
References: <20220203151742.1457-1-francisco.iglesias@xilinx.com>
In-Reply-To: <20220203151742.1457-1-francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/2/22 16:17, Francisco Iglesias wrote:
> 'Or' the IRQs coming from the QSPI and QSPI DMA models. This is done for
> avoiding the situation where one of the models incorrectly deasserts an
> interrupt asserted from the other model (which will result in that the IRQ
> is lost and will not reach guest SW).
> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
> 
> Hi,
> 
> I noted this after receiving a review comment (from Peter Maydell) on a similar
> issue on the Versal machine while working on the OSPI series.
> 
> Best regards,
> Francisco Iglesias
> 
> 
>   include/hw/arm/xlnx-zynqmp.h |  2 ++
>   hw/arm/xlnx-zynqmp.c         | 14 ++++++++++++--
>   2 files changed, 14 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

