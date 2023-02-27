Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456C26A4350
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:50:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdtX-0005ZL-FW; Mon, 27 Feb 2023 08:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pWdtU-0005Yp-GC
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:50:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pWdtR-0004jk-Kn
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:50:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677505816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S4dyMKsgXRD+AEfPfXAHj4Iqc5TLZmEtTAnOv2Rw0h4=;
 b=NysbPHAlYE9j7D1CbSWo79eWUIv4PTGXEg99RE3/yFZvAAWGJBZH4ag+St6wWnCPj/1s7T
 ydwOX9fD74dhOtU+uADSuG8K7mYzS8ExRtchbqn+8ljLzuiOGwJ0cAZ+1hhBTlfyBNBkad
 r76A/3w3IP+G6CBD+U7vn6GMkJ6P6Qc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-wohy-Yz4P0uX96rZ44jFWg-1; Mon, 27 Feb 2023 08:50:14 -0500
X-MC-Unique: wohy-Yz4P0uX96rZ44jFWg-1
Received: by mail-qv1-f72.google.com with SMTP id
 ge13-20020a05621427cd00b005739f5f9d7cso3189521qvb.22
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 05:50:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S4dyMKsgXRD+AEfPfXAHj4Iqc5TLZmEtTAnOv2Rw0h4=;
 b=uuKLNBbolWwZCjtWszdV7OM+DNjo6HPxrXc8u0/XUi9q66foESZEl8SHz5p80Kfp4C
 ltlsQZxJfkzUBzFuovAAmz/X2B2PbiNA0WGlXgxyJHXj2zal9dxXSSWWQS3N5aGV56Jd
 n0MyBtLOBA7Ssp4b3FKrAlrxAsywzp3V+2ZzzylyI39fx44nEsEI7ACxfnhMmdap24F0
 CuX8FmfvpucuF+TQfs6lIsX9G4JvDz0PqLzuAzoImz+WXEb8lCaMEXcOGJQmpwd4gFeI
 TaXRL298C+efm7qx+xtmgZeGZi8WPbrlD/zC7Z3vle4gPwY/rVVCImvVpW145Y5JTBLf
 Px8g==
X-Gm-Message-State: AO0yUKUGQtFmDfkXFYM1+EDAnXpzrWXvmvUPk+V5yjrAkMjARtWhFu++
 yuejeaxtCmqxshL8VZwxVGP4Z9jKRKPb1oHEtnBUqQnV4O3N38cm3Kvq8JYetthV74R5Hc4Y9JF
 JSxCXmDTi+VtsDcY=
X-Received: by 2002:a05:622a:610:b0:3b8:6930:ee6 with SMTP id
 z16-20020a05622a061000b003b869300ee6mr30667934qta.21.1677505814277; 
 Mon, 27 Feb 2023 05:50:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+Kjcp04ZieBCad/3pgxn90ob0TMqLxh2sWi2EnLrxI2OpbmLMSAeerFAn2h6trRco4l1W2GQ==
X-Received: by 2002:a05:622a:610:b0:3b8:6930:ee6 with SMTP id
 z16-20020a05622a061000b003b869300ee6mr30667864qta.21.1677505813797; 
 Mon, 27 Feb 2023 05:50:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 d21-20020ac86155000000b003b2ea9b76d0sm4633147qtm.34.2023.02.27.05.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 05:50:13 -0800 (PST)
Message-ID: <15861d03-df49-69b3-da78-083851ebded2@redhat.com>
Date: Mon, 27 Feb 2023 14:50:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 00/20] vfio: Add migration pre-copy support and device
 dirty tracking
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222135512.51b62650.alex.williamson@redhat.com>
 <79b05864-3feb-8e3c-ab03-7c656027741c@nvidia.com>
 <7db50fd1-014e-6ee1-b224-5677a98093ce@oracle.com>
 <6a42ff0d-5400-f3ef-8316-3a1233c096d3@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <6a42ff0d-5400-f3ef-8316-3a1233c096d3@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/26/23 18:00, Avihai Horon wrote:
