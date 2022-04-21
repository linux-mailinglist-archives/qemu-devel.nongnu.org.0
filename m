Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8F650953D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 05:08:48 +0200 (CEST)
Received: from localhost ([::1]:37222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhNBX-0002tF-Hk
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 23:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nhNA6-0001yG-Lo
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 23:07:20 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:37562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nhNA4-0003ld-0h
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 23:07:17 -0400
Received: by mail-pg1-x52c.google.com with SMTP id x191so3507370pgd.4
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 20:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5RecpkL1BjHvUWa3IPhCRvf4w1CrPG52o+xv9CSsSmk=;
 b=ini9fMZMWmxIEJL1S+jql9IYMQpcfBhz0GTVP0eluOW/knjyq5Jo/Iv2Cx4QQshjDc
 Q0nTUiUDHLSdUfoNVNGkuybjWTF4aqQrvl+QXmQeOHXZ/+cJ6pqKeYdtUwLlGYVj+23A
 ZjLxBRV484rG7BoR6ruFo0sP7aQl29e16F8fVgddBdIqXaFg3ntR3ItV+GQVXvWffm0K
 k5GaNqqcjnWCdoh2TNvPOir85lTpX4J2jhGqnuql+1ta6RElTm17HAScakBy8BigXWdb
 npXVLRB+k1IVDR50LbDZcGhe8JTy6lrv7nRTqO/A2bylvltHOmYfpliwKDd33KayJUTP
 k++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5RecpkL1BjHvUWa3IPhCRvf4w1CrPG52o+xv9CSsSmk=;
 b=uc4uw3Hwc05oxeaWoQtB/4VPKnBgkKvq14n/azLLSwJF2e4rgk8Jwg9dn6nUrw6vhT
 DcDXUrFHbQ6Hd2PCtYuHgjvfX325nVCY7u3tlQLvx+oDdDg67yOcjgVjisZWRlMvvLyT
 /Psz3w4yUpJG9QXIBifCNh3jElZFOGCIIPAZ6jAYYC8YDn+OcArGW0HQsOSxMPdq6Ni6
 3QMG3rbssmN1MpIWIvr4c9AXNDu2fuEbE3vBl6KMZanIcaeb/p4nmCTprK1KSr+uzNB0
 GdR+DXo3uUUzQv7WiC0GMxKHjYBESIUj85KNYzgKMjmSWbVTAG5h4GOy8h4jSH35ygKF
 AP/Q==
X-Gm-Message-State: AOAM531HNJnpILWpGfwJrPrDqNQMLkmtyD8Ixc8+pKpmUVKmjHsf4Ihv
 rQGd0dzwxZUoJ9pWy20jTtVipg==
X-Google-Smtp-Source: ABdhPJwIdIkd9UrvDtI9FvRfvTjyX/o29ZC8VyAcyUutAsFUAg5DlgHJrwmsJbDkkZ5vvkBTEjMZtQ==
X-Received: by 2002:a63:1b5e:0:b0:3aa:593c:9392 with SMTP id
 b30-20020a631b5e000000b003aa593c9392mr7233859pgm.470.1650510432118; 
 Wed, 20 Apr 2022 20:07:12 -0700 (PDT)
Received: from [192.168.10.95] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a17090aa50b00b001cd4989ff6esm360818pjq.53.2022.04.20.20.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 20:07:11 -0700 (PDT)
Message-ID: <5308af13-a943-efeb-d819-e39cfc2f2907@ozlabs.ru>
Date: Thu, 21 Apr 2022 13:07:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: XIVE VFIO kernel resample failure in INTx mode under heavy load
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <1891893257.448156.1647023745384.JavaMail.zimbra@raptorengineeringinc.com>
 <20220314160952.46d5313a.alex.williamson@redhat.com>
 <9638ec8f-2edf-97df-0c14-95ae2344dc70@kaod.org>
 <6f0a92ca-9f53-b8b8-e85d-43f4da36200d@kaod.org>
 <edfa8ca4-8e8a-335a-2e7e-c69661ec73da@ozlabs.ru>
 <560c8c1a-a87e-71f9-cfea-0a034933070b@ozlabs.ru>
 <e25296b3-b1ec-a90a-ee72-ed15fe5130f6@kaod.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <e25296b3-b1ec-a90a-ee72-ed15fe5130f6@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 14/04/2022 22:41, Cédric Le Goater wrote:
> 
>>> After re-reading what I just wrote, I am leaning towards disabling 
>>> use of KVM_CAP_IRQFD_RESAMPLE as it seems last worked on POWER8 and 
>>> never since :)
>>>
>>> Did I miss something in the picture (hey Cedric)?
>>
>> How about disabling it like this?
>>
>> =====
>> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
>> index 5bfd4aa9e5aa..c999f7b1ab1b 100644
>> --- a/hw/ppc/spapr_pci.c
>> +++ b/hw/ppc/spapr_pci.c
>> @@ -732,7 +732,7 @@ static PCIINTxRoute 
>> spapr_route_intx_pin_to_irq(void *opaque, int pin)
>>       SpaprPhbState *sphb = SPAPR_PCI_HOST_BRIDGE(opaque);
>>       PCIINTxRoute route;
>>
>> -    route.mode = PCI_INTX_ENABLED;
>> +    route.mode = PCI_INTX_DISABLED;
>>
>> =====
> 
> I like it.


The only thing is that this resampling works on POWER8/XICS and removing 
it there is not great. So far sPAPR PHB was unaware of underlying 
interrupt controller, or was not it?


> 
> You now know how to test all the combinations :) Prepare your matrix,
> variables are :
> 
>   * Host OS        POWER8, POWER9+
>   * KVM device        XICS (P8), XICS-on-XIVE (P9), XIVE-on-XIVE (P9)
>   * kernel_irqchip    off, on
>   * ic-mode        xics, xive
>   * Guest OS        msi or nomsi
> 
> Ideally you should check TCG, but that's like kernel_irqchip=off.
> 
> Cheers,
> 
> C.
> 
>>
>> (btw what the heck is PCI_INTX_INVERTED for?)
>>
>>
>> -- 
>> Alexey
> 


--
Alexey

