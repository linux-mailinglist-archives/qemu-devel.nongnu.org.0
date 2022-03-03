Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457474CC036
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 15:44:11 +0100 (CET)
Received: from localhost ([::1]:60638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPmgc-0002lM-C5
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 09:44:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPmeD-0001Hd-HE
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:41:42 -0500
Received: from [2607:f8b0:4864:20::1032] (port=44627
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPmeB-00047Q-PL
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:41:41 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so4888071pjb.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 06:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d/saZ9eUVVc6holwxky7oFz5YNSon/iqj3/DtKdZexY=;
 b=C+eDbaTFzdt0v/3KsePMULsWsD7cqSHTktUzdlTlaUmWuhreq1Vr9wex401yVKBIid
 iSBhgKcok4/ERgyca9s/Moa6917jjjg4232MzFmrRqqsxDueIrPE6YPj/fbuVbdVHOqt
 kWffSMJLPKAOPtknygqwDdLdSengRxOWlvw1p6bqfdiFYFwrkyJlf7MEFHRkqpYTrgIi
 uTM0gW9RkkPytoN1fCiM57xmD0a+hIA8Bd2S0mZGxB+a6wIGvyHMdCNUtu4mfzrLIQlr
 1JLtmENK1zoIEK2ps1uaYGmAmEK4ntDgCTIqozrlmVWb+4frjEXX95gVKs0QbEmpDYDz
 3bfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d/saZ9eUVVc6holwxky7oFz5YNSon/iqj3/DtKdZexY=;
 b=IGEzO9Fao9AFV2pl5L/5FLABdHurx058CZ8dpPP1ZaGP7HPbWC2eB0hU/XhCe07FDa
 nlWgnzA0Foo0xiqUmSH9NBtzS3D7pK8w31Tc7wOEcYp8Fo+9xnITk3eTLOODzGrteLyf
 L9QO2ydwwikfKTlqlJtVlqdDzQH/4klSmHSuQ9dhkO6O+TQ0q3jT1QJ2CWOxo2CbNKc3
 UCXtbmEP5TKa3RvRhpRNi1n6K7R/yf/sfEphbqPRc6vhh7k26Qebzgac/yrls/DG2fBo
 9493+92fZQvSzPsEv3F4rP63lN+RiYX/AMc8tiReBVUC0q/HfXbWQCKnqImF/FzI3Sye
 BXgQ==
X-Gm-Message-State: AOAM530Bo3ZgiPjRuai8MjSF3sY18A6PywBKE+lAu1cQg7kas+wZ3K10
 YoKITlKxvYJVha1alPjhksc=
X-Google-Smtp-Source: ABdhPJywXNc4Qlz7j/kFTnumlthpXQ7hNi6HREy5wUcd3OTVhjX5Ty2bfYp7Kf3u+dfIAS/paRh1Mg==
X-Received: by 2002:a17:903:248:b0:151:b270:7e76 with SMTP id
 j8-20020a170903024800b00151b2707e76mr1308650plh.120.1646318498380; 
 Thu, 03 Mar 2022 06:41:38 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 lk9-20020a17090b33c900b001bc7c2dfcdbsm2414284pjb.37.2022.03.03.06.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 06:41:37 -0800 (PST)
Message-ID: <5f0b5304-359b-1cc6-6ea0-57ba6b0947f0@gmail.com>
Date: Thu, 3 Mar 2022 15:41:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v4 08/14] none-machine: add 'ram-addr' property
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org,
 mark.burton@greensocs.com, edgari@xilinx.com
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-9-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220223090706.4888-9-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/2/22 10:07, Damien Hedde wrote:
> Add the property to configure a the base address of the ram.
> The default value remains zero.
> 
> This commit is needed to use the 'none' machine as a base, and
> subsequently to dynamically populate it using qapi commands. Having
> a non null 'ram' is really hard to workaround because of the actual
> constraints on the generic loader: it prevents loading binaries
> bigger than ram_size (with a null ram, we cannot load anything).
> For now we need to be able to use the existing ram creation
> feature of the none machine with a configurable base address.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   hw/core/null-machine.c | 34 ++++++++++++++++++++++++++++++++--
>   1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
> index 7eb258af07..5fd1cc0218 100644
> --- a/hw/core/null-machine.c
> +++ b/hw/core/null-machine.c
> @@ -16,9 +16,11 @@
>   #include "hw/boards.h"
>   #include "exec/address-spaces.h"
>   #include "hw/core/cpu.h"
> +#include "qapi/visitor.h"
>   
>   struct NoneMachineState {
>       MachineState parent;
> +    uint64_t ram_addr;
>   };
>   
>   #define TYPE_NONE_MACHINE MACHINE_TYPE_NAME("none")
> @@ -26,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(NoneMachineState, NONE_MACHINE)
>   
>   static void machine_none_init(MachineState *mch)
>   {
> +    NoneMachineState *nms = NONE_MACHINE(mch);
>       CPUState *cpu = NULL;
>   
>       /* Initialize CPU (if user asked for it) */
> @@ -37,9 +40,13 @@ static void machine_none_init(MachineState *mch)
>           }
>       }
>   
> -    /* RAM at address zero */
> +    /* RAM at configured address (default: 0) */
>       if (mch->ram) {
> -        memory_region_add_subregion(get_system_memory(), 0, mch->ram);
> +        memory_region_add_subregion(get_system_memory(), nms->ram_addr,
> +                                    mch->ram);
> +    } else if (nms->ram_addr) {
> +        error_report("'ram-addr' has been specified but the size is zero");

I'm not sure about this error message, IIUC we can get here if no ram
backend is provided, not if we have one zero-sized. Otherwise LGTM.

> +        exit(1);
>       }

