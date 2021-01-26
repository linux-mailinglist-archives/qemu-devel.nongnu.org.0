Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493913035E7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 06:57:07 +0100 (CET)
Received: from localhost ([::1]:54420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4HLd-0007Ds-Sj
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 00:57:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1l4HKQ-0006hG-U1; Tue, 26 Jan 2021 00:55:50 -0500
Received: from mail-io1-f50.google.com ([209.85.166.50]:39292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1l4HKP-0008Ia-39; Tue, 26 Jan 2021 00:55:50 -0500
Received: by mail-io1-f50.google.com with SMTP id e22so31473855iog.6;
 Mon, 25 Jan 2021 21:55:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wDwqpZ23EVuBY/XjeXlWxNVssghHMRyXqKqjO0vFlf4=;
 b=bq8MVt63A6prvH1PxqmRqITABk9xGxSOgzz9Wu5x44nM2HHD/1V9NpNLGSRsq2K3fc
 8tz7ReGLxM+MJvmbYPaxkewfXAAe+uaeCiWkNKgDCuFrl+hVkA/26lnboyPOjDG1lYEG
 635e8ayyAh0qdWCr40BmebJ4RK/FYqCwC3U6rKqw3mQVYrgu79YU4r1stTqLU+er8WaV
 YAn0kyhhK60Cw79ywP70kTV2XaQwel2QAtqfYteLCRquxoN2z709NOVvENTmto3zfIRV
 8CQbFtIq3KQcBg3gCluOKil7p05kNUXqLRW9otE5B5HFIGjgBcWv5nt3odFdYTW7wawB
 HqVA==
X-Gm-Message-State: AOAM5303MUCdLlvczEDODz0SZ/MM2Edok4a1iPW5azsf0QYKrXOYHe64
 BrAgMVBHDnN+lleAh0W0dcin73q6k6k=
X-Google-Smtp-Source: ABdhPJzELcJ4PiR1hGSHEXeyrDkfjtGLVNqsZTV1SUDTEzDa6FWOcNKCJy+uGvlv8auJwshKq577SA==
X-Received: by 2002:a02:9107:: with SMTP id a7mr3617861jag.12.1611640547224;
 Mon, 25 Jan 2021 21:55:47 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45])
 by smtp.gmail.com with ESMTPSA id h11sm1308931ior.19.2021.01.25.21.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 21:55:46 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id 16so971047ioz.5;
 Mon, 25 Jan 2021 21:55:46 -0800 (PST)
X-Received: by 2002:a02:781f:: with SMTP id p31mr3608666jac.14.1611640546377; 
 Mon, 25 Jan 2021 21:55:46 -0800 (PST)
MIME-Version: 1.0
References: <20210126012457.39046-1-j@getutm.app>
 <20210126012457.39046-4-j@getutm.app>
 <CANCZdfqcbb5r_BmsqCN6uymBghbJg6nd1aAr1qfNryVQmfdOwQ@mail.gmail.com>
In-Reply-To: <CANCZdfqcbb5r_BmsqCN6uymBghbJg6nd1aAr1qfNryVQmfdOwQ@mail.gmail.com>
From: Joelle van Dyne <j@getutm.app>
Date: Mon, 25 Jan 2021 21:55:35 -0800
X-Gmail-Original-Message-ID: <CA+E+eSAAaMagLdb_oUA2xS41jVLBSop-Z1AARKZ4A6uCLbqK+A@mail.gmail.com>
Message-ID: <CA+E+eSAAaMagLdb_oUA2xS41jVLBSop-Z1AARKZ4A6uCLbqK+A@mail.gmail.com>
Subject: Re: [PATCH v9 03/11] configure: check for sys/disk.h
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.50; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f50.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Joelle van Dyne <j@getutm.app>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously, the only case where sys/disk.h does not exist is on
platforms that define __DragonFly__. However, iOS also does not have
this header. Previously, I had it as

#if defined(__DragonFly__) || defined(CONFIG_IOS)

But there was a code review comment that we should use feature flags
instead of platform defines. So I added the HAS_SYS_DISK_H flag.

-j

On Mon, Jan 25, 2021 at 8:35 PM Warner Losh <imp@bsdimp.com> wrote:
>
>
>
> On Mon, Jan 25, 2021 at 6:33 PM Joelle van Dyne <j@getutm.app> wrote:
>>
>> Some BSD platforms do not have this header.
>>
>> Signed-off-by: Joelle van Dyne <j@getutm.app>
>> ---
>>  meson.build        | 1 +
>>  block.c            | 2 +-
>>  block/file-posix.c | 2 +-
>>  3 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 27110075df..6818d97df5 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1117,6 +1117,7 @@ config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
>>  config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
>>  config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
>>  config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
>> +config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
>>
>>  ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
>>  arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
>> diff --git a/block.c b/block.c
>> index 8b9d457546..c4cf391dea 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -54,7 +54,7 @@
>>  #ifdef CONFIG_BSD
>>  #include <sys/ioctl.h>
>>  #include <sys/queue.h>
>> -#ifndef __DragonFly__
>> +#if defined(HAVE_SYS_DISK_H)
>>  #include <sys/disk.h>
>>  #endif
>>  #endif
>> diff --git a/block/file-posix.c b/block/file-posix.c
>> index 11d2021346..666d3e7504 100644
>> --- a/block/file-posix.c
>> +++ b/block/file-posix.c
>> @@ -2320,7 +2320,7 @@ again:
>>          }
>>          if (size == 0)
>>  #endif
>> -#if defined(__APPLE__) && defined(__MACH__)
>> +#if defined(HAVE_SYS_DISK_H) && defined(__APPLE__) && defined(__MACH__)
>
>
> Why is this needed? __DragonFly__ doesn't define either __APPLE__ or __MACH__
>
> Warner
>
>>
>>          {
>>              uint64_t sectors = 0;
>>              uint32_t sector_size = 0;
>> --
>> 2.28.0
>>
>>

