Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFA940197E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 12:09:46 +0200 (CEST)
Received: from localhost ([::1]:44910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNBZR-0002XV-Ts
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 06:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNBXl-0000Va-2T
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:08:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNBXj-0000aK-Hg
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630922878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UF0sJ6xO08IQJ9zc+aGo0R4FBxuLBsCpTUf7aFOy5Hw=;
 b=FzafP2VdAtpTdY5+kr03zB4rLlSLd715WM1WpOO7f+bH/ws5zQKYTaRrGwer2RBIa/78pQ
 2XJwh2zNJmCsFiaLc1XxoxJOD1IRWZtfCGtOicUddbMohoP+8kgCamzW0J3LXWlww3KW65
 dYqn7i80keWnm3ssloKGj50NWSXbplY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-LQUjGW5ONbaBjhv89r9UBQ-1; Mon, 06 Sep 2021 06:07:57 -0400
X-MC-Unique: LQUjGW5ONbaBjhv89r9UBQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j33-20020a05600c48a100b002e879427915so2156350wmp.5
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 03:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UF0sJ6xO08IQJ9zc+aGo0R4FBxuLBsCpTUf7aFOy5Hw=;
 b=LCacRrsYMxw7BdFFhRb31c3wvL962On/WC95mV8UtcHftyHMtIu6q2OTvSphgIRK1g
 ezpm83mMPsWWrtyiOa6GtGNKyjDR3f32PawBh+hJYUN9BUM4ZBWSqvQSQy50jkY2IsRv
 elQr2AU05HZ7D+/Sr7WnJRK2m9e4H0U3rOu+UJ5tIzRxP+omoGQ70rJdy7Ap28kqksX+
 ZUMdIjg8ev0tTAPsbtKjAmR5W7NLj6wSFm9estilJN4TWuliMux5dr48qv7Zls/ajesx
 WWGAOaV1FH3a7ECZFMJhS5/Rb5oANlDSgYpXDor64YKTaBYq2h51Moa4skzm5gRa7s0S
 2TSg==
X-Gm-Message-State: AOAM533GUTyL7IhIRQinlDBtyLjzUvldWJm/F+44d8DjfLBlpYX76UHU
 /j8R8s7ZUjFddPCNJXb0v7j3YUvXIqobXchR0SE4XYmtL2ODw58B7XZsNkYDR1arn+Mi3zS/S87
 JbZTbTVSc+ylHets=
X-Received: by 2002:a5d:4305:: with SMTP id h5mr6242148wrq.4.1630922875958;
 Mon, 06 Sep 2021 03:07:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE8bHgFtY1dwOK4vKdKdx4ELpc9n0WERw2PQZA3CALRkrUFOEF+Txr14+wxBdT0+sWpQEc2g==
X-Received: by 2002:a5d:4305:: with SMTP id h5mr6242128wrq.4.1630922875750;
 Mon, 06 Sep 2021 03:07:55 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831a0.dip0.t-ipconnect.de.
 [217.232.49.160])
 by smtp.gmail.com with ESMTPSA id r20sm7654676wrr.47.2021.09.06.03.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 03:07:55 -0700 (PDT)
Subject: Re: [PATCH v3 11/13] hw/s390x/s390-skeys: check if an address is
 valid before dumping the key
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210903155514.44772-1-david@redhat.com>
 <20210903155514.44772-12-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <29493214-d289-3ebd-95d5-fd6ada57d2a1@redhat.com>
Date: Mon, 6 Sep 2021 12:07:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210903155514.44772-12-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.832, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 03/09/2021 17.55, David Hildenbrand wrote:
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
>   hw/s390x/s390-skeys.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
> index 56a47fe180..db73e9091d 100644
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
> @@ -86,6 +87,13 @@ void hmp_info_skeys(Monitor *mon, const QDict *qdict)
>           return;
>       }
>   
> +    if (!address_space_access_valid(&address_space_memory,
> +                                    addr & TARGET_PAGE_MASK, TARGET_PAGE_SIZE,
> +                                    false, MEMTXATTRS_UNSPECIFIED)) {
> +        monitor_printf(mon, "Error: The given address is not valid\n");
> +        return;
> +    }
> +
>       r = skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
>       if (r < 0) {
>           monitor_printf(mon, "Error: %s\n", strerror(-r));
> @@ -197,11 +205,6 @@ static int qemu_s390_skeys_enabled(S390SKeysState *ss)
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

Acked-by: Thomas Huth <thuth@redhat.com>


