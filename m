Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EEE303736
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:14:21 +0100 (CET)
Received: from localhost ([::1]:46174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4IYO-0008VI-LS
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4ISs-0005LI-Gy
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:08:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4ISq-0007VV-Lk
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611644916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RR12lR+lFNPUaChM5RhwSpP3un2txl21L4hHUPUSdJA=;
 b=CcdlhpILHfV1FsSrFLMvEtacmMJ5khHR4G68mBjllc/Ptp7zrv+4+vHq4FPJqlhzHJkrnS
 pghVvfVAUEEWVaLVbE4/JjfcoNBmdYjLUo6W9xVPXxZI01x64Eh7mAks5dPb3X2WiIHtaW
 GGmDOBGLF3zfox/nKx22zpIKshT6OcE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-CQdjwbJgMdWRmMaQMYNAtg-1; Tue, 26 Jan 2021 02:08:32 -0500
X-MC-Unique: CQdjwbJgMdWRmMaQMYNAtg-1
Received: by mail-ed1-f70.google.com with SMTP id v19so890503edx.22
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 23:08:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RR12lR+lFNPUaChM5RhwSpP3un2txl21L4hHUPUSdJA=;
 b=hvvYdY1PL0fyS4RRLTmmRUhhNT3vQx0CjAL9Zwqy6YLRMKVPAmU6dCZp+IAJcf64rl
 ggZyafab3kAY5FQCYZJS/Ycat5cv621DA5G9AXzII2vfhFWW5Qtwi7Pk1YwaC4mNVnaH
 ViUaQ2p3P8K3pHWQ1nnyVvELU9G2bo87S55Xl7GCkJqg/8KQEnNNnWN6CsaCR8mOBQ1X
 zQmSezMWVnVAhQj9d3U5Pc5FcJZxZAXm9T6R+Fs5iXAKtpMS+le7y8FJFIJfz7dUB8xc
 rQeAgdR4Fsqzb1KR9fY1JlOetKEUQwcwFv+HL2PnYlC8SBV3cmPa41juVPAmi4Xc12B9
 Dp5w==
X-Gm-Message-State: AOAM5309yBdTjBfmT0xpGmMUsit+M5pd0x0roR4o5tY5ctN1eGKQQ0cG
 Flt4Z8a8KQCnUOeJYLfiY5N3etBURztknI8vERfbmD/JQXox0STXE1HpZIR48vWGa6tSbH7AzSd
 6akfzN8AdS60w/axyw/u1CNAN5509q5wpUm4hX/vxWyrF8IJvPNeKcUI7vL8z9yLZ
X-Received: by 2002:a17:906:5618:: with SMTP id
 f24mr2565179ejq.517.1611644910844; 
 Mon, 25 Jan 2021 23:08:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIShTC/aUv4tHRp4gFZHI5V8L5cVU+PYPYD8hO1bqOKW5tAKImsujP2oDlb0Z+PL6A3wee8w==
X-Received: by 2002:a17:906:5618:: with SMTP id
 f24mr2565162ejq.517.1611644910486; 
 Mon, 25 Jan 2021 23:08:30 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id zg7sm9346228ejb.31.2021.01.25.23.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 23:08:29 -0800 (PST)
Subject: Re: [PATCH v9 03/11] configure: check for sys/disk.h
To: Joelle van Dyne <j@getutm.app>, Warner Losh <imp@bsdimp.com>
References: <20210126012457.39046-1-j@getutm.app>
 <20210126012457.39046-4-j@getutm.app>
 <CANCZdfqcbb5r_BmsqCN6uymBghbJg6nd1aAr1qfNryVQmfdOwQ@mail.gmail.com>
 <CA+E+eSAAaMagLdb_oUA2xS41jVLBSop-Z1AARKZ4A6uCLbqK+A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e361b373-75bd-e75d-027c-51b6562ed81c@redhat.com>
Date: Tue, 26 Jan 2021 08:08:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CA+E+eSAAaMagLdb_oUA2xS41jVLBSop-Z1AARKZ4A6uCLbqK+A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 6:55 AM, Joelle van Dyne wrote:
> Previously, the only case where sys/disk.h does not exist is on
> platforms that define __DragonFly__. However, iOS also does not have
> this header. Previously, I had it as
> 
> #if defined(__DragonFly__) || defined(CONFIG_IOS)
> 
> But there was a code review comment that we should use feature flags
> instead of platform defines. So I added the HAS_SYS_DISK_H flag.

On technical lists, it's best to avoid top-posting, and to
instead reply inline to make the conversation easier to follow.

> 
> -j
> 
> On Mon, Jan 25, 2021 at 8:35 PM Warner Losh <imp@bsdimp.com> wrote:
>>
>>
>>
>> On Mon, Jan 25, 2021 at 6:33 PM Joelle van Dyne <j@getutm.app> wrote:
>>>
>>> Some BSD platforms do not have this header.
>>>
>>> Signed-off-by: Joelle van Dyne <j@getutm.app>
>>> ---
>>>  meson.build        | 1 +
>>>  block.c            | 2 +-
>>>  block/file-posix.c | 2 +-
>>>  3 files changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 27110075df..6818d97df5 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -1117,6 +1117,7 @@ config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
>>>  config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
>>>  config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
>>>  config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
>>> +config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
>>>
>>>  ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
>>>  arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
>>> diff --git a/block.c b/block.c
>>> index 8b9d457546..c4cf391dea 100644
>>> --- a/block.c
>>> +++ b/block.c
>>> @@ -54,7 +54,7 @@
>>>  #ifdef CONFIG_BSD
>>>  #include <sys/ioctl.h>
>>>  #include <sys/queue.h>
>>> -#ifndef __DragonFly__
>>> +#if defined(HAVE_SYS_DISK_H)
>>>  #include <sys/disk.h>
>>>  #endif
>>>  #endif
>>> diff --git a/block/file-posix.c b/block/file-posix.c
>>> index 11d2021346..666d3e7504 100644
>>> --- a/block/file-posix.c
>>> +++ b/block/file-posix.c
>>> @@ -2320,7 +2320,7 @@ again:
>>>          }
>>>          if (size == 0)
>>>  #endif
>>> -#if defined(__APPLE__) && defined(__MACH__)
>>> +#if defined(HAVE_SYS_DISK_H) && defined(__APPLE__) && defined(__MACH__)
>>
>>
>> Why is this needed? __DragonFly__ doesn't define either __APPLE__ or __MACH__

Hmm we could also add:

  config_host_data.set('HAVE_DKIOCGETBLOCKCOUNT', cc.compiles(...))

Then this block would be easier to read:

  #if defined(HAVE_DKIOCGETBLOCKCOUNT)
  ...

(Maybe this is what Warner meant?)

>>
>> Warner
>>
>>>
>>>          {
>>>              uint64_t sectors = 0;
>>>              uint32_t sector_size = 0;
>>> --
>>> 2.28.0
>>>
>>>
> 


