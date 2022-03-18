Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C554DDE8E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 17:19:25 +0100 (CET)
Received: from localhost ([::1]:54306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVFK0-0004Hl-A7
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 12:19:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVFIs-0003J6-WB
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:18:15 -0400
Received: from [2607:f8b0:4864:20::534] (port=34352
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVFIr-0006SO-Dh
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:18:14 -0400
Received: by mail-pg1-x534.google.com with SMTP id t187so5367562pgb.1
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=A6lZLuiZdeZJebLh+6FDBs0cEjaUMc5OTNzZow0yxAE=;
 b=kDXOzITt9sPr75d9BhpD74pUYIhQH8gyXMYwuadM6nWdYXtWR+bahnxH03XszFF8YK
 xVPkBhd/Ndo6aynC2XIpnWU7WA9b2Uw3+YgpP92GbAqoBtQTyKdwa7CfNAuVaopg1PHo
 UoXZDiJoZ7vbGglBEwelHwZVIpy2NDOof6FAQaFVYwg/LAj2y3dCwzgTq88nFG7kLFws
 vsGro4a0v4ljGqvlgBV0onJL1bSsqcAsypXsaCxqlVWWI7bULnqGkPddPD9ZRK5J74w5
 jYF+oAZwZuk24Z6stEfQ0pivWCv2VlIaU4T1HMSDixbBviugh1An/cGdiW36ekYg2Dqf
 rTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A6lZLuiZdeZJebLh+6FDBs0cEjaUMc5OTNzZow0yxAE=;
 b=XaHBDbxrYJgzOOSljBMA/Ok9yl3YyiM5gmAb2ppx9+m+RRzwRMwnmxvpAqkcH5YoIC
 DPC5xvX8nnh24DKzH+oXcXWaoCMdbHGKkcvOrIOCM2d2Ia1euFtj1M0J5K5m22MpjpyJ
 hmc46Nl0nRsStizz+5g/+VnUfHFvYqusASYNYKu+6NhiZads+rjCysPKn6Z4mIVKJsed
 DMbn14uSoTV9pBJifcnHXB/fFnAKyQT0RzKfGpU2dH2nKpLCGaJy3gc3L3E6w06JMyko
 PmNR+EcQWNQmM8fNyXg3e2v4atgbML6o0P6q6I5/oIORTwEqgmptgPDtWwZVJ4FaiPoh
 Vb2w==
X-Gm-Message-State: AOAM5319cws5dFdl+7mNaPLd9WdaSZO5WD5PznaiHsm3pu02OF1OJ7yP
 FJYJIvH98dmIRXLLsv0dA3A=
X-Google-Smtp-Source: ABdhPJzN5cPs8CJSWNoAeS0t5ThZmvpZmIKY6pSyVevgx1d/b5zUgpfkm7oqq10+5lrl8HO1QTkmEA==
X-Received: by 2002:a65:4143:0:b0:375:89f4:b46a with SMTP id
 x3-20020a654143000000b0037589f4b46amr8391101pgp.335.1647620292031; 
 Fri, 18 Mar 2022 09:18:12 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y32-20020a056a001ca000b004fa201a613fsm8875086pfw.196.2022.03.18.09.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 09:18:11 -0700 (PDT)
Message-ID: <b3f40e00-ab03-0815-4ba8-61e3763e9edd@gmail.com>
Date: Fri, 18 Mar 2022 17:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 for-7.1] vfio/common: remove spurious tpm-crb-cmd
 misalignment warning
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com
References: <20220318150135.308623-1-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220318150135.308623-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x534.google.com
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
Cc: peter.maydell@linaro.org, cohuck@redhat.com, stefanb@linux.vnet.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/3/22 16:01, Eric Auger wrote:
> The CRB command buffer currently is a RAM MemoryRegion and given
> its base address alignment, it causes an error report on
> vfio_listener_region_add(). This region could have been a RAM device
> region, easing the detection of such safe situation but this option
> was not well received. So let's add a helper function that uses the
> memory region owner type to detect the situation is safe wrt
> the assignment. Other device types can be checked here if such kind
> of problem occurs again.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v1 -> v2:
> - do not check the MR name but rather the owner type
> ---
>   hw/vfio/common.c     | 27 ++++++++++++++++++++++++++-
>   hw/vfio/trace-events |  1 +
>   2 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 080046e3f51..98b0b6fb8c7 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -40,6 +40,7 @@
>   #include "trace.h"
>   #include "qapi/error.h"
>   #include "migration/migration.h"
> +#include "sysemu/tpm.h"

> +static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
> +{
> +    MemoryRegion *mr = section->mr;
> +
> +    if (!object_dynamic_cast(mr->owner, TYPE_TPM_CRB)) {

Using TPM_IS_CRB() instead:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

