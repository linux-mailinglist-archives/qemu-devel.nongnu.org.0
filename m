Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8122C492778
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:50:29 +0100 (CET)
Received: from localhost ([::1]:40960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9osW-0000E2-AN
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:50:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9no2-0006aI-4u
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:41:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9nnz-00047X-DR
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642509667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1I2/o3RwNgpvbVW6b7MBHeo5IpE75AA0Ih6Yl+YU8s=;
 b=R/LB1gTACzKpg2tNS6idQmUxKkko4P3uSorQvkXOhuf5FCLYwxL9iIIz4TpKiuh6dVOu3c
 1WengWmYbAP0nSRhWDKMeMp3isaQGl45YMLG1MbVKTfmVkQFhi3vpNxdDV1lLWly/3LKng
 KaRrO8afGAXT4nRDbXGT5PdYaeM6VZo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-_94Raj3bNnGtBmUCIofWxQ-1; Tue, 18 Jan 2022 07:41:06 -0500
X-MC-Unique: _94Raj3bNnGtBmUCIofWxQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 a3-20020a05600c348300b0034a0dfc86aaso1742801wmq.6
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 04:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q1I2/o3RwNgpvbVW6b7MBHeo5IpE75AA0Ih6Yl+YU8s=;
 b=JVtyz56G5H+yEOPQOiyo6OoFrp1HyZjsaqnHUmRJcpx0H6WFurapHTSXIBsrtzu1WZ
 E9AZhjIFKdELtq3coEtzENi1RgLz3QzIMc9vF+/SwX7yc6z7vSKRPIyuWAB9d6EhxJY4
 1nhKvO9rlvGttndZ0ka7b/1yhztn7YAN4HizViZtkS3p1wlRNBaO4RUjt/OyZ12PbFVh
 mvXXCobFZdM2yYFzcO30zZrnWht/Osd8fHGdw4Kz1zDQrYcXNUOiVGzYrW2wNM7v8RQ0
 vKcFGHnvAD2APDrCkHj0WrwEjHt5nAfNpMzEI3g+rAl+3Ycm6lmB87DGcQdsfIsIlWGU
 UBzg==
X-Gm-Message-State: AOAM532u0pkZ9t5/QsWJYVGAcjXzNrd7Ruc82kQItq3SzfwJZ0VNLCcZ
 OnK89Va1ekml0lVoyQ2SLQ6uKhMCHyb8nhDE+Rth17+P78Anr+V8IjGj4/GcXipmM/CNskS+J0S
 iVholsGXllC516KQFKnUNIrba/Nfns2kCYDOSDXPM+tA3kFUBAlWVzr0b+bxhr40=
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr23573988wrf.451.1642509665442; 
 Tue, 18 Jan 2022 04:41:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJws/5SLKA8XS20K1jISeq58/8HaB2LFspF6tVmeGXRxt1gf+ltj9m/LgUTfRBRsrOsediR9OQ==
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr23573936wrf.451.1642509664962; 
 Tue, 18 Jan 2022 04:41:04 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id h11sm2288167wmb.12.2022.01.18.04.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 04:41:04 -0800 (PST)
Message-ID: <6529d9b4-551a-0575-39d3-09e69497c8ac@redhat.com>
Date: Tue, 18 Jan 2022 13:41:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 3/3] tests/qtest/fuzz-sdcard-test: Add reproducer for
 OSS-Fuzz (Issue 29225)
To: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20211215205656.488940-1-philmd@redhat.com>
 <20211215205656.488940-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211215205656.488940-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/12/2021 21.56, Philippe Mathieu-Daudé wrote:
