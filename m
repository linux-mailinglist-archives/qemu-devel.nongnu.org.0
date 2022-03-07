Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EDA4CFC29
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:01:39 +0100 (CET)
Received: from localhost ([::1]:34522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRB7S-0003lZ-U0
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:01:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAVS-0002ni-Cu; Mon, 07 Mar 2022 05:22:22 -0500
Received: from [2a00:1450:4864:20::433] (port=39865
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAVQ-0005ul-SM; Mon, 07 Mar 2022 05:22:22 -0500
Received: by mail-wr1-x433.google.com with SMTP id n15so8287957wra.6;
 Mon, 07 Mar 2022 02:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qxwh0bseKetLePvXdD6+DzYqmAdBxmJi+JZ4XNltWb4=;
 b=IRKqSxEJ7/MAzl7nQRbkUOVrD8Kv+OZ0xGysuEJT+NhnCeiKnDnokWeGzi4mjblpyd
 ia6zKfF/MlBRcms6Gh7joWhpVt+VtrLxG59JW2ja4dP2FiWRWdLR8t2k8bbjivnpgu7V
 EQcVRA4+o6twCfA589DbujsuthMrowkct5gAUHylMuYj6oCP0HcX1tV+oQrvoWoUBAVn
 SXvrenR70iM6PO0vs8ev0nwtA3uyLh/EYMjPCtaAqu8x/R50JROOAMYZ3FEqN4pZCPFq
 w2TofvGC+eT/Tr1KgFrXqTKlu7+IIC9ycVL80bMSPTqWBqv1AS2i4bsFVq/M7ziIHTMp
 ucXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qxwh0bseKetLePvXdD6+DzYqmAdBxmJi+JZ4XNltWb4=;
 b=oRTuDHdbEB31awK3M38gxSWhpuwM2L8gEzkA7b7VZk+b7AievX8NeMDfRmc4Xn4T9m
 HCK+x1tPMuG01jQCJ7fVao4QAbnlP0L00MYG4gaRE3ItytzfL4AFIgFOVPTUWiIljqdu
 uomB3ZxIW9QlJD6YbJfgfCCciravm7wivFHwzNGS5rTBNPdqc/c2lIltKb3AFZhZclYs
 27/8ENsW/ejok4476KtK+aLM1QE/rrk7FpUdNDAVkjhGUv9EJ1hmgm3KhcCvSHW6Z1cv
 M25dp5E9aKmpXtKisCpDSbS0lfTxwPFIQfr9X2rYX7ppZX7kkUSrftO5YBH2SLFi/jjJ
 +m1Q==
X-Gm-Message-State: AOAM53115OX1yO668KFdv0qUL3hgN1BiGa2AGBdzIlGAH5d9TV2nMGo9
 1K3rkLSp+q0eTUOwOfXYoIs=
X-Google-Smtp-Source: ABdhPJxtGvB5HwlnDr5q7EZ3pUsETB5H6z8Q/1vjgs3gaHP7wsfxh+DFJYhSJ9reedn1DF8JgcnBOg==
X-Received: by 2002:a05:6000:1a88:b0:1f1:d8df:89d3 with SMTP id
 f8-20020a0560001a8800b001f1d8df89d3mr7747174wry.321.1646648539242; 
 Mon, 07 Mar 2022 02:22:19 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a05600c354400b003899f5a8195sm4862038wmq.32.2022.03.07.02.22.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 02:22:18 -0800 (PST)
Message-ID: <e335813c-570e-5124-1d06-788d9a63fbd1@gmail.com>
Date: Mon, 7 Mar 2022 11:22:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 3/6] aspeed/smc: Remove 'num_cs' field
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220307071856.1410731-1-clg@kaod.org>
 <20220307071856.1410731-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220307071856.1410731-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/22 08:18, Cédric Le Goater wrote:
> It is not used anymore.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/ssi/aspeed_smc.h | 1 -
>   hw/arm/aspeed.c             | 2 --
>   hw/arm/aspeed_ast2600.c     | 2 --
>   hw/arm/aspeed_soc.c         | 2 --
>   hw/ssi/aspeed_smc.c         | 7 -------
>   5 files changed, 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

