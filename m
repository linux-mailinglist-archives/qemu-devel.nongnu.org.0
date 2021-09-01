Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F293FDEE7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:43:59 +0200 (CEST)
Received: from localhost ([::1]:60274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSP8-00085C-Qj
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLS3x-0006NG-0J
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:22:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLS3v-0007hQ-5r
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509722;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9+Md7una6YjO9fGvWRaPNX+GVdZDIw8CWi+x8SaWGI=;
 b=RK/tnJ1ouLXEEBLz3I1vYTjkrJ1ffDecCVUewVN+BhiS0h1J1ZF27SjsW4pt3XI2XrgUA5
 E/7peRdENEkOdkNDhkIQEK4QkcuLBYJyzl7mF9YitHWhIMJ5T1PiVY3Sc8WNlA/S2MHSbY
 xs2l5DoO4OkMiI9ohGBwzaMTWgMID6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-vMd74GKHPQiiUX-_-BwWEw-1; Wed, 01 Sep 2021 11:22:00 -0400
X-MC-Unique: vMd74GKHPQiiUX-_-BwWEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E151DF8A5;
 Wed,  1 Sep 2021 15:21:59 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 377695C1BB;
 Wed,  1 Sep 2021 15:21:48 +0000 (UTC)
Date: Wed, 1 Sep 2021 16:21:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] gitlab: Escape git-describe match pattern on Windows hosts
Message-ID: <YS+aiZep166VuVcH@redhat.com>
References: <20210901145229.4132606-1-philmd@redhat.com>
 <YS+UylEr3CJyksxt@redhat.com>
 <CAFEAcA_gyZTfUTAAoKvrA-qyv-8dOvGjLSLmq2uaur8XYS6CuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_gyZTfUTAAoKvrA-qyv-8dOvGjLSLmq2uaur8XYS6CuQ@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 04:17:48PM +0100, Peter Maydell wrote:
> On Wed, 1 Sept 2021 at 15:59, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Wed, Sep 01, 2021 at 04:52:29PM +0200, Philippe Mathieu-Daudé wrote:
> > > Properly escape git-describe 'match' pattern to avoid (MinGW):
> > >
> > >   $ if grep -q "EXESUF=.exe" config-host.mak; then make installer;
> > >     version="$(git describe --match v[0-9]*)";
> > >     mv -v qemu-setup*.exe qemu-setup-${version}.exe; fi
> > >   fatal: No names found, cannot describe anything.
> > >   ERROR: Job failed: exit code 1
> > >
> > > Reported-by: Cédric Le Goater <clg@kaod.org>
> > > Fixes: 8619b5ddb56 ("ci: build & store windows installer")
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/591
> > > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > ---
> > >  .gitlab-ci.d/crossbuild-template.yml | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
> > > index 10d22dcf6c1..62d33e6661d 100644
> > > --- a/.gitlab-ci.d/crossbuild-template.yml
> > > +++ b/.gitlab-ci.d/crossbuild-template.yml
> > > @@ -14,7 +14,7 @@
> > >      - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
> > >      - if grep -q "EXESUF=.exe" config-host.mak;
> > >        then make installer;
> > > -      version="$(git describe --match v[0-9]*)";
> > > +      version="$(git describe --match 'v[0-9]*')";
> >
> > Do you have a pointer to a pipeline showing this fix works ?
> >
> > It is a bit strange to me. AFAICT, the only difference would
> > be if the unquoted  v[0-9]*  matched a filename in the
> > current directory, but that doesn't seem like it is the
> > case here.
> 
> We should quote the glob pattern anyway, to avoid possible
> really confusing behaviour in the future if such a file ever
> does turn up...

Sure, I'm happy to see the thing quoted regardless, just want to
make sure the commit behaviour matches the commit message.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


