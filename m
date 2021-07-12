Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80013C5C5C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:39:57 +0200 (CEST)
Received: from localhost ([::1]:49790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vE4-0007wc-Qu
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2v2P-000598-O8
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2v2M-0000VZ-9T
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626092868;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hmz6xba7CMv+t84WBCBttBw9AETBnWeEZDMHoDd30Sg=;
 b=BQDb1kfBGdx+Xy6OnpLdeB30U2UMUSy9SIuck/UPtjtbbIsws+v5PrMhvYzRKUwsKHOZmQ
 cHl92+9JnfsavNhZ7peFmSeJlOaV5HvhCqpcijSkG6kef56VnwY67Oa2wvCc+ypVk//HHC
 V3U+6rh6er15MGdRQp/eVEO2Sr3SrU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-Y6ltknMNPbGfdCrL_ckAag-1; Mon, 12 Jul 2021 08:27:43 -0400
X-MC-Unique: Y6ltknMNPbGfdCrL_ckAag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6C391922965;
 Mon, 12 Jul 2021 12:27:42 +0000 (UTC)
Received: from redhat.com (ovpn-114-105.ams2.redhat.com [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A985D60936;
 Mon, 12 Jul 2021 12:27:41 +0000 (UTC)
Date: Mon, 12 Jul 2021 13:27:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/48] Misc patches for QEMU 6.1 soft freeze
Message-ID: <YOw1OlURU/UfnHUs@redhat.com>
References: <20210710185818.444407-1-pbonzini@redhat.com>
 <CAFEAcA-XYOkrfzxZmq0DyS2HTKmJ-0LoKzO5X5q8tyFmHF9dwg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-XYOkrfzxZmq0DyS2HTKmJ-0LoKzO5X5q8tyFmHF9dwg@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 11:01:55AM +0100, Peter Maydell wrote:
> On Sat, 10 Jul 2021 at 20:01, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > The following changes since commit 05de778b5b8ab0b402996769117b88c7ea5c7c61:
> >
> >   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-07-09 14:30:01 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/bonzini/qemu.git tags/for-upstream
> >
> > for you to fetch changes up to 411ad8dd80077e98ed465775b044caf1a9482f6c:
> >
> >   meson: Use input/output for entitlements target (2021-07-09 18:21:34 +0200)
> >
> > v1->v2: fix docs build, add final patch for entitlements target
> >
> > ----------------------------------------------------------------
> > * More SVM fixes (Lara)
> > * Module annotation database (Gerd)
> > * Memory leak fixes (myself)
> > * Build fixes (myself)
> > * --with-devices-* support (Alex)
> >
> > ----------------------------------------------------------------
> 
> 
> Applied, thanks.
> 
> Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
> for any user-visible changes.

This series has broken the build for me:

/usr/bin/ld: libqemuutil.a(util_async.c.o): in function `aio_setup_linux_io_uring':
/home/berrange/src/virt/qemu/build/../util/async.c:421: undefined reference to `luring_init'
/usr/bin/ld: /home/berrange/src/virt/qemu/build/../util/async.c:426: undefined reference to `luring_attach_aio_context'
/usr/bin/ld: libqemuutil.a(util_async.c.o): in function `aio_ctx_finalize':
/home/berrange/src/virt/qemu/build/../util/async.c:334: undefined reference to `luring_detach_aio_context'
/usr/bin/ld: /home/berrange/src/virt/qemu/build/../util/async.c:335: undefined reference to `luring_cleanup'
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.

git bisect blames:

commit 63a7f853063133fd1aa34ab0744b009fa3d7e183 (refs/bisect/bad)
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Thu Jul 8 13:50:06 2021 +0200

    meson: fix missing preprocessor symbols
    
    While most libraries do not need a CONFIG_* symbol because the
    "when:" clauses are enough, some do.  Add them back or stop
    using them if possible.
    
    In the case of libpmem, the statement to add the CONFIG_* symbol
    was still in configure, but could not be triggered because it
    checked for "no" instead of "disabled" (and it would be wrong anyway
    since the test for the library has not been done yet).
    
    Reported-by: Li Zhijian <lizhijian@cn.fujitsu.com>
    Fixes: 587d59d6cc ("configure, meson: convert virgl detection to meson", 2021-07-06)
    Fixes: 83ef16821a ("configure, meson: convert libdaxctl detection to meson", 2021-07-06)
    Fixes: e36e8c70f6 ("configure, meson: convert libpmem detection to meson", 2021-07-06)
    Fixes: 53c22b68e3 ("configure, meson: convert liburing detection to meson", 2021-07-06)
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>




IIUC, we didn't detect this in gitlab CI because liburing-devel is not
present in any of the dockerfiles currently in git master. This omission
is fixed in my series here which will be in Alex's next pull:

  https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg06374.html

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


