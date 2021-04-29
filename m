Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8785C36E5BE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:16:42 +0200 (CEST)
Received: from localhost ([::1]:57584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc0uf-0005cm-GS
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0rn-0003vG-Df
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:13:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0rj-000406-KR
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619680418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5nmoTMU0A0PhjSt2hrqOEe1huHJVWX/hOI1awmFppVI=;
 b=XsoQIzVIXndH6ABP5mJZ82bvPAN7ExxAhkXIZaJ6atJXIcVGyMXCpuH/QMth/ZGCDXVx9Z
 LUjSZbR6c8Ht2iluvqZTjA7/Aesl52tM1olcGGdEEVwJ+ZgruRT/JMhfJ5CAhER6nvG8NR
 lj9TwclzOSnZBwj2yeFHM0eD7cMFGfA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-v2tdizzCOwyx2oYD4IPyuw-1; Thu, 29 Apr 2021 03:13:34 -0400
X-MC-Unique: v2tdizzCOwyx2oYD4IPyuw-1
Received: by mail-wr1-f70.google.com with SMTP id
 32-20020adf92a30000b029010d6849a4e1so3486170wrn.4
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5nmoTMU0A0PhjSt2hrqOEe1huHJVWX/hOI1awmFppVI=;
 b=AMzPWK2BStmu2hTUXStRFvS04piHw1EUOXEKuZTv0IcUJu6pD7SEFZko/YzkkSQua1
 7IioTqgWlKgFeeeHfDzTX6tXIGcMEwmjI1ZOJSsH97rSXbnqgjmf9hHBLWRlum+3HBcg
 gkgDTongfEXXhsyXkB5x6YoGD7yqUCbs9GxAGZjgSOvnJx6hz0okwno2q9I3m0sa7qIa
 uNXeDNtwsvxJ4Yzha4bo0Gk+E3+tmjTDoicEtqPIJU6vc0rzgWhHDY6qMGU4uV/M7Sae
 Zs4dkx4VcxnNGPRTZGyAbkJ3LDNCN6cwEDnW7+ALG8meZCFFID3ZpJfOAqn4bZIpS+tw
 sW0Q==
X-Gm-Message-State: AOAM533z855F6qAOT1qqguaD0uwqLkABkjgcK3WBCQ3KCiCV/vLZIXJi
 8s0ktsCNWtJV1H6TIOHU75S1O3BgyWZehrq7hM1c3lOOvGyd9N7F5oGMJY2J/pXydVBqKmLBh5t
 uBDULKs/qsT0zvEk=
X-Received: by 2002:a5d:660c:: with SMTP id n12mr33967039wru.87.1619680413107; 
 Thu, 29 Apr 2021 00:13:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+0aPHvkPVBX79DhvAuwIFQK0bItwV8iH43ew3sUxPbE31dIwXdwjo/MfTja7z+zVP7jkuvw==
X-Received: by 2002:a5d:660c:: with SMTP id n12mr33967020wru.87.1619680412912; 
 Thu, 29 Apr 2021 00:13:32 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 d6sm3183202wrr.77.2021.04.29.00.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:13:32 -0700 (PDT)
Subject: Re: [PATCH v2 06/15] linux-user/s390x: Fix sigcontext sregs value
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
 <20210428193408.233706-7-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <88c576ca-c1a1-a50c-9101-9eb3613872ad@redhat.com>
Date: Thu, 29 Apr 2021 09:13:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-7-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.04.21 21:33, Richard Henderson wrote:
> Using the host address of &frame->sregs is incorrect.
> We need the guest address.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index dcc6f7bc02..f8515dd332 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -142,7 +142,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
>   
>       save_sigregs(env, &frame->sregs);
>   
> -    __put_user((abi_ulong)(unsigned long)&frame->sregs, &frame->sc.sregs);
> +    __put_user(frame_addr + offsetof(sigframe, sregs), &frame->sc.sregs);
>   
>       /* Set up to return from userspace.  If provided, use a stub
>          already in userspace.  */
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


