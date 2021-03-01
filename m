Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52D13278D2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 09:02:24 +0100 (CET)
Received: from localhost ([::1]:60224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdVX-0000cs-RC
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 03:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdSv-0007Nz-Tz; Mon, 01 Mar 2021 02:59:41 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdSu-0008Mz-J0; Mon, 01 Mar 2021 02:59:41 -0500
Received: by mail-wr1-x430.google.com with SMTP id j2so2184056wrx.9;
 Sun, 28 Feb 2021 23:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cZAnSAXUjcg5CvUYd7dLiDNh85dzm7vaLx8l6sjitgw=;
 b=kYavZzFy3mdcuZme54WL/vIVxnNwaxay7qetShiM6dqiu2PqJJTVTllnCCSZor3VvP
 XjHaDONDgNPjhGHGh4prgcV38Nhf6bR8Di5O3M23yr3ukz8M0NHJThRHTYbzlOrIxBDM
 kc+IUhGlR7ss8YjDwGwBVlw6YHf0uSxbgdr28h19up4JftsqWlgXvwi8d4Sctf/VbACu
 r0kOolIt4+3ueFazPcHA31fvlkVg2q+zwWFh/ld2KRfYxRQUMNomEnGXMQ0mMpCKnVo5
 2GlWqxur+cjS5BP485h59nqRe8msYV2xJ/1haj31eVenRZqmvhhChVoDs5S8Sx/7QFDH
 KCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cZAnSAXUjcg5CvUYd7dLiDNh85dzm7vaLx8l6sjitgw=;
 b=qs98wO9a0HKH8/RGeGJDtv9pEdLK2UD4O6MI/HwFQHbijfdwWzxRSA4Svtp8pNoSD0
 j0Y8j0ux4N0/SaOCDC6FlYNliW902Q0JCWCp1Lo/AqtFKlKPJkKoQ59lcrUuf+JknXik
 0AFGvbn3KKIEwkLyhFF05zKu4yYmgh5WxifdW5FxXTZ3mAhKV+ILwCzBc8GK84zqf5Gk
 Va2Jhj/yLHKNYyLG1Qua2pSZ8IsDvI5OEEfFm+yixQlqeD5F2Z69YtYBY/MBD/DZAXLS
 AA50r6enfRGpcat5zQcu0l4XH7Nf9Xqd7HgveOarotMZ1nNJPpDpo4s/BLNKk1qn9x0A
 Q/PA==
X-Gm-Message-State: AOAM533ZwI80WSE9BXgtOvcxr2/0oU/CdrW3hmlhjaXQEBBzQDGFsZeH
 loBOmak/JA7sObZ5duKKYAc=
X-Google-Smtp-Source: ABdhPJxcRwDkYB1g/3MKF4QmFr0Pw6rpg6ef5x/K8aJgV1yNntq+BvWsT5PeHqvrTozbZbQuRwKfpw==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr15812292wru.266.1614585578814; 
 Sun, 28 Feb 2021 23:59:38 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t5sm22204688wma.4.2021.02.28.23.59.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 23:59:38 -0800 (PST)
Subject: Re: [PATCH v2 2/5] hw/arm: ast2600: Set AST2600_MAX_IRQ to value from
 datasheet
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20210301010610.355702-1-andrew@aj.id.au>
 <20210301010610.355702-3-andrew@aj.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <80ac1b39-8c6d-e769-6e0c-fe5ad099b451@amsat.org>
Date: Mon, 1 Mar 2021 08:59:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301010610.355702-3-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 qemu-devel@nongnu.org, joel@jms.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 2:06 AM, Andrew Jeffery wrote:
> The datasheet says we have 197 IRQs allocated, and we need more than 128
> to describe IRQs from LPC devices. Raise the value now to allow
> modelling of the LPC devices.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/arm/aspeed_ast2600.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


