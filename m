Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA0253558F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:36:03 +0200 (CEST)
Received: from localhost ([::1]:33544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuL9F-0007BG-Pz
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuL7F-0005Ae-F6; Thu, 26 May 2022 17:33:57 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:36748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuL7D-0007O3-Q8; Thu, 26 May 2022 17:33:57 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-edeb6c3642so3757534fac.3; 
 Thu, 26 May 2022 14:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5DVjK/wX3sR5WZY/hkuBjB8jVLAjNqWF7IL/p8fam14=;
 b=aJFPGYbZScj7RRfvA9XzvxkJIDuPMCwp9hZSFbnxYJENrOBznIIm/gwLzQaHZMrPmf
 yThrM/RRUBygLNpHFuciAmXjJfJUnxB6qhkVw2+47Xb6CpdPpAgMJN5wmjDvSisngsgx
 6ZL2Bd5H5WuuCdAQoGxHXjPNCHqqr2PYkPvT+t8xdfUlBDaLzhVJIxew8IlVwX51W0bg
 fUPzsxF0V70fzH1tMm7o4cXNqOKp55El63mUeYolkgFa78AM7HLsjB04BTZkHdiKY+Ei
 HOb71edo8SQCFWWHCFyufagsskv4PQxSb6q7UXvijPkQP5YlLAj8am4ID5ThYJ35ekO6
 7KZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5DVjK/wX3sR5WZY/hkuBjB8jVLAjNqWF7IL/p8fam14=;
 b=Z/CRkZcSIzkMF8cBfY/mwYRMmI3QGtjSdTWC4vfm1Er7vOblo4AahSL9f2qQEkRb/N
 wQ9DU5zJKxRho4t5u3nSX0WLqoc/UITnohKNnJs8JQ67ET1MXsDPn/slRbUpKqQhTnac
 YGH5gnYdyclCBH68ULIxHOL267UZ5+aVqiY4I6Oybae8XRzTMQe8LLaA/9erhTf7r9T3
 88VHvAoQqfuJ1xTjpRE/nFs2h8wSwz/OzKGjvcm0ZqHTN4DX++4SEZ5j+Z6Q6TPvj302
 2iaihILGanVwlvh75+Y2lgdriQ27Qfy/XZoEjfsBSexf0A6n3iRF8+Ftd5l9uXLkMF3j
 F5Zg==
X-Gm-Message-State: AOAM532cz/DcyqaPe/pr2NUyywmxpbcWVZdcQ4hZ6sjja8oXsMDgkYt5
 qSQgUuCwzlCF4rSbJpkLDd0=
X-Google-Smtp-Source: ABdhPJwfR2cKGkB8ipeoHyvEJePDTIyEWl1uAp3hSDhb7XP91JOggzEJ9PMv26APMjfGYuoHKbM4FQ==
X-Received: by 2002:a05:6870:17a6:b0:f1:ccf4:ad53 with SMTP id
 r38-20020a05687017a600b000f1ccf4ad53mr2374013oae.48.1653600833691; 
 Thu, 26 May 2022 14:33:53 -0700 (PDT)
Received: from [192.168.10.102] (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 b3-20020a056820134300b0035eb4e5a6ccsm1065063oow.34.2022.05.26.14.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 14:33:53 -0700 (PDT)
Message-ID: <dc3ebcca-78e9-ded1-519f-416a3aaf2a11@gmail.com>
Date: Thu, 26 May 2022 18:33:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 06/10] hw/ppc/e500: Remove unused
 BINARY_DEVICE_TREE_FILE
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "open list:e500" <qemu-ppc@nongnu.org>
References: <20220520180109.8224-1-shentey@gmail.com>
 <20220520180109.8224-7-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220520180109.8224-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 5/20/22 15:01, Bernhard Beschow wrote:
> Commit 28290f37e20cda27574f15be9e9499493e3d0fe8 'PPC: E500: Generate
> device tree on reset' improved device tree generation and made
> BINARY_DEVICE_TREE_FILE obsolete.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/ppc/e500.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 2bc3dce1fb..7f7f5b3452 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -47,7 +47,6 @@
>   #include "hw/irq.h"
>   
>   #define EPAPR_MAGIC                (0x45504150)
> -#define BINARY_DEVICE_TREE_FILE    "mpc8544ds.dtb"
>   #define DTC_LOAD_PAD               0x1800000
>   #define DTC_PAD_MASK               0xFFFFF
>   #define DTB_MAX_SIZE               (8 * MiB)

