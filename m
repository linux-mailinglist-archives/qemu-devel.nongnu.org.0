Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CD824D21D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 12:18:51 +0200 (CEST)
Received: from localhost ([::1]:49220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k948I-0004dV-VG
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 06:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k947N-0003g6-58
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:17:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25953
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k947L-0000pE-4m
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005070;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBFGIb0QN+tFVpru6aEm81JTkBnjMom9fDCSjpaUyBE=;
 b=cmLfw5KjEF8VmYWXv48nbTrx/GhRZW2B0oH1oFAAova9PgdKyiHJkbnFoLM5Hbyorp3aAU
 R+cW+6NZoL8tQixzLxJTHidK0cAkdw7V6Ibl7URP+xnzc4+DuRBZK8zPUH6J165XSZIw/O
 KsCVDhckDfBvyIkGl7u1a/fRzZoozeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-g56yX8UWOmqIG97AGhn7XQ-1; Fri, 21 Aug 2020 06:17:48 -0400
X-MC-Unique: g56yX8UWOmqIG97AGhn7XQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3636B18A2241;
 Fri, 21 Aug 2020 10:17:47 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CC3E795AE;
 Fri, 21 Aug 2020 10:17:44 +0000 (UTC)
Date: Fri, 21 Aug 2020 11:17:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2] configure: add support for pseudo-"in source tree"
 builds
Message-ID: <20200821101742.GH251583@redhat.com>
References: <20200820173124.243984-1-berrange@redhat.com>
 <814594a0-391c-01fb-a418-234e477793d3@redhat.com>
 <20200821100426.GB5153@linux.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20200821100426.GB5153@linux.fritz.box>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 23:41:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 21, 2020 at 12:04:26PM +0200, Kevin Wolf wrote:
> Am 20.08.2020 um 23:15 hat Eric Blake geschrieben:
> > On 8/20/20 12:31 PM, Daniel P. Berrangé wrote:
> > > Meson requires the build dir to be separate from the source tree. Many
> > > people are used to just running "./configure && make" though and the
> > > meson conversion breaks that.
> > > 
> > > This introduces some backcompat support to make it appear as if an
> > > "in source tree" build is being done, but with the the results in the
> > > "build/" directory. This allows "./configure && make" to work as it
> > > did historically, albeit with the output binaries staying under build/.
> > 
> > An observation:
> > 
> > If you already had out-of-tree builds, this does not change anything. You
> > can do an incremental build, where a tree that builds pre-merge should
> > continue to build incrementally with 'make -C dir' post-merge.
> > 
> > If you are used to in-tree builds, and do a fresh checkout, this lets you
> > maintain the illusion of an in-tree build although binaries may be located
> > differently than you are used to.
> > 
> > But if you do an incremental update to an in-tree build, this will cause
> > some odd behaviors, starting with the git update:
> > 
> > $ git merge $paolos_tag
> > error: The following untracked working tree files would be overwritten by
> > merge:
> > 	accel/kvm/trace.h
> > ...
> > 	util/trace.h
> > Please move or remove them before you merge.
> > Aborting
> > $ find -name trace.h -delete
> > $ git merge $paolos_tag
> > $ git am $this_patch
> > $ make
> > config-host.mak is out-of-date, running configure
> > Using './build' as the directory for build output
> > Submodule 'meson' (https://github.com/mesonbuild/meson/) registered for path
> > 'meson'
> > Cloning into '/home/eblake/qemu-tmp2/meson'...
> > ...
> > Command line for building ['libcommon.fa'] is long, using a response file
> > ./ninjatool -t ninja2make --omit clean dist uninstall < build.ninja >
> > Makefile.ninja
> > /bin/sh: build.ninja: No such file or directory
> >   GEN     tests/test-qapi-gen
> > make: Nothing to be done for 'all'.
> > $ echo $?
> > 0
> > $ make
> > changing dir to build for make ""...
> > make[1]: Entering directory '/home/eblake/qemu-tmp2/build'
> > Makefile:84: *** This is an out of tree build but your source tree
> > (/home/eblake/qemu-tmp2) seems to have been used for an in-tree build. You
> > can fix this by running "make distclean && rm -rf *-linux-user *-softmmu" in
> > your source tree.  Stop.
> > make[1]: Leaving directory '/home/eblake/qemu-tmp2/build'
> > make: *** [GNUmakefile:11: all] Error 2
> > $ echo $?
> > 2
> > 
> > So I'm not sure why the first build gets as far as it does, but does NOT
> > complete things and yet does not fail make, but my advice is that you should
> > NOT try to an incremental build on in-tree build when crossing the meson
> > epoch.  If you are a fan of in-tree convenience, you need a ONE-TIME
> > distclean when pulling in these changes (the fact that you HAVE to clean up
> > trace.h files to merge in the meson stuff should be a hint for that).  After
> > that has been done, you can go back to pretending meson supports in-tree.
> 
> Sounds like it will be painful to switch between branches based on make
> and branches based on meson. By extension, it will also be painful to
> check out and build old versions for comparison, or doing that even more
> than once during git bisect. :-(

Such is life when using in-source-dir builds.

Even with our current build system, using a separate build directory
makes it easier to work across multiple branches, as you can trivially
keep the builds from each branch separate and they won't interfere
with each other.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


