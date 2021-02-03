Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D6630D481
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 09:01:01 +0100 (CET)
Received: from localhost ([::1]:45746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7D5x-0006Rv-0L
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 03:01:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7D4g-0005ax-54
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:59:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7D4e-00074B-HW
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:59:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612339179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TWGlx5s8K5v5/sVQY015uC94oGDEy91P+2/H8nXSXeE=;
 b=YmG/zRSd4sCXqkLDQ3a2hCrj/Ppkuk50cyDq0Ua4NCe9VIV+Irw7PoysCleq0Vek2fRAFp
 WxdBu9HbqEJZ7dVG3HNQQt5YMG8V818zAJTcAFJzNFXofcFH9GFFWmQTWnwtuIwr7LuC39
 0emHYv2+DDjRwYUrXEjytMLrnUCvjQI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-t1HM2Fx7PTafYAH7zbcxOw-1; Wed, 03 Feb 2021 02:59:37 -0500
X-MC-Unique: t1HM2Fx7PTafYAH7zbcxOw-1
Received: by mail-ej1-f69.google.com with SMTP id m4so11502575ejc.14
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 23:59:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TWGlx5s8K5v5/sVQY015uC94oGDEy91P+2/H8nXSXeE=;
 b=QDO98Df0SDssY5CkL3pyKuMOEPZnTAztSi7E5XabRtIELTKuFmp12eXseoxd+B/kKa
 qwd8GVuAGh3hZpYqQ/9A2E9fVQ89+ZQBHGY/4piEhEDlCn1Z07ARFx1Mesokruw3+Hk1
 mI6vpqxgwj6FZHJW+pDbUlsqDoxbY013sNIa+KSW+xr0N/QUH3Xpg6Ph+M/5+Z62GcNW
 VC4ZfZMVBvp0gEennw7vu7bWZNazQLbkDCj22OKDgUM+mv6LLjS1QdQTGSm+yZhlY758
 JSlqNbqt5akQ5wsQlGGoa1mj4QlE6MqdJpQtpNt4Ryrd24I83MgzzH3HG/UBLm8M67gM
 HTQw==
X-Gm-Message-State: AOAM530IIpISUpUKzcIo4D0ftCvzsW0HuK9MPVFGDYKCYlZKeODm41r4
 pc7OvyLRr8Enyqzy+omlviXF7Ur/Iv2oBNGoD8na4yoL8uFrrOv1L1iiWTkVveoWosE0dmNXzZc
 VdVNu5YKW9RVHxNsks0VyCQAVeVC9AX2GXzm17xGlN62genVGggC+tJzEAoZHcbmLPRg=
X-Received: by 2002:a17:906:a115:: with SMTP id
 t21mr1946629ejy.549.1612339176297; 
 Tue, 02 Feb 2021 23:59:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWtwZQx/DF8sM/fIUoJcWKw2Y9no9ap8xdDPzKf7Qk7n6IoUaoLNjlyZrk0Z9DgtjwH7v1Ng==
X-Received: by 2002:a17:906:a115:: with SMTP id
 t21mr1946615ejy.549.1612339176072; 
 Tue, 02 Feb 2021 23:59:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y10sm603878ejj.122.2021.02.02.23.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 23:59:35 -0800 (PST)
Subject: Re: [PATCH] cpu-throttle: Remove timer_mod() from cpu_throttle_set()
To: Utkarsh Tripathi <utkarsh.tripathi@nutanix.com>, qemu-devel@nongnu.org
References: <1609420384-119407-1-git-send-email-utkarsh.tripathi@nutanix.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a568eb86-3428-ca1e-c2be-e2aa16b6aebd@redhat.com>
Date: Wed, 3 Feb 2021 08:59:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1609420384-119407-1-git-send-email-utkarsh.tripathi@nutanix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/12/20 14:13, Utkarsh Tripathi wrote:
> During migrations, after each iteration, cpu_throttle_set() is called,
> which irrespective of input, re-arms the timer according to value of
> new_throttle_pct. This causes cpu_throttle_thread() to be delayed in
> getting scheduled and consqeuntly lets guest run for more time than what
> the throttle value should allow. This leads to spikes in guest throughput
> at high cpu-throttle percentage whenever cpu_throttle_set() is called.
> 
> A solution would be not to modify the timer immediately in
> cpu_throttle_set(), instead, only modify throttle_percentage so that the
> throttle would automatically adjust to the required percentage when
> cpu_throttle_timer_tick() is invoked.
> 
> Manually tested the patch using following configuration:
> 
> Guest:
> Centos7 (3.10.0-123.el7.x86_64)
> Total Memory - 64GB , CPUs - 16
> Tool used - stress (1.0.4)
> Workload - stress --vm 32 --vm-bytes 1G --vm-keep
> 
> Migration Parameters:
> Network Bandwidth - 500MBPS
> cpu-throttle-initial - 99
> 
> Results:
> With timer_mod(): fails to converge, continues indefinitely
> Without timer_mod(): converges in 249 sec
> 
> Signed-off-by: Utkarsh Tripathi <utkarsh.tripathi@nutanix.com>
> ---
>   softmmu/cpu-throttle.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/softmmu/cpu-throttle.c b/softmmu/cpu-throttle.c
> index 2ec4b8e..8c2144a 100644
> --- a/softmmu/cpu-throttle.c
> +++ b/softmmu/cpu-throttle.c
> @@ -90,14 +90,21 @@ static void cpu_throttle_timer_tick(void *opaque)
>   
>   void cpu_throttle_set(int new_throttle_pct)
>   {
> +    /*
> +     * boolean to store whether throttle is already active or not,
> +     * before modifying throttle_percentage
> +     */
> +    bool throttle_active = cpu_throttle_active();
> +
>       /* Ensure throttle percentage is within valid range */
>       new_throttle_pct = MIN(new_throttle_pct, CPU_THROTTLE_PCT_MAX);
>       new_throttle_pct = MAX(new_throttle_pct, CPU_THROTTLE_PCT_MIN);
>   
>       qatomic_set(&throttle_percentage, new_throttle_pct);
>   
> -    timer_mod(throttle_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL_RT) +
> -                                       CPU_THROTTLE_TIMESLICE_NS);
> +    if (!throttle_active) {
> +        cpu_throttle_timer_tick(NULL);
> +    }
>   }
>   
>   void cpu_throttle_stop(void)
> 

Queued, thanks.

Paolo


