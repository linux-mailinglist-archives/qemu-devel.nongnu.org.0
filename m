Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55A24D9FD3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 17:21:13 +0100 (CET)
Received: from localhost ([::1]:46520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU9v6-0005AL-TL
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 12:21:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nU9q4-0002AF-EG
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 12:16:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nU9q2-0008A2-MA
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 12:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647360958;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WKdmj2ZK1JI+Z0B5jrJLBqELUKbqUqQZLGW+9aAjhLE=;
 b=D9KCh9/63ww6MCNPiYY/qZLQIBGGfOgFrBvI4eKVwDYAwcr8gsL+Z0hIvHnb9zWXphqGQl
 cxZeTK4DWk9lm4JH3NuTt7vHtBXPXXeYgU8mjStgKKFFZhNpjAIdJejdyMrR5+2tdcNxJL
 mXTWD6WtLom17m12OCk9ctKXJg0vnGc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-P_RyvGFVP3qtzZruGKyoeQ-1; Tue, 15 Mar 2022 12:15:51 -0400
X-MC-Unique: P_RyvGFVP3qtzZruGKyoeQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6807801E80;
 Tue, 15 Mar 2022 16:15:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84496141DEDA;
 Tue, 15 Mar 2022 16:15:49 +0000 (UTC)
Date: Tue, 15 Mar 2022 16:15:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Message-ID: <YjC7sorD36xWfhHD@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 10:31:47AM +0100, Paolo Bonzini wrote:
> However, there  are no ramifications to actual coroutine code, except
> for the template syntax "CoroutineFn<return_type>" for the function and
> the mandatory co_await/co_return keywords... both of which are an
> improvement, really: the fact that a single function cannot run either
> inside or outside coroutines is checked by the compiler now, because
> qemu_coroutine_create accepts a function that returns CoroutineFn<void>.
> Therefore I had to disable some more code in util/ and qapi/ that used
> qemu_in_coroutine() or coroutine_fn.

Bear with me as I suggest something potentially/probably silly
given my limited knowledge of C++ coroutines.

Given a function I know about:

  void coroutine_fn qio_channel_yield(QIOChannel *ioc,
                                      GIOCondition condition);

IIUC, you previously indicated that the header file declaration,
the implementation and any callers of this would need to be in
C++ source files.

The caller is what I'm most curious about, because I feel that
is where the big ripple effects come into play that cause large
parts of QEMU to become C++ code.

In general it is possible to call C++ functions from C.

I presume there is something special about the CoroutineFn<void>
prototype preventing that from working as needed, thus requiring
the caller to be compiled as C++ ? IIUC compiling as C++ though
is not neccessarily the same as using C++ linkage.

So I'm assuming the caller as C++ requirement is not recursive,
otherwise it would immediately mean all of QEMU needs to be C++.

This leads me to wonder if we can workaround this problem with
a wrapper function. eg in a io/channel.hpp file can be declare
something like:

  CoroutineFn<void> qio_channel_yield_impl(QIOChannel *ioc,
                                           GIOCondition condition);

  extern "C" {
    static inline void qio_chanel_yield(QIOChannel *ioc,
                                        GIOCondition condition) {
      qio_channel_yield_impl(ioc, condition)
    }
  }

With this qio_channel_yield_impl and qio_channel_yield are both
compiled as C++, but qio_channel_yield is exposed with C linkage
semantics. Thus enabling callers of qio_channel_yield can carry
on being compiled as C, since the invokation of the CoroutineFn
is in the inline C++ function ?

This would mean an extra function call, but perhaps this gets
optimized away, espeically with LTO, such that it doesn't impact
performance negatively ?

The impl of qio_channel_yield_impl() could also call from C++
back to C functions as much as possible.

IOW, can we get it such that the C++ bit is just a thin shim
"C -> C++ wrapper -> C++ CoroutineFn -> C", enabling all the
C++ bits to be well encapsulated and thus prevent arbitrary
usage of C++ features leaking all across the codebase ?

With Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


