Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B099405A25
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 17:22:48 +0200 (CEST)
Received: from localhost ([::1]:57812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOLt1-00019D-Mj
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 11:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOLry-0008Dz-5V
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:21:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOLrw-00025q-I2
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:21:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631200899;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Wi2qliHPd3AtKVNTLoCsraUbVFLCSxb4qy59V1yf7x0=;
 b=IYAjTZPa0mXNv/+7deikmkkG7x0YbmAfAYwaIHGDVuhgmZeiILDCc1K/wfp6FAie/WH/Du
 J3MZaSyfcLNV8VUsNd/8gxHBM8P8AHSS6D7b5moQJ89jxtlUwyronfWeB4Z0afXhWjvryI
 102hfFK+8ePpdoA+DUbZ9kC9mwZUxas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-pGtyimnOP4euVQ5v-WUGiA-1; Thu, 09 Sep 2021 11:21:33 -0400
X-MC-Unique: pGtyimnOP4euVQ5v-WUGiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE645A40CE;
 Thu,  9 Sep 2021 15:21:28 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EACCC60C04;
 Thu,  9 Sep 2021 15:21:27 +0000 (UTC)
Date: Thu, 9 Sep 2021 16:21:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Warner Losh <imp@bsdimp.com>
Subject: Re: [PULL 00/42] bsd-user updates to run hello world
Message-ID: <YTomdQYrx8Loysy6@redhat.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
 <CAFEAcA9kF08A1PyPmBXfWykWZwP4+MoPOvTn4diu13Dkq04SVg@mail.gmail.com>
 <CANCZdfqpoqgyqWoX=y_GFfjhphGbZjWk2yS=ZTcrAiZa9Q3BJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANCZdfqpoqgyqWoX=y_GFfjhphGbZjWk2yS=ZTcrAiZa9Q3BJw@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 09:12:45AM -0600, Warner Losh wrote:
> On Thu, Sep 9, 2021, 9:01 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> 
> > On Tue, 7 Sept 2021 at 22:56, <imp@bsdimp.com> wrote:
> > >
> > > From: Warner Losh <imp@bsdimp.com>
> > >
> > > The following changes since commit
> > f214d8e0150766c31172e16ef4b17674f549d852:
> > >
> > >   Merge remote-tracking branch
> > 'remotes/pmaydell/tags/pull-target-arm-20210826' into staging (2021-08-26
> > 18:03:57 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.com/bsdimp/qemu.git tags/bsd-user-pull-20210907-tag
> > >
> > > for you to fetch changes up to dc96376e46a52ac63a27ea185c3f0a6fd54e3c82:
> > >
> > >   bsd-user: Update mapping to handle reserved and starting conditions
> > (2021-09-07 08:26:53 -0600)
> >
> > >  slirp                                         |    2 +-
> >
> > A bogus submodule update seems to have crept in here...
> >
> 
> So I need to fix this and resubmit?
> 
> My loath of modules is coming to a middle... they update in the rebase, but
> don't reset without magic commands. :(

Historically this was quite a common problem as  'git add -u' would
stage any submodule  changes. At some point in recentish history
git stopped doing that, so these accidental inclusions don't happen
as easily.

For your specific case here:

diff --git a/slirp b/slirp
index a88d9ace23..8f43a99191 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0
+Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece


to fix this you just need to go into the submodule and checkout the
original hash and then add it to the commit. eg

  cd slirp
  git checkout a88d9ace234a24ce1c17189642ef9104799425e0
  cd ..
  git add slirp
  git commit --amend
  

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


