Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0549952B489
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 10:21:23 +0200 (CEST)
Received: from localhost ([::1]:36068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrEvq-0002Da-3w
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 04:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrEnt-0006wF-1X
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:13:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrEnq-00055s-7k
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652861585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dfHp/HP/b9AoGe09y0NtWxK8atBPRWLQkNOyfDM+It8=;
 b=SvmSC3oyW+h0G7bugaTFXlTWaIMxXhgskARGpFcjWS+wqVw5wMK9OaYuMvoGSocX89QhgA
 Ee/wciGyo8RBx4u2p75WFc0+eAq3amHTi/A1h3DhWJ2VqvDF9549xl9zrLipWMIX/FwGmV
 KxH6Bft27MZeRwpgMGhH5nXUdu5X+zs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-qpTODc4uNyKPkYzhwOLv7Q-1; Wed, 18 May 2022 04:13:04 -0400
X-MC-Unique: qpTODc4uNyKPkYzhwOLv7Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 m26-20020a7bcb9a000000b0039455e871b6so460405wmi.8
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 01:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dfHp/HP/b9AoGe09y0NtWxK8atBPRWLQkNOyfDM+It8=;
 b=ItmZ2XBU4tjWaBOyhahzR8beUpP6MrNQX1xC1vSiI3noMn7AKy0J6ERAt4cSX63iTl
 Wp2Ynsm5jfUET/AywrrI3vM8V7+3BIeKRlTVUpsNr5JEbtCOrrtpwD4ncjVc5n2fX+ZO
 YM9XpqjIGdj4RFof/mTZnfonAkCnpZWUhVIgkNeJy1QF5HHWBG6giWQQvcM0u85jRxgx
 5s4Rocyqtc7Wjt1YM6mpvyh99glCo9U2E62F/owLn7ukDYI/zVToTnb3BaNlB1yW5uOB
 xTXc8LeleLR+o2CEsEkTjNOSCvRwTfDQ3P/VNJ1FRXUL/CibBN/q2kmwBIJuUcABg0rm
 yCbg==
X-Gm-Message-State: AOAM531ZF7DdU6eeq/mgEPnXtSRpb81m0G+9SCW31/PjT90pVnaYhfyv
 z0Iz6xiGoNQ3rL9nuO0jjsaJEwjImKFEAelR7QkYQtfXrc249TpdBAluBLWuxmqfFnWQhUZ0XiL
 vccEZbjDQNyaLhb8=
X-Received: by 2002:a05:600c:3512:b0:394:7c3b:53c0 with SMTP id
 h18-20020a05600c351200b003947c3b53c0mr24455456wmq.170.1652861582990; 
 Wed, 18 May 2022 01:13:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmNMudMu1d4TT8vFzZFh+w0PrvObISRbOyWdvBWos1oyuudQE5xGQFE4p1tyR3Ib1wLmx3uw==
X-Received: by 2002:a05:600c:3512:b0:394:7c3b:53c0 with SMTP id
 h18-20020a05600c351200b003947c3b53c0mr24455422wmq.170.1652861582709; 
 Wed, 18 May 2022 01:13:02 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 e4-20020adf9bc4000000b0020d0c48d135sm1293889wrc.15.2022.05.18.01.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 01:13:02 -0700 (PDT)
Message-ID: <1dda12f3-2552-54d4-0946-73c168ff7d26@redhat.com>
Date: Wed, 18 May 2022 10:13:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 4/9] s390x/pci: add routine to get host function handle
 from CLP info
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 farman@linux.ibm.com, pmorel@linux.ibm.com, richard.henderson@linaro.org,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 mst@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <20220404181726.60291-1-mjrosato@linux.ibm.com>
 <20220404181726.60291-5-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220404181726.60291-5-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 04/04/2022 20.17, Matthew Rosato wrote:
> In order to interface with the underlying host zPCI device, we need
> to know it's function handle.  Add a routine to grab this from the
> vfio CLP capabilities chain.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-vfio.c         | 83 ++++++++++++++++++++++++++------
>   include/hw/s390x/s390-pci-vfio.h |  6 +++
>   2 files changed, 73 insertions(+), 16 deletions(-)
[...]
> diff --git a/include/hw/s390x/s390-pci-vfio.h b/include/hw/s390x/s390-pci-vfio.h
> index ff708aef50..0c2e4b5175 100644
> --- a/include/hw/s390x/s390-pci-vfio.h
> +++ b/include/hw/s390x/s390-pci-vfio.h
> @@ -20,6 +20,7 @@ bool s390_pci_update_dma_avail(int fd, unsigned int *avail);
>   S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
>                                             S390PCIBusDevice *pbdev);
>   void s390_pci_end_dma_count(S390pciState *s, S390PCIDMACount *cnt);
> +bool s390_pci_get_host_fh(S390PCIBusDevice *pbdev, uint32_t *fh);
>   void s390_pci_get_clp_info(S390PCIBusDevice *pbdev);
>   #else
>   static inline bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
> @@ -33,6 +34,11 @@ static inline S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
>   }
>   static inline void s390_pci_end_dma_count(S390pciState *s,
>                                             S390PCIDMACount *cnt) { }
> +static inline bool s390_pci_get_host_fh(S390PCIBusDevice *pbdev,
> +                                        unsigned int *fh)

This prototype does not match the one before the else - please replace 
"unsigned int" with "uint32_t".

  Thomas

> +{
> +    return false;
> +}
>   static inline void s390_pci_get_clp_info(S390PCIBusDevice *pbdev) { }
>   #endif
>   


