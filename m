Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131C33A83CA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:18:10 +0200 (CEST)
Received: from localhost ([::1]:44268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltApM-0000p0-VG
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltAn5-0007pC-Sx
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:15:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltAmz-000384-NZ
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623770141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XQxhxFT1X6Clq/T6ILL6eCVuQ0yhuCubF94KC9IVDw0=;
 b=ixu26kdO9zeie1igfCKlePPYlPhn9/dfaymxF5D5clNUu14IgjUTdoFxazjx3jcoZ/pRS4
 MFWuIpNaG2Pgg0E2vXCyTAhunR5EX9yYuI3zZTFlQXIIIrqjXTOJuPV1LIH+AMSNCdb68F
 I6SYHgqYsgTjx/U5b8hry4K60d/8y90=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-gbC4tx7XMau-RXjk9Cvlng-1; Tue, 15 Jun 2021 11:15:39 -0400
X-MC-Unique: gbC4tx7XMau-RXjk9Cvlng-1
Received: by mail-ed1-f69.google.com with SMTP id
 dd28-20020a056402313cb029038fc9850034so22498970edb.7
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XQxhxFT1X6Clq/T6ILL6eCVuQ0yhuCubF94KC9IVDw0=;
 b=a4SBVwDzlsW2feZeeDMRMG/LQgbofqw2U4+EOkNgGtctojCr9jtX2gCMuWI8FTPhSX
 cZRcLCRxhi/RBYDIFdGGfrHcIa7jIrfwWCKhwTUC06XBfvOlp/Rtuw8gIXkmIDsBARkC
 wOHI8kG43rQI/aQvL2ni7o0mE9s+snk6Ns8kadfc3Lh8oogCPvt38Qn7+4l1iFAO05VA
 Bk3UJV6oIHWcN2wgx0yTztfGmv1y9dMLjlUP4o+kczehLnt+86o8qd34+E6pNCF79dsi
 22xx7B+Cz+3tgzjXuaSKgCy7rlU051UGkUeWWRkDB7RL4GSVmDOiD3bctBlYFRo96Gyg
 AtYw==
X-Gm-Message-State: AOAM531idweC1gfTbmr89rSnaD/uZzmbBK2XJtH9/AGKaiN/BmzaTCqR
 aJzSjB33Z4EwEK3BBCbK9kmKv8gf8j1q0RUOuYcpszU7DJxJzhgDAZgj7HN8uJVm378XLr34ntI
 bbdQFF204cvozdENt3r6R3bzl1rWcmcfXbN9Q4AYSZfRk9bcWuyLzO4Fd6jWUEeKm/5c=
X-Received: by 2002:a17:906:e253:: with SMTP id
 gq19mr44554ejb.138.1623770138536; 
 Tue, 15 Jun 2021 08:15:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZIkN4PFr9shU81fHmVXchPJBkpPy5AsH9TYo9UYYK16V0s/8kiAjGGXzrtIKkM3yYYhmG7Q==
X-Received: by 2002:a17:906:e253:: with SMTP id
 gq19mr44535ejb.138.1623770138367; 
 Tue, 15 Jun 2021 08:15:38 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b25sm12327831edv.9.2021.06.15.08.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 08:15:37 -0700 (PDT)
Subject: Re: [PATCH 19/26] configure: convert compiler tests to meson, part 1
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-20-pbonzini@redhat.com> <YMjAYMEGpegs05Dr@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c119b15d-fd19-962c-08a6-d25fe30ccc82@redhat.com>
Date: Tue, 15 Jun 2021 17:15:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMjAYMEGpegs05Dr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/06/21 16:59, Daniel P. Berrangé wrote:
>>   config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
>>   
>> +config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
> 
> Why add this here rather than with the other CONFIG_ checks ?

Because despite the different name it's just a header check.  I chose to 
keep similar cc.has_* symbols together, and sorthed them alphabetically. 
  It should in theory make it easier to look for examples when adding 
new tests to meson.build.

>>   config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
>>   config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
>>   config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
>> @@ -1267,9 +1270,39 @@ config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
>>   config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
>>   config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
>>   
>> +config_host_data.set('CONFIG_CLOCK_ADJTIME', cc.has_function('clock_adjtime'))
>> +config_host_data.set('CONFIG_DUP3', cc.has_function('dup3'))
>> +config_host_data.set('CONFIG_FALLOCATE', cc.has_function('fallocate'))
>> +config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'))
>> +config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
>>   config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
>> +config_host_data.set('CONFIG_SENDFILE', cc.has_function('sendfile'))
>> +config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and cc.has_function('unshare'))
>> +config_host_data.set('CONFIG_SYNCFS', cc.has_function('syncfs'))
>> +config_host_data.set('CONFIG_SYNC_FILE_RANGE', cc.has_function('sync_file_range'))
>> +config_host_data.set('CONFIG_TIMERFD', cc.has_function('timerfd_create'))
>> +config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
>>   config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
> 
> This function looks even more out of place
> 
>>   
>> +config_host_data.set('CONFIG_BYTESWAP_H',
>> +                     cc.has_header_symbol('byteswap.h', 'bswap_32'))
>> +config_host_data.set('CONFIG_EPOLL_CREATE1',
>> +                     cc.has_header_symbol('sys/epoll.h', 'epoll_create1'))
> 
> Why not sort next to CONFIG_EPOLL
> 
>> +config_host_data.set('CONFIG_FALLOCATE_PUNCH_HOLE',
>> +                     cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_PUNCH_HOLE') and
>> +                     cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_KEEP_SIZE'))
>> +config_host_data.set('CONFIG_FALLOCATE_ZERO_RANGE',
>> +                     cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_ZERO_RANGE'))
> 
> And next to CONFIG_FALLOCATE ?
> 
>> +config_host_data.set('CONFIG_FIEMAP',
>> +                     cc.has_header('linux/fiemap.h') and
>> +                     cc.has_header_symbol('linux/fs.h', 'FS_IOC_FIEMAP'))
>> +config_host_data.set('CONFIG_MACHINE_BSWAP_H',
>> +                     cc.has_header_symbol('machine/bswap.h', 'bswap32',
>> +                                          prefix: '''#include <sys/endian.h>
>> +                                                     #include <sys/types.h>'''))
>> +config_host_data.set('CONFIG_PRCTL_PR_SET_TIMERSLACK',
>> +                     cc.has_header_symbol('sys/prctl.h', 'PR_SET_TIMERSLACK'))
>> +
>>   # Some versions of Mac OS X incorrectly define SIZE_MAX
>>   config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
>>       #include <stdint.h>
>> diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
>> index 47fdae5b21..cf65a0b161 100644
>> --- a/ui/vnc-auth-sasl.c
>> +++ b/ui/vnc-auth-sasl.c
>> @@ -33,7 +33,7 @@
>>    * files that use SASL API need to disable -Wdeprecated-declarations.
>>    */
>>   #ifdef CONFIG_DARWIN
>> -#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
>> +#pragma GCC diagnostic warning "-Wdeprecated-declarations"
> 
> Why this change now ?

Botched rebase.

>>   #endif
>>   
>>   /* Max amount of data we send/recv for SASL steps to prevent DOS */
>> diff --git a/util/meson.build b/util/meson.build
>> index 97fad44105..7fe9da60ab 100644
>> --- a/util/meson.build
>> +++ b/util/meson.build
>> @@ -3,7 +3,9 @@ util_ss.add(files('osdep.c', 'cutils.c', 'unicode.c', 'qemu-timer-common.c'))
>>   util_ss.add(when: 'CONFIG_ATOMIC64', if_false: files('atomic64.c'))
>>   util_ss.add(when: 'CONFIG_POSIX', if_true: files('aio-posix.c'))
>>   util_ss.add(when: 'CONFIG_POSIX', if_true: files('fdmon-poll.c'))
>> -util_ss.add(when: 'CONFIG_EPOLL_CREATE1', if_true: files('fdmon-epoll.c'))
>> +if config_host_data.get('CONFIG_EPOLL_CREATE1')
>> +  util_ss.add(files('fdmon-epoll.c'))
>> +endif
> 
> 
> Why does this need to change  ?

Because CONFIG_EPOLL_CREATE1 is not anymore part of config-host.mak 
(which is where config_host comes from; "when" clauses look at config_host).

>>   util_ss.add(when: ['CONFIG_LINUX_IO_URING', linux_io_uring], if_true: files('fdmon-io_uring.c'))
>>   util_ss.add(when: 'CONFIG_POSIX', if_true: files('compatfd.c'))
>>   util_ss.add(when: 'CONFIG_POSIX', if_true: files('event_notifier-posix.c'))
> 
> Regards,
> Daniel
> 


