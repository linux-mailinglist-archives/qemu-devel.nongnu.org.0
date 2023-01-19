Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D70673681
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 12:16:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIStm-00068U-3L; Thu, 19 Jan 2023 06:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIStk-00067U-Hc
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:16:00 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIStg-0001Wu-Up
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:16:00 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so2606153wmq.1
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 03:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NYyAYGOqmeiQ5irt+FYs7TMwfNtyRl5zZkW45wNNMpU=;
 b=UlDeKjQNxxSDOawR0HpfQtS88GRgzS2twvK+ygife66xEGzpr0m89RJm2ZMgTytL9W
 yjHCw3l9OkBZEhvUQnOx/OFDbsPDrGFrhm7XpaY2UP2o4T1cWiVFwvq9iLmSDw/fmatA
 O3ZrG/pwZjn9ev+Y0wIxARjcqIla2DfZDJMAER+uzZhsCGAwBOOllS1bX3ZMWQU9BmrZ
 GFn/eOlYpIq1jT1uOoRZDexe/KvBxVSx7Ie+61JEEa58M5Gi1Ibzd7MJaxA32QFm626h
 VtWnvI6qFEtyBhBD77DoIB0poERe1pa0UVO4Sb75d7gto7pul1yVAujWllScjf9YvlEw
 CL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NYyAYGOqmeiQ5irt+FYs7TMwfNtyRl5zZkW45wNNMpU=;
 b=5Gfdufw7j3sO4nK/6N+TLrMxesIWqIT+9t/5ExcM0cGiZl4fiNy9pR9RgvwSZcmaJu
 H7Ya581BlFM4mhc9MUsQavnXgR9dIRWwmbHxccWlJqQxlgl1nVzLR3mKIqmCW3G5YHIY
 r5uyaMr1sACESxPpSqU3st/JfNwGH4jcoDFUgD8sn0w/8Ay5uaBKebQY29boH4A/q/RP
 43N2BNItg6ZGS+utZR/wnccYJxAvaFXr6pd9/g1OWq3gsAVwgIsvth3XiHs92SE0Cq1T
 404OzPZTHwz/BznfFlfkTohi0bmqoAptCMbW8QhrR3pEBhHQc4mr9TnGMDUbvaen8bUr
 hIVg==
X-Gm-Message-State: AFqh2krqEsVKcvUBkcJi+IHZ8oMbjqb7pdFkHDoEddtFxRHeIFyZ2fti
 VheTREK0QxGoqghsLN3GCP4qpg==
X-Google-Smtp-Source: AMrXdXtkL9FoSK0pGAwnwS2JDyBHjUj391VMV3vV0w4t7HXmZT7hhiAMBfoZ8h0PVKA71Oge5lr/Rg==
X-Received: by 2002:a05:600c:4928:b0:3d3:4aa6:4fe6 with SMTP id
 f40-20020a05600c492800b003d34aa64fe6mr10027991wmp.3.1674126949065; 
 Thu, 19 Jan 2023 03:15:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c458900b003d35acb0fd7sm4764266wmo.34.2023.01.19.03.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 03:15:48 -0800 (PST)
Message-ID: <82250558-cd3e-b863-614d-468ad5f24643@linaro.org>
Date: Thu, 19 Jan 2023 12:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 4/8] tests/qtest/migration-test: Build command line using
 GString API
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org
References: <20230119100537.5114-1-philmd@linaro.org>
 <20230119100537.5114-5-philmd@linaro.org> <Y8kiiMLWxKmHIJTr@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y8kiiMLWxKmHIJTr@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 19/1/23 11:59, Dr. David Alan Gilbert wrote:
> * Philippe Mathieu-Daudé (philmd@linaro.org) wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/migration-test.c | 85 ++++++++++++++++++------------------
>>   1 file changed, 42 insertions(+), 43 deletions(-)
>>
>> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
>> index dbde726adf..36e6074653 100644
>> --- a/tests/qtest/migration-test.c
>> +++ b/tests/qtest/migration-test.c
>> @@ -582,13 +582,13 @@ typedef struct {
>>   static int test_migrate_start(QTestState **from, QTestState **to,
>>                                 const char *uri, MigrateStart *args)
>>   {
> 
> bit of a big change with lots of things moving around, I think it's
> mostly OK but...

I'll see how to split.

>> +    g_autoptr(GString) cmd_common = NULL;
>>       g_autofree gchar *arch_source = NULL;
>> +    g_autoptr(GString) cmd_source = NULL;
>>       g_autofree gchar *arch_target = NULL;
>> -    g_autofree gchar *cmd_source = NULL;
>> -    g_autofree gchar *cmd_target = NULL;
>> -    const gchar *ignore_stderr;
>> +    g_autoptr(GString) cmd_target = NULL;
>> +    const gchar *ignore_stderr = NULL;
>>       g_autofree char *bootpath = NULL;
>> -    g_autofree char *shmem_opts = NULL;
>>       g_autofree char *shmem_path = NULL;
>>       const char *arch = qtest_get_arch();
>>       const char *machine_opts = NULL;
>> @@ -602,6 +602,12 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>>       }
>>   
>>       got_stop = false;
>> +
>> +    cmd_common = g_string_new("");
>> +    g_string_append(cmd_common, "-accel tcg ");
>> +    g_string_append_printf(cmd_common, "-accel kvm%s ",
>> +                           args->use_dirty_ring ? ",dirty-ring-size=4096" : "");
>> +
> 
> Isn't that swapping the order of -accel tcg and -accel kvm ?
> In the original it's
>                      g_strdup_printf("-accel kvm%s -accel tcg%s%s "
> 
> I think you're ending up with tcg first?

Oops good catch, thanks!


