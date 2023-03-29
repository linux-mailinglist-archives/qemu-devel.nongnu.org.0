Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FEE6CD40B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 10:08:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phQq8-0007DK-JV; Wed, 29 Mar 2023 04:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phQpz-0007C1-Nm
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 04:07:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phQpx-0007CX-Pq
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 04:07:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680077236;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DgOzQXuiNTMWy6S0mm3119RDkrCUtm1+m2sDAslZWWg=;
 b=QBLYdbTElvqsasmrTrL0gJT+QmXX3KTxiuCni/mHtbxJDWd+l2L1vk5lIrXB6wBsHv8nwz
 be5rcigB5+67iY/O+2D8LdTS7H4j08Uhg0Su03xKCGVZWb9zmnf/KBwIScXAvV8gSbOIIn
 C3bRBMQOwGpH33ztTK+i298d4blR4D4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-YGs9xcHONiKB57A_ImVysg-1; Wed, 29 Mar 2023 04:07:14 -0400
X-MC-Unique: YGs9xcHONiKB57A_ImVysg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59165886065;
 Wed, 29 Mar 2023 08:07:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8D741121333;
 Wed, 29 Mar 2023 08:07:12 +0000 (UTC)
Date: Wed, 29 Mar 2023 09:07:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: egl compile error on msys CI runners
Message-ID: <ZCPxrZT+JlBNL/b6@redhat.com>
References: <CAFEAcA96hY7wxj9NjbkZmBshA6VECUQktNXAyGdS+-zLL5rWmw@mail.gmail.com>
 <CAJ+F1C+6YYdNoFbraKwaw0A5NeUnwdJvrM6q98V6z0f-hr68Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1C+6YYdNoFbraKwaw0A5NeUnwdJvrM6q98V6z0f-hr68Tw@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 29, 2023 at 11:01:35AM +0400, Marc-André Lureau wrote:
> Hi Peter
> 
> On Tue, Mar 28, 2023 at 6:39 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > The msys CI runners have started failing to compile with an EGL
> > related error:
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/4015682307
> >
> > In file included from
> > C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/include/epoxy/egl.h:46,
> > from C:/GitLab-Runner/builds/qemu-project/qemu/include/ui/egl-helpers.h:5,
> > from ../ui/egl-helpers.c:21:
> > C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/include/epoxy/egl_generated.h:11:10:
> > fatal error: EGL/eglplatform.h: No such file or directory
> > 11 | #include "EGL/eglplatform.h"
> > | ^~~~~~~~~~~~~~~~~~~
> > ninja: build stopped: subcommand failed.
> >
> > Dan says this is because of a msys2 packaging issue:
> > https://github.com/msys2/MINGW-packages/issues/16492
> >
> > Can we have a meson test that doesn't try to enable EGL on systems
> > like this one where it's broken ? Changing the current meson.build
> >   if cc.has_header('epoxy/egl.h', dependencies: epoxy)
> > to whatever the meson is for "actually try to compile with the
> > header" ought to do the trick, I think.
> >
> 
> This is an unfortunate consequence of using a fast-moving rolling
> distribution, there are random breakages. It would make sense to have
> tagged / pre-built images instead. That would also speed up the CI a
> bit, hopefully.

IMHO if the distro is considered susceptible to ongoing random
breakage we must not use it as a gating CI job. IOW, these
msys jobs should have 'allow-failure: true' added to their
definition.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


