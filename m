Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E8D41E328
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 23:18:31 +0200 (CEST)
Received: from localhost ([::1]:51804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW3Rm-00078N-Bs
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 17:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mW3Dj-0007bz-Aq
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 17:04:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mW3DV-0004sH-Kv
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 17:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633035824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JpI3JOIddd8yvoDDi802Q1wDM2T+oigiWIJcG/HBs2s=;
 b=COpjj01SEJ34Gb6mBgjOGf9hZjSGvJDgEBsIsGCKL1Bu5LxXclb5cZj/fD0/ttHA/C0fq7
 JvxK3IJpYvX5kHDWM75F/JVMLx3E4S+meScggu+nkBi02JyWxoJYMZageedKcLXaiVDOEw
 EQVOhtw6ipS57yVo7qafZj+fqHsgTtI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-U_yhhhVKMCSAMSKKIaflig-1; Thu, 30 Sep 2021 17:03:39 -0400
X-MC-Unique: U_yhhhVKMCSAMSKKIaflig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7871F19200C4;
 Thu, 30 Sep 2021 21:03:38 +0000 (UTC)
Received: from redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B35910016F5;
 Thu, 30 Sep 2021 21:03:37 +0000 (UTC)
Date: Thu, 30 Sep 2021 16:03:35 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3] nbd/server: Add --selinux-label option
Message-ID: <20210930210335.j47qkaz4sh5sfl3r@redhat.com>
References: <20210930084701.3899578-1-rjones@redhat.com>
 <c9a4f4ce-b626-18a4-326a-03ebfe5b5aee@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <c9a4f4ce-b626-18a4-326a-03ebfe5b5aee@virtuozzo.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, richard.henderson@linaro.org,
 "Richard W.M. Jones" <rjones@redhat.com>, wainersm@redhat.com, f4bug@amsat.org,
 willianr@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 11:54:58AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 9/30/21 11:47, Richard W.M. Jones wrote:
> > Under SELinux, Unix domain sockets have two labels.  One is on the
> > disk and can be set with commands such as chcon(1).  There is a
> > different label stored in memory (called the process label).  This can
> > only be set by the process creating the socket.  When using SELinux +
> > SVirt and wanting qemu to be able to connect to a qemu-nbd instance,
> > you must set both labels correctly first.
> > 
> > For qemu-nbd the options to set the second label are awkward.  You can
> > create the socket in a wrapper program and then exec into qemu-nbd.
> > Or you could try something with LD_PRELOAD.
> > 
> > This commit adds the ability to set the label straightforwardly on the
> > command line, via the new --selinux-label flag.  (The name of the flag
> > is the same as the equivalent nbdkit option.)
> > 
> > A worked example showing how to use the new option can be found in
> > this bug: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> > 
> > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> > Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> this should be Reviewed-by?

In this case, I think S-o-b is actually correct: I did make some
tweaks to Rich's v2 while preparing my pull request, so Rich is
crediting my addition to his work.  And at the time of my pull request
that included his v2 (before it got dropped for 32-bit build
problems), I had not actually sent my R-b, because I was already
trusting the R-b present from other reviewers.

Oddly enough, even if Rich had dropped my S-o-b line, it will still
eventually reappear, since I'll be queuing this patch through my NBD
tree which requires me to touch it again.  So already having it now
doesn't hurt.

[Many of the patches that go through my tree end up with both my R-b
and S-o-b; but there are patches where I have S-o-b but not R-b,
because I trusted the review of others, and view the act of a careful
review as orthogonal from the responsibility of touching a patch
enough to include it in a pull request]

> 
> > ---
> >   configure                                     |  8 +++-
> >   meson.build                                   | 10 ++++-
> >   meson_options.txt                             |  3 ++
> >   qemu-nbd.c                                    | 39 +++++++++++++++++++
> 
> [..]
> 
> >       }
> > @@ -938,6 +952,19 @@ int main(int argc, char **argv)
> >           } else {
> >               backlog = MIN(shared, SOMAXCONN);
> >           }
> > +        if (sockpath && selinux_label) {
> 
> 1. Why only for unix sockets?
> 
> 2. If [1] is intentional, why silently ignore the new option for ip sockets, shouldn't error-out instead?
>

Good point, and I missed it in v2, in spite of my touching that patch
to avoid silent ignoring when selinux support was not compiled in.

So at this point, I'm less certain whether it is smarter to reject
--selinux-label on non-unix sockets, or whether we try to do the
labeling regardless of socket type; and thus consider it premature for
me to give R-b until we have that resolved.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


