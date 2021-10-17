Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DCE430AC6
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 18:32:32 +0200 (CEST)
Received: from localhost ([::1]:43558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mc95M-0004iY-0q
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 12:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mc94S-00042C-6t
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 12:31:36 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mc94Q-0003mq-II
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 12:31:35 -0400
Received: by mail-wr1-x42f.google.com with SMTP id u18so36745838wrg.5
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 09:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HjQgGPNQld7jnZiS4mptMeYEbSGvHSbiAe+B2TUTzBc=;
 b=lJV+yPJ0l6rq51f2pmIk6PVxPPFZI/YJGe+Rz3QITKJRmmwwZS3i71OnwkwdtSWliN
 QjiQyIXvTvs1wqOBDD37rIJZX1E2tCSo+yaF3L9ANRLikbHTP4X1pKMuKPRK7bS4hnkl
 UBbw7m+UV+e2EY6V4lmZwcFfepSGNZ8RYEsjMPzZp5GOYw8BCp6enxrXt9XeAlUI4l/H
 SEKxwTakdeb8sHfgIaYvqlt6CpwIas8GYKhGqfnpubhcQZkqhu4jJ6W/VYot6O48izOA
 9x0jmvhxbZNvjVfnkGpVPUIIyHEpluvoL9pf1AMaGKr27pQQzSLpaSqxZxSa1adpNOTj
 C7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HjQgGPNQld7jnZiS4mptMeYEbSGvHSbiAe+B2TUTzBc=;
 b=KgMkJ4lIXlNHxrHmDRcC3H3R4v6WFQbK75pt/0svm7Seu3cl9O0zWfGiFSoe4DIB1d
 OpBwetURKHl1e1wdl089B1IGqAA6euGgmw6TImhYWgVbkCUFBTx56onhCi/avnwlyzRy
 ZZr/ylJ52AZCsVaLJVwcKKO5dwssPAjTpPUwb1YtZ+QNi3Wq0Z00s9XJr94abGAY4Alm
 7l416gBIaVxwFs+sK7gtsXQzcVYEyrXrg19vR3j9t/y/jZkHmpKNtYSFB7yNRme1yUGv
 YHXUSmEL8eqZeJJ1U9qqdxrMh+5X/K9Qc2cxCGUMmmN3E+F5Sxy4tzEarcxI5oaYiieh
 eU7w==
X-Gm-Message-State: AOAM533+MGp2saFKUmxsXe6CgA0YAPx6hdiWpeTyNbs5Vy1gM0+OAwyz
 RMF/VXH5CwqroDe0JBuElKc=
X-Google-Smtp-Source: ABdhPJyJ98S2fa+QZCAnbeAeVWQt+f1wzrtkmk0eYP+jBz4p/bJgoTNtoh5hpB8DbHWsJFr8tMcU4A==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr30375459wrc.25.1634488292470; 
 Sun, 17 Oct 2021 09:31:32 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id k10sm10157060wrh.64.2021.10.17.09.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 09:31:32 -0700 (PDT)
Message-ID: <84ff4daf-e04c-9238-ae31-9ddaed9a37dc@amsat.org>
Date: Sun, 17 Oct 2021 18:31:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 4/4] via-ide: Avoid using isa_get_irq()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>
References: <cover.1634259980.git.balaton@eik.bme.hu>
 <26cb1848c9fc0360df7a57c2c9ba5e03c4a692b5.1634259980.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <26cb1848c9fc0360df7a57c2c9ba5e03c4a692b5.1634259980.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.452,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 03:06, BALATON Zoltan wrote:
> Use via_isa_set_irq() which better encapsulates irq handling in the
> vt82xx model and avoids using isa_get_irq() that has a comment saying
> it should not be used.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/ide/via.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 94cc2142c7..252d18f4ac 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -29,7 +29,7 @@
>  #include "migration/vmstate.h"
>  #include "qemu/module.h"
>  #include "sysemu/dma.h"
> -
> +#include "hw/isa/vt82c686.h"
>  #include "hw/ide/pci.h"
>  #include "trace.h"
>  
> @@ -112,7 +112,7 @@ static void via_ide_set_irq(void *opaque, int n, int level)
>          d->config[0x70 + n * 8] &= ~0x80;
>      }
>  
> -    qemu_set_irq(isa_get_irq(NULL, 14 + n), level);
> +    via_isa_set_irq(pci_get_function_0(d), 14 + n, level);

Since pci_get_function_0() is expensive, we should cache
'PCIDevice *func0' in PCIIDEState, setting the pointer in
via_ide_realize(). Do you mind sending a follow-up patch?

>  }

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


