Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868CE425A69
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 20:11:18 +0200 (CEST)
Received: from localhost ([::1]:53004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXrR-0001IL-HX
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 14:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mYXgs-00053X-RO
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 14:00:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mYXgo-0000KB-VJ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 14:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633629618;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2j/+3pYAFwPuNAK0ZB1JMLS/y35Sb3DH/yoVXynzYl0=;
 b=d3O6ZQ1stO+HWtAKaPVzxTJ1uXJebEFgRLWhM3zldQwHqCc/0c2hFjnE4As3eekDG9rs0h
 htPgdBWQg+0c9jenkrhwmrayaLhApLT7DBNuMCebZ7Fx8VxQ7Bn2D7MFIuSaR7IE10GoHy
 cwSHJfy8UDKOdSspf0dIYB2eMOGRYbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-Si1Zjk0TPCOTOxR46pgdRQ-1; Thu, 07 Oct 2021 14:00:17 -0400
X-MC-Unique: Si1Zjk0TPCOTOxR46pgdRQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7C821994DB8;
 Thu,  7 Oct 2021 17:28:04 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F53260936;
 Thu,  7 Oct 2021 17:27:54 +0000 (UTC)
Date: Thu, 7 Oct 2021 18:27:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 16/23] target/i386/sev: Remove stubs by using code
 elision
Message-ID: <YV8uGDy4bgS/9UfU@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
 <20211007161716.453984-17-philmd@redhat.com>
 <YV8pS2D8e14qmFBq@work-vm>
 <6080fa16-66aa-570e-93c8-09be2ced9431@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6080fa16-66aa-570e-93c8-09be2ced9431@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 07, 2021 at 07:18:04PM +0200, Philippe Mathieu-Daudé wrote:
> On 10/7/21 19:07, Dr. David Alan Gilbert wrote:
> > * Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> >> Only declare sev_enabled() and sev_es_enabled() when CONFIG_SEV is
> >> set, to allow the compiler to elide unused code. Remove unnecessary
> >> stubs.
> >>
> >> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > 
> > What makes it allowed to *rely* on the compiler eliding calls?
> 
> I am not aware of a particular requirement on the compiler for code
> elision, however we already use this syntax:

Maybe I'm mis-understanding David's question, but I'm not
sure it matters whether the compiler elides the code or
not.

IIUC, with the old code using stubs it is unlikely to be
elided at all. With the new code it will probably be
elided, but if it isn't, then it is no worse than the
code its replacing.

Or am I mis-understanding David's question ?

> $ git grep -A4 'ifdef CONFIG_' include/sysemu/
> ...
> include/sysemu/tcg.h:11:#ifdef CONFIG_TCG
> include/sysemu/tcg.h-12-extern bool tcg_allowed;
> include/sysemu/tcg.h-13-#define tcg_enabled() (tcg_allowed)
> include/sysemu/tcg.h-14-#else
> include/sysemu/tcg.h-15-#define tcg_enabled() 0
> ...
> 
> Cc'ing Richard/Eric/Daniel who have more experience with compiler
> features in case they can enlighten me here.

I'd say my general view is we are free to use features explicitly
supported by our designated compilers. We should avoid relying on
undefined compiler behaviour for funtional results in QEMU.

We can rely on our designated compilers to optimize certain code
patterns, as long as its purely for performance benefits, not
functional benefits, since optimizations are not guaranteed and
users can turn them off too.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


