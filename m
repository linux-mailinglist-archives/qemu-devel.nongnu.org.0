Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED88538CA62
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:46:29 +0200 (CEST)
Received: from localhost ([::1]:51032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk7M4-00048z-OR
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk7Km-0003MC-3j
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:45:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk7Ki-0001yP-FK
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:45:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621611902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NpKwqkBwTCrvZ+44tINNRn4UDrCT06xCyKDwQoW5meU=;
 b=Nd4LXmoihe34Qkn21VCV0MiPy1e3pbLZxqhQ8Eycpe9/++dCrB0/qvghwB8GDc3H3XnEKj
 GbcTFmeSypuix62sRlenzhLGX+s35lgLUTPq0ByFlGW6+FUBpWwLhVtNWoEQpRXjET7fTn
 2z/1XluQuUEs/nrshN31UEcRVdgRfrM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-uUM26GhRNjGBu4ibhw80DQ-1; Fri, 21 May 2021 11:45:00 -0400
X-MC-Unique: uUM26GhRNjGBu4ibhw80DQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso9581564wrf.11
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 08:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NpKwqkBwTCrvZ+44tINNRn4UDrCT06xCyKDwQoW5meU=;
 b=WVL02WqQxmaKY3CHOusmS8BPo8Z4AQcPjgHrWS/gKxduoUKJRzGlcOnksnDFtYo37j
 ZnALFnQ1eAqQ26ytSpaqAjwoLVFI2RsH4DLQtpSOK2XDBYqoXwXTtPQrzxwgOL/ZLRQj
 GWOIeMxO5Q05TNSnPqCTpjxyz5K9l4MYwF8TXpei/JTe3MFEtRItgE3lkN6FMQ3X0SYo
 53+1liPWTXzQ3g3GTGoSILa6a2N/9mJsQlQ6Ex2iD98xZsTudb+NIIC9B7pOuyCDsQf2
 g2fGsd3WYNBhRmXOR5rdS1feoDuUETUrZ9XNct1Zp0EP/q75JWLn33997XMIGO/+wiml
 RbJg==
X-Gm-Message-State: AOAM5323lmGx5iT9jdIBCvoPWoSO5wX1QYD7ippt7eDiZ+CVCrtFc/eT
 V1kx4WMHTQDDWdoOV/9ee++a0cQUJBVzxpQhGMZJ3EqTGCXTxTRHuQzQxysacjJdj9pKoxpZ7H2
 qgtno8FTZA6XSZfw=
X-Received: by 2002:a5d:408f:: with SMTP id o15mr9925435wrp.89.1621611899770; 
 Fri, 21 May 2021 08:44:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFqd9XUmpOZ5HndD5Ssj5qNWyOMP+ifHOCXc7S9ri6lSCGBY5M+h1syyzfwusfjIF1CMdNyg==
X-Received: by 2002:a5d:408f:: with SMTP id o15mr9925422wrp.89.1621611899519; 
 Fri, 21 May 2021 08:44:59 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id d15sm2581162wrv.84.2021.05.21.08.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 08:44:59 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/usb: hcd-xhci-pci: Fix spec violation of IP flag
 for MSI/MSI-X
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210521024224.2277634-1-bmeng.cn@gmail.com>
 <20210521024224.2277634-2-bmeng.cn@gmail.com>
 <7feeff48-6fa0-19bf-eb72-09caaba8cdb3@redhat.com>
 <CAEUhbmVx72gwUsCEfG5Zg-jG7ZSCtrAebr1vKVpLWkw+m9K=fA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c67fc4a2-9177-eb26-4d5f-194f607ee7ae@redhat.com>
Date: Fri, 21 May 2021 17:44:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVx72gwUsCEfG5Zg-jG7ZSCtrAebr1vKVpLWkw+m9K=fA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, Ruimei Yan <ruimei.yan@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/21 3:25 PM, Bin Meng wrote:
> On Fri, May 21, 2021 at 8:46 PM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> On 5/21/21 4:42 AM, Bin Meng wrote:
>>> From: Ruimei Yan <ruimei.yan@windriver.com>
>>>
>>> Per xHCI spec v1.2 chapter 4.17.5 page 296:
>>>
>>>   If MSI or MSI-X interrupts are enabled, Interrupt Pending (IP)
>>>   shall be cleared automatically when the PCI dword write generated
>>>   by the interrupt assertion is complete.
>>>
>>> Currently QEMU does not clear the IP flag in the MSI / MSI-X mode.
>>> This causes subsequent spurious interrupt to be delivered to guests.
>>> To solve this, we change the xhci intr_raise() hook routine to have
>>> a bool return value that is passed to its caller (the xhci core),
>>> with true indicating that IP should be self-cleared.
>>>
>>> Fixes: 62c6ae04cf43 ("xhci: Initial xHCI implementation")
>>> Fixes: 4c47f800631a ("xhci: add msix support")
>>> Signed-off-by: Ruimei Yan <ruimei.yan@windriver.com>
>>> [bmeng: move IP clear codes from xhci pci to xhci core]
>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>> ---
>>>
>>>  hw/usb/hcd-xhci.h        | 2 +-
>>>  hw/usb/hcd-xhci-pci.c    | 8 +++++---
>>>  hw/usb/hcd-xhci-sysbus.c | 4 +++-
>>>  hw/usb/hcd-xhci.c        | 8 ++++++--
>>>  4 files changed, 15 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
>>> index 7bba361f3b..98f598382a 100644
>>> --- a/hw/usb/hcd-xhci.h
>>> +++ b/hw/usb/hcd-xhci.h
>>> @@ -194,7 +194,7 @@ typedef struct XHCIState {
>>>      uint32_t flags;
>>>      uint32_t max_pstreams_mask;
>>>      void (*intr_update)(XHCIState *s, int n, bool enable);
>>> -    void (*intr_raise)(XHCIState *s, int n, bool level);
>>> +    bool (*intr_raise)(XHCIState *s, int n, bool level);
>>>      DeviceState *hostOpaque;
>>>
>>>      /* Operational Registers */
>>> diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
>>> index b6acd1790c..e934b1a5b1 100644
>>> --- a/hw/usb/hcd-xhci-pci.c
>>> +++ b/hw/usb/hcd-xhci-pci.c
>>> @@ -57,7 +57,7 @@ static void xhci_pci_intr_update(XHCIState *xhci, int n, bool enable)
>>>      }
>>>  }
>>>
>>> -static void xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
>>> +static bool xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
>>>  {
>>>      XHCIPciState *s = container_of(xhci, XHCIPciState, xhci);
>>>      PCIDevice *pci_dev = PCI_DEVICE(s);
>>> @@ -70,13 +70,15 @@ static void xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
>>>
>>>      if (msix_enabled(pci_dev) && level) {
>>>          msix_notify(pci_dev, n);
>>> -        return;
>>> +        return true;
>>>      }
>>>
>>>      if (msi_enabled(pci_dev) && level) {
>>>          msi_notify(pci_dev, n);
>>> -        return;
>>> +        return true;
>>>      }
>>> +
>>> +    return false;
>>>  }
>>
>> Could be simplified as:
>>
>>   if (!level) {
>>     return false;
>>   }
>>   if (msix_enabled(pci_dev)) {
>>     msix_notify(pci_dev, n);
>>   }
>>   if (msi_enabled(pci_dev)) {
>>     msi_notify(pci_dev, n);
>>   }
>>   return true;
> 
> The simplified logic will deliver both interrupts if both msix and msi
> are enabled. The previous logic prevents such from happening.

Oops you are right :)

>> Otherwise,
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

This stands.


