Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058913E8C50
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 10:47:11 +0200 (CEST)
Received: from localhost ([::1]:51694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDjtG-00019s-2o
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 04:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDjqT-0004bk-BC
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:44:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDjqQ-0001MY-6u
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628671453;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oy3I6fwi38N9iSokcTuVYpz8g225HTEwapurfW6R8Hw=;
 b=gvDlRtBE7vomn3S7/pJXOXoMdd4vzcGqbTI02+u1kkTwdw+yUUbRwIFgxblT8RQk1TZuR7
 wW+7ZQ9OymGMqxk4EQXl7YxcZmGcU3541Ly9dSbBNBQJgz9K7bUeSJdLKHZ650ajNoYQ2+
 lMBprIEvpngdINfKcd38SE8dCNjA8Fs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-H-6vh2l5OrC-fLvbUu3MAA-1; Wed, 11 Aug 2021 04:44:10 -0400
X-MC-Unique: H-6vh2l5OrC-fLvbUu3MAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32B20801A92;
 Wed, 11 Aug 2021 08:44:09 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 363E5620DE;
 Wed, 11 Aug 2021 08:44:00 +0000 (UTC)
Date: Wed, 11 Aug 2021 09:43:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/2] gitlab: skip many more targets in windows cross builds
Message-ID: <YRONzVe8Clct99j2@redhat.com>
References: <20210810140653.3969823-1-berrange@redhat.com>
 <20210810140653.3969823-3-berrange@redhat.com>
 <1a43f8c6-24f8-9aee-d321-04f5a8ecc6ee@amsat.org>
MIME-Version: 1.0
In-Reply-To: <1a43f8c6-24f8-9aee-d321-04f5a8ecc6ee@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 11, 2021 at 08:20:37AM +0200, Philippe Mathieu-Daudé wrote:
> On 8/10/21 4:06 PM, Daniel P. Berrangé wrote:
> > The windows cross builds still take way too long in gitlab CI, so need
> > more targets to be skipped. We don't want to hurt coverage of other
> > cross builds more though, so we let jobs fine tune with a new env
> > variale $CROSS_SKIP_TARGETS.
> > 
> > We take the set of targets that are considered relatively niche or
> > very old architectures, and skip approx half of them in win32 builds
> > and the other half of them in win64.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  .gitlab-ci.d/crossbuild-template.yml | 2 +-
> >  .gitlab-ci.d/crossbuilds.yml         | 2 ++
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
> > index cfb576b54c..10d22dcf6c 100644
> > --- a/.gitlab-ci.d/crossbuild-template.yml
> > +++ b/.gitlab-ci.d/crossbuild-template.yml
> > @@ -10,7 +10,7 @@
> >          --disable-user --target-list-exclude="arm-softmmu cris-softmmu
> >            i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
> >            mips64-softmmu ppc-softmmu riscv32-softmmu sh4-softmmu
> > -          sparc-softmmu xtensa-softmmu"
> > +          sparc-softmmu xtensa-softmmu $CROSS_SKIP_TARGETS"
> >      - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
> >      - if grep -q "EXESUF=.exe" config-host.mak;
> >        then make installer;
> > diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> > index 4ff3aa3cfc..a5f9dbcbeb 100644
> > --- a/.gitlab-ci.d/crossbuilds.yml
> > +++ b/.gitlab-ci.d/crossbuilds.yml
> > @@ -160,6 +160,7 @@ cross-win32-system:
> >      job: win32-fedora-cross-container
> >    variables:
> >      IMAGE: fedora-win32-cross
> > +    CROSS_SKIP_TARGETS: or1k-softmmu rx-softmmu sh4eb-softmmu sparc64-softmmu tricore-softmmu xtensaeb-softmmu
> >    artifacts:
> >      paths:
> >        - build/qemu-setup*.exe
> > @@ -170,6 +171,7 @@ cross-win64-system:
> >      job: win64-fedora-cross-container
> >    variables:
> >      IMAGE: fedora-win64-cross
> > +    CROSS_SKIP_TARGETS: alpha-softmmu avr-softmmu hppa-softmmu m68k-softmmu microblazeel-softmmu mips64el-softmmu nios2-softmmu
> 
> It looks you inverted the lists. We expect more Win64 users, and these
> are the targets of interest. I'd keep here (skipping in Win32):

I wouldn't say inverted, because the split was entirely arbitrary. While
32-bit vs 64-bit could conceivably show a difference, in practice those
differences are likely to already be caught by non-windows builds. These
jobs are most important for catching UNIX vs Windows differences, so in
that view whether a target is built for win32 vs win64 doesn't matter.

> 
> alpha-softmmu avr-softmmu hppa-softmmu m68k-softmmu microblazeel-softmmu
> mips64el-softmmu sparc64-softmmu
> 
> And skip (keep them in win32):
> 
> or1k-softmmu rx-softmmu sh4eb-softmmu nios2-softmmu tricore-softmmu
> xtensaeb-softmmu

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


