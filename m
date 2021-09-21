Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5611841338D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 14:49:54 +0200 (CEST)
Received: from localhost ([::1]:34296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSfDd-0004f7-9S
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 08:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mSfCZ-0003ob-IA
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 08:48:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mSfCV-0003H8-NM
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 08:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632228521;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=n5D1ImWB9w4DIFcvAxhdSnbsDSuN/g9P2gxMEandinI=;
 b=Ui8+sMAwih3Cc2v8vN+EGC1j5wabXlUQl880TJrtqJTGwLIdXGCmGpH6bIabuQ37ak48MH
 50qzBk89PjrP7GYp9Bl5Qmed6vUEhGxLA6CH+sbEM3s0rgGkwRQanik12hkQks39itejiL
 ZBO50OYfGW4TeZ7dbWSyFBvArrVKn2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-WHk3-JO-OayAxqB6xHYLDg-1; Tue, 21 Sep 2021 08:48:35 -0400
X-MC-Unique: WHk3-JO-OayAxqB6xHYLDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB7F5BBEE7;
 Tue, 21 Sep 2021 12:48:34 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C820F101E1C5;
 Tue, 21 Sep 2021 12:48:33 +0000 (UTC)
Date: Tue, 21 Sep 2021 13:48:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/3] Update meson version
Message-ID: <YUnUn100vx++0n5C@redhat.com>
References: <20210918093140.5797-1-pbonzini@redhat.com>
 <CAFEAcA_07d87j7y1qnBeTuoKQw=9=fY0Ci=6ky=XxBQbuEqDnw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_07d87j7y1qnBeTuoKQw=9=fY0Ci=6ky=XxBQbuEqDnw@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 21, 2021 at 01:40:36PM +0100, Peter Maydell wrote:
> On Sat, 18 Sept 2021 at 10:34, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > The following changes since commit 831aaf24967a49d7750090b9dcfd6bf356f16529:
> >
> >   Merge remote-tracking branch 'remotes/marcandre/tags/misc-pull-request' into staging (2021-09-14 18:14:56 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/bonzini/qemu.git tags/for-upstream
> >
> > for you to fetch changes up to ccc3f971c37bd2202a21abc9f0be093f10426364:
> >
> >   hexagon: use env keyword argument to pass PYTHONPATH (2021-09-15 09:12:55 +0200)
> >
> > ----------------------------------------------------------------
> > * Update Meson to 0.58.2
> >
> > ----------------------------------------------------------------
> > Paolo Bonzini (3):
> >       meson: bump submodule to 0.58.2
> >       meson: switch minimum meson version to 0.58.2
> >       hexagon: use env keyword argument to pass PYTHONPATH
> 
> So, I tried merging this, ran into some "is this an issue with this
> pullreq or is it just an intermittent or infrastructure" issues,
> and decided to postpone the merge for a bit and retry it later.
> 
> It has made an absolute mess of my incremental build setups.
> They now all fail with errors like this, even after having blown
> away the build directory and re-created it:

Might want to 'git submodule deinit --all --force' to purge
all currently checked out submodules, so it'll then re-init
them in a clean (older) state. In theory this should be handled
by the git-submodule.sh script we have in QEMU, but 'deinit' is
a big hammer to try if wierd things appear to be happening
despite cleaning the build dir.

> Is there anything that can be done to make meson version bumps
> not a horrific pain to back out ? This seems to go wrong pretty
> much every time.

Save your previous 'build' directory contents somewhere safe
and record the submodule checkout hashes, so they can be
reset to that ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


