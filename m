Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D2532A1CF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 15:12:05 +0100 (CET)
Received: from localhost ([::1]:59724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5km-0003Kg-7W
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 09:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lH5ix-00020f-On
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:10:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lH5it-00073H-LB
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614694202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWv9boeHBhSLaMl9G4iMxBxvsyXJRxH5VMkvkkRkdFI=;
 b=jQBLRs9s9rsmVy2ZXxGvtgfg4GgA+MlzcCLy2HaE9kWCFnYIqnBuH0oDmoNgYvTz28cn0u
 aJdBjHumz0ZbnV5txl3e7A+JoetxaB7kUjCTjGeXYMqnT8MDdRGuQhDlxR+lJcWWjTbre6
 WC8MitapbK/lglOCU1OBSbHi7H7ePOc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-I7SOkxYYMpWYJT3L0lTdJw-1; Tue, 02 Mar 2021 09:09:59 -0500
X-MC-Unique: I7SOkxYYMpWYJT3L0lTdJw-1
Received: by mail-wr1-f70.google.com with SMTP id h30so11170120wrh.10
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 06:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jWv9boeHBhSLaMl9G4iMxBxvsyXJRxH5VMkvkkRkdFI=;
 b=FPeiSgPw2rKKC1UvNFpJco2Fh96CcmMIu1E4onb33TrAZIIOF7f0NPJXlgwhORYbeT
 HGVXO0Y+TtcWIipBiU5fpBrci1hyzF7i0dE2xtBO4e/X7TSlvP7oYk6O81CjjXc/PHHj
 j6JILfSxVuFtiILGcQRVaDdwaYsV77nN24J1Ca8nWJ/mRwC8Fq/Q5HmVlVfosMqe9j6S
 NPEpxcGa+YzhTnS1q6fWoJNvWOk4gAguyb8/nW1uJ/yhBEDFFexj+CmkFchCTrraSSmH
 DPQmUIizciyNmG4qb6appT5q4MqI5S31zGJh1D5DsWdH9wqXsWEcXPRu2UmeCfPyZ9FJ
 g71g==
X-Gm-Message-State: AOAM533Tgl58tw4fymUGIsJGPYAAz2BKDEpVQfQd5iuFzZCIDVgrBP01
 VHB+K56mQhnWcPB5L5x4SMPe7IvgpFbfc5jb1FdRowgo+kd66Q2EpWX+oZSmbn21US3JIa2lC2a
 pA/eef2dPdQvzu58=
X-Received: by 2002:a7b:c410:: with SMTP id k16mr4124990wmi.121.1614694198016; 
 Tue, 02 Mar 2021 06:09:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyibQlysJNwedUKZ5fKFUs28kJSJ6b+v3XuCrfKbQ6TG04lgMLpD7xUDMCyLXmK4s7Q4+UOTA==
X-Received: by 2002:a7b:c410:: with SMTP id k16mr4124973wmi.121.1614694197789; 
 Tue, 02 Mar 2021 06:09:57 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z2sm10064374wrm.0.2021.03.02.06.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 06:09:57 -0800 (PST)
Subject: Re: [PATCH] lsilogic: Use PCIDevice::exit instead of
 DeviceState::unrealize
To: Peng Liang <liangpeng10@huawei.com>, qemu-devel@nongnu.org
References: <20210302133016.1221081-1-liangpeng10@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <81b96fc9-8368-66ad-5d98-868695d75920@redhat.com>
Date: Tue, 2 Mar 2021 15:09:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302133016.1221081-1-liangpeng10@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, qemu-stable@nongnu.org, xiexiangyou@huawei.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/03/21 14:30, Peng Liang wrote:
> PCI_DEVICE has overwritten DeviceState::unrealize (pci_qdev_unrealize).
> However, LSI53C895A, which is a subclass of PCI_DEVICE, overwrites it
> again and doesn't save the parent's implementation so the PCI_DEVICE's
> implementation of DeviceState::unrealize will never be called when
> unrealize a LSI53C895A device.  And it will lead to memory leak and
> unplug failure.
> 
> For a PCI device, it's better to implement PCIDevice::exit instead of
> DeviceState::unrealize.  So let's change to use PCIDevice::exit.
> 
> Fixes: a8632434c7e9 ("lsi: implement I/O memory space for Memory Move instructions")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
> ---
>   hw/scsi/lsi53c895a.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index 7d13c7dc1c46..af46c62f0d78 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -2312,7 +2312,7 @@ static void lsi_scsi_realize(PCIDevice *dev, Error **errp)
>       scsi_bus_new(&s->bus, sizeof(s->bus), d, &lsi_scsi_info, NULL);
>   }
>   
> -static void lsi_scsi_unrealize(DeviceState *dev)
> +static void lsi_scsi_exit(PCIDevice *dev)
>   {
>       LSIState *s = LSI53C895A(dev);
>   
> @@ -2325,11 +2325,11 @@ static void lsi_class_init(ObjectClass *klass, void *data)
>       PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>   
>       k->realize = lsi_scsi_realize;
> +    k->exit = lsi_scsi_exit;
>       k->vendor_id = PCI_VENDOR_ID_LSI_LOGIC;
>       k->device_id = PCI_DEVICE_ID_LSI_53C895A;
>       k->class_id = PCI_CLASS_STORAGE_SCSI;
>       k->subsystem_id = 0x1000;
> -    dc->unrealize = lsi_scsi_unrealize;
>       dc->reset = lsi_scsi_reset;
>       dc->vmsd = &vmstate_lsi_scsi;
>       set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> 

Queued, thanks.

Paolo


