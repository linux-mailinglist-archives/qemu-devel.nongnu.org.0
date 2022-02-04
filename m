Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39DB4A9522
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 09:31:47 +0100 (CET)
Received: from localhost ([::1]:56698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFu0R-0008Sd-05
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 03:31:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nFtMg-0003gr-Ie
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:50:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nFtMZ-0007hI-Qn
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:50:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643961032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnw2Ruf02HJtNkR5+kbs86iiJHiuWO2Cn5EcJNp6n4g=;
 b=awh5np8bUkZ3p2BibKMf8WxAHO5ZAdCSKrcCOxnnPxT7TyVNHFs8oiL+P2wer2t1SscUWn
 I+y1acfyLGcxC+Kl1JuyJnk4+cHVxs0ASzN5CaRAjYPklNsJBqP3GLejAMDXYbzTa1OJRn
 ZSvq/x8ES/oNS7N0EYqHkWDczfNgmGs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-_GqeDfsUNRmW9DoPhpa8xg-1; Fri, 04 Feb 2022 02:50:31 -0500
X-MC-Unique: _GqeDfsUNRmW9DoPhpa8xg-1
Received: by mail-wr1-f72.google.com with SMTP id
 w19-20020adf8bd3000000b001df887ad0caso1621980wra.18
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 23:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xnw2Ruf02HJtNkR5+kbs86iiJHiuWO2Cn5EcJNp6n4g=;
 b=u8/nnK0INOKIgTdhnKIcml4fTrFofImw9sPpV4bm6L7+JrkHs9t5StikJA9byu3Eyr
 o9AC2jzbUR4NeN/XQGEhskj6dHAwuFRe3+THPxLtSyAuAOhvAyVVHErCqSHbBeG1JyYM
 oX5U3AKH4HvB/J2u7BiJCZa3fLT1LmuKOmnrZdaJfteyBRTdNTkX+UiKoDg5oj80YFzJ
 CYIMQ86DWHMjtsiuXCP58c3JbdC3e13jclh1pVwE0oEJf3qgYwoAs+vN2MyK+iagVaBp
 LHqJ4MD5Furp30dVzxfCVHzQoBC1mecS6QT8ioNFQRlGq1b6L7sHfMaX6Uy5mkO9P3Lw
 42/Q==
X-Gm-Message-State: AOAM530VywrIIPML5Q9GKHnNQgOnBkyj5IIKQcr6Sq4VLpl7a8IpBO6D
 wHZYOI1CkA/iKv2KBiegsbm5PwSIFHzDavBBhHGItRjdvzwS2XtHKsE2b7gw5antKzeGRg4evcl
 Wb5MQw6MzQ9tlvf0=
X-Received: by 2002:a05:600c:4f47:: with SMTP id
 m7mr1171267wmq.132.1643961030370; 
 Thu, 03 Feb 2022 23:50:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPvBFYutV/gy2fA9NY2BZ6WNUwXH4Q+61RLXA0CkGNVJy7E9IEp6xFuwd1Slo8FoLCzr6btQ==
X-Received: by 2002:a05:600c:4f47:: with SMTP id
 m7mr1171183wmq.132.1643961030017; 
 Thu, 03 Feb 2022 23:50:30 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id p2sm841000wmc.33.2022.02.03.23.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 23:50:29 -0800 (PST)
Message-ID: <a08ea7e0-6203-39d9-29b3-3c6684b4ddae@redhat.com>
Date: Fri, 4 Feb 2022 08:50:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/10] hw/s390x/virtio: Add missing 'cpu.h' include
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-4-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220203193803.45671-4-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/2022 20.37, Philippe Mathieu-Daudé wrote:
> CPUS390XState is declared in "cpu.h".

And how is this related to your qemu/log.h refactoring / why is this patch 
needed now?

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/s390x/s390-virtio-hcall.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/s390x/s390-virtio-hcall.h b/hw/s390x/s390-virtio-hcall.h
> index 9800c4b351..9773ed8a21 100644
> --- a/hw/s390x/s390-virtio-hcall.h
> +++ b/hw/s390x/s390-virtio-hcall.h
> @@ -13,6 +13,7 @@
>   #define HW_S390_VIRTIO_HCALL_H
>   
>   #include "standard-headers/asm-s390/virtio-ccw.h"
> +#include "cpu.h"
>   
>   /* The only thing that we need from the old kvm_virtio.h file */
>   #define KVM_S390_VIRTIO_NOTIFY 0

Anyway:
Acked-by: Thomas Huth <thuth@redhat.com>


