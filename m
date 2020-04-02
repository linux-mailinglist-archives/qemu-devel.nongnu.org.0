Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D184619BDE7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 10:48:46 +0200 (CEST)
Received: from localhost ([::1]:35398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJvWn-000284-Uy
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 04:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44660)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jJvVM-00011e-6M
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 04:47:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jJvVL-0005VU-6d
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 04:47:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50423
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jJvVL-0005Un-3T
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 04:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585817234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lj30UAt8X7wWPT0eCo7ZWeFtSAuq0vDSwO2ZWdmBTpk=;
 b=ZO47m7YmGjJF+EyfutvutV8RqGYeACncopNMkP9OLC1yvNPsZX86wqce64+gM6BOAOojFl
 LkA96mnlFMu7YpkgRKRIup1wc8Y46f3NQ2IEBIMQjb1+YX3tqrlYgiVE7da9tfoRLYESiy
 eVRwZr2gHJjqFcDXndWZJLpp7YVvsgc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-4VHVMsCHOzGCAzzcxfI6Lw-1; Thu, 02 Apr 2020 04:47:11 -0400
X-MC-Unique: 4VHVMsCHOzGCAzzcxfI6Lw-1
Received: by mail-wm1-f72.google.com with SMTP id l13so1093159wme.7
 for <qemu-devel@nongnu.org>; Thu, 02 Apr 2020 01:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lj30UAt8X7wWPT0eCo7ZWeFtSAuq0vDSwO2ZWdmBTpk=;
 b=g953D+xfisNggQTkobEoxRy0y29e2RbvTvLAMIPbRwzCt7JiQxk5lAiXxkXSJ7PUnK
 gPoIqBT536PZoU5cy66xDGBpKm7Q9a1ltM0QJIm/je1XKVl5lODzlOz12D/L9mG35xLM
 w7uI+niDaL7wLAEeBWtTQkSdDhIwz2sypdlL1JZkFApEMnAT3Pa/AOpTtkRQts94TbMk
 Ib0DYfG83ZCqp1vEYzUrkbmp5dUgOIWfvfG4wa9H0RsLj4Uj95wNr0Xb4O8dXRAfh5wB
 zqqdhYuwX7HihTy93h3zZrRXWguvV+59iUIT8G3GkvafpEW41NvUU3N5gsMIeUxa+VmC
 39Cw==
X-Gm-Message-State: AGi0Puboq914nciwK4laX/vJWC1yuNjI1U94bFTZTC981kfcGwcX83+I
 Gc5p+zymmLSBxjE1UHkrQSd6c3G8jJG7I6BGycUT87ePCMpyuhR5q2+W3CM1WistO1J4jJlhvyf
 QzSouL2RlHYpxuqs=
X-Received: by 2002:adf:800e:: with SMTP id 14mr2251244wrk.369.1585817230134; 
 Thu, 02 Apr 2020 01:47:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypIRwDyciQab9fYIL7Z0uFsyjw8Z9Iz8SeUpLF6hygeqDlRZRP1vLIe4/1VTBMsO09Q68n8MBA==
X-Received: by 2002:adf:800e:: with SMTP id 14mr2251222wrk.369.1585817229828; 
 Thu, 02 Apr 2020 01:47:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:1868:42dd:216c:2c09?
 ([2001:b07:6468:f312:1868:42dd:216c:2c09])
 by smtp.gmail.com with ESMTPSA id z12sm6722573wrt.27.2020.04.02.01.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2020 01:47:09 -0700 (PDT)
Subject: Re: [PATCH v2] util/async: Add memory barrier to aio_ctx_prepare
To: Ying Fang <fangying1@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200402024431.1629-1-fangying1@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2f8406fa-ae18-856b-938f-a804ff1b11c7@redhat.com>
Date: Thu, 2 Apr 2020 10:47:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200402024431.1629-1-fangying1@huawei.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: fam@euphon.net, wu.wubin@huawei.com, qemu-stable@nongnu.org,
 stefanha@redhat.com, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/04/20 04:44, Ying Fang wrote:
> Normal VM runtime is not affected by this hang since there is always some
> timer timeout or subsequent io worker come and notify the main thead.
> To fix this problem, a memory barrier is added to aio_ctx_prepare and
> it is proved to have the hang fixed in our test.

Hi Ying Fang,

this part of the patch is correct, but I am not sure if a memory barrier
is needed in aio_poll too.

In addition, the memory barrier is quite slow on x86 and not needed there.

I am sorry for dropping the ball on this bug; I had a patch using
relaxed atomics (atomic_set/atomic_read) but I never submitted it
because I had placed it in a larger series.  Let me post it now.

Thanks,

Paolo

> 
> diff --git a/util/async.c b/util/async.c
> index b94518b..89a4f3e 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -250,7 +250,8 @@ aio_ctx_prepare(GSource *source, gint    *timeout)
>      AioContext *ctx = (AioContext *) source;
>  
>      atomic_or(&ctx->notify_me, 1);
> -
> +    /* Make sure notify_me is set before aio_compute_timeout */
> +    smp_mb();
>      /* We assume there is no timeout already supplied */
>      *timeout = qemu_timeout_ns_to_ms(aio_compute_timeout(ctx));
>  
> 


