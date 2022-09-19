Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3BF5BC98E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 12:28:10 +0200 (CEST)
Received: from localhost ([::1]:54222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaE0W-0007wG-SJ
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 06:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaDr8-0002zg-I7
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 06:18:26 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:35684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaDr6-0004FI-IG
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 06:18:26 -0400
Received: by mail-pf1-x432.google.com with SMTP id e5so27611990pfl.2
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 03:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=U+rcp6v/Tlvvzu632mxmdWadX6tu1C272K49mrLf2KQ=;
 b=K1u6aryAeesFWpsNQonqZC7HtDguL7Jt/IFoN5ydrtJTcQNe9a1pnsQhhjtRjYORcl
 SJjSbiCiaNhBnIyKWwevPvys47lD0sDTHPe5ZiGKltA/NH6Bg6llmeg4A+pousDvgXjU
 /PZPVZ2X5SWvVqOrhn76egtvOYvlmJBLeeF75qSBb+VU9ttG3ClcHDQc3VW9nzGIAK0N
 FJljdQo9Ar6UtGXFcnxyqemQa8JAa9ieQXo7dPSzFbYu/zxeEuwdy64ePQY5TGuiLSqR
 F44uDubgeTu4jyB8azXZBQ6mVJMd+HlPLtyLUym1f4938bRT2lnpceHJcaeUIQcm3wZ/
 yLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=U+rcp6v/Tlvvzu632mxmdWadX6tu1C272K49mrLf2KQ=;
 b=uiXRG8A2x2h7ND3anSEB/Kwrss8IyDXwwCZOuT7lXahJtFGY4W/qy0zQVXC5AGCScJ
 M7NFP3mbDllbYq2INUT0JKxAZOvDtyjw3DBX/6XLhKdHjGeMGA3SKSu7i816axzkyhRP
 xh6EZOy/w7OFti3hvG/nw/iIRA8vv/uXqlGkquydGc5TvaBGBdeSxGC6bvxLB1SD92e5
 xF39bckxu1k/a4UGrQCegGjoAGYUNwv73POUUWIv1OCDcBTr6BTZNgB2YJWXEmQbcdm/
 V5pTUK3Pm8Rjr7wSrDsE588ioHXs5s1vKpvlZDjUtGg62Oo7KqTP1ULCdUW4dHEMFcSt
 jStQ==
X-Gm-Message-State: ACrzQf0qaMoxYnYSmFYdvaP0VWl9fZ35t7tsnPF6UM95vPtHnX28odlM
 SmtXgZ9Yk5TAdiom/A0mIjc=
X-Google-Smtp-Source: AMsMyM7qQGCkMJGqDyU0HtM0djiXeLVi7WZi2gn49t0m3Kj4+2Zupn/+D205qeck8lGFjtPxaKd68g==
X-Received: by 2002:a63:6f8a:0:b0:439:36bc:89f9 with SMTP id
 k132-20020a636f8a000000b0043936bc89f9mr14584522pgc.100.1663582702961; 
 Mon, 19 Sep 2022 03:18:22 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p4-20020aa79e84000000b0053ea0e55574sm19835613pfq.187.2022.09.19.03.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 03:18:22 -0700 (PDT)
Message-ID: <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
Date: Mon, 19 Sep 2022 12:18:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de> <877d23ekj0.fsf@pond.sub.org>
In-Reply-To: <877d23ekj0.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.657,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 16/9/22 11:27, Markus Armbruster wrote:
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> improve error handling during module load, by changing:
>>
>> bool module_load_one(const char *prefix, const char *lib_name);
>> void module_load_qom_one(const char *type);
>>
>> to:
>>
>> bool module_load_one(const char *prefix, const char *name, Error **errp);
>> bool module_load_qom_one(const char *type, Error **errp);
>>
>> module_load_qom_one has been introduced in:
>>
>> commit 28457744c345 ("module: qom module support"), which built on top of
>> module_load_one, but discarded the bool return value. Restore it.
>>
>> Adapt all callers to emit errors, or ignore them, or fail hard,
>> as appropriate in each context.
> 
> How exactly does behavior change?  The commit message is mum on the
> behavior before the patch, and vague on the behavior afterwards.
> 
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>   audio/audio.c         |   9 ++-
>>   block.c               |  15 ++++-
>>   block/dmg.c           |  18 +++++-
>>   hw/core/qdev.c        |  10 ++-
>>   include/qemu/module.h |  38 ++++++++++--
>>   qom/object.c          |  18 +++++-
>>   softmmu/qtest.c       |   6 +-
>>   ui/console.c          |  18 +++++-
>>   util/module.c         | 140 ++++++++++++++++++++++++------------------
>>   9 files changed, 194 insertions(+), 78 deletions(-)

>> diff --git a/include/qemu/module.h b/include/qemu/module.h
>> index 8c012bbe03..78d4c4de96 100644
>> --- a/include/qemu/module.h
>> +++ b/include/qemu/module.h
>> @@ -61,16 +61,44 @@ typedef enum {

>>   
>>   void module_call_init(module_init_type type);
>> -bool module_load_one(const char *prefix, const char *lib_name);
>> -void module_load_qom_one(const char *type);
>> +
>> +/*
>> + * module_load_one: attempt to load a module from a set of directories
>> + *
>> + * directories searched are:
>> + * - getenv("QEMU_MODULE_DIR")
>> + * - get_relocated_path(CONFIG_QEMU_MODDIR);
>> + * - /var/run/qemu/${version_dir}
>> + *
>> + * prefix:         a subsystem prefix, or the empty string ("audio-", ..., "")
>> + * name:           name of the module
>> + * errp:           error to set in case the module is found, but load failed.
>> + *
>> + * Return value:   true on success (found and loaded);
>> + *                 if module if found, but load failed, errp will be set.
>> + *                 if module is not found, errp will not be set.
> 
> I understand you need to distingush two failure modes "found, but load
> failed" and "not found".
> 
> Functions that set an error on some failures only tend to be awkward: in
> addition to checking the return value for failure, you have to check
> @errp for special failures.  This is particularly cumbersome when it
> requires a @local_err and an error_propagate() just for that.  I
> generally prefer to return an error code and always set an error.

I notice the same issue, therefore would suggest this alternative
prototype:

   bool module_load_one(const char *prefix, const char *name, 
             bool ignore_if_missing, Error **errp);
which always sets *errp when returning false:

  * Return value:   if ignore_if_missing is true:
  *                   true on success (found or missing), false on
  *                   load failure.
  *                 if ignore_if_missing is false:
  *                   true on success (found and loaded); false if
  *                   not found or load failed.
  *                 errp will be set if the returned value is false.
  */

