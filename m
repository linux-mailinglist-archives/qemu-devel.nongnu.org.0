Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172BF36B092
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 11:30:37 +0200 (CEST)
Received: from localhost ([::1]:39114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laxZc-0003gd-38
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 05:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1laxWM-0002Jy-Kt
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:27:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1laxWJ-0005hI-G1
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:27:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619429230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0AQW/vJNoIy6Zmv06czZCvJGtr2WVb8AByS4WREWuug=;
 b=AXH4SQYNooTO9m2h1jsynBn5uyypJbwdYYGAsT+DS7tuqm0Z0PBIaXPpbGAHH9TRrbD7da
 Iha+EG7RiRa0ytp4EzgL/ySf2LY7V/eDwigz4cXAi3ZG5FVkpDBUch4qmj/4zTOZYrGAkx
 dxwTX2CJgjx+I9eQ/BV65brLa7NaWsM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-cWrsT24IPMGbibVcRFAMyw-1; Mon, 26 Apr 2021 05:27:07 -0400
X-MC-Unique: cWrsT24IPMGbibVcRFAMyw-1
Received: by mail-wm1-f69.google.com with SMTP id
 o18-20020a1ca5120000b02901333a56d46eso2847381wme.8
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 02:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0AQW/vJNoIy6Zmv06czZCvJGtr2WVb8AByS4WREWuug=;
 b=JqPW7Yx2CTfajnpYE7COgqq8l0mvHJ2hc9MPg65jUI8tJPFASrh3xRDIoxkmWM3Qpc
 VeeQIB/SVeg00/n0rSvHAtT/DPM7ug+zL0/ZmFBphRUo6oqm+h5q56JH1RNPA49X4LQO
 zy72sM+hz9ZepmEY17hG9LXARzXWuerKKCUaTAGG5OzFwbVooTX0fnFzBn+Se+B/zMmX
 DqsifXKdLCeHn/1BAoZDXI82H8Q2ldGuUgiqNyFFASFV9AEfa8zUXZTCEyBcxGxAdCzd
 D44PlU/m6s97xder+hpLk/293Mzbctr5WWJ1vOhdPJ8BTf1Qmbzvqz6V4cYJnnc9uUiP
 o4cg==
X-Gm-Message-State: AOAM532RZPWMlla/kFax26FSdYK5j+SF2SbhvjQKOqRWPhtTOxS/nn+j
 N3lIXMFsRQfXefE4mahU9XtIjMW16Xp/TI48bDluFW0N0Bve42hLIKX8ZtSd/tqseErcu273DuX
 Wg4eJtuAVPgwrfyk=
X-Received: by 2002:a1c:7f58:: with SMTP id a85mr999257wmd.149.1619429226261; 
 Mon, 26 Apr 2021 02:27:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJG6iypLj1Xe2EnNgU33nu9ZVvC3aGEIGRBYEnclsxzxnI2f6nVC/ePt0TWi3vfB2qZgG04w==
X-Received: by 2002:a1c:7f58:: with SMTP id a85mr999239wmd.149.1619429226102; 
 Mon, 26 Apr 2021 02:27:06 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t184sm20089657wmf.26.2021.04.26.02.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 02:27:05 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 1/2] hw/block/nvme: fix invalid msix exclusive
 uninit
To: Klaus Jensen <its@irrelevant.dk>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20210423052127.512489-1-its@irrelevant.dk>
 <20210423052127.512489-2-its@irrelevant.dk>
 <YIZEPo8gD/puvP5T@apples.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <79c468bd-e600-7acd-2843-e9a77df91e79@redhat.com>
Date: Mon, 26 Apr 2021 11:27:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIZEPo8gD/puvP5T@apples.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/21 6:40 AM, Klaus Jensen wrote:
> On Apr 23 07:21, Klaus Jensen wrote:
>> From: Klaus Jensen <k.jensen@samsung.com>
>>
>> Commit 1901b4967c3f changed the nvme device from using a bar exclusive
>> for MSI-x to sharing it on bar0.
>>
>> Unfortunately, the msix_uninit_exclusive_bar() call remains in
>> nvme_exit() which causes havoc when the device is removed with, say,
>> device_del. Fix this.
>>
>> Additionally, a subregion is added but it is not removed on exit which
>> causes a reference to linger and the drive to never be unlocked.
>>
>> Fixes: 1901b4967c3f ("hw/block/nvme: move msix table and pba to BAR 0")
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> ---
>> hw/block/nvme.c | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>> index 624a1431d072..5fe082ec34c5 100644
>> --- a/hw/block/nvme.c
>> +++ b/hw/block/nvme.c
>> @@ -6235,7 +6235,8 @@ static void nvme_exit(PCIDevice *pci_dev)
>>     if (n->pmr.dev) {
>>         host_memory_backend_set_mapped(n->pmr.dev, false);
>>     }
>> -    msix_uninit_exclusive_bar(pci_dev);
>> +    msix_uninit(pci_dev, &n->bar0, &n->bar0);
>> +    memory_region_del_subregion(&n->bar0, &n->iomem);
>> }
>>
>> static Property nvme_props[] = {
>> -- 
>> 2.31.1
>>
> 
> Ping for a review on this please :)

You forgot to Cc the maintainers :/ (doing it now).

$ ./scripts/get_maintainer.pl -f include/hw/pci/msix.h
"Michael S. Tsirkin" <mst@redhat.com> (supporter:PCI)
Marcel Apfelbaum <marcel.apfelbaum@gmail.com> (supporter:PCI)


