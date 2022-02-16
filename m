Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2A04B945E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 00:16:08 +0100 (CET)
Received: from localhost ([::1]:45088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKTWp-0000bI-BG
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 18:16:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKTUk-0007Yx-PZ
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 18:14:00 -0500
Received: from [2607:f8b0:4864:20::102d] (port=37402
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKTUj-0007os-EI
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 18:13:58 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so7830305pjl.2
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 15:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EEdLgI5OOErDBz4hAov9vPg/UQKik6igC8CHD68Uke0=;
 b=J4QiJontEmXs7j2H/luucwCYZm5B4QPf+ye4Or2Xf9rPHgxV68HWXgVqkpZzIJkL7P
 +zoQx8V8HQ15v9bJ8UlgDtzzebDI8T4rjfkI6cUDpNQ7b5wfrSZ1r8Lp8IplJiJgO6UM
 NTS09QrtAAVq2+G0CRIfygFRqHOobStVxJskTGHWx5yWflbRSrpD/ADZhDXmSwa27F/C
 q6jaxbQzmMvulLd669Z3ExdogEnR0yz7nafLt7aIkQbhqcMTn61EukpRCVxyvpTDyBAz
 ciPW/EX3NSIe88QDy+9LLnoAe0fxB+TPwnio6hdObeaM55O8Lh4h/rr2FYxiJyHieWhe
 DRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EEdLgI5OOErDBz4hAov9vPg/UQKik6igC8CHD68Uke0=;
 b=ZseFfSIbiPeufJgrbulAZQUA9Xozv7xc8cpIb5GCWOIOcTvdHcj9bZx5ErTxWshkIc
 kVGuwUB10B70qy7QO4LVcJun1inxnuntyCcscW3lIrKhZf/YAB98Nke287lbWBBUivPH
 tXyWx5TqmqrOg+ECXLdfgkkJ0RWeSWl0NBd5j4e7RvvTzX2vAOvDCmn+4Xfwd638ceWd
 CpO//yKHMrnE+vwkIS1mQocrF3TwFSH7gPFOZ81lMkh9HCaLszd9fvmE0ebKnZNhP4gB
 X6xo2zI1TozCZgyPCntoYeiOk/mYihDEXvLmPZ1x7rjfdx4gjWg5xPhH2ulLXLqTStJN
 AgDA==
X-Gm-Message-State: AOAM530lEeLLz4nA0JXQ3+hl3XzH3Q7xrA1pmfwPllbymM9lcPhV4Dpn
 TEtNqV0RKW081WOlost0Sv4=
X-Google-Smtp-Source: ABdhPJyhfaxt4xDeY3huwaz4Op3YluwSIfJKh5P2MJ4pE2HCKyCMCDoKcva/3cHk604OYrHHVsL3og==
X-Received: by 2002:a17:902:9b97:b0:14d:a773:4d35 with SMTP id
 y23-20020a1709029b9700b0014da7734d35mr161582plp.61.1645053235861; 
 Wed, 16 Feb 2022 15:13:55 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id 17sm44608735pfl.175.2022.02.16.15.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 15:13:55 -0800 (PST)
Message-ID: <134278e9-c58e-aff1-a343-c1aa047b4a10@amsat.org>
Date: Thu, 17 Feb 2022 00:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 3/7] hw/isa/piix4: Resolve redundant i8259[] attribute
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20220216224519.157233-1-shentey@gmail.com>
 <20220216224519.157233-4-shentey@gmail.com>
In-Reply-To: <20220216224519.157233-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 16/2/22 23:45, Bernhard Beschow wrote:
> This is a follow-up on patch "malta: Move PCI interrupt handling from
> gt64xxx_pci to piix4" where i8259[] was moved from MaltaState to
> PIIX4State to make the code movement more obvious. However, i8259[]
> seems redundant to *isa, so remove it.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix4.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

