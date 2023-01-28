Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD08767FBD7
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 00:34:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLugz-0003Sq-Ci; Sat, 28 Jan 2023 18:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pLugw-0003SG-LI; Sat, 28 Jan 2023 18:33:02 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pLugv-0003ia-02; Sat, 28 Jan 2023 18:33:02 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-16346330067so11004812fac.3; 
 Sat, 28 Jan 2023 15:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+FPSBUqUDCbjK5SMFDbixw+ED95ggzOVp/fZudhlzQc=;
 b=ln4svgzDiC857vnHWIUF2390/uiy+vHacCn62ZVacDKgndm+qAzrd6LWSjycrKjUsa
 qv9oV20bCRH/VW7OGs4pxzgRM6k0q0kVg81WPeuS3GJs7TXhfmeUD8Rxx0mGuUbl44vv
 rOCa1O9k1B3FtFMNyv/OxlX2JIyzW9uFG8yAbZ7+Jv+HYvTPGp+N38ebQfxjzcC4UU/9
 OOE4W8AS/oYdgOXpH/7Rgftxp8Kh0jKzLNFG+109ihNCMm+S/qtolSdIxhDJ+ztitCpC
 qTmtnlYxQ3LSfdVeR8+4vKZk1jpHgA9EKcoSlTQPexqpkaHkhgGHR9+d4fEVXzX5cDap
 qulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+FPSBUqUDCbjK5SMFDbixw+ED95ggzOVp/fZudhlzQc=;
 b=2akneS121wja6xMW5eFWNlm7lBfllya+4PbFQdDezRmS3yWgS2JS2unnPi46hraZVP
 gET0fa2VS0UztfnkOuInoOyt315L+FUzk/6yixJd6elFwQbA1w3TYVC0Iu4ptydeNWBq
 9oao3uTkgEvBTdoqsn+A1r0/+LCBYvdbKORUNo44XXXM87l8/QaFOzx5nVw4N2rO8HwL
 3tqFAML++zlUVuQ91ryEZ1yG7C4fUuoxYf+ja5o2Q8sLkfZc4eVlq/8n7fgKpiifnAq9
 e4IOOtiMLn2tPDOaFIWyXZrwk5B3JDUvWoC8Yb40+91v5vNU51Eiu2zodDoCQCsREg7M
 m/bg==
X-Gm-Message-State: AO0yUKW0HGqNikHyrg3sLbLCCuJ/IESEo/WJ3ueKnircawXjaNPxhRKY
 LBplJfNFldYAnSJiML4XOxsbEBYGWjk=
X-Google-Smtp-Source: AK7set8r/JtkqHFoDjXg6185PVwaohM9sYQubgpGtqYZY2Rx8ZW/SVtz3LkHwt+fJS94PEJ7qde48A==
X-Received: by 2002:a05:6870:561f:b0:163:29ec:6776 with SMTP id
 m31-20020a056870561f00b0016329ec6776mr9720275oao.32.1674948778019; 
 Sat, 28 Jan 2023 15:32:58 -0800 (PST)
Received: from [192.168.68.107] (200-148-13-157.dsl.telesp.net.br.
 [200.148.13.157]) by smtp.gmail.com with ESMTPSA id
 c17-20020a056870479100b0014fd25bd3b5sm3621810oaq.0.2023.01.28.15.32.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 15:32:57 -0800 (PST)
Message-ID: <389a1d6d-d6ee-9788-c402-3915e5aa2c44@gmail.com>
Date: Sat, 28 Jan 2023 20:32:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/4] PCI-related cleanup for ppc/powernv
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20230127122848.550083-1-fbarrat@linux.ibm.com>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230127122848.550083-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 1/27/23 09:28, Frederic Barrat wrote:
> Pretty simple PCI-related cleanup for powernv
> 
> Frederic Barrat (4):
>    ppc/pnv/pci: Cleanup PnvPHBPecState structure
>    ppc/pnv/pci: Remove duplicate definition of PNV_PHB5_DEVICE_ID
>    ppc/pnv/pci: Update PHB5 version register
>    ppc/pnv/pci: Fix PHB xscom registers memory region name

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

> 
>   hw/pci-host/pnv_phb4.c         | 2 +-
>   include/hw/pci-host/pnv_phb4.h | 5 +----
>   2 files changed, 2 insertions(+), 5 deletions(-)
> 

