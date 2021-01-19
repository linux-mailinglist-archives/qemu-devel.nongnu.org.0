Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1842FBA9F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:03:14 +0100 (CET)
Received: from localhost ([::1]:39326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sXJ-000351-AB
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1sVN-0002Qg-BH
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:01:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1sVG-00080I-UT
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611068465;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=zhZSJCpO1sh3N2bpILDXPW24TFpHyBrRaOruij+0LdA=;
 b=XXpPebv7tYCYWJnWKc6rfL7uro98BQs1vT0BRcq5Qo8ZegjzQvk9CnOyt+ev7c0YHTTAeg
 wO+FeSB2xdCl3QnYg+wFf1jj+lZ7gMEMTtCwJ5UVJCKeDhmxsfR7r8oLzoI3J1XG0/11Av
 JkK6YNHWfkcDKKiqBXGMdWWTDRJ4iyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-4R2o80zgPByp7TJKz--gEg-1; Tue, 19 Jan 2021 10:01:01 -0500
X-MC-Unique: 4R2o80zgPByp7TJKz--gEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9205D100A649;
 Tue, 19 Jan 2021 15:01:00 +0000 (UTC)
Received: from redhat.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9374760C5A;
 Tue, 19 Jan 2021 15:00:56 +0000 (UTC)
Date: Tue, 19 Jan 2021 15:00:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] deploy docs to qemu-project.org from GitLab CI
Message-ID: <20210119150054.GJ2335568@redhat.com>
References: <20210119132619.302207-1-pbonzini@redhat.com>
 <20210119145622.GC288294@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20210119145622.GC288294@stefanha-x1.localdomain>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, alex.bennee@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 02:56:22PM +0000, Stefan Hajnoczi wrote:
> On Tue, Jan 19, 2021 at 02:26:19PM +0100, Paolo Bonzini wrote:
> > Currently, the website is rebuilt on qemu-project.org using
> > a separate container (https://github.com/stefanha/qemu-docs/)
> > cron job hook.  We can instead reuse the GitLab's CI artifacts.
> > 
> > To do so, we use the same mechanism that is already in place for
> > qemu-web.git.
> > 
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  .gitlab-ci.yml                             | 23 ++++++++++++++++++++++
> >  tests/docker/dockerfiles/ubuntu2004.docker |  2 ++
> >  2 files changed, 25 insertions(+)
> 
> Hmm...the UNIX account on qemu.org is locked down to some extent but I
> don't feel comfortable with a GitLab CI job sshing into qemu.org.
> 
> ssh access aside, we are publishing HTML from a shared CI runner to
> qemu.org. Effectively we are allowing an untrusted machine to publish
> HTML/JS/CSS on qemu.org. It could steal HTTP Cookies or do other
> malicious things. That is less of a problem when there is a dedicated
> subdomain so that the Same Origin policy can provide isolation. Maybe
> there are more recent web security mechanisms that allow us to define a
> policy so browsers do not treat qemu.org/docs/* the same as other
> qemu.org pages?

The "easy" option is to just stop using  qemu.org/docs and instad hav
docs.qemu.org and make it a cname for qemu-project.gitlab.io. Then
gitlab can be serving the docs directly.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