> Include the qtest reproducer provided by Alexander Bulekov
> in https://gitlab.com/qemu-project/qemu/-/issues/451. Without
> the previous commit, we get:
> 
>    $ make check-qtest-i386
>    ...
>    Running test qtest-i386/fuzz-sdcard-test
>    ==447470==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x61500002a080 at pc 0x564c71766d48 bp 0x7ffc126c62b0 sp 0x7ffc126c62a8
>    READ of size 1 at 0x61500002a080 thread T0
>        #0 0x564c71766d47 in sdhci_read_dataport hw/sd/sdhci.c:474:18
>        #1 0x564c7175f139 in sdhci_read hw/sd/sdhci.c:1022:19
>        #2 0x564c721b937b in memory_region_read_accessor softmmu/memory.c:440:11
>        #3 0x564c72171e51 in access_with_adjusted_size softmmu/memory.c:554:18
>        #4 0x564c7216f47c in memory_region_dispatch_read1 softmmu/memory.c:1424:16
>        #5 0x564c7216ebb9 in memory_region_dispatch_read softmmu/memory.c:1452:9
>        #6 0x564c7212db5d in flatview_read_continue softmmu/physmem.c:2879:23
>        #7 0x564c7212f958 in flatview_read softmmu/physmem.c:2921:12
>        #8 0x564c7212f418 in address_space_read_full softmmu/physmem.c:2934:18
>        #9 0x564c721305a9 in address_space_rw softmmu/physmem.c:2962:16
>        #10 0x564c7175a392 in dma_memory_rw_relaxed include/sysemu/dma.h:89:12
>        #11 0x564c7175a0ea in dma_memory_rw include/sysemu/dma.h:132:12
>        #12 0x564c71759684 in dma_memory_read include/sysemu/dma.h:152:12
>        #13 0x564c7175518c in sdhci_do_adma hw/sd/sdhci.c:823:27
>        #14 0x564c7174bf69 in sdhci_data_transfer hw/sd/sdhci.c:935:13
>        #15 0x564c7176aaa7 in sdhci_send_command hw/sd/sdhci.c:376:9
>        #16 0x564c717629ee in sdhci_write hw/sd/sdhci.c:1212:9
>        #17 0x564c72172513 in memory_region_write_accessor softmmu/memory.c:492:5
>        #18 0x564c72171e51 in access_with_adjusted_size softmmu/memory.c:554:18
>        #19 0x564c72170766 in memory_region_dispatch_write softmmu/memory.c:1504:16
>        #20 0x564c721419ee in flatview_write_continue softmmu/physmem.c:2812:23
>        #21 0x564c721301eb in flatview_write softmmu/physmem.c:2854:12
>        #22 0x564c7212fca8 in address_space_write softmmu/physmem.c:2950:18
>        #23 0x564c721d9a53 in qtest_process_command softmmu/qtest.c:727:9
> 
>    0x61500002a080 is located 0 bytes to the right of 512-byte region [0x615000029e80,0x61500002a080)
>    allocated by thread T0 here:
>        #0 0x564c708e1737 in __interceptor_calloc (qemu-system-i386+0x1e6a737)
>        #1 0x7ff05567b5e0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x5a5e0)
>        #2 0x564c71774adb in sdhci_pci_realize hw/sd/sdhci-pci.c:36:5
> 
>    SUMMARY: AddressSanitizer: heap-buffer-overflow hw/sd/sdhci.c:474:18 in sdhci_read_dataport
>    Shadow bytes around the buggy address:
>      0x0c2a7fffd3c0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>      0x0c2a7fffd3d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>      0x0c2a7fffd3e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>      0x0c2a7fffd3f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>      0x0c2a7fffd400: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    =>0x0c2a7fffd410:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>      0x0c2a7fffd420: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>      0x0c2a7fffd430: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>      0x0c2a7fffd440: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>      0x0c2a7fffd450: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>      0x0c2a7fffd460: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>    Shadow byte legend (one shadow byte represents 8 application bytes):
>      Addressable:           00
>      Heap left redzone:       fa
>      Freed heap region:       fd
>    ==447470==ABORTING
>    Broken pipe
>    ERROR qtest-i386/fuzz-sdcard-test - too few tests run (expected 3, got 2)
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/qtest/fuzz-sdcard-test.c | 76 ++++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)

Acked-by: Thomas Huth <thuth@redhat.com>


