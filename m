Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4CE4DC678
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 13:52:46 +0100 (CET)
Received: from localhost ([::1]:39866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUpcT-00079Z-3i
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 08:52:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUpbI-0005t2-NQ
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:51:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUpbG-0001Ry-MS
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647521489;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJOKAzEO57CcmZHm5emdJq1hhPY3TJbVyytui+bbb68=;
 b=S9M9k1FuoCIAwntmi3i5eHvv6AGF/4Hiku8CHWinlEROEPdDzueI5dqfk4xz887VbTs6Rq
 ajQQERLO5GoHkdDmPz0rKQHBgSQVlGm59pxO7mrosmmp5UuFzltMVNl9nlmCsFp0BqVf4b
 j7QUYOvMfe7DozL7wn+A6u53qTiEMx4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-YNVCHQHmNdCcqG1IhxOdDA-1; Thu, 17 Mar 2022 08:51:25 -0400
X-MC-Unique: YNVCHQHmNdCcqG1IhxOdDA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09D961044566;
 Thu, 17 Mar 2022 12:51:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7EFB141DC5F;
 Thu, 17 Mar 2022 12:51:23 +0000 (UTC)
Date: Thu, 17 Mar 2022 12:51:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Message-ID: <YjMuyMcwG09Tohyh@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
 <YjCnss5W5MhZK1Hw@redhat.com> <YjC2+F2SkNEDOXTe@redhat.com>
 <7b634dc9-cca5-c9d0-e392-21a594851b0c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7b634dc9-cca5-c9d0-e392-21a594851b0c@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, hreitz@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 12:08:33AM +0100, Paolo Bonzini wrote:
> On 3/15/22 16:55, Daniel P. Berrangé wrote:
> > Expecting maintainers to enforce a subset during code review feels
> > like it would be a tedious burden, that will inevitably let stuff
> > through because humans are fallible, especially when presented
> > with uninspiring, tedious, repetitive tasks.
> > 
> > Restricting ourselves to a subset is only viable if we have
> > an automated tool that can reliably enforce that subset. I'm not
> > sure that any such tool exists, and not convinced our time is
> > best served by trying to write & maintainer one either.
> 
> We don't need to have a policy on which features are used.  We need to have
> goals for what to use C++ for.  I won't go into further details here,
> because I had already posted "When and how to use C++"[1] about an hour
> before your reply.

I see that mail, but I don't think it addresses my point.

We already use GLib and it provides a bunch of data structures,
objects and APIs, alot of which will overlap with C++ standard
library, not to mention QEMU's own stuff that predates GLib.

The guidelines say what we want to use C++ for which fine, but
it doesn't help maintainers/reviewers evaluating whether the
proposed C++ usage is desired.

Do we prefer GLib APIs and data structures for consistency &
interoperability with remaining C-only code, or do we prefer
the libstdc++, or do we allow both but set rules on when
to use each, or do we allow a free-for-all with author or
reviewer deciding based on their personal preference.

If we don't have a policy for C++ feature usage, then we
get the free-for-all by default. May be that is OK, maybe
not. Either way we need to declare our intent, so reviewers
know what to complain about and what to not.

Personally I'm not a fan of having a codebase with many
different APIs/data structures for doing the same job,
so would like a clear policy for what to use / prefer,
ideally one we can enforce with tools rather than rely
on humans to spot.


> > IOW, I fear one we allow C++ in any level, it won't be practical
> > to constrain it as much we desire. I fear us turning QEMU into
> > even more of a monster like other big C++ apps I see which take
> > all hours to compile while using all available RAM in Fedora RPM
> > build hosts.
> 
> Sorry but this is FUD.  There's plenty of C++ apps and libraries that do not
> "take hours to compile while using all available RAM".  You're probably
> thinking of the Chromium/Firefox/Libreoffice triplet but those are an order
> of magnitude larger than QEMU.  And in fact, QEMU is *already* a monster
> that takes longer to compile than most other packages, no matter the
> language they're written in.

I was particularly considering Ceph when I wrote the above, which
is bigger, but still a similar order of magnutude in size compared
to QEMU, but in Fedora Ceph takes 12 hours to compile on the slower
arch, vs QEMU's 3 hrs, or 3 hrs on x86_64 vs QEMU's 1 hr. Maybe I'm
being mistaken in blaming C++ in general, and it is something else
Or maybe certain features trigger this slowness and we can consider
if we should stay away from them

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


