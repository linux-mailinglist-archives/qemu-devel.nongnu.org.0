Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF814937B2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:48:30 +0100 (CET)
Received: from localhost ([::1]:33194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7Zs-0004oD-Vb
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:48:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nA7O8-0004v3-0k
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 04:36:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nA7O2-0007Yj-Bg
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 04:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642584958;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JLVZAuhAoYYMDXW+wcnbZ8Rgj8ddgdTf3Tj9p9R2nZY=;
 b=HGv0IEO+6RNjdgE6xks5hYf7Xj1+/JgUAMxIgAV2qJ8CfJAdFg1bY9QVMBg9ZWSxxDJrWf
 RnlDmdnyFxA5Yh6x39vtAYV22Ui+BCZFnUGGG/bRsj14DnSLzNAohgI+UafYo3gAk++7It
 jV/dFhQWwkwmyk5kbbrzyGz/rCaVeCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117--QjlRQ5cPfOQY9PGFdTHRA-1; Wed, 19 Jan 2022 04:35:38 -0500
X-MC-Unique: -QjlRQ5cPfOQY9PGFdTHRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF6AB1018758;
 Wed, 19 Jan 2022 09:35:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0A2A7B9FD;
 Wed, 19 Jan 2022 09:35:13 +0000 (UTC)
Date: Wed, 19 Jan 2022 09:35:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>
Subject: Re: [PATCH] drop libxml2 checks since libxml is not actually used
 (for parallels)
Message-ID: <YefbTt14JoVim2if@redhat.com>
References: <20220119090423.149315-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <20220119090423.149315-1-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copying the maintainers for block/parallels.c

On Wed, Jan 19, 2022 at 12:04:23PM +0300, Michael Tokarev wrote:
> [This is a trivial patch, but due to the number of files it touches
> I'm not using qemu-trivial@ route.]
> 
> For a long time, we assumed that libxml2 is neecessary for parallels
> block format support (block/parallels*). However, this format actually
> does not use libxml. Since this is the only user of libxml2 in while
> qemu tree, we can drop all libxml2 checks and dependencies too.
> 
> It is even more: --enable-parallels configure option was the only
> option which was silently ignored when it's (fake) dependency
> (libxml2) isn't installed.

This option was added in this PULL request;

  commit 25bfd5a75fa3e8f5796656c7634e26193f7bedc1 (HEAD)
  Merge: 238e2d93c9 bcbb3866da
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Wed Jan 24 15:28:36 2018 +0000

    Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging
    
    Pull request
    
    v2:
     * Drop merge failure from a previous pull request that broke virtio-blk on ARM
       guests
     * Add Parallels XML patch series
       
    * remotes/stefanha/tags/block-pull-request:
      block/parallels: add backing support to readv/writev
      block/parallels: replace some magic numbers
      block/parallels: move some structures into header
      configure: add dependency
      docs/interop/prl-xml: description of Parallels Disk format
      block: add block_set_io_throttle virtio-blk-pci QMP example
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

If i look back at the mailing list archives I find

 v1: https://lists.nongnu.org/archive/html/qemu-devel/2017-12/msg03440.html
 v2: https://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg01870.html
 v3: https://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg02443.html

which says

[quote]
   This series contains very basic
   description of this XML files and makes preparations for actual
   implementation to be followed.
[/quote]

but obviously the actual implementation never merged. I'm not sure
if it was even posted, I didn't see anything in the mail archives
forthe next couple of months, but didn't look beyond that.

Denis: can you explain the status of XML support for the parallels
block driver. Is this something you are carrying out of tree, or
has the need for it gone away entirely ? Is there any reason why
QEMU should keep this logic for probing for libxml2 for parallels ?

>  .cirrus.yml                                     | 1 -
>  .gitlab-ci.d/cirrus/freebsd-12.vars             | 2 +-
>  .gitlab-ci.d/cirrus/freebsd-13.vars             | 2 +-
>  .gitlab-ci.d/cirrus/macos-11.vars               | 2 +-
>  .gitlab-ci.d/windows.yml                        | 2 --
>  block/meson.build                               | 3 +--
>  meson.build                                     | 6 ------
>  meson_options.txt                               | 2 --
>  scripts/ci/org.centos/stream/8/x86_64/configure | 1 -
>  scripts/coverity-scan/coverity-scan.docker      | 1 -
>  scripts/coverity-scan/run-coverity-scan         | 2 +-
>  tests/docker/dockerfiles/alpine.docker          | 1 -
>  tests/docker/dockerfiles/centos8.docker         | 1 -
>  tests/docker/dockerfiles/fedora.docker          | 1 -
>  tests/docker/dockerfiles/opensuse-leap.docker   | 1 -
>  tests/docker/dockerfiles/ubuntu1804.docker      | 1 -
>  tests/docker/dockerfiles/ubuntu2004.docker      | 1 -
>  17 files changed, 5 insertions(+), 25 deletions(-)

Note, this will conflict with pending PULL request that
changes most of those dockerfiles and cirrus CI configs
to be auto-generated

  https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg02585.html


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


