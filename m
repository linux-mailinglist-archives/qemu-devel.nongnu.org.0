Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95F6324DC0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:15:44 +0100 (CET)
Received: from localhost ([::1]:38382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDgN-0002oD-KT
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:15:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFDeF-0001Z3-9H
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:13:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFDeD-00084h-P1
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:13:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614248009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pnja8ID6PKuAE50BXObi7Ta5EDTNwSW9bs+cJgYZ7kI=;
 b=Ev3rGVlXY4p76bAavMdeA1AAc/fa+KU7b/nBORaG1ByFP8ghUnF6LQQi7PkVdsku7HEVyS
 SaLFjxzQ3R0bFo7ATx9Hk852sdVEVsqyk4P1i3XzIXp5bTqOYUqR96lxkDQ/b5q02x0GKL
 ZKIqIENNkooXZAHuo1Q/fv5jxxaNCHk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-0cCnQfTdMIqqi0P9mrfyww-1; Thu, 25 Feb 2021 05:13:24 -0500
X-MC-Unique: 0cCnQfTdMIqqi0P9mrfyww-1
Received: by mail-wr1-f72.google.com with SMTP id v13so1468398wrs.21
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 02:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pnja8ID6PKuAE50BXObi7Ta5EDTNwSW9bs+cJgYZ7kI=;
 b=UWYQ7X24UQQMXmWIx/3n8e5qVPTlyBJZfYPGV30oiM8Efrjw+UqkGT4XWI2IG+X+i0
 1+seacVPQiq1SonoMzUna8d7QhvrjOjywFF0pooPIwr+x5oYdgDKk8tGFilbbe+E2D+4
 fV0uKdQfuD0YlFRX8HqBo/T+rtToH36xutKSYzNX4vn3tqe3Zo/d6z7hwzFMSY9rcdhn
 FWmEkISdAbdyz/AZGIJrfonZBhBWbEtLKR9Wrnb5ONoELwfbSKWuB5WFRqebLmT2q3oG
 OlNhnDlpq/d5LzoBjqXsD9tuWLgEn16/XHBA/sQm8vxuwLTmySRKYHA39kKiU8MGzPqx
 xouA==
X-Gm-Message-State: AOAM533IH/sgagZweuKeSIDqFF0zdJ0Z6ndQ2rw4FAObMy8toUHcoWQ5
 pduGEoS9em98PCBUedG2Ndn0P1rP0z6hQJJ3ktH3YlHo9dziaIhdQ2uExPA6Em+b92HO2ezHtcM
 w1cgQRgmFEiLA0mEoitLmo0A+WeGRRh8VZezseQdpSjfyujubPvRJCHmxXFhZui10
X-Received: by 2002:adf:e60a:: with SMTP id p10mr2675968wrm.291.1614248002313; 
 Thu, 25 Feb 2021 02:13:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9iaytD/wl2DuY/Ty0OkX8Vu/XEoGKO6k0qiF7Rs1iU62eyLO/GHX0cOgSqQe5MRnw9KkS3A==
X-Received: by 2002:adf:e60a:: with SMTP id p10mr2675955wrm.291.1614248002185; 
 Thu, 25 Feb 2021 02:13:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p190sm2004050wmp.4.2021.02.25.02.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 02:13:21 -0800 (PST)
Subject: Re: [PATCH] tcg/i386: rdpmc: use the the condtions
To: Paolo Bonzini <pbonzini@redhat.com>, Zheng Zhan Liang <linuxmaker@163.com>
References: <20210225054756.35962-1-linuxmaker@163.com>
 <433c4c21-be83-1cb9-91bb-0f855fd161ed@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8650b361-ecf1-2d24-c827-0e539bac62ec@redhat.com>
Date: Thu, 25 Feb 2021 11:13:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <433c4c21-be83-1cb9-91bb-0f855fd161ed@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On 2/25/21 11:07 AM, Paolo Bonzini wrote:
> On 25/02/21 06:47, Zheng Zhan Liang wrote:
>> Signed-off-by: Zheng Zhan Liang <linuxmaker@163.com>
>> ---
>>   target/i386/tcg/misc_helper.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/i386/tcg/misc_helper.c
>> b/target/i386/tcg/misc_helper.c
>> index f02e4fd400..90b87fdef0 100644
>> --- a/target/i386/tcg/misc_helper.c
>> +++ b/target/i386/tcg/misc_helper.c
>> @@ -222,7 +222,8 @@ void helper_rdtscp(CPUX86State *env)
>>     void helper_rdpmc(CPUX86State *env)
>>   {
>> -    if ((env->cr[4] & CR4_PCE_MASK) && ((env->hflags & HF_CPL_MASK)
>> != 0)) {
>> +    if (((env->cr[4] & CR4_PCE_MASK) == 0 ) &&
>> +        ((env->hflags & HF_CPL_MASK) != 0)) {
>>           raise_exception_ra(env, EXCP0D_GPF, GETPC());
>>       }
>>       cpu_svm_check_intercept_param(env, SVM_EXIT_RDPMC, 0, GETPC());
>>
> 
> Queued, thanks.

Do you mind fixing the patch subject?


