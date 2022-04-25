Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128C750E9A7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 21:41:49 +0200 (CEST)
Received: from localhost ([::1]:57336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj4ai-00063L-79
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 15:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nj4Z9-0004TS-Er
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 15:40:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nj4Z6-0004x3-RA
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 15:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650915607;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=59OsmWVuRNUrfdHh8Mtn4PpwkZAEMGMF05GKzQKOW8M=;
 b=JNoYYHpseZ2oS+8mlCt0yOIMh7jzWXN2LCYzGQAeJxWeviIEqQ8vqgAQTzM/03axct1lHz
 Tnivn4KToo/B9P6Q5EisGAr3Zu3nJTNpUB9VJPHOfdU441SeX9RGf3sJPFecph5BgXj3yx
 dK7Yjhsk/8+4e5JmzXtELCUKAZvLAdg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-ZXD4L5tnNpqgtOvrFBH9hQ-1; Mon, 25 Apr 2022 15:40:06 -0400
X-MC-Unique: ZXD4L5tnNpqgtOvrFBH9hQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so139311wmj.0
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 12:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=59OsmWVuRNUrfdHh8Mtn4PpwkZAEMGMF05GKzQKOW8M=;
 b=eYuyHww9KnuU0rvGHyp3adxAbi7OJVh0qznrS/DM1yWk18lO4X7VbSg/68akCnbmg0
 bIh12NdBoaXTVCywK8RMRGygoWQOZZZCHQmSXM5h9Wthrrfn9jOPJqmjVaeVn0fp8THM
 NEvbcDT63E9XrFmsUMw+1IGjwonXg2tgVHtMW1WseAB6DMt7dnYMyWOHlHuYU3vsB4fc
 rtNhpNqZcfzhEQXBLYtaHTMOHL6b2ybFFwgMjbFyuXuy2rvOiOYtUy/pmHQaxZzL80ey
 ESIE6gVXl/HpM0+GbJQqp12cOwoqvKR42cYDu8PV6PJDBq+duvm06osAhkec7IicQpmU
 QmeQ==
X-Gm-Message-State: AOAM533XDsWFQTXSTvCnYoCLMBYECV+kfLXB2XJdQCDgvElqpGZIBQeM
 esLdzIpEpbtd09ajcW9FNmbbMgGHIJy28lJLZD12bVtxzVMStQ2tF/STQaoqKHsxPFCizjk2AT/
 UA+KdM57mmc7CDCQ=
X-Received: by 2002:a05:600c:1ca5:b0:393:e846:4ea1 with SMTP id
 k37-20020a05600c1ca500b00393e8464ea1mr8986758wms.32.1650915605254; 
 Mon, 25 Apr 2022 12:40:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxklePhnj02IPsy8/Irc8mp3FLrjMXCVlgPJkcGwG6Xi81YV8G9XFRpOl9CalYqeU5TAb0+9w==
X-Received: by 2002:a05:600c:1ca5:b0:393:e846:4ea1 with SMTP id
 k37-20020a05600c1ca500b00393e8464ea1mr8986728wms.32.1650915605016; 
 Mon, 25 Apr 2022 12:40:05 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 o21-20020adfa115000000b0020adea2767csm2615032wro.83.2022.04.25.12.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:40:04 -0700 (PDT)
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
To: Nicolin Chen <nicolinc@nvidia.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <Ylku1VVsbYiAEALZ@Asurada-Nvidia>
 <16ea3601-a3dd-ba9b-a5bc-420f4ac20611@redhat.com>
 <Yl4r3Ok61wxCc2zd@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <9ba412e7-85c1-8dd7-9a55-3a0078642bf8@redhat.com>
Date: Mon, 25 Apr 2022 21:40:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <Yl4r3Ok61wxCc2zd@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, thuth@redhat.com,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org, mjrosato@linux.ibm.com,
 farman@linux.ibm.com, jasowang@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, peterx@redhat.com, pasic@linux.ibm.com,
 alex.williamson@redhat.com, chao.p.peng@intel.com, kevin.tian@intel.com,
 jgg@nvidia.com, eric.auger.pro@gmail.com, yi.y.sun@intel.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Nicolin,

On 4/19/22 5:26 AM, Nicolin Chen wrote:
> On Sun, Apr 17, 2022 at 12:30:40PM +0200, Eric Auger wrote:
>
>>>> - More tests
>>> I did a quick test on my ARM64 platform, using "iommu=smmuv3"
>>> string. The behaviors are different between using default and
>>> using legacy "iommufd=off".
>>>
>>> The legacy pathway exits the VM with:
>>>     vfio 0002:01:00.0:
>>>     failed to setup container for group 1:
>>>     memory listener initialization failed:
>>>     Region smmuv3-iommu-memory-region-16-0:
>>>     device 00.02.0 requires iommu MAP notifier which is not currently supported
>>>
>>> while the iommufd pathway started the VM but reported errors
>>> from host kernel about address translation failures, probably
>>> because of accessing unmapped addresses.
>>>
>>> I found iommufd pathway also calls error_propagate_prepend()
>>> to add to errp for not supporting IOMMU_NOTIFIER_MAP, but it
>>> doesn't get a chance to print errp out. Perhaps there should
>>> be a final error check somewhere to exit?
>> thank you for giving it a try.
>>
>> vsmmuv3 + vfio is not supported as we miss the HW nested stage support
>> and SMMU does not support cache mode. If you want to test viommu on ARM
>> you shall test virtio-iommu+vfio. This should work but this is not yet
>> tested.
> I tried "-device virtio-iommu" and "-device virtio-iommu-pci"
> separately with vfio-pci, but neither seems to work. The host
> SMMU driver reports Translation Faults.
>
> Do you know what commands I should use to run QEMU for that
> combination?
you shall use :

 -device virtio-iommu-pci -device vfio-pci,host=<BDF>

Please make sure the "-device virtio-iommu-pci" is set *before* the
"-device vfio-pci,"

Otherwise the IOMMU MR notifiers are not set properly and this may be
the cause of your physical SMMU translations faults.

Eric
>
>> I pushed a fix for the error notification issue:
>> qemu-for-5.17-rc6-vm-rfcv2-rc0 on my git https://github.com/eauger/qemu.git
> Yes. This fixes the problem. Thanks!
>


