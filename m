Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D2A4AA878
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 13:00:43 +0100 (CET)
Received: from localhost ([::1]:53508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGJkA-0001Nm-FS
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 07:00:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGJiA-0000M9-4J; Sat, 05 Feb 2022 06:58:38 -0500
Received: from [2607:f8b0:4864:20::433] (port=42980
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGJi7-0006yy-Rk; Sat, 05 Feb 2022 06:58:37 -0500
Received: by mail-pf1-x433.google.com with SMTP id i65so7410316pfc.9;
 Sat, 05 Feb 2022 03:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2GcxujHW1yBT3ZjJwOqMsE0YXwA+cJN5EM8pqnCOu9c=;
 b=FVjCLWIelkEhw9SiLQEpGyjWm+W5tJUjfvig+SdOn8mB9IyGWRnq5PCdDHg+GMeLw1
 zMPpn2kc3gjqni3iJWJoAiENUXRLFkrnqp/33j8YLEUQMtSVCa7EXOp797TeI/IuorIC
 YcchG6f6zhqrYKHCyJQv61XJTxAOZADcly6tb4+iOeju558sgOqSJjamnE+gHmJP2sS/
 dkEu+Wa11Mb2I17N9dnnflS07ohVXUycSthkh8AxjzWtTLhNkKn7UHk32svF9Qsl6tos
 Vz3jZ/g6a+iWe5uEx7Wx7yhKnexoDIZK4lubhv2AcW+kSgcHHRbinbJVahO/OqhhLdpq
 CpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2GcxujHW1yBT3ZjJwOqMsE0YXwA+cJN5EM8pqnCOu9c=;
 b=IHQ3g1/RyBsImxEfVpuQTDJQBYB155gRHcFJNSWGC1U6slPnNeworaZqX/UWEveXAJ
 57oUaksa7UtLvDRZqRh6evTrHbk8kHwWWk0+znStq4Y6lmHNks1lNOYbxxzhX0fEJCj/
 9WlEL5r1q3AmvAMNuwy37hXUlUkM8+wfl0NA7e6sSr295X8Gcva03ty5CGW5d36Cwm61
 mCQtip0WWvKa127Un5BJqoEUfKMVWab8JzFkX+Cu8xm4Sa7wDN4jAjUzJfUO2MXpDOi4
 Ca25deh8Vd+KUobRzyBQecdDhvoNXNGywXm8RrLBqmDMLn9mFKt7/iC8zVQms1QcUQUI
 tG1w==
X-Gm-Message-State: AOAM531a1ldrbqyrqKaiQLXRznT1DxhfZspGiiRxJ05bxX6vMvX4XFKY
 TGSgCTZUKuNOu1211MHxe0Q=
X-Google-Smtp-Source: ABdhPJxuFfEScfc+AgQRA5HW70qCZ9GlcrVF7FIkDbzKjG7tjtUE/6kCThb+p50jteugw2xzv9yXgw==
X-Received: by 2002:a63:74d:: with SMTP id 74mr2621154pgh.324.1644062307753;
 Sat, 05 Feb 2022 03:58:27 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id g22sm6148779pfc.177.2022.02.05.03.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 03:58:27 -0800 (PST)
Message-ID: <83e8e341-4226-9ee6-018b-8bdb03e8ffef@amsat.org>
Date: Sat, 5 Feb 2022 12:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Greg Kurz <groug@kaod.org>,
 qemu-stable@nongnu.org, ldv@altlinux.org
References: <20220204050609.15510-1-vt@altlinux.org>
 <2519450.KGbbELgHQX@silver>
In-Reply-To: <2519450.KGbbELgHQX@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/2/22 12:36, Christian Schoenebeck wrote:
> On Freitag, 4. Februar 2022 06:06:09 CET Vitaly Chikunov wrote:
>> `struct dirent' returned from readdir(3) could be shorter (or longer)
>> than `sizeof(struct dirent)', thus memcpy of sizeof length will overread
>> into unallocated page causing SIGSEGV. Example stack trace:
>>
>>   #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64 +
>> 0x497eed) #1  0x00005555559ec2e9 v9fs_readdir (/usr/bin/qemu-system-x86_64
>> + 0x4982e9) #2  0x0000555555eb7983 coroutine_trampoline
>> (/usr/bin/qemu-system-x86_64 + 0x963983) #3  0x00007ffff73e0be0 n/a (n/a +
>> 0x0)
>>
>> While fixing, provide a helper for any future `struct dirent' cloning.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
>> Cc: qemu-stable@nongnu.org
>> Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
>> ---
>> Tested on x86-64 Linux again.
>>
>> Changes from v2:
>> - Make it work with a simulated dirent where d_reclen is 0, which was
>>    caused abort in readdir qos-test, by using fallback at runtime.
>>
>>   hw/9pfs/codir.c      |  3 +--
>>   include/qemu/osdep.h | 13 +++++++++++++
>>   util/osdep.c         | 18 ++++++++++++++++++
>>   3 files changed, 32 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
>> index 032cce04c4..c0873bde16 100644
>> --- a/hw/9pfs/codir.c
>> +++ b/hw/9pfs/codir.c
>> @@ -143,8 +143,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState
>> *fidp, } else {
>>               e = e->next = g_malloc0(sizeof(V9fsDirEnt));
>>           }
>> -        e->dent = g_malloc0(sizeof(struct dirent));
>> -        memcpy(e->dent, dent, sizeof(struct dirent));
>> +        e->dent = qemu_dirent_dup(dent);
>>
>>           /* perform a full stat() for directory entry if requested by caller
>> */ if (dostat) {
>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>> index d1660d67fa..ce12f64853 100644
>> --- a/include/qemu/osdep.h
>> +++ b/include/qemu/osdep.h
>> @@ -805,6 +805,19 @@ static inline int
>> platform_does_not_support_system(const char *command) }
>>   #endif /* !HAVE_SYSTEM_FUNCTION */
>>
>> +/**
>> + * Duplicate directory entry @dent.
>> + *
>> + * It is highly recommended to use this function instead of open coding
>> + * duplication of @c dirent objects, because the actual @c struct @c dirent
>> + * size may be bigger or shorter than @c sizeof(struct dirent) and correct
>> + * handling is platform specific (see gitlab issue #841).
>> + *
>> + * @dent - original directory entry to be duplicated
>> + * @returns duplicated directory entry which should be freed with g_free()
>> + */
>> +struct dirent *qemu_dirent_dup(struct dirent *dent);
>> +
>>   #ifdef __cplusplus
>>   }
>>   #endif
>> diff --git a/util/osdep.c b/util/osdep.c
>> index 42a0a4986a..2c80528a61 100644
>> --- a/util/osdep.c
>> +++ b/util/osdep.c
>> @@ -33,6 +33,7 @@
>>   extern int madvise(char *, size_t, int);
>>   #endif
>>
>> +#include <dirent.h>
>>   #include "qemu-common.h"
>>   #include "qemu/cutils.h"
>>   #include "qemu/sockets.h"
>> @@ -615,3 +616,20 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
>>       return readv_writev(fd, iov, iov_cnt, true);
>>   }
>>   #endif
>> +
>> +struct dirent *
>> +qemu_dirent_dup(struct dirent *dent)
>> +{
>> +    size_t sz = 0;
>> +#if defined _DIRENT_HAVE_D_RECLEN
>> +    /* Avoid use of strlen() if there's d_reclen. */
>> +    sz = dent->d_reclen;
>> +#endif
>> +    if (sz == 0) {
> 
> Philippe, Greg, apart from the additional comment, do you want to see this
> check to be changed in v4 to this?
> 
> 	if (unlikely(sz == 0)) {

This is not an hot path so probably not very useful.

> 
> Best regards,
> Christian Schoenebeck
> 
>> +        /* Fallback to the most portable way. */
>> +        sz = offsetof(struct dirent, d_name) +
>> +                      strlen(dent->d_name) + 1;
>> +    }
>> +    struct dirent *dst = g_malloc(sz);
>> +    return memcpy(dst, dent, sz);

However 'return g_memdup(dent, sz)' is simpler to review.

>> +}
> 
> 
> 


