Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440684B6DCC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:41:16 +0100 (CET)
Received: from localhost ([::1]:60770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJy4x-0005Xp-8m
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:41:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJxtY-0002Ip-2w
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:29:28 -0500
Received: from [2607:f8b0:4864:20::42f] (port=45746
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJxtW-0005uY-F2
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:29:27 -0500
Received: by mail-pf1-x42f.google.com with SMTP id u16so839288pfg.12
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 05:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mH/OcjlHST6I08Egq+nByjo89XrDZ4t7by/a/ssrE0U=;
 b=EoArLMs4HBdpwYLDeaEeVoekg07+OcepfxcSXoYVwPTh6DSZn/wHYEMhjVSpEEjzWR
 t/5kz/r3HQdlqyDCrTN/WeoPdh2PDeSWP1WgGuGeXZeUAS3jiXf13X+mp6u22BhWYHwd
 XQb/RudvAj4XGM4jRJvKlumCKXbVp4RvXG4Y4cN3bovuGE4E22k97YWw5Bl9dlLyqAKR
 26Eboea/6BYAmc0p1++nXzCSe3IPGxhsqe5a7mgx71A7x147bkz349z/iJS4J9JqQ9Hk
 H/2dSZEz03WxZZJamWtyjTL4u9J1kf0YAKkI+qUDdH+AT3pz8gyWMi+wp0OCe6eNhirO
 VCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mH/OcjlHST6I08Egq+nByjo89XrDZ4t7by/a/ssrE0U=;
 b=ShU6dRBx2TJ1//QVtiS9w8Vs7lbWcLox1Z/5ELeM2BkewieB39aqEZxAdYIqc446+S
 qMO/z6DufZ0SlggU0dvynBol7b94LfSPzDTAyEkpgDbUCViCu6Q1OzME1/ngNTD0cXp7
 HfB2RLPGO8qW8aNZG3oYYEvcd159vtxZvSmY9hlpXY02OgmMaM9C7OCfP3ebIQMh7r/7
 kNg5kgecTEjTpNONpXNqPX0Zbzf8ZJ/QJl5Nry22n3UOEn8BPjWaO0iPpDee44CCWscf
 QV2oKaYdCTiZfXKB5vYConINQVIHx3N17BuXuNjOwBDLrl9tvYLLDGEUayVTN3kRwcq7
 K57A==
X-Gm-Message-State: AOAM533psk6rTXOyL4bdy/peZQNRDGxhHo9voDIKIR8ToKY7exApzwbT
 6Ao2CI4OuIXAx2I1F1jOVQo=
X-Google-Smtp-Source: ABdhPJwhWa5pVLiVryvNibXM/aDwaB8kkz6N5AG+OlxBjDs1uQeDMB5c5J0jFsDc6iOgSpa9GR0ReA==
X-Received: by 2002:a05:6a00:1ca7:: with SMTP id
 y39mr4172583pfw.48.1644931764998; 
 Tue, 15 Feb 2022 05:29:24 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id c14sm38557884pfm.169.2022.02.15.05.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 05:29:24 -0800 (PST)
Message-ID: <99ae4ffc-1add-18ad-0596-0ca2a1223f7b@amsat.org>
Date: Tue, 15 Feb 2022 14:29:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 2/4] osdep: Un-inline qemu_thread_jit_execute/write
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20220215120625.64711-1-f4bug@amsat.org>
 <20220215120625.64711-3-f4bug@amsat.org>
 <CAMVc7JViZmmeMyXMvXqhtLJuvSku0goFHYgLUHMafbdR5viq3g@mail.gmail.com>
In-Reply-To: <CAMVc7JViZmmeMyXMvXqhtLJuvSku0goFHYgLUHMafbdR5viq3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 15/2/22 14:09, Akihiko Odaki wrote:
> On Tue, Feb 15, 2022 at 9:06 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> qemu_thread_jit_execute() and qemu_thread_jit_write() call
>> pthread_jit_write_protect_np() which is declared in "pthread.h".
>> Since we don't want all C files to preprocess unused headers,
>> avoid adding yet another header here and move the function
>> definitions to osdep.c, un-inlining them.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   include/qemu/osdep.h | 17 ++---------------
>>   util/osdep.c         | 20 ++++++++++++++++++++
>>   2 files changed, 22 insertions(+), 15 deletions(-)
>>
>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>> index 1e7a002339..785884728b 100644
>> --- a/include/qemu/osdep.h
>> +++ b/include/qemu/osdep.h
>> @@ -773,21 +773,8 @@ size_t qemu_get_host_physmem(void);
>>    * Toggle write/execute on the pages marked MAP_JIT
>>    * for the current thread.
>>    */
>> -#if defined(MAC_OS_VERSION_11_0) && \
>> -    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
>> -static inline void qemu_thread_jit_execute(void)
>> -{
>> -    pthread_jit_write_protect_np(true);
>> -}
>> -
>> -static inline void qemu_thread_jit_write(void)
>> -{
>> -    pthread_jit_write_protect_np(false);
>> -}
>> -#else
>> -static inline void qemu_thread_jit_write(void) {}
>> -static inline void qemu_thread_jit_execute(void) {}
>> -#endif
>> +void qemu_thread_jit_execute(void);
>> +void qemu_thread_jit_write(void);
>>
>>   /**
>>    * Platforms which do not support system() return ENOSYS
>> diff --git a/util/osdep.c b/util/osdep.c
>> index 42a0a4986a..b228a53612 100644
>> --- a/util/osdep.c
>> +++ b/util/osdep.c
>> @@ -124,6 +124,26 @@ int qemu_mprotect_none(void *addr, size_t size)
>>   #endif
>>   }
>>
>> +static void qemu_pthread_jit_write_protect(bool enabled)
>> +{
>> +#if defined(MAC_OS_VERSION_11_0) \
>> +        && MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
>> +    if (__builtin_available(macOS 11.0, *)) {
>> +        pthread_jit_write_protect_np(enabled);
>> +    }
>> +#endif
>> +}
>> +
>> +void qemu_thread_jit_execute(void)
>> +{
>> +    qemu_pthread_jit_write_protect(true);
>> +}
>> +
>> +void qemu_thread_jit_write(void)
>> +{
>> +    qemu_pthread_jit_write_protect(false);
>> +}
>> +
>>   #ifndef _WIN32
>>
>>   static int fcntl_op_setlk = -1;
>> --
>> 2.34.1
>>
> 
> Is this for compile-time reduction? If so, it would be nice if you
> provide some numbers. It should have some explanation of the advantage
> otherwise.

No, no number, but when using GCC on Monterey, the C files not including
"pthread.h" complain qemu_pthread_jit_write_protect() is not declared,
although not using qemu_thread_jit_execute(). I'll check why GCC is not
eliding unused inlined code.

