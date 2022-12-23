Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B094654F67
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 12:02:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8foK-0004n3-LL; Fri, 23 Dec 2022 06:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8foC-0004mC-Mb
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 06:01:50 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8fo9-0001dk-63
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 06:01:47 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h16so4230642wrz.12
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 03:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xdvU/53H5D7dGfaHtfE0hhS3kMciuawfjja+WhLm8Jg=;
 b=zTJNyqSUcFWpCEuf3fxKKbkrGoZGokmOKwQ/bC79rMnrGl2OvlQ3jHyFRcVwVv+csL
 gE/pYJsH/bo1MD/ksNxv2Z1gHTjCIALr3Zhl10xK3J1/YJFzIHx5BPfHY73v41Vqs6Bv
 nA/8TCiztdH8UemWNf0hhUcIbfDPB4ZXQSpRuHx9/p5Hp9XebFI+BvcCOwOWCO//zq37
 moOv+ypxVo0tVyZB9NxWLfU6uyV3mxqFEzWxOk0l7pRO1mEItGsYgAJQkjZQAK76Feis
 2oGlyZqI6nso0UYkVo43g/ENcCti4y2mgGZ5N7HhHmPoBspTVy1loERjjUnQz7mgrNZx
 iNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xdvU/53H5D7dGfaHtfE0hhS3kMciuawfjja+WhLm8Jg=;
 b=o0joh7gBJBgT7vcjRu0FBweV1z842XO6U4udz8SjH6I33ewxpLUXl9/K1rW85Sf9Rk
 faLcbVxxbiF8HhgOScfdk8ow65CIogWUhNG7SuE8VcQ7JQuHCZ/s4uVampyoqbTCqpb8
 snqKS/Z1vqp8yebpNWIU+J9iizUbIZ4Zr9PaPGArSETVo8KWJ7S5kpCFtFSVNV20STdm
 JOGZD8lBZoYc0ahD1CgGvcoKZw8FsIn8pr+AVbwM8iVab8pjukH++Kv72yMI6u7iLD6a
 8xmxQO4occJYfLi5tJT2O5ga7dMqNv6t+J01fDkG6pdXme+L6jJbpwI6PsZhBwzR7Q4e
 WXlA==
X-Gm-Message-State: AFqh2kqwsMXs+gt2YimXrQ2UxKaCrF0s5dWLy5Sru14oHDSVhMSU/4/G
 9gnugzDaTYbkl8RetRCFqdd+zg==
X-Google-Smtp-Source: AMrXdXuWmOpEBkOSojy46YYTahSK2RxASsYwuiMU7ZymUjZh7LAZ25oHt5/7kdGfgFvF4TChC9V8TQ==
X-Received: by 2002:adf:de8a:0:b0:266:3709:5ce3 with SMTP id
 w10-20020adfde8a000000b0026637095ce3mr5647426wrl.0.1671793303485; 
 Fri, 23 Dec 2022 03:01:43 -0800 (PST)
Received: from [192.168.27.175] (160.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.160]) by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b0025e86026866sm3551674wrn.0.2022.12.23.03.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 03:01:43 -0800 (PST)
Message-ID: <5a06e9f8-f7ea-1dbf-d44b-b9d134d3c400@linaro.org>
Date: Fri, 23 Dec 2022 12:01:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH] linux-user: Improve strace output of personality() and
 sysinfo()
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
References: <20221223100107.17303-1-deller@gmx.de>
 <5780556e-ef12-408d-7f8b-9104314cf9f4@linaro.org>
 <69357647-288c-a032-27f9-2912c6483418@gmx.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <69357647-288c-a032-27f9-2912c6483418@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 23/12/22 11:53, Helge Deller wrote:
> On 12/23/22 11:50, Philippe Mathieu-Daudé wrote:
>> On 23/12/22 11:01, Helge Deller wrote:
>>> Make the strace look nicer for those two syscalls.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>> ---
>>>   linux-user/strace.list | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/linux-user/strace.list b/linux-user/strace.list
>>> index f9254725a1..909298099e 100644
>>> --- a/linux-user/strace.list
>>> +++ b/linux-user/strace.list
>>> @@ -1043,7 +1043,7 @@
>>>   { TARGET_NR_perfctr, "perfctr" , NULL, NULL, NULL },
>>>   #endif
>>>   #ifdef TARGET_NR_personality
>>> -{ TARGET_NR_personality, "personality" , NULL, NULL, NULL },
>>> +{ TARGET_NR_personality, "personality" , "%s(%p)", NULL, 
>>> print_syscall_ret_addr },
>>
>> Shouldn't this be:
>>
>>     { TARGET_NR_personality, "personality" , "%s(%u)", NULL, NULL },
> 
> Basically yes, but...
> it's a bitmap, so printing it as hex value (similiar to a pointer)
> is easier to read/analyze.

Oh, good point. Then "%s(0x"TARGET_ABI_FMT_lx")" is self-explicit.

Also for clarity:

#define print_syscall_ret_persona print_syscall_ret_addr

So what do you think of:

{ TARGET_NR_personality, "personality" , "%s(0x"TARGET_ABI_FMT_lx")",
    NULL, print_syscall_ret_persona },

?

