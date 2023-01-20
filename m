Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417E46752F7
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 12:05:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIpCD-00044U-Tz; Fri, 20 Jan 2023 06:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIpC2-00041t-3n
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 06:04:31 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIpBz-0007ky-3N
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 06:04:21 -0500
Received: by mail-wr1-x429.google.com with SMTP id bk16so4490150wrb.11
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 03:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gJrYagMDjoV7CQfxsB9AF4VjGFWtThSQgPY4CZ6EGEg=;
 b=dP4ftQvN6SS9UiYXxglB4ssOjamXFeP75ouTEysE+jydrJbQwkGmCTcnLFtj/e47li
 QDT20GPEHoqWUB8mUkjm5esucpOq6/BGyld9O72hfV5FvIMLV1CwS3wEPdMCVRkPB+rZ
 5jaOIEAUwvzrvuYKsdXGJGgkvbve/9cj9r+bri6gkF5w0ysm1ei5SrQ5mLUvp8b5LxfA
 KnECZYEZq5ngD0bCd7caDzvX7iCE3Ai1JFYLoumXkWEdl5CovYp/mnSxlrWvtWA8wB/w
 JqvnezRQ3KIi/ObMulDMyJJA8Z9erZVts4xGAJxSe04uuaz8NO90MDIpl1D9lqiCMGza
 HwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gJrYagMDjoV7CQfxsB9AF4VjGFWtThSQgPY4CZ6EGEg=;
 b=etBIcAZbt/V3A0eCyb6t/JPdZpAgstFcxz+Xzcz1gIVhWeVKgGIOI9kip/qTy8KC1A
 jsyV3+yvfgP7+Fu8okPE7kY7sbUdIZlUhYseXZ2bjByF2WZnrQ9Y5LjF12YeEcXki1S1
 2iawk+f7ztIN8f6TQsd/Lr/BAHBOBMdjBbJRxioWMIOfuQ6blPvz4lf/hX+yp3QxDwBr
 ARaDstWHpm2KWqBfypnR4JhSrHg+3+XJLfgP48R0pxRT3QB4WtHHAsI0GFNDRo4le121
 ZnKQhN6QFVDfIi7uV2ymbrKgp/e9NwztMd90cc+yHixTYJ4QzrSW9iY/vTGKLRoFgDEs
 wJ+Q==
X-Gm-Message-State: AFqh2kobK26AkFLgEIznopTsQNrCyI2m3gzKvw28vYJAqZL7vlZ705Du
 0/WDYSIUE1JGptAixSx8P7b+3g==
X-Google-Smtp-Source: AMrXdXv5GeqTP2eVS/9RLj3txlit432sqNC/+zyay4Z/aNcIX69bdXmCDVSxeU+2Hn9C/1wEr3S8Ow==
X-Received: by 2002:a5d:6ac6:0:b0:29f:7c87:74ab with SMTP id
 u6-20020a5d6ac6000000b0029f7c8774abmr11016639wrw.10.1674212657383; 
 Fri, 20 Jan 2023 03:04:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o15-20020a5d684f000000b002bddac15b3dsm19971677wrw.33.2023.01.20.03.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 03:04:16 -0800 (PST)
Message-ID: <67a1ec14-92fb-dde4-b214-909b279ae4b3@linaro.org>
Date: Fri, 20 Jan 2023 12:04:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 03/11] tests/qtest/boot-serial-test: Build command line
 using GString API
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-4-philmd@linaro.org>
 <4b5fbb1a-204b-15a0-8cc1-71c899b9760a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <4b5fbb1a-204b-15a0-8cc1-71c899b9760a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 20/1/23 09:59, Thomas Huth wrote:
> On 19/01/2023 15.58, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/boot-serial-test.c | 23 +++++++++++++++--------
>>   1 file changed, 15 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/qtest/boot-serial-test.c 
>> b/tests/qtest/boot-serial-test.c
>> index 3a854b0174..92890b409d 100644
>> --- a/tests/qtest/boot-serial-test.c
>> +++ b/tests/qtest/boot-serial-test.c
>> @@ -226,14 +226,17 @@ static void test_machine(const void *data)
>>       const testdef_t *test = data;
>>       g_autofree char *serialtmp = NULL;
>>       g_autofree char *codetmp = NULL;
>> -    const char *codeparam = "";
>>       QTestState *qts;
>>       int ser_fd;
>> +    g_autoptr(GString) cmd = g_string_new("");
> 
> You could already start with the "-no-shutdown" here.

It is just the matter of knowing the style of the maintainer :)
IIRC Alex prefers starting with an empty "" to avoid future churn
when adding new params (just add new line instead of modify).

I'll use your suggestion if I respin.

> 
>>       ser_fd = g_file_open_tmp("qtest-boot-serial-sXXXXXX", 
>> &serialtmp, NULL);
>>       g_assert(ser_fd != -1);
>>       close(ser_fd);
>> +    g_string_append_printf(cmd, "-M %s ", test->machine);
>> +    g_string_append(cmd, "-no-shutdown ");
>> +
>>       if (test->kernel || test->bios) {
>>           ssize_t wlen;
>>           int code_fd;
>> @@ -243,19 +246,23 @@ static void test_machine(const void *data)
>>           wlen = write(code_fd, test->kernel ? : test->bios, 
>> test->codesize);
>>           g_assert(wlen == test->codesize);
>>           close(code_fd);
>> +        g_string_append_printf(cmd, "%s %s ",
>> +                               test->kernel ? "-kernel " : "-bios ", 
>> codetmp);
>>       }
>> +    g_string_append_printf(cmd, "-chardev file,id=serial0,path=%s "
>> +                                "-serial chardev:serial0 ", serialtmp);
> 
> Why not include this in the initial g_string_append_printf statement 
> already?
> 
>>       /*
>>        * Make sure that this test uses tcg if available: It is used as a
>>        * fast-enough smoketest for that.
>>        */
>> -    qts = qtest_initf("%s %s %s -M %s -no-shutdown "
>> -                      "-chardev file,id=serial0,path=%s "
>> -                      "-serial chardev:serial0 -accel tcg -accel kvm 
>> %s",
>> -                      codeparam,
>> -                      test->kernel ? "-kernel " : test->bios ? "-bios 
>> " : "",
>> -                      codetmp ? : "", test->machine,
>> -                      serialtmp, test->extra);
>> +    g_string_append(cmd, "-accel tcg ");
>> +    g_string_append(cmd, "-accel kvm ");
>> +    g_string_append(cmd, test->extra);
>> +
>> +    qts = qtest_init(cmd->str);
> 
> ... and I have to say that this is already quite a lot of code churn, 
> just to get the -accel parameters tweaked in the end.
> 
> Why don't you simply do a single small patch that just replaces the 
> "-accel tcg -accel" part with "%s %s" and add two parameters like this:
> 
>    has_tcg ? "-accel tcg" : "", has_kvm ? "-accel kvm" : ""

I thought it would be simpler when adding HVF support later, KISS,
but I don't mind to change.

Thanks,

Phil.

