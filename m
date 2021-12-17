Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853C04786E2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 10:17:06 +0100 (CET)
Received: from localhost ([::1]:46448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my9MP-0007w1-MX
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 04:17:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1my9K1-0005e5-VS
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 04:14:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1my9Jy-0006sM-HN
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 04:14:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639732473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RsDj6nTc+4l4ojG7cyEuQ3smAn2DL2n3PJQtzyJm4HQ=;
 b=V1o1XuxMUhyRXIknRTrClNHTtrMwpcoA3tuHdfw2J6BbHQnK5viVSeo1cSplBm+++b5okB
 kJVCmfVYhApWJZUrvLcwlMpHDxOhd63J5OTNMDd9W3C1bqs8yVJBdRNxmguExNAiyVZhRR
 CXkoVI76kgLfBa7elaVqR/y8o66PGBU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-AycGpL9fMXu-MeautnkUTA-1; Fri, 17 Dec 2021 04:13:28 -0500
X-MC-Unique: AycGpL9fMXu-MeautnkUTA-1
Received: by mail-ed1-f69.google.com with SMTP id
 eg23-20020a056402289700b003f80a27ca2bso1362494edb.14
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 01:13:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=RsDj6nTc+4l4ojG7cyEuQ3smAn2DL2n3PJQtzyJm4HQ=;
 b=YVUGEU/ilej+2AaoxcIcIcdDrdR/Tt396Uj7WfS3c2u3N8pFv9TnXPrB8CQ4k899JQ
 UDJzPNO/y4dVs+/J4ZMN2F4EwQSm93URtvY/yiehtUzTjdgAML9t8Z+pNWjmsukF0X//
 5cwui5vdOdarlHMKLbYAC2HGm0c0E2pWb9DVsI2GYyrKuhBiTcEdeCSXJ8rGZ93FFGaj
 eR9W32jWQ6L6gt+8Q0Cavzr0kWb+xVgKS/Zf4wR6aSWIhKbADdTNs49Wis5LfKiUQm2v
 sp3sgAA1qCYwjlXY6PK9emvLlKdwvGGPmqJUDNGNgx4gUtRyH4F3xoB4VcEUklME4vTq
 oy/A==
X-Gm-Message-State: AOAM531D8ejfkr4+Lx7IcnFOHw6e+P2s2QGcl2LvSDGLvYeGaoNPYUtZ
 g1fqH5jnH3brU5c4DsqbPsKntCZRHNXXd1Ia4uWiZUsDsEwY4I/4Y/2x7jR0nAud0TlYWv0zwyc
 aBCVMk1tFmKxzhitbuyFs94NHMYF8rPU7M9BC//P1gq9V2FDjYki+DCLxp8InZp56fV0=
X-Received: by 2002:a17:907:9713:: with SMTP id
 jg19mr1866545ejc.262.1639732407163; 
 Fri, 17 Dec 2021 01:13:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwN+f9H/zf2tvmKiNrPSwoUzJrFAYWxSufy/5LtokEXHnCykegub7FCxTZATmd296d+yp/Okg==
X-Received: by 2002:a17:907:9713:: with SMTP id
 jg19mr1866520ejc.262.1639732406731; 
 Fri, 17 Dec 2021 01:13:26 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id o13sm2661440ejy.192.2021.12.17.01.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 01:13:26 -0800 (PST)
Message-ID: <ff8ce273-30d4-2895-f374-87fcbee2e612@redhat.com>
Date: Fri, 17 Dec 2021 10:13:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] thunk: do not use HOST_* defines
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
References: <20211216100527.103021-1-pbonzini@redhat.com>
In-Reply-To: <20211216100527.103021-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 11:05, Paolo Bonzini wrote:
> Just use sizeof, avoiding the need to write down all the ABIs twice.
> 
> Cc: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

This breaks bsd-user, I'll resend when "[PATCH v7 00/15] linux-user: 
simplify safe signal handling" is in.

Paolo

> ---
>   include/exec/user/thunk.h | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/include/exec/user/thunk.h b/include/exec/user/thunk.h
> index 300a840d58..c50ba17317 100644
> --- a/include/exec/user/thunk.h
> +++ b/include/exec/user/thunk.h
> @@ -22,6 +22,7 @@
>   
>   #include "cpu.h"
>   #include "exec/user/abitypes.h"
> +#include <asm/posix_types.h>
>   
>   /* types enums definitions */
>   
> @@ -109,16 +110,7 @@ static inline int thunk_type_size(const argtype *type_ptr, int is_host)
>           break;
>       case TYPE_OLDDEVT:
>           if (is_host) {
> -#if defined(HOST_X86_64)
> -            return 8;
> -#elif defined(HOST_ALPHA) || defined(HOST_IA64) || defined(HOST_MIPS) || \
> -      defined(HOST_PARISC) || defined(HOST_SPARC64)
> -            return 4;
> -#elif defined(HOST_PPC)
> -            return sizeof(void *);
> -#else
> -            return 2;
> -#endif
> +            return sizeof(__kernel_old_dev_t);
>           } else {
>   #if defined(TARGET_X86_64)
>               return 8;
> 


