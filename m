Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0AC4355A6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:00:09 +0200 (CEST)
Received: from localhost ([::1]:33064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdJd2-0006HZ-LV
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdJbG-0004SA-2g; Wed, 20 Oct 2021 17:58:18 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdJbE-0004by-Ky; Wed, 20 Oct 2021 17:58:17 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v17so452959wrv.9;
 Wed, 20 Oct 2021 14:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GoCNeXkR2UCXjoOVWE4nwolB4oZBsJho/sydr7rGtvM=;
 b=C+HKhkDiPLZW7rCA4fL504X6krGTkxiBqj4ct+Tzt/LfuihYMohFuA6XKXqvQN/5f9
 OKob7WBITx+QHwkzLi9VvW1+ZuXFMsEE8D0YvXNLC9Fu19o9oEn1wyD0rJhSE/eolnSX
 SzmSycEgsBf8ycC1pU3pFsL/hwXQEabCWF+j9f97eu1Ix4WxAQ3DyFqcccWk5AIhZk6D
 alPVUm1JKRb8q3s+itBXODFD4HXQrFMH8nmRpgfS24BM+4RHKIUzlCJTP5kyD7fSrzd0
 5jOwQb/DsLaddk3tlAj01CicOi7/3sDEgZYIbQjrQFa36IdeiE6PLliFlAJL2WgMJjR6
 iyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GoCNeXkR2UCXjoOVWE4nwolB4oZBsJho/sydr7rGtvM=;
 b=gr4wMsPilvvBnSEUlVhnzThKuY6kQKHkTkT99wYpqYAzEvRGjiNGW0oTqXR/wBrFGF
 7zzmwVXhAtJkmCS2MCtAJP2wvn/rqPQtvKwAJu4cbD4PLAdubEwxYUsnrvCPakPpqMnN
 wu0paNjJ1uVHvE4cMmFhgxQSCDHC+ylCyIzEO+cIK1h6hJsYJQ81bUDVQb2OziEL9kDf
 238u3Kb5tw3DLIqckXfr+LhWoXaWScYDpq9HMjgRmOUSsZh6lj/aM4YNckYnUDQvLv8f
 h3hg5zOgGMVawi4RryI2hSb8G0yiJVjhVU7wqZU/vZ0PFzBmUWHm0HB6tRVp6IQapuOS
 OvvQ==
X-Gm-Message-State: AOAM530nd4F4y2GgbhmXacHd0AeoEBjcszQ0jhsoWgOLvITFx5gZlri4
 xnKVWxS96GTN3X0FgH/Mngw=
X-Google-Smtp-Source: ABdhPJySARyZEzS9iqlgLRHkbfJ2IAi2oRfDe+sWsI+GukzkOUy+AFicUQ0GFBv9OGeibcwSrypKlw==
X-Received: by 2002:a05:6000:18a4:: with SMTP id
 b4mr2337228wri.394.1634767094529; 
 Wed, 20 Oct 2021 14:58:14 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l2sm3867826wrs.90.2021.10.20.14.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 14:58:14 -0700 (PDT)
Message-ID: <a42f6624-9bd3-609d-954d-be9fdf524c95@amsat.org>
Date: Wed, 20 Oct 2021 23:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 2/5] aspeed: Initialize the watchdog device models
 before the FMC models
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211018132609.160008-1-clg@kaod.org>
 <20211018132609.160008-3-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211018132609.160008-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/18/21 15:26, Cédric Le Goater wrote:
> Next changes will map the WDT2 registers in the AST2600 FMC memory
> region. Make sure the MemoryRegion pointers are correctly initialized
> before setting the object links.
> 
> Do the same in the Aspeed AST2400 and AST2500 SoC models for
> consistency.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed_ast2600.c | 36 ++++++++++++++++++------------------
>  hw/arm/aspeed_soc.c     | 36 ++++++++++++++++++------------------
>  2 files changed, 36 insertions(+), 36 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