> 
> On 24/02/2023 21:26, Joao Martins wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 23/02/2023 14:56, Avihai Horon wrote:
>>> On 22/02/2023 22:55, Alex Williamson wrote:
>>>> There are various errors running this through the CI on gitlab.
>>>>
>>>> This one seems bogus but needs to be resolved regardless:
>>>>
>>>> https://gitlab.com/alex.williamson/qemu/-/jobs/3817940731
>>>> FAILED: libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o
>>>> 2786s390x-linux-gnu-gcc -m64 -Ilibqemu-aarch64-softmmu.fa.p -I. -I..
>>>> -Itarget/arm -I../target/arm -Iqapi -Itrace -Iui -Iui/shader
>>>> -I/usr/include/pixman-1 -I/usr/include/capstone -I/usr/include/glib-2.0
>>>> -I/usr/lib/s390x-linux-gnu/glib-2.0/include -fdiagnostics-color=auto -Wall
>>>> -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem
>>>> /builds/alex.williamson/qemu/linux-headers -isystem linux-headers -iquote .
>>>> -iquote /builds/alex.williamson/qemu -iquote
>>>> /builds/alex.williamson/qemu/include -iquote
>>>> /builds/alex.williamson/qemu/tcg/s390x -pthread -U_FORTIFY_SOURCE
>>>> -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
>>>> -fno-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings
>>>> -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls
>>>> -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security
>>>> -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
>>>> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
>>>> -Wmissing-format-attribute -Wno-missing-include-dirs -Wno-shift-negative-value
>>>> -Wno-psabi -fstack-protector-strong -fPIE -isystem../linux-headers
>>>> -isystemlinux-headers -DNEED_CPU_H
>>>> '-DCONFIG_TARGET="aarch64-softmmu-config-target.h"'
>>>> '-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"' -MD -MQ
>>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -MF
>>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o.d -o
>>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -c ../hw/vfio/common.c
>>>> 2787../hw/vfio/common.c: In function ‘vfio_listener_log_global_start’:
>>>> 2788../hw/vfio/common.c:1772:8: error: ‘ret’ may be used uninitialized in this
>>>> function [-Werror=maybe-uninitialized]
>>>> 2789 1772 |     if (ret) {
>>>> 2790      |        ^
>>>>
>>>> 32-bit builds have some actual errors though:
>>>>
>>>> https://gitlab.com/alex.williamson/qemu/-/jobs/3817940719
>>>> FAILED: libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o
>>>> 2601cc -m32 -Ilibqemu-aarch64-softmmu.fa.p -I. -I.. -Itarget/arm
>>>> -I../target/arm -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/pixman-1
>>>> -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/sysprof-4
>>>> -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
>>>> -isystem /builds/alex.williamson/qemu/linux-headers -isystem linux-headers
>>>> -iquote . -iquote /builds/alex.williamson/qemu -iquote
>>>> /builds/alex.williamson/qemu/include -iquote
>>>> /builds/alex.williamson/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE
>>>> -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
>>>> -fno-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings
>>>> -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls
>>>> -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security
>>>> -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
>>>> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
>>>> -Wmissing-format-attribute -Wno-missing-include-dirs -Wno-shift-negative-value
>>>> -Wno-psabi -fstack-protector-strong -fPIE -isystem../linux-headers
>>>> -isystemlinux-headers -DNEED_CPU_H
>>>> '-DCONFIG_TARGET="aarch64-softmmu-config-target.h"'
>>>> '-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"' -MD -MQ
>>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -MF
>>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o.d -o
>>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -c ../hw/vfio/common.c
>>>> 2602../hw/vfio/common.c: In function
>>>> 'vfio_device_feature_dma_logging_start_create':
>>>> 2603../hw/vfio/common.c:1572:27: error: cast from pointer to integer of
>>>> different size [-Werror=pointer-to-int-cast]
>>>> 2604 1572 |         control->ranges = (uint64_t)ranges;
>>>> 2605      |                           ^
>>>> 2606../hw/vfio/common.c:1596:23: error: cast from pointer to integer of
>>>> different size [-Werror=pointer-to-int-cast]
>>>> 2607 1596 |     control->ranges = (uint64_t)ranges;
>>>> 2608      |                       ^
>>>> 2609../hw/vfio/common.c: In function
>>>> 'vfio_device_feature_dma_logging_start_destroy':
>>>> 2610../hw/vfio/common.c:1620:9: error: cast to pointer from integer of
>>>> different size [-Werror=int-to-pointer-cast]
>>>> 2611 1620 |         (struct vfio_device_feature_dma_logging_range
>>>> *)control->ranges;
>>>> 2612      |         ^
>>>> 2613../hw/vfio/common.c: In function 'vfio_device_dma_logging_report':
>>>> 2614../hw/vfio/common.c:1810:22: error: cast from pointer to integer of
>>>> different size [-Werror=pointer-to-int-cast]
>>>> 2615 1810 |     report->bitmap = (uint64_t)bitmap;
>>>> 2616      |                      ^
>>> Sure, I will fix these errors.
>> Just a thought: should the pre-copy series be moved towards the end of this
>> series, given that it's more of an improvement of downtime than a must-have like
>> dirty tracking?
> 
> Given recent discussion, maybe it would be better to split this series and go one step at a time:
> Start with basic support for device dirty tracking (without vIOMMU support), then add pre-copy and then add vIOMMU support to device dirty tracking.

and add the fixes first in the series. They could be merged quickly.

Thanks,

C.



