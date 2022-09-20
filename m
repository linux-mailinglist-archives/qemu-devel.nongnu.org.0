Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D37E5BEE9B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 22:37:16 +0200 (CEST)
Received: from localhost ([::1]:49362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oajzX-0008EH-Bw
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 16:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oafMO-0001RJ-7O; Tue, 20 Sep 2022 11:40:32 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:33342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oafMM-00026E-Df; Tue, 20 Sep 2022 11:40:31 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1274ec87ad5so4878752fac.0; 
 Tue, 20 Sep 2022 08:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=BgXKGvAX7TGUhqn3f0++dK0+AnxAU2iMCwEEafnZxzs=;
 b=p2rUYmGFt8VUU9JwBw6xJ/K1orE/QM8cxpkVKhdzhrKNLheNN/h1Ef2tkEPWO9XYgv
 m2SsImZYBP/dWiNlAKpB1/JDpLLd6GHbSMbivZTxSTZ1UjmRR3WCkQjEjKCoeQ9wMv1d
 +HHWBET7B6Ky+Ezc5SWoq7hfEgfVoHl3y4FAORYvga6bUWEkAneE8F6LPwgKy6d6pfDl
 DQNJTNquxOsoUMs/+90VsHAWa9MTdH3URTHuiM1lWC25ENp4svc0MkxWWJIvTOxxRl1E
 gXsbtk/UJKz5sJyuhmn7Iu1amjElIwNqk067aLwrZRpmLcWCaR0Sv2jJMn/bdXP1Hz7F
 P0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=BgXKGvAX7TGUhqn3f0++dK0+AnxAU2iMCwEEafnZxzs=;
 b=ef59MzER4ohVdcWP5rXQ8BgVd8in9Xj/kuqkPmnLpp4dmWozY/l7YwJgIJo141Y7p0
 UsnFy9oPY3zNYRxG24W++750cyAeSgKJCjuh83ntibOU1iaTX3CoPptLLal1V8pcAiZa
 QXZVYkvsQnuoFpfp74VvM5hWrAnWWRPTh8stcyfe3BIKNNL8j2/m+Dl9i77oi84gIY8a
 Qlz3/exgsSAFAd5u+f5/gO5JTE+pNuq8B+3P5cMHJ2w7540mE5Uo5XyjNmYAgLhy5cP2
 8ZqTH2yMS0psHmuI/mVTU1S1BmcHDXQAix5ohkhTfP59HTDTqD29tpltaF8mtHNi9SsU
 0hFg==
X-Gm-Message-State: ACrzQf2VEBHesQGJ4IM4uXQMWD7+LAgYuR59B3uprGmBsjZXS8S9BHsm
 8Ok6KCj4Wh9AdAf/H7YwF4g=
X-Google-Smtp-Source: AMsMyM73AFaHYKEOnm7NPcqpVsXdws9MDLKLEI1Z9VZ3WrD7nykpjSnvoww+Snl27z+8qFb99ARBbg==
X-Received: by 2002:a05:6870:2392:b0:127:7e1:e3bf with SMTP id
 e18-20020a056870239200b0012707e1e3bfmr2489554oap.43.1663688428621; 
 Tue, 20 Sep 2022 08:40:28 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 ca11-20020a056830610b00b0065a0d4b8969sm71140otb.5.2022.09.20.08.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 08:40:27 -0700 (PDT)
Message-ID: <8c9748e9-0204-c5c5-bdde-3ae069c0c98a@gmail.com>
Date: Tue, 20 Sep 2022 12:40:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 28/39] hw/pci-host: pnv_phb{3, 4}: Fix heap
 out-of-bound access failure
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-29-bmeng.cn@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220920103159.1865256-29-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.182,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bin,

Since I'll send a ppc pull request shortly, I'll queue up both this and patch 27 via
the ppc tree. These are good fixes that are independent of what happens with the
'tests/qtest: Enable running qtest on Windows​' series.


Thanks,


Daniel

On 9/20/22 07:31, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> pnv_phb3_root_bus_info and pnv_phb4_root_bus_info are missing the
> instance_size initialization. This results in accessing out-of-bound
> memory when setting 'chip-id' and 'phb-id', and eventually crashes
> glib's malloc functionality with the following message:
> 
>    "qemu-system-ppc64: GLib: ../glib-2.72.3/glib/gmem.c:131: failed to allocate 3232 bytes"
> 
> This issue was noticed only when running qtests with QEMU Windows
> 32-bit executable. Windows 64-bit, Linux 32/64-bit do not expose
> this bug though.
> 
> Fixes: 9ae1329ee2fe ("ppc/pnv: Add models for POWER8 PHB3 PCIe Host bridge")
> Fixes: 4f9924c4d4cf ("ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge")
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> Changes in v2:
> - new patch: "hw/pci-host: pnv_phb{3,4}: Fix heap out-of-bound access failure"
> 
>   hw/pci-host/pnv_phb3.c | 1 +
>   hw/pci-host/pnv_phb4.c | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index af8575c007..9054c393a2 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1169,6 +1169,7 @@ static void pnv_phb3_root_bus_class_init(ObjectClass *klass, void *data)
>   static const TypeInfo pnv_phb3_root_bus_info = {
>       .name = TYPE_PNV_PHB3_ROOT_BUS,
>       .parent = TYPE_PCIE_BUS,
> +    .instance_size = sizeof(PnvPHB3RootBus),
>       .class_init = pnv_phb3_root_bus_class_init,
>   };
>   
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 824e1a73fb..ccbde841fc 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1773,6 +1773,7 @@ static void pnv_phb4_root_bus_class_init(ObjectClass *klass, void *data)
>   static const TypeInfo pnv_phb4_root_bus_info = {
>       .name = TYPE_PNV_PHB4_ROOT_BUS,
>       .parent = TYPE_PCIE_BUS,
> +    .instance_size = sizeof(PnvPHB4RootBus),
>       .class_init = pnv_phb4_root_bus_class_init,
>   };
>   

