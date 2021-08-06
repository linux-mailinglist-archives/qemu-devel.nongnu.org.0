Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4173E267E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 10:54:22 +0200 (CEST)
Received: from localhost ([::1]:40106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBvcT-00022w-9w
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 04:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBvbk-0001Ix-7b
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBvbi-0001zL-Nv
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628240014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xEQUGvo5UIneZWdOzQBrvCLxT2A7Ul6W58B4NZjmgCk=;
 b=EQg3GjG3t1fpw7nJaASrWYTP5syz7/ffrIPmpQoAl6VnrzFAWSJqOy+9rBZ8uidROdKxdF
 a2EM3DwnsTx+XM07ko3gKZigzhN4wqkhJz+RBTyMUxb1WxXJhFkEfEu5FVpRW197WXdq5d
 hxHzkYPgFQn3KuoE67ADQyIMpPDYdGg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-DgrZwN1xMBC7FTRF7msGBA-1; Fri, 06 Aug 2021 04:53:32 -0400
X-MC-Unique: DgrZwN1xMBC7FTRF7msGBA-1
Received: by mail-wr1-f71.google.com with SMTP id
 p2-20020a5d48c20000b0290150e4a5e7e0so2900974wrs.13
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 01:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xEQUGvo5UIneZWdOzQBrvCLxT2A7Ul6W58B4NZjmgCk=;
 b=mkhwjqSCVBafbQm0TGnRAbXM7BkDbocrzwG5fUp5QDd12at6hDrydDndofXmVXAm9i
 mVhiGqmDIyptoAp9pfYc2NraZndgc/dz7+XYOhP7h3FZj5yOWFeNvuD3GeRhAxGuVFXX
 e+aNhOaf7I8yTCf8ksq6eMS+MtO8/2skr0EjJtQIh1xnk2ZaxplLzZ5FdOAQqPASgzUa
 Bp0FGeMeC58764QWZLvYP9dKy3nNzRrw9x5dSinYgBzCdgyltIaQaZbMNwcF2xD0X4Cj
 AB2qlGzFT2ss01ndn64RCesCCafhJ5Q+HQnEx3hYH2qqeR9C6S0gGiHS5l3dU1nXcsUt
 WkpA==
X-Gm-Message-State: AOAM533rCpjgMOF43rWITMB/J5RJqkG8tO5a8o6I2ZJn0Mhx7FwjpvYb
 vFzcepkTo4yzDwzY7t76XLKGDEYh1xKtko/VukpYVu1Ijjb92t+JOWfzwae6HH0S4um2otAL4yl
 KNgeanT3mSRCSMsU=
X-Received: by 2002:a5d:620d:: with SMTP id y13mr9563673wru.45.1628240011780; 
 Fri, 06 Aug 2021 01:53:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL5IEeuBVBPSc6GPFLNS03yEXIfodaBdnEYS1zhHoO9++ZUjvbV/mu+m4g60Nab/DSpEUmjg==
X-Received: by 2002:a5d:620d:: with SMTP id y13mr9563651wru.45.1628240011587; 
 Fri, 06 Aug 2021 01:53:31 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id a16sm8843844wrx.7.2021.08.06.01.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 01:53:31 -0700 (PDT)
Subject: Re: [PATCH v1 11/12] hw/s390x/s390-skeys: check if an address is
 valid before dumping the key
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-12-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <fd12be48-6c8c-9afa-ed4b-c5eb674cae88@redhat.com>
Date: Fri, 6 Aug 2021 10:53:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805152804.100333-12-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2021 17.28, David Hildenbrand wrote:
> Let's validate the given address and report a proper error in case it's
> not. All call paths now properly check the validity of the given GFN.
> Remove the TODO.
> 
> The errors inside the getter and setter should only trigger if something
> really goes wrong now, for example, with a broken migration stream. Or
> when we forget to update the storage key allocation with memory hotplug.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/s390x/s390-skeys.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
> index 56a47fe180..53e16f1b9c 100644
> --- a/hw/s390x/s390-skeys.c
> +++ b/hw/s390x/s390-skeys.c
> @@ -18,6 +18,7 @@
>   #include "qapi/qmp/qdict.h"
>   #include "qemu/error-report.h"
>   #include "sysemu/memory_mapping.h"
> +#include "exec/address-spaces.h"
>   #include "sysemu/kvm.h"
>   #include "migration/qemu-file-types.h"
>   #include "migration/register.h"
> @@ -86,6 +87,12 @@ void hmp_info_skeys(Monitor *mon, const QDict *qdict)
>           return;
>       }
>   
> +    if (!address_space_access_valid(&address_space_memory,
> +                                    addr & TARGET_PAGE_MASK, TARGET_PAGE_SIZE,
> +                                    false, MEMTXATTRS_UNSPECIFIED)) {
> +        monitor_printf(mon, "Error: The given address is not valid\n");

I think the code should return here?

> +    }
> +
>       r = skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
>       if (r < 0) {
>           monitor_printf(mon, "Error: %s\n", strerror(-r));
> @@ -197,11 +204,6 @@ static int qemu_s390_skeys_enabled(S390SKeysState *ss)
>       return 1;
>   }
>   
> -/*
> - * TODO: for memory hotplug support qemu_s390_skeys_set and qemu_s390_skeys_get
> - * will have to make sure that the given gfn belongs to a memory region and not
> - * a memory hole.
> - */
>   static int qemu_s390_skeys_set(S390SKeysState *ss, uint64_t start_gfn,
>                                 uint64_t count, uint8_t *keys)
>   {
> 

  Thomas


