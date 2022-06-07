Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B26C540AEF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 20:25:14 +0200 (CEST)
Received: from localhost ([::1]:50584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nydtA-0006fT-1C
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 14:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nydrb-0005o9-DR
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 14:23:36 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nydrZ-0002jY-Ql
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 14:23:35 -0400
Received: by mail-pg1-x529.google.com with SMTP id e66so16617347pgc.8
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 11:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jk2hZ1biDoUhkZVaKhOoWW4zZPsG8+AFECFHffIwETM=;
 b=sju7MechveCk8CZby5yV6oN+iPoT+nODUCDDDOy79g/SaN8nOp34PFQoUucNufgPhK
 vxewptAj2O/q0irEp0DDr1AxnzDHG2ImXx9KDXGHrpc90O3RlPEa+N/DnJw6etJbA51f
 h+X0ln5yxlCCxzANmstPmUv3O6g0vsIWCaNItqNZyXNR9D7Y+UAE2fEG3qTnpJfSbTt9
 0BQJZMK+SYDvdfGIigqofYv4j+KbH4V8ugEVMYRq5waTegqtiW4hvNmxDhn6CI9lz6JC
 aE2IENmKSnR8jK/6qFftf89vwJIfZ77LqLYxpDvZx8Ted7wgc/I+n1yiZba0q/7fAWqO
 2rkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jk2hZ1biDoUhkZVaKhOoWW4zZPsG8+AFECFHffIwETM=;
 b=FHrCNlZhoHKvWfCtmPUdhAVsS9axp+npH/am+LVIj/JlvtfRLHsXgsiCgZEZBaeDPV
 kWnvI+s+rS9YkeXtLQZmMfYjGwcizayt1yJiAPzArqh7OgGogNBH+nt9RBaYGJU5Ou4t
 MWRAKZXIGph8JzE8gW+0hmO+s0pNuR+qOzAe6cTweHD3BwhWVV0FCQRlE+IYw44i3cFs
 Ccwh27ZO12azpOPVTwT3fYKMvKaI2xGTtFSe5BfzA8OvoNvNrXBAp2a2OWN1T4KYOyt3
 d9PBytmBiv1LtiLd0qxElVT3eNzKN3G5Ga41P0a2u+PDPOphuusKEDKLgDlgw/mruayg
 NFvg==
X-Gm-Message-State: AOAM533JXjiLSDBD/FwRtEmnYdwGQfpV7zDDWrtmwFLBghuCJX26FYCj
 vY3KHIB4S/2b9l064/PabC5vUA==
X-Google-Smtp-Source: ABdhPJy7cpI1gBnfBd7GCtd8HsN4udDYHjKto+kkxGuO4/qyzoIjbW0WWwfBtJPSliRmI8Wv9+ZrqQ==
X-Received: by 2002:a63:2360:0:b0:3fb:ee61:82cf with SMTP id
 u32-20020a632360000000b003fbee6182cfmr26343827pgm.574.1654626212050; 
 Tue, 07 Jun 2022 11:23:32 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a654b86000000b003fba6db1b50sm13294312pgq.85.2022.06.07.11.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 11:23:31 -0700 (PDT)
Message-ID: <4d3735bd-3f5a-810b-6ef0-a79e5a8f1ab6@linaro.org>
Date: Tue, 7 Jun 2022 11:23:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 23/49] semihosting: Split out semihost_sys_open
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-24-richard.henderson@linaro.org>
 <CAFEAcA8ENQo8258jw=CeBG6Qamk49_zQ9RQjuwd4ZfymD=cV-w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8ENQo8258jw=CeBG6Qamk49_zQ9RQjuwd4ZfymD=cV-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/23/22 06:30, Peter Maydell wrote:
>> diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
>> index b6405f5663..7ac2e147a8 100644
>> --- a/semihosting/guestfd.c
>> +++ b/semihosting/guestfd.c
>> @@ -11,6 +11,11 @@
>>   #include "qemu/osdep.h"
>>   #include "exec/gdbstub.h"
>>   #include "semihosting/guestfd.h"
>> +#ifdef CONFIG_USER_ONLY
>> +#include "qemu.h"
>> +#else
>> +#include "semihosting/softmmu-uaccess.h"
>> +#endif
> 
> Does this need to be in this patch, or should it be somewhere else?

The first use of target_strlen is added in this patch, so yes, belongs here.


r~

