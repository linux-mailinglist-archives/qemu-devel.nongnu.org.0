Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5B0674E2A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:33:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIlss-0004w1-Ks; Fri, 20 Jan 2023 02:32:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIlsq-0004ve-Fq
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:32:20 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIlso-0003ID-FY
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:32:20 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so2987774wms.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yzhvZFutE7S6+uC6TVcEW9GptLU9pvUHwFqb546VN+Y=;
 b=UZkzRNLGvXvhytfX0ByWI0pSHatuAQwqjif7+KqRt2qZ1uN0TY4nlpunRWdPFvueQO
 sM4NlELJ54ZNAXemprjqbkcMjnV9lRXSccdtl956jtlZQ4KoqLQX2ma0LmB/OCJ/iYf/
 N6xhC1FNAvGSCQEidRHEbSvS34KY2r3hZd7WQOI45nDn0csA2B6hYFbfGjPPEe5+LhW9
 EW5DdF1Ym6C9Bf1jPqej1swEnCXbpytcYmBAhy1hKg9PkpqRfv59/I3SvQw4J9Z/pnwX
 4bZt6MTorIy2PWD22TKqOUgYKPECWacXb96tG/wkbX+fxu+hYXPQsxu0/Vjh8cE+P4HE
 paCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yzhvZFutE7S6+uC6TVcEW9GptLU9pvUHwFqb546VN+Y=;
 b=E2t/RFq7mK3AOC6VuUUSjlggGHjLo+13ONbnAFBo1qhrwoMjo5Uw8Y9jOUjtmowURJ
 Q4mmUrHttoq0rAiASSD5dRCB7k8VwEW+O6MTIfojZGgIBCZkrhTYD4BqKIJ4k9TcJl4z
 z5ubCbjswHxAcLYG8cFe2nrwbnKJStpHzf8DJ4gmRJhzNMIGt3a853vaSyQaHivi3zUH
 zjag3DvN6m4CmDmGp4a1g9XSHGiXlgGokAAjcul14ON6by4F7sgp+UFcmBNybEEJyt50
 2blsIENGcjZa/l5CVZ9lsMhO8wQmwBxt7SgjPlqlFrqjwDAY7wOEgDl3SsPZRsCrEKhk
 imww==
X-Gm-Message-State: AFqh2kqoy4poyDP2auKmkoKQTyQMyhKeDGFbrIpgQzCfWWidTcK2IJRP
 oHL2p7WceElIz0gndhpPAfFtfw==
X-Google-Smtp-Source: AMrXdXvdErLH5sOz5LaKBFmiX/ukslf5pxNcOgcrkDPmztyjWe1rSvmYkH8OFJ+w3v6cXSO0q4wAig==
X-Received: by 2002:a05:600c:2255:b0:3da:f950:8168 with SMTP id
 a21-20020a05600c225500b003daf9508168mr12480769wmm.35.1674199936784; 
 Thu, 19 Jan 2023 23:32:16 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d4-20020a05600c3ac400b003d9fa355387sm1378390wms.27.2023.01.19.23.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 23:32:16 -0800 (PST)
Message-ID: <8af15c5e-044d-ffa4-cb78-85b9f5e0fbb2@linaro.org>
Date: Fri, 20 Jan 2023 08:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/11] tests/qtest/migration-test: Build command line
 using GString API (1/4)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-8-philmd@linaro.org>
 <ca41b949-e31e-ba69-7876-e6180ef52a3b@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ca41b949-e31e-ba69-7876-e6180ef52a3b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 19/1/23 22:10, Richard Henderson wrote:
> On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
>> Part 1/4: Convert memory & machine options.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/migration-test.c | 22 ++++++++++++----------
>>   1 file changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
>> index 6c3db95113..7aa323a7a7 100644
>> --- a/tests/qtest/migration-test.c
>> +++ b/tests/qtest/migration-test.c
>> @@ -582,6 +582,7 @@ typedef struct {
>>   static int test_migrate_start(QTestState **from, QTestState **to,
>>                                 const char *uri, MigrateStart *args)
>>   {
>> +    g_autoptr(GString) cmd_common = NULL;
>>       g_autofree gchar *arch_source = NULL;
>>       g_autofree gchar *arch_target = NULL;
>>       g_autofree gchar *cmd_target = NULL;
>> @@ -601,6 +602,9 @@ static int test_migrate_start(QTestState **from, 
>> QTestState **to,
>>       }
>>       got_stop = false;
>> +
>> +    cmd_common = g_string_new("");
>> +
>>       bootpath = g_strdup_printf("%s/bootsect", tmpfs);
>>       if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>>           /* the assembled x86 boot sector should be exactly one 
>> sector large */
>> @@ -644,6 +648,10 @@ static int test_migrate_start(QTestState **from, 
>> QTestState **to,
>>       } else {
>>           g_assert_not_reached();
>>       }
>> +    if (machine_opts) {
>> +        g_string_append_printf(cmd_common, " -machine %s ", 
>> machine_opts);
>> +    }
>> +    g_string_append_printf(cmd_common, "-m %s ", memory_size);
>>       if (!getenv("QTEST_LOG") && args->hide_stderr) {
>>   #ifdef _WIN32
>> @@ -674,33 +682,27 @@ static int test_migrate_start(QTestState **from, 
>> QTestState **to,
>>       if (!args->only_target) {
>>           g_autofree gchar *cmd_source = NULL;
>> -        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
>> +        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s "
>>                                        "-name source,debug-threads=on "
>> -                                     "-m %s "
>>                                        "-serial file:%s/src_serial "
>>                                        "%s %s %s %s",
>>                                        args->use_dirty_ring ?
>>                                        ",dirty-ring-size=4096" : "",
>> -                                     machine_opts ? " -machine " : "",
>> -                                     machine_opts ? machine_opts : "",
> 
> You removed two strings here, but only one %s above.

>> -                                     memory_size, tmpfs,
>> +                                     cmd_common->str, tmpfs,

One new string is added here             ^^^^^^^^^^^^^^^.

>>                                        arch_source, shmem_opts,
>>                                        args->opts_source ? 
>> args->opts_source : "",
>>                                        ignore_stderr);
>>           *from = qtest_init(cmd_source);
>>       }
>> -    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
>> +    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s "
>>                                    "-name target,debug-threads=on "
>> -                                 "-m %s "
>>                                    "-serial file:%s/dest_serial "
>>                                    "-incoming %s "
>>                                    "%s %s %s %s",
>>                                    args->use_dirty_ring ?
>>                                    ",dirty-ring-size=4096" : "",
>> -                                 machine_opts ? " -machine " : "",
>> -                                 machine_opts ? machine_opts : "",
>> -                                 memory_size, tmpfs, uri,
>> +                                 cmd_common->str, tmpfs, uri,
>>                                    arch_target, shmem_opts,
>>                                    args->opts_target ? 
>> args->opts_target : "",
>>                                    ignore_stderr);
> 


