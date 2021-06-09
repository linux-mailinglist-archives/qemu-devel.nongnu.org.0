Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68103A141F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:18:51 +0200 (CEST)
Received: from localhost ([::1]:33246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxAY-00010x-PO
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqx9J-0006ye-3y
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:17:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqx9E-0000Ap-1v
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623241046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+5qTwneeYksEp0OTTvWXty3HzzO/mhZR9rzK7LRn9+U=;
 b=goqiiaVLm4JunPfjhAYFoSSM0+GI5hH3TYQyD1R3xHsMYeqhye9gw9YaxmW31+RAieBPm4
 0Onz9wXpV7sOmJAAFMzfaj7FpBv9rzsPbaNf4cNLAAsrQaXvPUspHcYbNEo80xtL7+t5jG
 IbftGQUMHfMzz5HxXU4XESnS4ypZnpE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-4MSyVPceNsuJDGTPCnyrmQ-1; Wed, 09 Jun 2021 08:17:25 -0400
X-MC-Unique: 4MSyVPceNsuJDGTPCnyrmQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 z13-20020adfec8d0000b0290114cc6b21c4so10640967wrn.22
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 05:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+5qTwneeYksEp0OTTvWXty3HzzO/mhZR9rzK7LRn9+U=;
 b=VxnmYxkaouREt9HaDC3SpDq854+LzezmMeYOFCRr3bbHVPxLTcvsB5qtxwPdy14yWb
 X/9CXNpzeEs7lhy+nZebp8VbQxycLFrlD7WNpTMdYXpACE5EweupWJu6+efRjEVqXaVI
 mq2iI67UgNHEvg7/Exzs58RPrSiqwKm9Ve/TWJe3kAfjEFJ9GDvwKQbxLue8YI7u0yz9
 fcBIx++kZW1PFM9TiDPJGIZ3ymOox30K1HZjlpoXzcqJYEWrGnXPg/j641at72lKUDhY
 0fJoWa3UhmXza5tjHMm4LYkKVDECCMVt2ucQtFf7jXIkgznH+3O6hZuGKoJq6YNAVU6j
 hzbw==
X-Gm-Message-State: AOAM5324WgKhShPVI0x+BFBkS4mqnBJbQegrYEWKTsA00MTl3Vk3bjTu
 HYi+xfCHLxKyclerx06axdtlg2DbvSFoogQWNuYLB2EE00K6yMJrDwJ97dAscv5as6/n6/Owrr8
 TLqjFKe6vtmf7ib4=
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr27587313wmj.184.1623241044624; 
 Wed, 09 Jun 2021 05:17:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAZNhq52SJV36buontqGscQCHbvpYZVpV+5htp294SHN9FBLsrz2ajKAaFDj1BQYLZ28+o9Q==
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr27587293wmj.184.1623241044464; 
 Wed, 09 Jun 2021 05:17:24 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k36sm12033036wms.30.2021.06.09.05.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 05:17:23 -0700 (PDT)
Subject: Re: [PATCH v3 06/33] util/async: aio_co_schedule(): support
 reschedule in same ctx
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-7-vsementsov@virtuozzo.com>
 <32f2b6f0-2c31-942d-cbe2-81eda2a43fc0@redhat.com>
 <19ff6e67-e548-14df-ac7e-8b0a3bf7a798@virtuozzo.com>
 <ef518e01-4f08-5fe7-b226-e70ab3102ca4@redhat.com>
 <52ba34c5-1de8-21b3-a31c-bf51676c29af@virtuozzo.com>
 <154cff7e-3552-5cb1-4d96-8dae3c1607cb@redhat.com>
 <008cbc78-aebe-e2fa-8fb3-f8cbdc6daf31@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c4e225f8-a78f-ce97-5c07-3c091f28c613@redhat.com>
Date: Wed, 9 Jun 2021 14:17:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <008cbc78-aebe-e2fa-8fb3-f8cbdc6daf31@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 mreitz@redhat.com, rvkagan@yandex-team.ru,
 Stefan Hajnoczi <stefanha@redhat.com>, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/21 12:24, Vladimir Sementsov-Ogievskiy wrote:
> Thanks, I'll base v4 of nbd patches on it.
> 
> I now run make check. test-aio-multithread crashes on assertion:

With the patch I've sent it doesn't, so hopefully you can go ahead.

Paolo

> (gdb) bt
> #0  0x00007f4af8d839d5 in raise () from /lib64/libc.so.6
> #1  0x00007f4af8d6c8a4 in abort () from /lib64/libc.so.6
> #2  0x00007f4af8d6c789 in __assert_fail_base.cold () from /lib64/libc.so.6
> #3  0x00007f4af8d7c026 in __assert_fail () from /lib64/libc.so.6
> #4  0x000055daebfdab95 in aio_poll (ctx=0x7f4ae0000b60, blocking=true) 
> at ../util/aio-posix.c:567
> #5  0x000055daebea096c in iothread_run (opaque=0x55daed81bc90) at 
> ../tests/unit/iothread.c:91
> #6  0x000055daebfc6c4a in qemu_thread_start (args=0x55daed7d9940) at 
> ../util/qemu-thread-posix.c:521
> #7  0x00007f4af8f1a3f9 in start_thread () from /lib64/libpthread.so.0
> #8  0x00007f4af8e47b53 in clone () from /lib64/libc.so.6
> (gdb) fr 4
> #4  0x000055daebfdab95 in aio_poll (ctx=0x7f4ae0000b60, blocking=true) 
> at ../util/aio-posix.c:567
> 567         assert(in_aio_context_home_thread(ctx == 
> iohandler_get_aio_context() ?
> (gdb) list
> 562          *
> 563          * aio_poll() may only be called in the AioContext's thread. 
> iohandler_ctx
> 564          * is special in that it runs in the main thread, but that 
> thread's context
> 565          * is qemu_aio_context.
> 566          */
> 567         assert(in_aio_context_home_thread(ctx == 
> iohandler_get_aio_context() ?
> 568                                           qemu_get_aio_context() : 
> ctx));
> 569
> 570         qemu_lockcnt_inc(&ctx->list_lock);


