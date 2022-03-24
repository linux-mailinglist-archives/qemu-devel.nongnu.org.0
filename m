Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419414E64A6
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 15:05:07 +0100 (CET)
Received: from localhost ([::1]:55410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXO5K-00013z-3n
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 10:05:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nXO3D-0008Nl-50; Thu, 24 Mar 2022 10:02:56 -0400
Received: from [2607:f8b0:4864:20::c35] (port=38657
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nXO3A-0002eC-Px; Thu, 24 Mar 2022 10:02:54 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 v19-20020a056820101300b0032488bb70f5so788359oor.5; 
 Thu, 24 Mar 2022 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=2AdRPwz4EgffdjtBBqWogMQekHk3SpUIvOSAl94V04o=;
 b=IJlW/m7CKNNABwSvgAFeoIzV6MKPODTt+S6UB/9ZBmD932dcK2fkuDyQP+YWvwb+55
 O7/Csu6rD19ct7iSlu0pb3tOvbNha+VUvX5zIg93s3P3NEssDTNGnopBxKuPChjxG4Cy
 ogYqB1qImMmVPXqKQf2Hg+CIMwjh617JprTVKe/7znrKFCtfmaA2oZCAXBrf588ldGBT
 oIKbiqF40SS//rq06SDXIdC9bgBLUCPhsSqd3DKBMwW2sMDxaoh5O85OCZyaRVABAhIL
 /B3r5QrhItg8utzWPi6/auHngogRsFGSUOFJvX9Q1ppr2xh8VqJufXebetOuCOtyY0+u
 5uQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2AdRPwz4EgffdjtBBqWogMQekHk3SpUIvOSAl94V04o=;
 b=4a/yQdzEctAgtx8ZG5Fhxg+lJ1VXcBHey76ATKPAewzTgyr5jE6O3QcYtnnSs3CQcJ
 aUCGFu6eFXrWkmhC+Cp4zLCDBIwsefosic7lEuANmN3UIka3yi9TzGybSZtkjm4dhbHF
 vNxruKhxikU7+lADr1VvFCpYhW5PSTX2AC/5uTP7+J8vKTFu8mnGSt5xeLMG31tk4Skb
 E0sIV/v4vSi/lm5LKdrzr5BYJM8KnYpUcLi3gthRDCU2Joj9btbjqzBcCZ+m7DZRM4iZ
 CBQEVUF+zn/zS2NuBg2pJOQfWqtHdFeHL8LQJSiGsr2O/hwCL+IzGGPSoPaQQg05z99a
 q/Wg==
X-Gm-Message-State: AOAM530ohFXM9LSe2Hpjh1ifs0TE+H1k3rzQqgfx/Ru53/1CjcDIqPzS
 EUmjaq6fQzpbKTB+uA+o/+k=
X-Google-Smtp-Source: ABdhPJwVYqdwRwMeVQWZUXX53NB/pQntxliMP2OG1XvmTWZw1kYdOS+9FO1V9Ao3DmEd9Ezwt+dYwg==
X-Received: by 2002:a4a:5b83:0:b0:324:4866:4f6e with SMTP id
 g125-20020a4a5b83000000b0032448664f6emr1998596oob.61.1648130571249; 
 Thu, 24 Mar 2022 07:02:51 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96?
 ([2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96])
 by smtp.gmail.com with ESMTPSA id
 y67-20020a4a4546000000b0032476e1cb40sm1317857ooa.25.2022.03.24.07.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 07:02:51 -0700 (PDT)
Message-ID: <f3efd672-3d8e-8533-4aff-720c32d5800c@gmail.com>
Date: Thu, 24 Mar 2022 11:02:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] pcie: Don't try triggering a LSI when not defined
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org, mst@redhat.com,
 marcel.apfelbaum@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220321153357.165775-1-fbarrat@linux.ibm.com>
 <20220321153357.165775-2-fbarrat@linux.ibm.com>
 <d0eaf24b-9eff-cfd4-4827-c738e238b5e6@gmail.com>
 <5a482e34-cadc-571a-360a-fb5ede7d8a2d@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <5a482e34-cadc-571a-360a-fb5ede7d8a2d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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



On 3/24/22 10:47, Frederic Barrat wrote:
> 
> 
> On 24/03/2022 14:07, Daniel Henrique Barboza wrote:
>>
>>
>> On 3/21/22 12:33, Frederic Barrat wrote:
>>> This patch skips [de]asserting a LSI interrupt if the device doesn't
>>> have any LSI defined. Doing so would trigger an assert in
>>> pci_irq_handler().
>>>
>>> The PCIE root port implementation in qemu requests a LSI (INTA), but a
>>> subclass may want to change that behavior since it's a valid
>>> configuration. For example on the POWER8/POWER9/POWER10 systems, the
>>> root bridge doesn't request any LSI.
>>>
>>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
>>> ---
>>
>> I assume that it's easier to handle just the codepaths that powernv PHBs uses
>> rather than handling all instances where pci_irq_handler() would be asserting
>> without LSIs.
> 
> 
> The real reason is that the LSI is added when we realize the TYPE_PCIE_ROOT_PORT object. See rp_realize(). So I'm only trying to fix the code paths that can be called from a subclass of TYPE_PCIE_ROOT_PORT which would choose to override the "interrupt pin" setting in the config space. I believe they are all covered by this patch.
> The assert() in pci_irq_handler() is there for a reason and I don't want to mess with that.


Yes, handling this situation inside pci_irq_handler() would require changing the
"assert(0 <= irq_num && irq_num < PCI_NUM_PINS)" assert or doing some sanity before
it to avoid the trigger.

Since this is a common code used everywhere we're better of doing minimalist changes
as you're doing. We can reevaluate this design if more machines/devices start to get
in the same situation we have now with powernv PHBs.


Daniel

> 
>    Fred
> 
> 
>>
>>
>> Patch LGTM. Small nits below:
>>
>>>   hw/pci/pcie.c     | 8 ++++++--
>>>   hw/pci/pcie_aer.c | 4 +++-
>>>   2 files changed, 9 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
>>> index 67a5d67372..71c5194b80 100644
>>> --- a/hw/pci/pcie.c
>>> +++ b/hw/pci/pcie.c
>>> @@ -354,7 +354,9 @@ static void hotplug_event_notify(PCIDevice *dev)
>>>       } else if (msi_enabled(dev)) {
>>>           msi_notify(dev, pcie_cap_flags_get_vector(dev));
>>>       } else {
>>> -        pci_set_irq(dev, dev->exp.hpev_notified);
>>> +        if (pci_intx(dev) != -1) {
>>> +            pci_set_irq(dev, dev->exp.hpev_notified);
>>> +        }
>>
>>
>> Since you're not doing anything unless the condition is met, you can use 'else if'
>> like it's done in the other conditionals:
>>
>>
>>      if (msix_enabled(dev)) {
>>          msix_notify(dev, pcie_cap_flags_get_vector(dev));
>>      } else if (msi_enabled(dev)) {
>>          msi_notify(dev, pcie_cap_flags_get_vector(dev));
>>      } else if (pci_intx(dev) != -1) {
>>          pci_set_irq(dev, dev->exp.hpev_notified);
>>      }
>>
>>
>>
>>>       }
>>>   }
>>> @@ -362,7 +364,9 @@ static void hotplug_event_clear(PCIDevice *dev)
>>>   {
>>>       hotplug_event_update_event_status(dev);
>>>       if (!msix_enabled(dev) && !msi_enabled(dev) && !dev->exp.hpev_notified) {
>>> -        pci_irq_deassert(dev);
>>> +        if (pci_intx(dev) != -1) {
>>> +            pci_irq_deassert(dev);
>>> +        }
>>>       }
>>
>> Similar comment here:
>>
>>      if (!msix_enabled(dev) && !msi_enabled(dev) && !dev->exp.hpev_notified &&
>>          pci_intx(dev) != -1) {
>>          pci_irq_deassert(dev);
>>      }
>>
>>
>>
>>>   }
>>> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
>>> index e1a8a88c8c..d936bfca20 100644
>>> --- a/hw/pci/pcie_aer.c
>>> +++ b/hw/pci/pcie_aer.c
>>> @@ -291,7 +291,9 @@ static void pcie_aer_root_notify(PCIDevice *dev)
>>>       } else if (msi_enabled(dev)) {
>>>           msi_notify(dev, pcie_aer_root_get_vector(dev));
>>>       } else {
>>> -        pci_irq_assert(dev);
>>> +        if (pci_intx(dev) != -1) {
>>> +            pci_irq_assert(dev);
>>> +        }
>>
>>
>> And here:
>>
>>      if (msix_enabled(dev)) {
>>          msix_notify(dev, pcie_aer_root_get_vector(dev));
>>      } else if (msi_enabled(dev)) {
>>          msi_notify(dev, pcie_aer_root_get_vector(dev));
>>      } else if (pci_intx(dev) != -1) {
>>          pci_irq_assert(dev);
>>      }
>>
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>>       }
>>>   }

