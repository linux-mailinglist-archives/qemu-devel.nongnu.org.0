Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BBF4312A4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 10:59:42 +0200 (CEST)
Received: from localhost ([::1]:45420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcOUf-0002ia-7X
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 04:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcOSn-0000Lf-Ey; Mon, 18 Oct 2021 04:57:45 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcOSl-0000kl-Hg; Mon, 18 Oct 2021 04:57:45 -0400
Received: by mail-wr1-x42f.google.com with SMTP id o20so40030331wro.3;
 Mon, 18 Oct 2021 01:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kZsvhk5OmAGcsOZUO6hNEvq1KPk0VFMf7f+fTabcrB8=;
 b=dgaHwthBxIxLs/Qh2bhd0ShQPLgLe+C71nm8td72XgGzvAzfZJS0J4OpQ3oSYd5ldd
 QNWa3Jqk7G3K75HQutKDhav/ZUv0cknPl3I7/xTu0uYM3oqXKL13gd9uzl1uOgS32bRu
 Vh9R4gIFJFXypsKFWKfDQyB+A2OuxR2XVgSIYNV0KubKJIdIxHFSaqCNDUnFD3z+zsXP
 lUJUJ8dFi1+IOJYqJqPh1wYEVr2vIRVEIKEY02BvL4IQpE7OnV75ITFQRxGek5g9nMzw
 MJYxJwnks3TqzUevlVslnW4blsXrhZr6DtHCYnZfDsyw5gs6Wkv+gHCODrudlJei1yc/
 l7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kZsvhk5OmAGcsOZUO6hNEvq1KPk0VFMf7f+fTabcrB8=;
 b=EbnUOkoteouN0JC/c/9aarNtl3VT97mWp5abkLULCKiq9GdUlPHE84g5De6yilD5Mt
 jRs9rGdTM5kmYUYsvAjJ/Eum1oUTsAkMkKrqv3ivvG9+7H5Lvsq97XaTyNPZ1n+gcerG
 SJUk4jwdjUzqqlnuYPccTjkLWUhHqRwWdX3Gtcjii5kM1uU2LdIwC2QenAr+cHJp0phK
 q0BZgZsIOtRCNPFXWsQi/VefCnjEPXCUPbKETq4F5bRXjgSOgjsanEwqOORnduaDfpcA
 2A2baOCfB5uknoN/uohSVOmYPoPma/kGhCnyKL8bp6qYbUAGbHYkz+rXYa687FY056yD
 qtHg==
X-Gm-Message-State: AOAM533+Bft5dtKf4mYQjZjDI/JgFqmPxU2Vu3rKISazqZTjjc4pkjCI
 skHgmVVlT0sxJPhtXKAJ+pk=
X-Google-Smtp-Source: ABdhPJwtG4h5vl1flKYBWuiPnfwQv4yKRilK2g62MwxFQG2hNm6JKMdHKvNFU3H8SSBQNVjwJDmecQ==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr34211057wrr.76.1634547461614; 
 Mon, 18 Oct 2021 01:57:41 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id j15sm12012769wrr.8.2021.10.18.01.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 01:57:41 -0700 (PDT)
Message-ID: <5c2c6afc-e854-11ee-f3be-0b5dd222b205@amsat.org>
Date: Mon, 18 Oct 2021 10:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/4] aspeed/wdt: Add trace events
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211004154635.394258-1-clg@kaod.org>
 <20211004154635.394258-2-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211004154635.394258-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/21 17:46, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/watchdog/wdt_aspeed.c | 5 +++++
>  hw/watchdog/trace-events | 4 ++++
>  2 files changed, 9 insertions(+)

> +# wdt-aspeed.c
> +aspeed_wdt_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
> +aspeed_wdt_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64

"size=%u", otherwise:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

