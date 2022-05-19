Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD69D52D1B7
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 13:47:01 +0200 (CEST)
Received: from localhost ([::1]:33782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrecE-0002tC-Qv
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 07:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nreZI-0000mg-No
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:43:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nreZG-0004e0-0V
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652960624;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QA/2YI1DsC9YAhafWqKhqSquAhnXlLE01QlYaem3uh8=;
 b=eM3vyG4GMdcCoNuNVgH8/8u7nj9tT73kkampRQ8o+9RdvNmrhSDAZdK8LB/KNISd5lWdTP
 2ZbpWUrmyD06o2F6Y919kfMEOec8MsNbV4LYqQ7IhAYz9mMChTv7rA8XhDplJJ0hWDbG+P
 aGTg3OTBxpZmCotiDgW+0w6U7DtP5V4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-gTmiSlxLMt2HYfPSNt9vrw-1; Thu, 19 May 2022 07:43:41 -0400
X-MC-Unique: gTmiSlxLMt2HYfPSNt9vrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 251E13C025BC;
 Thu, 19 May 2022 11:43:41 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 436EC1121314;
 Thu, 19 May 2022 11:43:39 +0000 (UTC)
Date: Thu, 19 May 2022 12:43:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PULL 0/8] Misc patches (Gitlab-CI, qtest, Capstone, ...)
Message-ID: <YoYtaEoBDNN6RHsF@redhat.com>
References: <20220518090438.158475-1-thuth@redhat.com>
 <c3fdc5fa-9bb1-dfb8-d763-1a0946f15aa5@linaro.org>
 <47c757d4-5576-cb24-6f90-027892a30720@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47c757d4-5576-cb24-6f90-027892a30720@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 19, 2022 at 08:29:09AM +0200, Thomas Huth wrote:
> On 18/05/2022 18.12, Richard Henderson wrote:
> > On 5/18/22 02:04, Thomas Huth wrote:
> > >   Hi Richard!
> > > 
> > > The following changes since commit eec398119fc6911d99412c37af06a6bc27871f85:
> > > 
> > >    Merge tag 'for_upstream' of
> > > git://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging
> > > (2022-05-16 16:31:01 -0700)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-05-18
> > > 
> > > for you to fetch changes up to 83602083b4ada6ceb86bfb327e83556ebab120fc:
> > > 
> > >    capstone: Remove the capstone submodule (2022-05-18 08:54:22 +0200)
> > > 
> > > ----------------------------------------------------------------
> > > * Remove Ubuntu 18.04 containers (not supported anymore)
> > > * Improve the cleanup of the QEMU binary in case of failing qtests
> > > * Update the Windows support statement
> > > * Remove the capstone submodule (and rely on Capstone of the distros instead)
> > 
> > Fails centos-stream-8-x86_64 test,
> > 
> > Run-time dependency capstone found: NO (tried pkgconfig)
> > ../meson.build:2539:2: ERROR: Dependency "capstone" not found, tried pkgconfig
> > 
> > https://gitlab.com/qemu-project/qemu/-/jobs/2473935684
> 
> That's a custom runner ... who has access to that one? Cleber? Stefan? I
> didn't spot an entry for it on https://wiki.qemu.org/AdminContacts ...
> 
> Anyway, somebody needs to install "capstone-devel" on that machine - or we
> need to disable capstone in scripts/ci/org.centos/stream/8/x86_64/configure
> now if the machine can't be changed...

This is pretty that when we add build deps we need someone to manually
inconvenient as a requirement :-(

It would be really nice if the host could run the jobs in containers,
so when the pull request contains container updates, it "just works"
in the same way as the standard gitlab runners.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


