Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF196445E9
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 15:41:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Z7x-0003I1-Nb; Tue, 06 Dec 2022 09:40:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Z7w-0003Hk-3X
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 09:40:56 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Z7o-0001Ox-Qm
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 09:40:54 -0500
Received: by mail-wr1-x42e.google.com with SMTP id h7so17750315wrs.6
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 06:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jMkOCBbUh8RGluDV05b02Pl4wRDfLhYJBOQRL5dqlYc=;
 b=Fn17UewVShyHBr4U/5y1U7D9zeMe68a8toDSRtnvqFhaQLVWSQa8O6LVDOqNfaVMMg
 Po0FU7PE2zEUUWQwo3IefaNQavaFg/Gpo0mLUZxIlUC+aqj3P6ooxjwDXda1DiMyh+5U
 9FKbbh2k+V/x4Io4zn9rf35lvH3QPlO5J5c3DuAIXT17aO/b3bb8eyUvSb00CNh3GvXY
 SUkiq1+nLVSFH6GXagvppITqzDrLjBjJ3YDQHRUsXsieKH7vaxSgImUM1I1n8DXjNm8k
 /GiqFcvKDYrQ+TqLYOk4/HRn17hAAR49LRdGwq2EFC4FKiRhikL5A08VTNUSgwCzrbot
 DwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jMkOCBbUh8RGluDV05b02Pl4wRDfLhYJBOQRL5dqlYc=;
 b=4I/iSC7D+wnTnqyXKY4Y8JftF38urpCr79R+udIlBJnH/ufEL0e2tWDD4R8/sY1X8R
 FQO2SSY9fDUI3YxgVOszPio+W9w++UFnMY3yPFJAkGZn8cvt64WRr0wD6H/n487UCBvS
 YVwMPjdSYJN6IvPfCowdc3oyoaSdItPojjTTr7idHFEEne7zZqJqIJv4/BwKWm5DMCKV
 St78ESyE5OViZm3XzZUcGM/VTD0bEsAZzsC8N/Y7WkjPb4wCNty/NOFWJeNS1U2xajC3
 +piZlzTTdYZSq9f10VJ4IM3EoOOC8LcZ5JKP3qWq+ExxqBsTMjpNhupQ676ppeMHic+2
 Sj6Q==
X-Gm-Message-State: ANoB5pnINaxccwpsWqY7/Lg/Xl8buQEampdakBaM5lfFoZXjLCI7nK4S
 rW+EXqZtIXhEMcqveLOx3fdwUg==
X-Google-Smtp-Source: AA0mqf5bF3QogBoQpzEu4Ba4BSL0DZEDxzZUWc+0eBE4O/bx5ItLCKQty5e9cMm8spyQ0mRW+mP7LA==
X-Received: by 2002:adf:fb12:0:b0:236:60e8:3cca with SMTP id
 c18-20020adffb12000000b0023660e83ccamr46753810wrr.471.1670337647076; 
 Tue, 06 Dec 2022 06:40:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e15-20020a5d530f000000b002420dba6447sm16573852wrv.59.2022.12.06.06.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 06:40:46 -0800 (PST)
Message-ID: <3f83743b-32f3-c9ec-fca5-e63ced14fe32@linaro.org>
Date: Tue, 6 Dec 2022 15:40:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 02/11] exec: Restrict hwaddr.h to sysemu/
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210517111111.1068153-1-f4bug@amsat.org>
 <20210517111111.1068153-3-f4bug@amsat.org>
 <13fbfb3f-0d42-19a6-de11-4df9c5884b5b@linaro.org>
 <abeef930-8fc8-7afc-80d7-b9807fceb728@linaro.org>
In-Reply-To: <abeef930-8fc8-7afc-80d7-b9807fceb728@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
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

On 6/12/22 15:32, Philippe Mathieu-Daudé wrote:
> On 26/5/21 20:15, Richard Henderson wrote:
>> On 5/17/21 4:11 AM, Philippe Mathieu-Daudé wrote:
>>> --- a/include/exec/hwaddr.h
>>> +++ b/include/exec/sysemu/hwaddr.h
>>> @@ -1,8 +1,9 @@
>>>   /* Define hwaddr if it exists.  */
>>> -#ifndef HWADDR_H
>>> -#define HWADDR_H
>>> +#ifndef EXEC_SYSEMU_HWADDR_H
>>> +#define EXEC_SYSEMU_HWADDR_H
>>> +#ifndef CONFIG_USER_ONLY
>>>   #define HWADDR_BITS 64
>>>   /* hwaddr is the type of a physical address (its size can
>>> @@ -23,4 +24,6 @@ typedef struct MemMapEntry {
>>>       hwaddr size;
>>>   } MemMapEntry;
>>> +#endif /* !CONFIG_USER_ONLY */
>>> +
>>>   #endif
>>
>> Why no #error on this one, unlike the next patch.
> 
> Because many files in user emulation include "exec/hwaddr.h" :(

See for example gdbstub/user.c:

int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len)

I suppose we should change the two hwaddr by vaddr:

/**
  * vaddr:
  * Type wide enough to contain any #target_ulong virtual address.
  */

