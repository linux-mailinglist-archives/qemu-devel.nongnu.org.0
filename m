Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D89B36C77C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 16:04:39 +0200 (CEST)
Received: from localhost ([::1]:57582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbOKM-0001CO-6v
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 10:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lbOI6-0000G9-CS; Tue, 27 Apr 2021 10:02:18 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:41523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lbOHz-0004VY-Hk; Tue, 27 Apr 2021 10:02:18 -0400
Received: by mail-qk1-x730.google.com with SMTP id 8so26279662qkv.8;
 Tue, 27 Apr 2021 07:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QH/OUlp9Y/Egq3Eos/j8U05dojd+9jsbV9FKSFsoeo8=;
 b=u62AvzrV1u2ieDcNSntXfOZrvA3Gjcys+5RB1GfQHxCFq3w3ziCWnGEeDt1u2mXEBN
 309bV2ez70DV3O37KD/Ff2q6OtyVvzVWlprkxzS534H3BQc05AuR7dtEzxgexUnaamxi
 YeRmM6ubkYHlju3xBApkLAJIsc0EUJ3xS/MwMEEAhf7SxyrNkEW+HegVg+xxpEHTGoKI
 z9/s/wKFIUY8QzFLaTAsInc5LzsSuOJPAn0KR1G7uaWJRCSx9TwQwdA1NCDRgySfvm4m
 4xsFbyp2TeM3O/QRThxw9Bb3LQM5glGs8frb/O0QBqUaSqfwRNsf5XA60V2YriGgxjUq
 auLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QH/OUlp9Y/Egq3Eos/j8U05dojd+9jsbV9FKSFsoeo8=;
 b=GkQ8s2KkjrO5M4gNuqx57M9wmMnqr7evf7C9VNuncbQ8jzqya+QDeJjPJy9v1iydFJ
 FcY3QOlrqXi6EU8wcxS1wbkzrNiX9bz8mg9EwmF0PyanGGgPRWF6Ab1VbNv5/PTptik4
 usNv3mcRDCZzkoi+k+Ag6FmSm4v3il6Z1WfDeVS53T3VwvvfcdF4fOC6HcSGRrk4JehE
 DYMqDskVWS5Ch6ma4wPBwEaYIsozFHmQcdY/sIyUD0etbROjnbOmARNypK7bDe3jFr6T
 3sCzpVpTWiMt7Ab1dfsk4BzvttLs5p1MAOsBdozcMSUZvN5/EXebQKi7fDN3yyqroaPY
 uAbg==
X-Gm-Message-State: AOAM530aSkQRR6cN0j0bDLDBVqIQ095HU64nZnZ0ddYoRgR6tDDviieB
 c2AXaWSmoYgW6t2GPt+1uuUm/kBL9lI=
X-Google-Smtp-Source: ABdhPJwKFUfaQLlc5QSfyJNKzkx3UtA+zztk373Cb035EhNDrG5WGYQapB1cu2PDTkkKDWa5BF4HXw==
X-Received: by 2002:a37:a5d6:: with SMTP id
 o205mr22910476qke.166.1619532128581; 
 Tue, 27 Apr 2021 07:02:08 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:6de0:3db1:1b8e:b097:6036?
 ([2804:431:c7c7:6de0:3db1:1b8e:b097:6036])
 by smtp.gmail.com with ESMTPSA id q26sm13646004qtr.7.2021.04.27.07.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 07:02:08 -0700 (PDT)
Subject: Re: [PATCH] spapr: Modify ibm, get-config-addr-info2 to set DEVNUM in
 PE config address.
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Qemu-devel <qemu-devel@nongnu.org>
References: <161952458744.148285.11534763593153102355.stgit@jupiter>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <3f57fa90-6561-acba-0e49-8132bbeac5c3@gmail.com>
Date: Tue, 27 Apr 2021 11:02:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <161952458744.148285.11534763593153102355.stgit@jupiter>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: Oliver O'Halloran <oohall@gmail.com>, Qemu-ppc <qemu-ppc@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/27/21 8:56 AM, Mahesh Salgaonkar wrote:
> With upstream kernel, especially after commit 98ba956f6a389
> ("powerpc/pseries/eeh: Rework device EEH PE determination") we see that KVM
> guest isn't able to enable EEH option for PCI pass-through devices anymore.
> 
> [root@atest-guest ~]# dmesg | grep EEH
> [    0.032337] EEH: pSeries platform initialized
> [    0.298207] EEH: No capable adapters found: recovery disabled.
> [root@atest-guest ~]#
> 
> So far the linux kernel was assuming pe_config_addr equal to device's
> config_addr and using it to enable EEH on the PE through ibm,set-eeh-option
> RTAS call. Which wasn't the correct way as per PAPR. The linux kernel
> commit 98ba956f6a389 fixed this flow. With that fixed, linux now gets the
> PE config address first using the ibm,get-config-addr-info2 RTAS call, and
> then uses the found address as argument to ibm,set-eeh-option RTAS call to
> enable EEH on the PCI device. This works on PowerVM lpar but fails in qemu
> KVM guests. This is because ibm,set-eeh-option RTAS call in qemu expects PE
> config address bits 16:20 be populated with device number (DEVNUM).
> 
> The rtas call ibm,get-config-addr-info2 in qemu always returns the PE
> config address in form of "00BB0001" (i.e.  <00><BUS><DEVFN><REG>) where
> "BB" represents the bus number of PE's primary bus and with device number
> information always set to zero. However until commit 98ba956f6a389 this
> return value wasn't used to enable EEH on the PCI device.
> 
> Now in qemu guest with recent kernel the ibm,set-eeh-option RTAS call fails
> with -3 return value indicating that there is no PCI device exist for the
> specified pe config address. The rtas_ibm_set_eeh_option call uses
> pci_find_device() to get the PC device that matches specific bus and devfn
> extracted from PE config address passed as argument. Since the DEVFN part
> of PE config always contains zero, pci_find_device() fails to find the
> specific PCI device and hence fails to enable the EEH capability.
> 
> hw/ppc/spapr_pci_vfio.c: spapr_phb_vfio_eeh_set_option()
>     case RTAS_EEH_ENABLE: {
>          PCIHostState *phb;
>          PCIDevice *pdev;
> 
>          /*
>           * The EEH functionality is enabled on basis of PCI device,
>           * instead of PE. We need check the validity of the PCI
>           * device address.
>           */
>          phb = PCI_HOST_BRIDGE(sphb);
>          pdev = pci_find_device(phb->bus,
>                                 (addr >> 16) & 0xFF, (addr >> 8) & 0xFF);
>          if (!pdev || !object_dynamic_cast(OBJECT(pdev), "vfio-pci")) {
>              return RTAS_OUT_PARAM_ERROR;
>          }
> 
> hw/pci/pci.c:pci_find_device()
> 
> PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn)
> {
>      bus = pci_find_bus_nr(bus, bus_num);
> 
>      if (!bus)
>          return NULL;
> 
>      return bus->devices[devfn];
> }
> 
> This patch fixes this issue by populating DEVNUM field (bits 16:20) of PE
> config address with device number.
> 
> After this fix guest is able to find EEH capable devices and enable EEH
> recovery on it.
> 
> [root@atest-guest ~]# dmesg | grep EEH
> [    0.048139] EEH: pSeries platform initialized
> [    0.405115] EEH: Capable adapter found: recovery enabled.
> [root@atest-guest ~]#
> 
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/spapr_pci.c |    8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index feba18cb12..d6b0c380c8 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -538,8 +538,9 @@ static void rtas_ibm_get_config_addr_info2(PowerPCCPU *cpu,
>       }
>   
>       /*
> -     * We always have PE address of form "00BB0001". "BB"
> -     * represents the bus number of PE's primary bus.
> +     * Return PE address of form "00BBD001". "BB" represents the
> +     * bus number of PE's primary bus and "D" represents the device number.
> +     * Guest uses this PE address to enable EEH on this pci device.
>        */
>       option = rtas_ld(args, 3);
>       switch (option) {
> @@ -550,7 +551,8 @@ static void rtas_ibm_get_config_addr_info2(PowerPCCPU *cpu,
>               goto param_error_exit;
>           }
>   
> -        rtas_st(rets, 1, (pci_bus_num(pci_get_bus(pdev)) << 16) + 1);
> +        rtas_st(rets, 1, (pci_bus_num(pci_get_bus(pdev)) << 16) |
> +                         (PCI_DEVFN(PCI_SLOT(pdev->devfn), 0) << 8) | 1);
>           break;
>       case RTAS_GET_PE_MODE:
>           rtas_st(rets, 1, RTAS_PE_MODE_SHARED);
> 
> 

