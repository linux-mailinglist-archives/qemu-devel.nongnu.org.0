Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331D436E6A3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 10:12:31 +0200 (CEST)
Received: from localhost ([::1]:49676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc1md-0003US-5B
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 04:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lc1lZ-0002y6-Lg
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:11:21 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lc1lT-0005HN-RJ
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:11:21 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so8355628pjz.0
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 01:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cLazsXl7TLjW1/8ZlQ9f0Rsp4Gw8y1pNDJEkgF3HajA=;
 b=EvX87bbW4Fva2k9LwWsb3IXfATZCmLK3lxr4tquCslkkc33Zv+l20WO9/Y/MOXQuIH
 fzfLRPp+zyreWPDgMlG+d1cYL2hj8W6wUGhkvlyYcoWtBGJktL5SsGHpssQCkvpE+hBF
 eWmBaNesHcY9TtZR1bbGOUG1zm5rKIKCBhhmAau4IUQNtScGuxJdEwQ+Dd3ZCyQVfHom
 hT06/hQKRbpj/Rb4p995vEQHr4RZEy+Sxaug3jrt387tzoxhOqIJEpAojJAm4+/oefIQ
 0z2yzc5Tsl9tKcUAiTKdXt2QXo1zLjg2q+VlVVpKQtzdUmM1sdgmQ9r6GKRigBEabdCS
 sCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cLazsXl7TLjW1/8ZlQ9f0Rsp4Gw8y1pNDJEkgF3HajA=;
 b=Xpe6aFg0G7tgddhJ6l5f5u21Fmi9F11n+YaqtdS92ll6z54JVC0WrF03AczaGIPJVp
 dD5cEn8BZvnurw/LWGxZ/gOT88QnzFYqNJkULmD89xui7jLayUNYWwILfFZ+ARyf7AoH
 dFUeS/BZgbFc6uKsEu/Qoxch6IVD7VS6e/KdgPJoCRDSvzQGT2Zt1cgKGvI9DHgbr1Rg
 pnZTDxgXD2eqOkPwDVY9trNUb5dGzvenLp1pU2Xjhyn3XOop8rlzNgUptlpGoELWWHP6
 7aSHSgv4qTo8tSvP3vJZtU7ZZCzoITwkN0utUm2r8/eBYuHFJsMFbce47/f0i4b047+t
 j1qw==
X-Gm-Message-State: AOAM533A93pCYApvomTpYnqT/78pzyJ4idB+OUCdO+0nkRsKYLuVVnWW
 TkBgcWeoxzSNnvFalAfFwtvH4Q==
X-Google-Smtp-Source: ABdhPJxQe6R5h7V/pZUt0CpBnykG4vQe115nDvTwD9XEboRkAjjLF9SB8vvfg6YvhL8AZy5ngDtA1w==
X-Received: by 2002:a17:902:82c3:b029:ed:70b2:363a with SMTP id
 u3-20020a17090282c3b02900ed70b2363amr7366225plz.25.1619683872346; 
 Thu, 29 Apr 2021 01:11:12 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with UTF8SMTPSA id b25sm1305260pfo.218.2021.04.29.01.11.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 01:11:11 -0700 (PDT)
Message-ID: <89a51a2d-ef9c-1fa4-1789-52bb20b03773@ozlabs.ru>
Date: Thu, 29 Apr 2021 18:10:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH] spapr: Modify ibm, get-config-addr-info2 to set DEVNUM in
 PE config address.
Content-Language: en-US
To: Oliver O'Halloran <oohall@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
References: <161952458744.148285.11534763593153102355.stgit@jupiter>
 <CAOSf1CGGgxX4mGhjjsVGYA391XrABEOTh2xmiafW6V7cScyG4g@mail.gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <CAOSf1CGGgxX4mGhjjsVGYA391XrABEOTh2xmiafW6V7cScyG4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Qemu-ppc <qemu-ppc@nongnu.org>, Qemu-devel <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/28/21 22:33, Oliver O'Halloran wrote:
