Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202176CEEA9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 18:06:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phYIL-0004jZ-KC; Wed, 29 Mar 2023 12:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phYI7-0004cr-BE
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:04:51 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phYI5-0005p8-G3
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:04:51 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso11830097wmb.0
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 09:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680105887;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=I4AZldpobB2IY/O1auHtFGTG09WImH3TA7GZo2RLiyE=;
 b=WMt8DHT6TBugCnIwf/vdlTYgC+QwJ4+6INEZ8kbQi59wx/Dcl0wre/+WAfpw3g7FS9
 qMXAIYeJMtVAti6Cpqpl/YBd7v/X9/4PnsM1oIg80Lmhf26HYgPLQTYYeIu6vB+X5o/R
 SsuCOnaeqHeks7izab10mxB9yVc226wwTfIG5pGIOVoKuZICaG6n+TRrrNO6cND4w0ht
 1YTBCU2Fe5CznKJQqDoirgPitgmDewHOVmn1w4HAx0126VG7+4P1HCXW1FNPdeTspLly
 QLkbOZPNkPfvWI4VRNb4bI51GodB6O+9AGiQu07ijyXyEoRpfDiQ1lfcWzTrPpMSQwta
 hzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680105887;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I4AZldpobB2IY/O1auHtFGTG09WImH3TA7GZo2RLiyE=;
 b=zYLCFuKQb7MB7g1WDts9M6u2limTYZVKIJtj1YxYNfs1ZVl1tGbM7g2tGzX0lTzkbc
 6nRo/PAmczx00KnBYFgd1fqDtz7QAZsexXuXqzAVS+rLPWidcezaAD5otirzXsX/p5X3
 C6uem3INMVnsmDLc6YqYbctW8OMzTkgCIkJ3QkOjV1kdPXi02RGMarF/E1wBjOOdPDbm
 j8uU3Cd9A1x8FqEG3tVOjcQElZ99GjjiXslZo6znB7WYvdvYDtGEEH7v/pM7ohu+Unpt
 Ju/evNiqdzY7FIEWZiY1uIvkYmrzt0oaQphS4ice6pHp8s/XcP3HjHTyzS7O7m+2lqlY
 TN4w==
X-Gm-Message-State: AO0yUKW7tccjIEg5gHNNPesr2JYPQ5ggO3wTDgMG6oXqwwEpZV0Bh2/M
 sZH7n00OcJ0KlnFEQcX42nKyfw==
X-Google-Smtp-Source: AK7set/6URRZWWx80/2DS7tt7LWBMtqE6WVK5yy/IUETDbeHKmCLuwZALlpeMwH8hAUoOpKaz0wadQ==
X-Received: by 2002:a05:600c:2049:b0:3ea:edd7:1f24 with SMTP id
 p9-20020a05600c204900b003eaedd71f24mr14791748wmg.39.1680105886939; 
 Wed, 29 Mar 2023 09:04:46 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003ef5bb63f13sm2874536wms.10.2023.03.29.09.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 09:04:46 -0700 (PDT)
Message-ID: <54359831-9364-7a57-44e3-67b4a2e9d023@linaro.org>
Date: Wed, 29 Mar 2023 18:04:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PULL 22/30] gdbstub: only compile gdbstub twice for whole build
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
 <20230307212139.883112-23-alex.bennee@linaro.org>
 <f0cda165-69c2-9f3b-44cf-df55a9a71967@linaro.org>
