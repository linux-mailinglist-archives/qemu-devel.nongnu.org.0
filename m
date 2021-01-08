Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E082EF087
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 11:18:12 +0100 (CET)
Received: from localhost ([::1]:41336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxoqR-00014W-08
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 05:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kxopJ-0000eX-Hl
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 05:17:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kxopG-0007jn-NG
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 05:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610101016;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OXS9a5oMWJMUKPfRJUID9I9JKtpSqjIcUvUyKgZpy/g=;
 b=HjqQBRrCaAARQUpiB+7I4m8ZZz9I4J7WEkEXT6MzEe+Vv+1Z0yEStF6cfBIHeHM2VrKSit
 LygzfRmwZN/Kq4pCIQZC+nqpG+gqqoUmsz85SWB9yJiLK7Qnk47R3PXYa2uLP2m2a/rgWK
 k98CfKYIuozNM3qyQP3XnkEEcLe7xdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-vKDbPeZ3PWyuISgYgkkMmQ-1; Fri, 08 Jan 2021 05:16:54 -0500
X-MC-Unique: vKDbPeZ3PWyuISgYgkkMmQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3BD959;
 Fri,  8 Jan 2021 10:16:52 +0000 (UTC)
Received: from redhat.com (ovpn-114-227.ams2.redhat.com [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4288D60C5F;
 Fri,  8 Jan 2021 10:16:47 +0000 (UTC)
Date: Fri, 8 Jan 2021 10:16:45 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH] ci: ensure that all jobs use a shallow clone
Message-ID: <20210108101645.GE1082385@redhat.com>
References: <20210107171719.477856-1-pbonzini@redhat.com>
 <20210107182812.GI1029501@redhat.com>
 <dff4499e-eb4d-f96b-5f82-51352561d231@redhat.com>
 <CABgObfZt-8gG3c4WTZqd0Ls0VEe43MFc_mFuykoZvDP2ZGu0gA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgObfZt-8gG3c4WTZqd0Ls0VEe43MFc_mFuykoZvDP2ZGu0gA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 07, 2021 at 08:23:49PM +0100, Paolo Bonzini wrote:
> Il gio 7 gen 2021, 20:05 Thomas Huth <thuth@redhat.com> ha scritto:
> 
> > on travis-ci.com you can
> > only get free CI minutes for non-sponsored FOSS projects.
> > So let's simply not worry about Travis-CI anymore.
> >
> > Maybe we could rather disable shippable now that we support the cross
> > container builds on gitlab-ci, too?
> >
> 
> With pleasure, starting this discussion was an intended possible side
> effect of the patch. :)
> 
> The main issue with Travis is the non-x86 builders, which have no
> alternative yet.

The free travis accounts get 10000 credits. Linux jobs take 10 credits
per minute of execution time. Free credits are a one-off grant which
don't auto renew. You have to make an email request to travis to beg
for more each time they run out.

The non-x86 CI jobs we have in travis consume 91 minutes of time in
total.  So we'll burn through all free credits in 11 jobs and then
our CI will stop.

IOW, despite travis giving us non-x86 builders, it is doomed to be
unusuable, unless we can convince them to give us a *massively*
larger free credit allowance on the qemu account.  It would need to
be on the order x100 larger, and auto-renewing once a month to cope
with our rate of builds for the non-x86 CI jobs.

I think we need to just delete the travis config and accept that we
can't run those jobs unless we provide our own hardware for non-x86
in GitLab CI.  IIUC, the latter is something we're planning anyway.

So I support removing travis and shippable configs and focusing only
on GitLab and Cirrus

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


