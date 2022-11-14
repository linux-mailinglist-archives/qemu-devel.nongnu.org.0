Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECDE628E4F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:28:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouig3-0006BA-PE; Mon, 14 Nov 2022 18:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouie0-0001eb-2z
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:36 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouhjs-0006NC-Ek
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:15:38 -0500
Received: by mail-wr1-x42e.google.com with SMTP id o4so20850703wrq.6
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 14:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xu8qw4w9t7T/qBA8yUsMaO04+1Z1VFGPow3Zh6Wxt2U=;
 b=wGA5HyI1TEruwIN8+Pv/E8KSz4Yfk8RhKKIvi5Mw1szntQiPrvAOdCdOS2yLRTqI/x
 hW7zIMUGSLvla1zA0eRvBeCtMOPV2UJBProiSMKK4oqO5SwTlh1A/VoVJYcjI6N57uuX
 FSodX9zEsOc1bUT36Xfr64lzLYOw0e1r3qCfehbEubcW1U5nZeEdIVUWIKytSNCz1CCL
 EWFixzM7shm4wfxSG+siLMe1k+GhaRwIx9O8TBBRD3PETY2qckcly2JQrdwsp6X5Iv12
 T9QfmNYD6aKFTdgskyALrmI81wynLIpkoIic++vxo+O9fcJITiwBEG4pHmW4elp0txUc
 sHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xu8qw4w9t7T/qBA8yUsMaO04+1Z1VFGPow3Zh6Wxt2U=;
 b=sqb7HNHeE/4hClpNpDAOZJ8wmdqLphqYWiCQWynzjvUtGIipnN2vZRaJ2G3iRn+TP2
 V7qraobSBP4O3k4T/pZWXNY67Ssfp53kxK/8tHIyoqAsv6DqONOGTPoA630DGwMRrhF1
 PJcNP/nKT7Ps1whvlHk4jsdOlcqkFBo1Oxa/qvblTvhbtL1i6/oo6R1lQWxh3sCIyzIS
 dnCxsOP05iFODI3NlY/xs8+KxGVvEebC7j430reHApTpUPscEsYXjgPlEI9Lvnuwrdv4
 q5hSkK7+xZxfVsH6l67z5RLlZ2OJJLl3Sjt3erTCcS211PBfgPkR9y8V84NbwuZI5KEH
 zjBQ==
X-Gm-Message-State: ANoB5pnT9k5aKDt44snjoj34WiQCfwI4mzE+iB/fari41ZnIwIw+D6qY
 cyWv81MXvrXMjJpa2ONHM0LOxQ==
X-Google-Smtp-Source: AA0mqf5rwSRDJOf0FFYvFznGZYQjTZ4r7I5mVjPHUD73BD//8sxsFfTRy/ZzftmEUtxV1nITf+ZzEw==
X-Received: by 2002:a5d:674a:0:b0:22e:35e3:4427 with SMTP id
 l10-20020a5d674a000000b0022e35e34427mr8761489wrw.44.1668464134111; 
 Mon, 14 Nov 2022 14:15:34 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e8-20020adffc48000000b00236863c02f5sm10378169wrs.96.2022.11.14.14.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 14:15:33 -0800 (PST)
Message-ID: <6dbc1126-cdae-1ae2-f04e-659d37c58ecf@linaro.org>
Date: Mon, 14 Nov 2022 23:15:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2 02/12] tests/avocado: improve behaviour waiting for
 login prompts
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
 <20221111145529.4020801-3-alex.bennee@linaro.org>
 <CAFEAcA_dv=iDyi8ubMsP9dEvP=71x3ns8ykT3gDnqqr8FS0dqw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_dv=iDyi8ubMsP9dEvP=71x3ns8ykT3gDnqqr8FS0dqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 14/11/22 17:28, Peter Maydell wrote:
> On Fri, 11 Nov 2022 at 14:58, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> This attempts to deal with the problem of login prompts not being
>> guaranteed to be terminated with a newline. The solution to this is to
>> peek at the incoming data looking to see if we see an up-coming match
>> before we fall back to the old readline() logic. The reason to mostly
>> rely on readline is because I am occasionally seeing the peek stalling
>> despite data being there.
>>
>> This seems kinda hacky and gross so I'm open to alternative approaches
>> and cleaner python code.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> With this patch, the evb_sdk test fails:
> 
> Fetching asset from
> ./build/arm-clang/tests/avocado/machine_aspeed.py:AST2x00MachineSDK.test_arm_ast2500_evb_sdk
> JOB ID     : 542e050c4f7e1ddd6d5cdd350e4c26e1bdfcdee4
> JOB LOG    : /home/petmay01/avocado/job-results/job-2022-11-14T16.21-542e050/job.log
>   (1/1) ./build/arm-clang/tests/avocado/machine_aspeed.py:AST2x00MachineSDK.test_arm_ast2500_evb_sdk:
> ERROR: log() missing 1 required positional argument: 'msg' (82.57 s)
> RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
> | CANCEL 0
> JOB TIME   : 84.09 s
> 
> The avocado log reports a traceback where Python has thrown a
> UnicodeDecodeError, and then subsequently an attempted debug
> message in the error-handling path has a syntax error
> ("log() missing 1 required positional argument"):

> _console_interaction(test, success_message, failure_message, None,
> vm=vm)
> 2022-11-14 16:22:48,573 stacktrace       L0045 ERROR|   File
> "/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/avocad
> o/avocado_qemu/__init__.py", line 226, in _console_interaction
> 2022-11-14 16:22:48,573 stacktrace       L0045 ERROR|     msg =
> _peek_ahead(console, min_match, success_message)
> 2022-11-14 16:22:48,573 stacktrace       L0045 ERROR|   File
> "/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/avocad
> o/avocado_qemu/__init__.py", line 180, in _peek_ahead
> 2022-11-14 16:22:48,573 stacktrace       L0045 ERROR|
> console_logger.log("error in decode of peek")
> 2022-11-14 16:22:48,573 stacktrace       L0045 ERROR| TypeError: log()
> missing 1 required positional argument: 'msg'

Indeed, log() expects a Level as first argument. Here we simply want to
report the exception as a warning and continue:

-- >8 --
          except UnicodeDecodeError:
-            console_logger.log("error in decode of peek")
+            console_logger.warning("error in decode of peek")
              return None
---

