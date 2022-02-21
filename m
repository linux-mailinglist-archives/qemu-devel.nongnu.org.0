Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0B14BD95A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 12:16:21 +0100 (CET)
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM6fz-0000o8-Kp
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 06:16:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nM6bz-0007xo-Gc
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 06:12:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nM6bv-0000mg-Sb
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 06:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645441926;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=T9Yv+kYSzkaMXXLe5cCWWbX9QfJoNtNAlxOI8Hjt4uo=;
 b=NYbvoDNLzGcWyxzIhYNzhJ9gGPD1RMrNWRbA0bj9+vcfA32fFeeOltRhoj92VlgppfaroB
 93LR1IPAMQwcGUl1ITIEkE0RDhhmnCVjUeiBqeZXkFRgfVZIBh6qEGOal387mCXvN5GoRj
 dTY0Z7X7BC4z23M4fYiEZgswEc5g9vQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-2dbrB4pdMSupIn7vMo4YJw-1; Mon, 21 Feb 2022 06:12:02 -0500
X-MC-Unique: 2dbrB4pdMSupIn7vMo4YJw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77D061091DA0;
 Mon, 21 Feb 2022 11:12:01 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B6707B9CF;
 Mon, 21 Feb 2022 11:11:55 +0000 (UTC)
Date: Mon, 21 Feb 2022 11:11:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [RFC 1/2] sem-posix: remove the posix semaphore support
Message-ID: <YhNzd6bGT2ejTRLx@redhat.com>
References: <20220221095617.1974-1-longpeng2@huawei.com>
 <20220221095617.1974-2-longpeng2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220221095617.1974-2-longpeng2@huawei.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: pbonzini@redhat.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 21, 2022 at 05:56:16PM +0800, Longpeng(Mike) via wrote:
> POSIX specifies an absolute time for sem_timedwait(), it would be
> affected if the system time is changing, but there is not a relative
> time or monotonic clock version of sem_timedwait, so we cannot gain
> from POSIX semaphore anymore.

It doesn't appear in any man pages on my systems, but there is a
new-ish API  sem_clockwait() that accepts a choice of clock as a
parameter.

This is apparently a proposed POSIX standard API introduced in
glibc 2.30, along with several others:

https://sourceware.org/legacy-ml/libc-announce/2019/msg00001.html

[quote]
* Add new POSIX-proposed pthread_cond_clockwait, pthread_mutex_clocklock,
  pthread_rwlock_clockrdlock, pthread_rwlock_clockwrlock and sem_clockwait
  functions.  These behave similarly to their "timed" equivalents, but also
  accept a clockid_t parameter to determine which clock their timeout should
  be measured against.  All functions allow waiting against CLOCK_MONOTONIC
  and CLOCK_REALTIME.  The decision of which clock to be used is made at the
  time of the wait (unlike with pthread_condattr_setclock, which requires
  the clock choice at initialization time).
[/quote]

> diff --git a/include/qemu/thread-posix.h b/include/qemu/thread-posix.h
> index b792e6e..5466608 100644
> --- a/include/qemu/thread-posix.h
> +++ b/include/qemu/thread-posix.h
> @@ -27,13 +27,9 @@ struct QemuCond {
>  };
>  
>  struct QemuSemaphore {
> -#ifndef CONFIG_SEM_TIMEDWAIT
>      pthread_mutex_t lock;
>      pthread_cond_t cond;
>      unsigned int count;
> -#else
> -    sem_t sem;
> -#endif
>      bool initialized;
>  };

As a point of history, the original  code only used sem_t. The pthreads
based fallback was introduced by Paolo in

  commit c166cb72f1676855816340666c3b618beef4b976
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Fri Nov 2 15:43:21 2012 +0100

    semaphore: implement fallback counting semaphores with mutex+condvar
    
    OpenBSD and Darwin do not have sem_timedwait.  Implement a fallback
    for them.
    
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
    Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>

I'm going to assume this fallback impl is less efficient than the
native sem_t impl as the reason for leaving the original impl, or
maybe Paolo just want to risk accidental bugs by removing the
existing usage ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


