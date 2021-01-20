Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EC52FDBE7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 22:36:59 +0100 (CET)
Received: from localhost ([::1]:36210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2L9t-0002fM-Je
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 16:36:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2L94-000278-Jz
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 16:36:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2L91-0003AT-FS
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 16:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611178560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1SuD0BrWYLTaQhbYj4HraVELDij+Xm0ukMbLv6h6RSY=;
 b=GXFwhZHQhL4Yl1skG0h7ZBFL++tlJ9K4C4OC6WPA7XJFs684ZwPHIuGyQ2lkC0HRROcLIA
 5HIORJ9AIZOhqOycfMH7f3zDfOlBm/o29KodXxVOEwrfLp8tHTgmajUyGJsGp1spLU/jXG
 Ki4iPSS+SBNdr8jiGhvzY92lWRwLcXg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-ohTkRBMdO6CLQsO8Cg1piA-1; Wed, 20 Jan 2021 16:35:59 -0500
X-MC-Unique: ohTkRBMdO6CLQsO8Cg1piA-1
Received: by mail-ej1-f71.google.com with SMTP id o21so7308eje.5
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 13:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1SuD0BrWYLTaQhbYj4HraVELDij+Xm0ukMbLv6h6RSY=;
 b=IxPNPNBoYHcXVJ18g/rLXT3+mo9cT+jga+I6oWrKS96rwthha0pGDQgm04o5Lbav0K
 YtFo+5PcQ6N0F2M0cnnGS/lMoMO7P7tmzzT6YW+NuwhAVNskd0wustUsbg6y3q0J+h0h
 XmxxoACPGXHnL6Mf2+wJGWyDLkIK1u24gMe4b4cCS3Tp2hIKIxinYv4ou9z3zRXVcs1f
 m6hteJtdeqHpxs1zqWTDDquex4vQP4J3btcLKsk9z7TcSa6NhuzodhFShLnGK3xsjeo9
 YzoyuXIIF/N+YehgDEnpVUU59QiCH3WxCMNegVtjZ/SedIkQHN2KpkJ8qNqUnMZqfMXy
 80RA==
X-Gm-Message-State: AOAM531nI+4W5hQctj7x3NU8ZoOGYSU5+xHLpodbX99ZihFJFys40D3h
 Asy1puAvw2aMKegxH0f1R+7UUdM9Dd6RjH1uDtH9RLTowDjqeo+ZdaJl0Liod9jXXO9k8QNaaev
 CjtXDZNUm6OSeTa0=
X-Received: by 2002:a17:906:eb12:: with SMTP id
 mb18mr7065270ejb.257.1611178557784; 
 Wed, 20 Jan 2021 13:35:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzM7cvrRtoTL351SUK4AaGYXta9u4xCRayWFEBzw5ru8SbRZ9lF6OpZ1uDkzJD4QMbTwX5VWg==
X-Received: by 2002:a17:906:eb12:: with SMTP id
 mb18mr7065260ejb.257.1611178557580; 
 Wed, 20 Jan 2021 13:35:57 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id co6sm1752959edb.96.2021.01.20.13.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 13:35:56 -0800 (PST)
Subject: Re: [PATCH] Deprecate pmem=on with non-DAX capable backend file
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210111203332.740815-1-imammedo@redhat.com>
 <20210120203122.6c037b5b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cbe5a2e4-ad7e-c1cd-3c06-eb997c10d146@redhat.com>
Date: Wed, 20 Jan 2021 22:35:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120203122.6c037b5b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: libvir-list@redhat.com, pbonzini@redhat.com, thuth@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing MST.

On 1/20/21 8:31 PM, Igor Mammedov wrote:
> On Mon, 11 Jan 2021 15:33:32 -0500
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
>> It is not safe to pretend that emulated NVDIMM supports
>> persistence while backend actually failed to enable it
>> and used non-persistent mapping as fall back.
>> Instead of falling-back, QEMU should be more strict and
>> error out with clear message that it's not supported.
>> So if user asks for persistence (pmem=on), they should
>> store backing file on NVDIMM.
>>
>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v2:
>>   rephrase deprecation comment andwarning message
>>   (Philippe Mathieu-Daudé <philmd@redhat.com>)
> 
> I've posted as v1 though it's v2 and it looks like it fell through cracks,
> 
> can someone pick it up if it looks fine, please?
> 
>> ---
>>  docs/system/deprecated.rst | 17 +++++++++++++++++
>>  util/mmap-alloc.c          |  3 +++
>>  2 files changed, 20 insertions(+)
>>
>> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
>> index bacd76d7a5..e79fb02b3a 100644
>> --- a/docs/system/deprecated.rst
>> +++ b/docs/system/deprecated.rst
>> @@ -327,6 +327,23 @@ The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
>>  to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
>>  machines have been renamed ``raspi2b`` and ``raspi3b``.
>>  
>> +Backend options
>> +---------------
>> +
>> +Using non-persistent backing file with pmem=on (since 6.0)
>> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>> +
>> +This option is used when ``memory-backend-file`` is consumed by emulated NVDIMM
>> +device. However enabling ``memory-backend-file.pmem`` option, when backing file
>> +is (a) not DAX capable or (b) not on a filesystem that support direct mapping
>> +of persistent memory, is not safe and may lead to data loss or corruption in case
>> +of host crash.
>> +Options are:
>> +    - modify VM configuration to set ``pmem=off`` to continue using fake NVDIMM
>> +      (without persistence guaranties) with backing file on non DAX storage
>> +    - move backing file to NVDIMM storage and keep ``pmem=on``
>> +      (to have NVDIMM with persistence guaranties).
>> +
>>  Device options
>>  --------------
>>  
>> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
>> index 27dcccd8ec..0388cc3be2 100644
>> --- a/util/mmap-alloc.c
>> +++ b/util/mmap-alloc.c
>> @@ -20,6 +20,7 @@
>>  #include "qemu/osdep.h"
>>  #include "qemu/mmap-alloc.h"
>>  #include "qemu/host-utils.h"
>> +#include "qemu/error-report.h"
>>  
>>  #define HUGETLBFS_MAGIC       0x958458f6
>>  
>> @@ -166,6 +167,8 @@ void *qemu_ram_mmap(int fd,
>>                      "crash.\n", file_name);
>>              g_free(proc_link);
>>              g_free(file_name);
>> +            warn_report("Using non DAX backing file with 'pmem=on' option"
>> +                        " is deprecated");
>>          }
>>          /*
>>           * if map failed with MAP_SHARED_VALIDATE | MAP_SYNC,
> 


