Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC43FEC21
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:28:55 +0200 (CEST)
Received: from localhost ([::1]:34322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjxm-0007c2-QS
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLjtl-0002zF-5E
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:24:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLjth-0003Ad-AP
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630578280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FcW6tk//vWUq5OGy1EaoTC/0Mw8+XRKa3O7s8dnhtQQ=;
 b=UzkJ1IGu5HnhIqe/R7kh/lEIsuXz15wynB6siCmQfBoUzPI7I8GJJO8Ic28o7lQ+KZMZQ1
 YDSuJwdSRHxcQGhDL+subF5wDoUIRMgDKUXJQn25+WKo6Hx4yOoo9Y3hihUzNVitRXTjFh
 hY6P/FAU3q1uLB9DqC2HfkWYPdBXcgI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-8Nl-3rrUNfeOr_YMK5r83w-1; Thu, 02 Sep 2021 06:24:37 -0400
X-MC-Unique: 8Nl-3rrUNfeOr_YMK5r83w-1
Received: by mail-wm1-f69.google.com with SMTP id
 j135-20020a1c238d000000b002e87aa95b5aso800826wmj.4
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 03:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FcW6tk//vWUq5OGy1EaoTC/0Mw8+XRKa3O7s8dnhtQQ=;
 b=X1hDvH9sR3cs40CVw/0JuW0ZSbdOUAu3dSZDqk5h4uIWSlBrqkrf8avCfKWQ/BYlYv
 kuTknLWMCdCma1nWvpD0Kxb/nWdBS7RbsS2rm0VpdlAM1oCWtCl0PDAmoQ64tiAIAibF
 lum9/nk/jW9grBNk1Lqjny9wS82F6HzWVPkrS2ikIgsdbKJoUvLfs/SGeMf0ex7jyL9N
 MA2CDMocITVK4y6HXO/o0bPhjbLqCHKG2ItVUiajID59wNmV7VOydy+Mr0LTQpBrMRCX
 343NcmKkjxP5AhlFT/WnV0qNXqsswhwzxJ8oKxCx8GTWkwSJmftLX7SFkOcH/9xX7Al9
 qmCQ==
X-Gm-Message-State: AOAM531/rN8UZdOeH490mbWr64++jT51xYLFCW/7QurrKkOTU+wRETB4
 OGSE66nS0LJOwaH9ZKD9G90294yIjsM8DDI3X6FYP4pnXPNXPSntiXsFEa+mX1fUnaTCagK2e2S
 84rNDNI35TFzHEQA=
X-Received: by 2002:a05:6000:188d:: with SMTP id
 a13mr2835593wri.99.1630578276349; 
 Thu, 02 Sep 2021 03:24:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnTTlwjUIvSYpDNJ3dlkzE8JdpY5NU7wnZV7UbK0Z51pQn7A7owXadfG1fcVnutdhIdFPkxA==
X-Received: by 2002:a05:6000:188d:: with SMTP id
 a13mr2835567wri.99.1630578276065; 
 Thu, 02 Sep 2021 03:24:36 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id i5sm1118635wmq.17.2021.09.02.03.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 03:24:35 -0700 (PDT)
Subject: Re: [PATCH] coroutine: resize pool periodically instead of limiting
 size
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210901160923.525651-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <629ed7db-64bc-b64f-6454-1167c21111ee@redhat.com>
Date: Thu, 2 Sep 2021 12:24:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901160923.525651-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.029,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Tingting Mao <timao@redhat.com>,
 Honghao Wang <wanghonghao@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 6:09 PM, Stefan Hajnoczi wrote:
> It was reported that enabling SafeStack reduces IOPS significantly
> (>25%) with the following fio benchmark on virtio-blk using a NVMe host
> block device:
> 
>   # fio --rw=randrw --bs=4k --iodepth=64 --runtime=1m --direct=1 \
> 	--filename=/dev/vdb --name=job1 --ioengine=libaio --thread \
> 	--group_reporting --numjobs=16 --time_based \
>         --output=/tmp/fio_result
> 
> Serge Guelton and I found that SafeStack is not really at fault, it just
> increases the cost of coroutine creation. This fio workload exhausts the
> coroutine pool and coroutine creation becomes a bottleneck. Previous
> work by Honghao Wang also pointed to excessive coroutine creation.
> 
> Creating new coroutines is expensive due to allocating new stacks with
> mmap(2) and mprotect(2). Currently there are thread-local and global
> pools that recycle old Coroutine objects and their stacks but the
> hardcoded size limit of 64 for thread-local pools and 128 for the global
> pool is insufficient for the fio benchmark shown above.
> 
> This patch changes the coroutine pool algorithm to a simple thread-local
> pool without a size limit. Threads periodically shrink the pool down to
> a size sufficient for the maximum observed number of coroutines.
> 
> This is a very simple algorithm. Fancier things could be done like
> keeping a minimum number of coroutines around to avoid latency when a
> new coroutine is created after a long period of inactivity. Another
> thought is to stop the timer when the pool size is zero for power saving
> on threads that aren't using coroutines. However, I'd rather not add
> bells and whistles unless they are really necessary.
> 
> The global pool is removed by this patch. It can help to hide the fact
> that local pools are easily exhausted, but it's doesn't fix the root
> cause. I don't think there is a need for a global pool because QEMU's
> threads are long-lived, so let's keep things simple.
> 
> Performance of the above fio benchmark is as follows:
> 
>       Before   After
> IOPS     60k     97k
> 
> Memory usage varies over time as needed by the workload:
> 
>             VSZ (KB)             RSS (KB)
> Before fio  4705248              843128
> During fio  5747668 (+ ~100 MB)  849280
> After fio   4694996 (- ~100 MB)  845184
> 
> This confirms that coroutines are indeed being freed when no longer
> needed.
> 
> Thanks to Serge Guelton for working on identifying the bottleneck with
> me!
> 
> Reported-by: Tingting Mao <timao@redhat.com>
> Cc: Serge Guelton <sguelton@redhat.com>
> Cc: Honghao Wang <wanghonghao@bytedance.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/qemu/coroutine-pool-timer.h | 36 +++++++++++++++++
>  include/qemu/coroutine.h            |  7 ++++
>  iothread.c                          |  6 +++
>  util/coroutine-pool-timer.c         | 35 ++++++++++++++++
>  util/main-loop.c                    |  5 +++
>  util/qemu-coroutine.c               | 62 ++++++++++++++---------------
>  util/meson.build                    |  1 +
>  7 files changed, 119 insertions(+), 33 deletions(-)
>  create mode 100644 include/qemu/coroutine-pool-timer.h
>  create mode 100644 util/coroutine-pool-timer.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


