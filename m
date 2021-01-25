Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F423027F9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:36:29 +0100 (CET)
Received: from localhost ([::1]:49174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44qq-0003A6-R3
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l44oo-0002Ei-FW; Mon, 25 Jan 2021 11:34:23 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l44on-000142-11; Mon, 25 Jan 2021 11:34:22 -0500
Received: by mail-ej1-x630.google.com with SMTP id g3so18941230ejb.6;
 Mon, 25 Jan 2021 08:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rYyw7gQiDoE36mUwY+RMaAWC4T2e6b4ZyPk8XLzDz8g=;
 b=n793x5VcWgx0M8fScYym0dRQlXp64j49bZwKaTv33furzvi3pbakOMU3neM3f/Bg/t
 UAmC/bn41xgsuj+936JbJf6TAjOzXF63ZRjUwlNZwJYcVHbk/KJl1X96i7Gww7GgupJu
 Yzi6HtJRF7BFOvbTbhMrOm7AWPGoNyA/hqU3b9fdHO0MiuLEcZAiAjNul0oXMvdT/wLa
 rU1f0JrGO1M1X447McjxnY2cmO6tvoSYF5c8cxt23xsiUZ+nw57PUAWaRClelXessNF6
 67aDeKzSa0kk2hPsYHhr2edikuzq0wYTksJHDERm3gC78DV32d0QzLjG1/+/F1BpeCGc
 FBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rYyw7gQiDoE36mUwY+RMaAWC4T2e6b4ZyPk8XLzDz8g=;
 b=NDKh1xQ/w5S4KDFEIie3/YNUCs0wckH6BFcVRlcRZto6UDUmG21TZ9Ym/Yd74mS6v4
 LOymRqAL3zV8lrA9qW67bg/jasRoHmUNEWROh6sVGSLIVguxtyBWsbERgNQxPWP5LyIE
 tJA8+v1u1kQCeGnf5xs+hyHAkilCOPwTCAuOYGZXtIGEooUlY4siScavbuiy6Iuvp+wJ
 uEozeYqbwuUk/ScOpGeXbONK2jO3Ch7ad9CoIQrTyEAKRn5/rcMcyyZbAIu4wjWXPnTK
 OpZKowc7Om6Y74iGT7fvXPAuh/uFj4z6lmLXM2ZZGxKcvBEq0fLXzyoc8Ya6frm4rU48
 n0dA==
X-Gm-Message-State: AOAM532zbZmKlF0z3JVmug6BKIe657VP41oiVWV4H345d1cVa1MV0+xG
 ePUXp+BF3WJeKxDnzCiHlZJ6GKtgSQY=
X-Google-Smtp-Source: ABdhPJyZDn1KHhkR0KohgKwg1LqDrnS43ZbWsDPac0t90WvspQzYBE5U0YT+g1qBLYljo0REXjukxQ==
X-Received: by 2002:a17:906:748:: with SMTP id z8mr874469ejb.233.1611592458849; 
 Mon, 25 Jan 2021 08:34:18 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r7sm8593126ejo.20.2021.01.25.08.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 08:34:18 -0800 (PST)
Subject: Re: [PATCH v2] configure: Only build s390-ccw BIOS when system
 emulation is built
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210125153719.2863349-1-f4bug@amsat.org>
 <97317bd1-03a1-acd2-2eeb-795666edac58@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <463962f0-5bdb-d598-be02-b8aab9e47758@amsat.org>
Date: Mon, 25 Jan 2021 17:34:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <97317bd1-03a1-acd2-2eeb-795666edac58@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/21 5:29 PM, Thomas Huth wrote:
> On 25/01/2021 16.37, Philippe Mathieu-Daudé wrote:
>> It is pointless to build the s390-ccw BIOS when only user-mode
>> emulation is built. Only build it when s390 system mode emulation
>> is selected.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> v2: Restrict to s390x-softmmu (thuth)
>>
>> We could move the whole block into the case(), but
>> 1/ it doesn't look nice
>> 2/ it doesn't match the rest of this file code style
>>
>> Supersedes: <20210124161740.2502786-1-f4bug@amsat.org>
>> ---
>>   configure | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index dcc5ea7d630..997fb0761a5 100755
>> --- a/configure
>> +++ b/configure
>> @@ -461,6 +461,7 @@ skip_meson=no
>>   gettext="auto"
>>   fuse="auto"
>>   fuse_lseek="auto"
>> +s390_ccw_bios="no"
>>     malloc_trim="auto"
>>   @@ -5373,7 +5374,11 @@ if { test "$cpu" = "i386" || test "$cpu" =
>> "x86_64"; } && \
>>   fi
>>     # Only build s390-ccw bios if we're on s390x and the compiler has
>> -march=z900
>> -if test "$cpu" = "s390x" ; then
>> +case $target_list in
>> +  *"s390x-softmmu"*) s390_ccw_bios=yes
>> +  ;;
>> +esac
>> +if test "$s390_ccw_bios" = yes; then
> 
> Why did you drop the test for the host CPU? ... the s390-ccw bios
> currently only compiles on a s390x box...

I saw something odd but couldn't figure. Too much squashing and
switching between branches...

Phil.