Content-Language: en-US
In-Reply-To: <f0cda165-69c2-9f3b-44cf-df55a9a71967@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23/3/23 11:05, Philippe Mathieu-Daudé wrote:
> Hi Alex, Paolo,
> 
> On 7/3/23 22:21, Alex Bennée wrote:
>> Now we have removed any target specific bits from the core gdbstub
>> code we only need to build it twice. We have to jump a few meson hoops
>> to manually define the CONFIG_USER_ONLY symbol but it seems to work.
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20230302190846.2593720-23-alex.bennee@linaro.org>
>> Message-Id: <20230303025805.625589-23-richard.henderson@linaro.org>
>>
>> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
>> index e264ed04e7..d9e9bf9294 100644
>> --- a/gdbstub/gdbstub.c
>> +++ b/gdbstub/gdbstub.c
>> @@ -39,9 +39,7 @@
>>   #include "sysemu/hw_accel.h"
>>   #include "sysemu/runstate.h"
>> -#include "exec/exec-all.h"
>>   #include "exec/replay-core.h"
>> -#include "exec/tb-flush.h"
>>   #include "exec/hwaddr.h"
>>   #include "internals.h"
>> @@ -1612,7 +1610,7 @@ static const GdbCmdParseEntry 
>> gdb_gen_query_table[] = {
>>           .cmd_startswith = 1,
>>           .schema = "s:l,l0"
>>       },
>> -#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)
>> +#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
>>       {
>>           .handler = gdb_handle_query_xfer_auxv,
>>           .cmd = "Xfer:auxv:read::",
>> diff --git a/gdbstub/meson.build b/gdbstub/meson.build
>> index c876222b9c..d679c7ab86 100644
>> --- a/gdbstub/meson.build
>> +++ b/gdbstub/meson.build
>> @@ -4,13 +4,35 @@
>>   # types such as hwaddr.
>>   #
>> -specific_ss.add(files('gdbstub.c'))
>> +# We need to build the core gdb code via a library to be able to tweak
>> +# cflags so:
>> +
>> +gdb_user_ss = ss.source_set()
>> +gdb_softmmu_ss = ss.source_set()
>> +
>> +# We build two versions of gdbstub, one for each mode
>> +gdb_user_ss.add(files('gdbstub.c', 'user.c'))
>> +gdb_softmmu_ss.add(files('gdbstub.c', 'softmmu.c'))
>> +
>> +gdb_user_ss = gdb_user_ss.apply(config_host, strict: false)
>> +gdb_softmmu_ss = gdb_softmmu_ss.apply(config_host, strict: false)
>> +
>> +libgdb_user = static_library('gdb_user',
>> +                             gdb_user_ss.sources() + genh,
>> +                             name_suffix: 'fa',
>> +                             c_args: '-DCONFIG_USER_ONLY')
> 
> FYI building configured as '--disable-user --disable-tcg' I still see:
> 
> [13/810] Compiling C object gdbstub/libgdb_user.fa.p/gdbstub.c.o
> 
>> +libgdb_softmmu = static_library('gdb_softmmu',
>> +                                gdb_softmmu_ss.sources() + genh,
>> +                                name_suffix: 'fa')
>> +
>> +gdb_user = declare_dependency(link_whole: libgdb_user)
>> +user_ss.add(gdb_user)
> 
> Later we have:
> 
> common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
> 
> Also:
> 
> config_all += {
>    'CONFIG_SOFTMMU': have_system,
>    'CONFIG_USER_ONLY': have_user,
>    'CONFIG_ALL': true,
> }
> 
> Why is libgdb_user.fa built while using --disable-user
> (have_user=false)?

Not sure if this is the best way to do this, but this fixed it:

-- >8 --
diff --git a/gdbstub/meson.build b/gdbstub/meson.build
--- a/gdbstub/meson.build
+++ b/gdbstub/meson.build
@@ -20,11 +20,13 @@ gdb_softmmu_ss = gdb_softmmu_ss.apply(config_host, 
strict: false)
  libgdb_user = static_library('gdb_user',
                               gdb_user_ss.sources() + genh,
                               name_suffix: 'fa',
-                             c_args: '-DCONFIG_USER_ONLY')
+                             c_args: '-DCONFIG_USER_ONLY',
+                             build_by_default: have_user)

  libgdb_softmmu = static_library('gdb_softmmu',
                                  gdb_softmmu_ss.sources() + genh,
-                                name_suffix: 'fa')
+                                name_suffix: 'fa',
+                                build_by_default: have_system)

  gdb_user = declare_dependency(link_whole: libgdb_user)
  user_ss.add(gdb_user)
---

>> +gdb_softmmu = declare_dependency(link_whole: libgdb_softmmu)
>> +softmmu_ss.add(gdb_softmmu)
>>   # These have to built to the target ABI
>>   specific_ss.add(files('syscalls.c'))
>> -softmmu_ss.add(files('softmmu.c'))
>> -user_ss.add(files('user.c'))
>> -
>>   # The user-target is specialised by the guest
>>   specific_ss.add(when: 'CONFIG_USER_ONLY', if_true: 
>> files('user-target.c'))
> 


