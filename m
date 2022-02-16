Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C344B9460
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 00:16:41 +0100 (CET)
Received: from localhost ([::1]:47190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKTXM-00025h-8V
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 18:16:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKTVs-0000Hk-Te
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 18:15:09 -0500
Received: from [2607:f8b0:4864:20::62b] (port=36565
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKTVr-00084i-Hy
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 18:15:08 -0500
Received: by mail-pl1-x62b.google.com with SMTP id u5so3206265ple.3
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 15:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NxQTKZf0Sdj2Fgl3phsl7nUUflWwEZfSBsZBrZnVvjA=;
 b=BlD1TO846+mM5nKHRa6r3ya3XaOuuUQNpaFBFp01pQl5eJ2OTSdnPaBzcRfMba6Abm
 LULTR6BgLfOPLhwpNDwe8cUoXX5RArKPj6im/V3GaNyfoSOunTvosm4mxXEVhvKYl506
 TLLfHP7L6sdKWkaYkCd2wzDW0Ulw4drhICYgmIUGPthadaafVgpv8NA2M8Cd9tHfew2D
 ptZYRo6ui0FAHrYhON+q1ABFn1BBgnnvu6Ewshmem7UyNFqhbGkEIfmgiLrf9iEEW1gQ
 WlTvoLS43WBOYgfQGHxQrOL07e8wQ4LpxtYhDNtPocEdv9akqBZ0kp31m1oFYvrMUZpc
 ZVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NxQTKZf0Sdj2Fgl3phsl7nUUflWwEZfSBsZBrZnVvjA=;
 b=AXVJqoqCFccoCJrupbjeOHAi0h1TT2C+Yki4PtkQc/6CAY9iTd0mI+vnPS6OZNQUxB
 6xjdaufuRLPTGWfRLDiOfuV7Kc9jhR4ONbNpV3KjgpWeL3XM7Aj9bLozjW9BeFJNn4h6
 uD7m3uKRD2hpeLuxNDUj+JUlWVga4AiYpj3uMJJk8W89CcfyyPrRnzluL8lHfM1gPPpG
 Yx0uxrq82+m3Gs3WqkqnmfjDcD1F/QIiMHr76LmFtClbDWQoV691gEv93JQ8Zuy7L+T7
 81KoPWfx/wNAGw1d107RXrFUl6wzHIQCS/Psse2u2mjJYtkgxoTVTtxVH0Z7VirBIDZo
 aK8w==
X-Gm-Message-State: AOAM530fGW/JlHT0m3dkhdarj+pwWyuuxKZXajDytlMya+2MuBdcOXSa
 wVa0IT+dsZhdBTGXXnyY2mU=
X-Google-Smtp-Source: ABdhPJxJEgvp+d1yJOfBh7VY/tfYkKz0QhjmcgwQKCEUwnHnvaB04I7+l7YgBUNim8qBezDflL3NKg==
X-Received: by 2002:a17:902:e294:b0:14c:da5b:2b26 with SMTP id
 o20-20020a170902e29400b0014cda5b2b26mr262184plc.110.1645053306173; 
 Wed, 16 Feb 2022 15:15:06 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id a3sm118993pjq.43.2022.02.16.15.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 15:15:05 -0800 (PST)
Message-ID: <184dccd7-55e8-1a70-f166-bd245e9b83cc@amsat.org>
Date: Thu, 17 Feb 2022 00:15:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 2/7] malta: Move PCI interrupt handling from
 gt64xxx_pci to piix4
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20220216224519.157233-1-shentey@gmail.com>
 <20220216224519.157233-3-shentey@gmail.com>
In-Reply-To: <20220216224519.157233-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62b.google.com
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
> Handling PCI interrupts in piix4 increases cohesion and reduces differences
> between piix4 and piix3.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix4.c         | 55 ++++++++++++++++++++++++++++++++++++++
>   hw/mips/gt64xxx_pci.c  | 60 ++++--------------------------------------
>   hw/mips/malta.c        |  6 +----
>   include/hw/mips/mips.h |  2 +-
>   4 files changed, 62 insertions(+), 61 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

