Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD20854A848
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:45:10 +0200 (CEST)
Received: from localhost ([::1]:40500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0yQP-0004nr-Lc
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0yNF-0003Bw-3J
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:41:54 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0yNC-0004sY-ER
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:41:52 -0400
Received: by mail-pj1-x1032.google.com with SMTP id z14so2709620pjb.4
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qY78vMTvE8/IGNzx75WrIDK+OR0YGwaIAf8jETKmBZs=;
 b=bIJ2ntrfVJIO6HhQmndg3C3NiU4gyU7M+3mfdqDQcL1fkRy8aVhAgxkP6Nr92DDoYp
 ty5jCUuahTEFnGYVwEXIF9AA9h2Z4OyD8sHzNGp3FZhOVESctZHSIkedOIQW+DldR0Ih
 WAg6ZNxLzahvxni3GdMUrHJEEHoYK6H6ZlQdWARtCproF3//RvKKc+IFy76/cTZh1YnK
 op7YdDd5Putef3ZjCgcB4PfJfnn4yOqYa8TK3KhiwyJiKHqbUXAbCpLNp7lNgSzMm4v1
 yb3ieoe4jqjS3oLQFW6OfNnCMSxH15IjKLg45+pbhEz8tMddraa3UpuqMoMt1Vql+751
 5NFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qY78vMTvE8/IGNzx75WrIDK+OR0YGwaIAf8jETKmBZs=;
 b=oapAHFNdO1qh3IVt8ZDIwyazYWtZJsDOvtMuldtk2I8PRZGkdguBuX6xdRAM5BAMmt
 3TkAXD7sLJmSoxNOVLoZHxkCfTPCaJyA8cy4jogOqX/kVir0K6znldGSOAe0bqLFaPgf
 Oe8+Z3WBcgrOTW0j/8eqh+PLRDkAb7yaEFX803ofxEnZ+posxEwj2ZDWuKnq7zRsDtrq
 UKBv+aJ/3tK7M9kWv0I1u2HFBHJ9SmGFBtfSYCCIwvSmGibeYZhp4Go9kmywuAp/e3GC
 SqbqvWeTkdj9v7O7BqHOxQCH/e/JX6gq0XdmPsf4yGcAyB0AmWaDFAv2ZGeCQMycSK2k
 vTgQ==
X-Gm-Message-State: AJIora/85hQHnUjwjA2CzhdUpsDs4GN//7Gx0+OZkNtrmaDB0lFTvOFb
 eiUuewswpCyrYMWTfj0uhskC5w==
X-Google-Smtp-Source: AGRyM1vTWS0YMxFJHZwlZwPL0G0SYXZDjNSjkoMYOqQNooeTdtR7cT8w0efgjbrLO1F6vy9ff4sW7g==
X-Received: by 2002:a17:902:db0f:b0:166:42b5:c819 with SMTP id
 m15-20020a170902db0f00b0016642b5c819mr2533225plx.96.1655181707487; 
 Mon, 13 Jun 2022 21:41:47 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 c14-20020aa781ce000000b0050dc7628178sm6297952pfn.82.2022.06.13.21.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 21:41:47 -0700 (PDT)
Message-ID: <5802e5dc-42e0-6866-c5b4-41366ae9c12b@linaro.org>
Date: Mon, 13 Jun 2022 21:41:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 2/2] target/xtensa: Use semihosting/syscalls.h
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <20220608053650.811947-1-richard.henderson@linaro.org>
 <20220608053650.811947-3-richard.henderson@linaro.org>
 <CAMo8BfKVGD-6TUvea=QRP3MD=hdTw+yJ8zWsb44CGANTQakaVg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAMo8BfKVGD-6TUvea=QRP3MD=hdTw+yJ8zWsb44CGANTQakaVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 6/13/22 18:06, Max Filippov wrote:
>> +++ b/hw/xtensa/sim.c
>> @@ -87,9 +87,6 @@ XtensaCPU *xtensa_sim_common_init(MachineState *machine)
>>           xtensa_create_memory_regions(&sysram, "xtensa.sysram",
>>                                        get_system_memory());
>>       }
>> -    if (serial_hd(0)) {
>> -        xtensa_sim_open_console(serial_hd(0));
>> -    }
> 
> Do I understand correctly that the sim machine will no longer
> support the -serial option with this change?

No, -serial is still fine.  However, -serial is no longer the semihosting "console" -- 
that will get its own output stream.

>> +#include "semihosting/syscalls.h"
> 
> This does not build on top of the current master, is there a branch where
> it's buildable?

Yes, see the cover letter and the Based-on tag, or
https://patchew.org/QEMU/20220608053650.811947-1-richard.henderson@linaro.org/

and the git fetch link there.


git fetch https://github.com/patchew-project/qemu 
tags/patchew/20220608053650.811947-1-richard.henderson@linaro.org

>> -#ifdef ENOTBLK
>> -    case ENOTBLK:   return TARGET_ENOTBLK;
>> -#endif
> 
> AFAIR there were reports that qemu doesn't build on some
> systems because they were missing ENOTBLK and other
> error codes that were made conditional here.

Ok, I'll have a dig back.

>> +    E(LOOP);
> 
> I'm not sure mangling error code names is a good idea.

Mangling?


r~