> On Tue, Apr 27, 2021 at 9:56 PM Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
>>
>> With upstream kernel, especially after commit 98ba956f6a389
>> ("powerpc/pseries/eeh: Rework device EEH PE determination") we see that KVM
>> guest isn't able to enable EEH option for PCI pass-through devices anymore.
> 
> How are you passing the devices through to the guest?
> 
>> [root@atest-guest ~]# dmesg | grep EEH
>> [    0.032337] EEH: pSeries platform initialized
>> [    0.298207] EEH: No capable adapters found: recovery disabled.
>> [root@atest-guest ~]#
>>
>> So far the linux kernel was assuming pe_config_addr equal to device's
>> config_addr and using it to enable EEH on the PE through ibm,set-eeh-option
>> RTAS call. Which wasn't the correct way as per PAPR. The linux kernel
>> commit 98ba956f6a389 fixed this flow. With that fixed, linux now gets the
>> PE config address first using the ibm,get-config-addr-info2 RTAS call, and
>> then uses the found address as argument to ibm,set-eeh-option RTAS call to
>> enable EEH on the PCI device.
> 
> That's not really correct. EEH being enabled or disabled is a per-PE
> setting rather than a per-device setting. The fact there's not a 1-1
> correspondence between devices and PEs is a large part of why the
> get-config-addr-info2 RTAS call exists in the first place.
> Unfortunately, the initial implementation of EEH support in linux
> conflated the two because in the past there was typically a single
> device within a PE. However, that assumption was never really correct
> and it has long outlived its usefulness.
> 
>> This works on PowerVM lpar but fails in qemu
>> KVM guests. This is because ibm,set-eeh-option RTAS call in qemu expects PE
>> config address bits 16:20 be populated with device number (DEVNUM).
>>
>> The rtas call ibm,get-config-addr-info2 in qemu always returns the PE
>> config address in form of "00BB0001" (i.e.  <00><BUS><DEVFN><REG>) where
>> "BB" represents the bus number of PE's primary bus and with device number
>> information always set to zero. However until commit 98ba956f6a389 this
>> return value wasn't used to enable EEH on the PCI device.
>>
>> Now in qemu guest with recent kernel the ibm,set-eeh-option RTAS call fails
>> with -3 return value indicating that there is no PCI device exist for the
>> specified pe config address. The rtas_ibm_set_eeh_option call uses
>> pci_find_device() to get the PC device that matches specific bus and devfn
>> extracted from PE config address passed as argument. Since the DEVFN part
>> of PE config always contains zero, pci_find_device() fails to find the
>> specific PCI device and hence fails to enable the EEH capability.
>>
>> hw/ppc/spapr_pci_vfio.c: spapr_phb_vfio_eeh_set_option()
>>     case RTAS_EEH_ENABLE: {
>>          PCIHostState *phb;
>>          PCIDevice *pdev;
>>
>>          /*
>>           * The EEH functionality is enabled on basis of PCI device,
>>           * instead of PE. We need check the validity of the PCI
>>           * device address.
>>           */
>>          phb = PCI_HOST_BRIDGE(sphb);
>>          pdev = pci_find_device(phb->bus,
>>                                 (addr >> 16) & 0xFF, (addr >> 8) & 0xFF);
>>          if (!pdev || !object_dynamic_cast(OBJECT(pdev), "vfio-pci")) {
>>              return RTAS_OUT_PARAM_ERROR;
>>          }
>>
>> This patch fixes this issue by populating DEVNUM field (bits 16:20) of PE
>> config address with device number.
> 
> I don't think this is a good idea and I'm fairly sure you're
> introducing some subtle breakage here. As an example, say that on the
> host side you have two devices on the same bus:
> 
> 0000:00:00.0 - card 1
> 0000:00:01.0 - card 2
> 
> On PowerNV (i.e. the hypervisor) these would be placed into the same
> hardware PE since they're on the same bus. Now, if I take both devices
> and pass them through to the guest on the same PHB and bus (use
> 0005:ff) we'll have:
> 
> 0005:ff:00.0 - card 1
> 0005:ff:01.0 - card 2
> 
> With this patch applied get-config-addr-info2 returns 00BBD001, so the
> PE we get for each device will be:
> 
> card 1 - 00ff0001
> card 2 - 00ff1001
> 
> Which implies the two are in different PEs. As a result, if the guest
> requests a reset of card 1's PE then the guest will see an unexpected
> reset of card 2 as well. From the hypervisor's point of view the two
> are in the same PE so this is a legitimate thing to do, but due to
> this patch the guest doesn't know that.


Agree. I guess we should only use vphbid:00:00.0 as a PE config address 
in QEMU as there is really just one per vphb which allows EEH.


> As far as I can remember this is why you're supposed to pass each EEH
> capable devices to the guest on a seperate spapr-phb (which matches
> what PHYP does). Alexy can probably tell you more.


The primary reason was that the EEH subdriver in VFIO did a poor job 
synchronizing states from different PEs so recovery was either tricky or 
broken:

https://git.qemu.org/?p=qemu.git;a=commitdiff;h=3153119;hp=f1a6cf3ef734aab142d5f7ce52e219474ababf6b


-- 
Alexey

