Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2D55FC2CF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 11:14:50 +0200 (CEST)
Received: from localhost ([::1]:42614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiXpB-0003Z5-66
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 05:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiXjN-0007gq-FM
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:08:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiXjJ-0001Aq-Gk
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665565724;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbL7ar16b35BCiT9eoC5+F7aQ5L3YDhb4MZyc4sNZ1k=;
 b=f8yXonwz6/gpMJz0dCCVxGKLrg+FLc1Dd1URwH1sXXi8/svvVcHqR990qOeH/n1dn2R8ST
 t3Bct8LbQ30DlXbmyZBWJMxdUhAWwAk9QnAuDWmJxqCKiBwnKiPPwHTb/sdf+bTmMCYlLt
 yGw9mLOC2CocddK3RNMcb5kXQHRjNnU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-6ntF6pE1NE-ft731u45Z1Q-1; Wed, 12 Oct 2022 05:08:41 -0400
X-MC-Unique: 6ntF6pE1NE-ft731u45Z1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EC38185A792;
 Wed, 12 Oct 2022 09:08:41 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52C5D40E993C;
 Wed, 12 Oct 2022 09:08:40 +0000 (UTC)
Date: Wed, 12 Oct 2022 10:08:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Hajnoczi, Stefan" <stefanha@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PULL 1/1] Revert "configure: build ROMs with container-based
 cross compilers"
Message-ID: <Y0aEFUOU0DCWgvcL@redhat.com>
References: <20221011192858.956078-1-alex.bennee@linaro.org>
 <20221011192858.956078-2-alex.bennee@linaro.org>
 <CABgObfY42pEWRe67qZJ78LdnEmL+xK+V5c_Ut+cxoqJ7Gw4mzQ@mail.gmail.com>
 <Y0Z3fMpQo+8fz9ul@redhat.com>
 <bd325ff3-831e-ca4d-4ada-e2650a0a908b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd325ff3-831e-ca4d-4ada-e2650a0a908b@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Oct 12, 2022 at 10:59:54AM +0200, Paolo Bonzini wrote:
> On 10/12/22 10:14, Daniel P. Berrangé wrote:
> > > Daniel, does building the TCG tests work for you? If not, I think we should
> > > just disable containers by default.
> > 
> > I've never (knowingly) tried running TCG tests. IIUC, they are strictly
> > an opt-in test needing explicit 'make check-tcg', so any container usage
> > wouldn't be encountered by most contributors ?
> 
> Yeah, that is true.  But the problems below affect all container usage
> rather than just firmware builds, so they should be fixed there. configure
> is able to only run 'make check-tcg' for targets which have a compiler
> installed.
> 
> > IOW, I'd like to see
> > 
> >   - Explicit opt-in at configure time for use of container
> >     downloads during 'make'
> 
> This is what I'm proposing, and extending to all targets.

Ok, makes sense.

> >   - Tailor downloads wrt the target list configured
> 
> This is already done.

Where's the patch for that, I hadn't noticed it being posted yet ?

> >   - Suppress the verbose output to preserve meson progress
> >     readability
> 
> That's in general a tradeoff with long-running tasks.  It's difficult to say
> which is better, for example "make check" also has a verbose output.

If 'make' was running with V=1, then also letting docker download be
verbose makes sense.

The plain 'make' though is intentionally quite terse, just giving a
list of files meson compiles. Right now, the output ends up looking
like this:

[2715/2945] Compiling C object tests/unit/test-xbzrle.p/test-xbzrle.c.o
[2716/2945] Linking target tests/unit/test-authz-pam
Copying blob bd159e379b3b skipped: already exists  
Copying blob fc8d65e34cd5 [>-------------------------------------] 9.3MiB / 360.2MiB
Copying blob 13224e2971af [--------------------------------------] 1.1MiB / 366.5MiB
[2720/2945] Linking target tests/unit/test-io-channel-tls
Copying blob bd159e379b3b skipped: already exists  
Copying blob fc8d65e34cd5 [>-------------------------------------] 9.4MiB / 360.2MiB
Copying blob 13224e2971af [--------------------------------------] 1.2MiB / 366.5MiB
[2724/2945] Linking target tests/unit/test-io-task
[2725/2945] Compiling C object tests/unit/test-util-sockets.p/test-util-sockets.c.o
[2726/2945] Compiling C object tests/unit/test-util-sockets.p/socket-helpers.c.o
[2727/2945] Linking target tests/unit/test-xbzrle
[2728/2945] Compiling C object tests/unit/test-base64.p/test-base64.c.o
[2729/2945] Linking target tests/unit/test-timed-average
[2730/2945] Compiling C object tests/unit/test-bufferiszero.p/test-bufferiszero.c.o
Copying blob bd159e379b3b skipped: already exists  
Copying blob 2a205c8a1d36 [>-------------------------------------] 4.4MiB / 257.2MiB
Copying blob bd159e379b3b skipped: already exists  
Copying blob fc8d65e34cd5 [>-------------------------------------] 9.5MiB / 360.2MiB
Copying blob 13224e2971af [--------------------------------------] 1.3MiB / 366.5MiB
[2736/2945] Compiling C object tests/unit/test-yank.p/test-yank.c.o
[2737/2945] Compiling C object tests/unit/test-util-filemonitor.p/test-util-filemonitor.c.o
Copying blob bd159e379b3b skipped: already exists  
Copying blob fc8d65e34cd5 [>-------------------------------------] 9.6MiB / 360.2MiB
Copying blob 13224e2971af [--------------------------------------] 1.3MiB / 366.5MiB


which I feel is quite unplesant, especially when you then get
multiple parallel docker downloads concurrently refreshing the
screen and overwriting each others' output.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


