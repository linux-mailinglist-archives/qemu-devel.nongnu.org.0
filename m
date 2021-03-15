Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE6F33C5D8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:38:26 +0100 (CET)
Received: from localhost ([::1]:56584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLs6j-0002Zm-NM
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lLrc7-0004hi-CJ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:06:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lLrc1-00029g-8w
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615831600;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ax2dBgVxEZoZTzSANXRixukL888w1B8HGmLIEuYZhJM=;
 b=iYv9LBnPjGV4wVBOj+cQgCEmZsvfj83SRngtsWqb2n8qRBvGesSgYf5Bvxres9R7z2zcyP
 rcrkO7yIXe92Voct/ExRhVb4dgWW8SWBjQQcjIP/CGcKtflwoZpfdwz5UL3dMk60RFPlo0
 cUiIA6POp8+1gR21Tdv4NEPlIQDH4QM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-kygQeWi2PEyu6h5QELuZ6g-1; Mon, 15 Mar 2021 14:06:33 -0400
X-MC-Unique: kygQeWi2PEyu6h5QELuZ6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7993F108BD07;
 Mon, 15 Mar 2021 18:06:32 +0000 (UTC)
Received: from redhat.com (ovpn-115-81.ams2.redhat.com [10.36.115.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9BAF60C0F;
 Mon, 15 Mar 2021 18:06:27 +0000 (UTC)
Date: Mon, 15 Mar 2021 18:06:25 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] docs/devel: expand style section of memory management
Message-ID: <YE+iIfv7+EmbWxfl@redhat.com>
References: <20210315165312.22453-1-alex.bennee@linaro.org>
 <CAFEAcA8gnFdOprY=yj+voN+DJ44zx3+9ABM3yMPdWJSQ3X6QrQ@mail.gmail.com>
 <b5db40d9-1a51-3690-a1ac-0ac345619376@redhat.com>
 <YE+UuX2Hqr2BjsRh@redhat.com> <87pn008fq9.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87pn008fq9.fsf@linaro.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 05:54:17PM +0000, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Mon, Mar 15, 2021 at 06:04:10PM +0100, Thomas Huth wrote:
> >> On 15/03/2021 17.57, Peter Maydell wrote:
> >> > On Mon, 15 Mar 2021 at 16:53, Alex Bennée <alex.bennee@linaro.org> wrote:
> >> > > -Prefer g_new(T, n) instead of g_malloc(sizeof(T) ``*`` n) for the following
> >> > > +Care should be taken to avoid introducing places where the guest could
> >> > > +trigger an exit. For example using ``g_malloc`` on start-up is fine
> >> > > +if the result of a failure is going to be a fatal exit anyway. There
> >> > > +may be some start-up cases where failing is unreasonable (for example
> >> > > +speculatively loading debug symbols).
> >> > > +
> >> > > +However if we are doing an allocation because of something the guest
> >> > > +has done we should never trigger an exit. The code may deal with this
> >> > > +by trying to allocate less memory and continue or re-designed to allocate
> >> > > +buffers on start-up.
> >> > 
> >> > I think this is overly strong. We want to avoid malloc-or-die for
> >> > cases where the guest gets to decide how big the allocation is;
> >> > but if we're doing a single small fixed-size allocation that happens
> >> > to be triggered by a guest action we should be OK to g_malloc() that
> >> > I think.
> >> 
> >> I agree with Peter. If the host is so much out-of-memory that we even can't
> >> allocate some few bytes anymore (let's say less than 4k), the system is
> >> pretty much dead anyway and it might be better to terminate the program
> >> immediately instead of continuing with the out-of-memory situation.
> >
> > On a Linux host you're almost certainly not going to see g_malloc
> > fail for small allocations at least. Instead at some point the host
> > will be under enough memory pressure that the OOM killer activates
> > and reaps arbitrary processes based on some criteria it has, freeing
> > up memory for malloc to succeed (unless OOM killer picked you as the
> > victim).
> 
> OK how about this wording:
> 
>   Please note that ``g_malloc`` will exit on allocation failure, so
>   there is no need to test for failure (as you would have to with
>   ``malloc``). Generally using ``g_malloc`` on start-up is fine as the
>   result of a failure to allocate memory is going to be a fatal exit
>   anyway. There may be some start-up cases where failing is unreasonable
>   (for example speculatively loading a large debug symbol table).
> 
>   Care should be taken to avoid introducing places where the guest could
>   trigger an exit by causing a large allocation. For small allocations,
>   of the order of 4k, a failure to allocate is likely indicative of an
>   overloaded host and allowing ``g_malloc`` to ``exit`` is a reasonable
>   approach. However for larger allocations where we could realistically
>   fall-back to a smaller one if need be we should use functions like
>   ``g_try_new`` and check the result. For example this is valid approach
>   for a time/space trade-off like ``tlb_mmu_resize_locked`` in the
>   SoftMMU TLB code.

Fine with me

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


