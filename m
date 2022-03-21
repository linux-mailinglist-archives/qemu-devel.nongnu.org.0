Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F14E2E20
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:33:39 +0100 (CET)
Received: from localhost ([::1]:39572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKyQ-000114-1z
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:33:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWKvq-00072x-BL
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:30:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWKvm-0004H1-Sb
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647880253;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9meNV+bnDqDMviOgxcAYtUOqh27nKFZZDnH50+7AQxY=;
 b=VQ6M6ThdEnB7yRb02qstHQG4PsAEzDaBn7xlXlLqZedmLoemDO+GaEbkN5qm5vhxrePmXA
 xJ369rBdm3hSFzvtr9FbmhbwG8OVKqLNdJFHjx3iX5ELyhnvqoZUxg8ipHdpCJbgbqvETF
 SxF63lSTHHG8m6C8dgLcbs3ZxokmmZk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-DvWOa_rjMZG1UANSBGm6JQ-1; Mon, 21 Mar 2022 12:30:47 -0400
X-MC-Unique: DvWOa_rjMZG1UANSBGm6JQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C90481C03370;
 Mon, 21 Mar 2022 16:30:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE3CC40CF8FB;
 Mon, 21 Mar 2022 16:30:45 +0000 (UTC)
Date: Mon, 21 Mar 2022 16:30:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: comparison of coroutine backends
Message-ID: <YjioM9mf60OEoP74@redhat.com>
References: <8e98ff69-2f35-72c1-9b68-2a6a19ed716b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8e98ff69-2f35-72c1-9b68-2a6a19ed716b@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 09:48:37AM +0100, Paolo Bonzini wrote:
> Hi all,
> 
> based on the previous discussions here is a comparison of the various
> possibilities for implementing coroutine backends in QEMU and the
> respective advantages and disadvantages.
> 
> I'm adding a third possibility for stackless coroutines, which is to
> use the LLVM/clang builtins.  I believe that would still require a
> source-to-source translator, but it would offload to the compiler the
> complicated bits such as liveness analysis.
> 
> 1) Stackful coroutines:
> Advantages:
> - no changes to current code
> 
> Disadvantages:
> - portability issues regarding shadow stacks (SafeStack, CET)
> - portability/nonconformance issues regarding TLS
> 
> Another possible advantage is that it allows using the same function for
> both coroutine and non-coroutine context.  I'm listing this separately
> because I'm not sure that's desirable, as it prevents compile-time
> checking of calls to coroutine_fn.  Compile-time checking would be
> possible using clang -fthread-safety if we forgo the ability to use the
> same function in both scenarios.
> 
> 
> 2) "Duff's device" stackless coroutines
> Advantages:
> - no portability issues regarding both shadow stacks and TLS
> - compiles to good old C code
> - compile-time checking of "coroutine-only" but not awaitable functions
> - debuggability: stack frames should be easy to inspect
> 
> Disadvantages:
> - complex source-to-source translator

I guess I'm still a bit fuzzy on the actual implications of this
point. Is this a one time hit to write it, or is it something
that is going to need periodic (even frequent) updates to cope
with new places in which we use coroutines  ? Presumably most
maintainers won't have to care about / look at the details of
it ?

> - more complex build process
> 
> 
> 3) C++20 stackless coroutines
> Advantages:
> - no portability issues regarding both shadow stacks and TLS
> - no code to write outside QEMU
> - simpler build process
> 
> Disadvantages:
> - requires a new compiler
> - it's C++
> - no compile-time checking of "coroutine-only" but not awaitable functions
> 
> 
> 4) LLVM stackless coroutines
> Advantages:
> - no portability issues regarding both shadow stacks and TLS
> - no code to write outside QEMU
> 
> Disadvantages:
> - relatively simple source-to-source translator
> - more complex build process
> - requires a new compiler and doesn't support GCC
> 
> 
> Note that (2) would still have a build dependency on libclang.
> However the code generation could still be done with GCC and with
> any compiler version.

We looked at using libclang for some code generation in libvirt, via
its python API binding. While we didn't go forward with it (yet), it
looked promising as a library to use. IIRC, it was viable from clang
vintage available in RHEL-8 onwards, as versions before that point
were not compatible with the current python binding. I think it would
cover all the mainstream platforms that QEMU officially targets and
tests in CI right now.

I think libclang might also be an interesting framework on which to
experiment with code analysis checks, to augment (or even replace)
some of what is done by checkpatch.pl

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


