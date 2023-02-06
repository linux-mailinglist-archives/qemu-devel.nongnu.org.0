Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 125CC68BE10
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 14:24:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP1T6-0001Sd-Ve; Mon, 06 Feb 2023 08:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP1SN-0001Mq-K0
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:23:04 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP1SJ-00028I-Rr
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:22:49 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso8763172wms.4
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 05:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gnh1FfrNweT/nOfJrMSifUe9aq1gBH1TckZoHHlIFk8=;
 b=RkUEDjpOT3uCchVPVvAzy6u95Js5cuQca0k8l39jjOgFux9KXYOl/0SD00KYNv51Ab
 VzYJ6lPgdLyScRmgKDEaQNJU49vgxfYQu+XNLTfoWHQP/eql49KyBH6hu8Bo+Mj6tews
 lawbErCMjzg32wQq0Y8/fNUbo0unmB0ZDTdke7/Mt0jri+FlZLuusl9uiAoWtWsRMxHe
 cHxIW0OH4PkoLfTDrZAQ8KvAZ+M8PJF2+3qyPR0AKWP9P8KAbZNJOfh4B9mntgDny7Rc
 cVHUMb91LsQltyri5FE0cSNgxJx79yZqmwRxu0yrvwbRJakEHOEg4CIvceEhb8c+XYCO
 ZMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gnh1FfrNweT/nOfJrMSifUe9aq1gBH1TckZoHHlIFk8=;
 b=bzlMWW6iOC4vObIdNSbhSuOViX93pgWJK3yuzU/xSGMfoL25s5Oq9zTUqML7d8oov6
 n8bGEw3RArKBteJbnzBvQn3DgS10+vqKU/7BsTtJlTWBwEis2j3a7FS1ANOudOlem75Y
 HPLOIRUzN157v/+WI4A4vVfJ2wR7udDP/AK4BrxqHKKtk3nRcR/zQPs9nfgqu+VBJIRo
 1Nh+y/lGmI4UFPfoMu0DIZSINdN0hNnjyNV7l0QJLD7gwELnGm2cYKGT11WtNJPrDZje
 d8adBWGym2MDqhXlzgmMqpXZVCTS9EN9ks8mxCwzrP9TqEkhAoodySei1ZqvSUpPe03f
 L5Hg==
X-Gm-Message-State: AO0yUKU94PiKEQ7hKotGlGo02mKrsbTpng0jMyeyuv27QMBhZTKX2eLq
 +txmrkcE89RZv6mhTsccaTDBAA==
X-Google-Smtp-Source: AK7set8f/OKI8EhvSLblwDKmLDLZdfymdNoUb2rSKROrJmuvatiqMIG/Kn/QGVfRlJSA6yI56B5nhA==
X-Received: by 2002:a7b:c3c6:0:b0:3da:22a6:7b6b with SMTP id
 t6-20020a7bc3c6000000b003da22a67b6bmr19471587wmj.13.1675689766119; 
 Mon, 06 Feb 2023 05:22:46 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c3b1400b003db1ca20170sm11908120wms.37.2023.02.06.05.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 05:22:45 -0800 (PST)
Message-ID: <a4011d2f-c652-d8c1-59d9-39c8f9c16adf@linaro.org>
Date: Mon, 6 Feb 2023 14:22:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PULL 04/35] tests/unit: drop hacky race avoidance in
 test-io-channel-command
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
 <20230126112250.2584701-5-alex.bennee@linaro.org>
 <adf22fcb-51a6-3194-4496-6a6878e9d498@linaro.org> <87a61rq6p5.fsf@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87a61rq6p5.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 6/2/23 14:11, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Hi Alex, Thomas.
>>
>> On 26/1/23 12:22, Alex Bennée wrote:
>>> We don't need to play timing games to ensure one socat wins over the
>>> other, just create the fifo they both can use before spawning the
>>> processes. However in the process we need to disable two tests for
>>> Windows platforms as we don't have an abstraction for mkfifo().
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1403
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>> Message-Id: <20230124180127.1881110-5-alex.bennee@linaro.org>
>>> diff --git a/tests/unit/test-io-channel-command.c
>>> b/tests/unit/test-io-channel-command.c
>>> index 19f72eab96..425e2f5594 100644
>>> --- a/tests/unit/test-io-channel-command.c
>>> +++ b/tests/unit/test-io-channel-command.c
>>> @@ -20,6 +20,8 @@
>>>      #include "qemu/osdep.h"
>>>    #include <glib/gstdio.h>
>>> +#include <sys/types.h>
>>> +#include <sys/stat.h>
>>>    #include "io/channel-command.h"
>>>    #include "io-channel-helpers.h"
>>>    #include "qapi/error.h"
>>> @@ -29,6 +31,7 @@
>>>      static char *socat = NULL;
>>>    +#ifndef _WIN32
>>>    static void test_io_channel_command_fifo(bool async)
>>>    {
>>>        g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
>>> @@ -40,12 +43,13 @@ static void test_io_channel_command_fifo(bool async)
>>>        QIOChannel *src, *dst;
>>>        QIOChannelTest *test;
>>>    +    if (mkfifo(fifo, 0600)) {
>>> +        g_error("mkfifo: %s", strerror(errno));
>>> +    }
>>> +
>>>        src = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) srcargv,
>>>                                                        O_WRONLY,
>>>                                                        &error_abort));
>>> -    /* try to avoid a race to create the socket */
>>> -    g_usleep(1000);
>>> -
>>>        dst = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) dstargv,
>>>                                                        O_RDONLY,
>>>                                                        &error_abort));
>>> @@ -60,7 +64,6 @@ static void test_io_channel_command_fifo(bool async)
>>
>> Testing on Darwin/Aarch64 I'm getting (reproducible):
>>
>> 78/93 qemu:unit / test-io-channel-command             ERROR 2.38s
>> killed by signal 13 SIGPIPE
>>>>> MALLOC_PERTURB_=10 G_TEST_BUILDDIR=./tests/unit
>>      G_TEST_SRCDIR=tests/unit ./tests/unit/test-io-channel-command
>>     --tap -k
>> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>> stderr:
>> 2023/02/03 08:26:49 socat[32507] E
>> mkfifo(/var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/qemu-test-io-channel.GMARZ1/test-io-channel-command.fifo,
>> 438): File exists
>>
>> (test program exited with status code -13)
>>
>> TAP parsing error: Too few tests run (expected 4, got 0)
>> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>>
>> We call g_rmdir(), but I see various qtests calling unlink()
>> before rmdir(). Do we need it here?
>>
>> +       g_unlink(fifo);
> 
> Probably - the man page implies rmdir is expecting an empty directory.

Ah indeed; also it returns 0 on success. Then maybe:

   err = g_unlink(fifo);
   assert(err == 0);
   err = g_rmdir(tmpdir);
   assert(err == 0);

> 
>>
>>>        g_rmdir(tmpdir);
>>>    }


