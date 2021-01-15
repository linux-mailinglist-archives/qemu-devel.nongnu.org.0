Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B62B2F7E67
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:40:58 +0100 (CET)
Received: from localhost ([::1]:33578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0QHZ-0006Xs-Bs
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:40:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l0PcR-0007fW-BF
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:58:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l0PcO-0001be-Hx
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610719103;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kDpeEowZ+gB87nOZKbKcNz6ngAg+pVrkmdC1yF5b2ys=;
 b=NOUXIiDGAqN6JJXFoxnU6FTfO0JFz7JlYk/z6v1IBNuxFi+1Ys9b6hUFz2YNm2nev/MVTi
 UcssZsfKd8eLLMgVLHBBFI36Es9osh4kXZP+wVCSszy3G4hTa3SIQFFciV/TcBlsYwIaMO
 6ukgzMonby0yKOn9FkFJ+hC53aDJ0oI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-CT_ZWZrrMju5pLfzZvig_A-1; Fri, 15 Jan 2021 08:58:21 -0500
X-MC-Unique: CT_ZWZrrMju5pLfzZvig_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79DC3100C660;
 Fri, 15 Jan 2021 13:58:20 +0000 (UTC)
Received: from redhat.com (ovpn-115-76.ams2.redhat.com [10.36.115.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60F8C1A8A9;
 Fri, 15 Jan 2021 13:58:15 +0000 (UTC)
Date: Fri, 15 Jan 2021 13:58:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v2 02/25] tests/docker: don't use BUILDKIT in GitLab either
Message-ID: <20210115135812.GI1692978@redhat.com>
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-3-berrange@redhat.com>
 <678eec1f-9cf6-ef96-8a11-e8ddaff4710e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <678eec1f-9cf6-ef96-8a11-e8ddaff4710e@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 10:53:34AM -0300, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 1/14/21 10:02 AM, Daniel P. Berrangé wrote:
> > Using BUILDKIT breaks with certain container registries such as CentOS,
> > with docker build reporting an error such as
> > 
> >    failed to solve with frontend dockerfile.v0:
> >    failed to build LLB: failed to load cache key:
> >    unexpected status code
> >    https://registry.centos.org/v2/centos/manifests/7:
> >    403 Forbidden
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   tests/docker/docker.py | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/docker/docker.py b/tests/docker/docker.py
> > index 36b7868406..d1d0da9419 100755
> > --- a/tests/docker/docker.py
> > +++ b/tests/docker/docker.py
> > @@ -222,7 +222,9 @@ class Docker(object):
> >       def __init__(self):
> >           self._command = _guess_engine_command()
> > -        if "docker" in self._command and "TRAVIS" not in os.environ:
> > +        if ("docker" in self._command and
> > +            "TRAVIS" not in os.environ and
> > +            "CI" not in os.environ):
> 
> 
> The variable CI is also exported in Travis. But if you want to keep this
> guard specific to gitlab then you can use GITLAB_CI.

Ah good point, more specific is probably better.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


