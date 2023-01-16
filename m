Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBE766BC1E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 11:46:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHN0N-0000xd-PZ; Mon, 16 Jan 2023 05:46:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHN0I-0000wE-Tz
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 05:46:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHN0H-0000xH-1w
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 05:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673865971;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v7706M3lpfw4HUKk7huWMmBXo9aFYMV7D7JQDZwgUk0=;
 b=SvA1J02pNnhIadKMK4ZXWLDPQX+BlJ2W3N0gq2TjfBYATHojapfT22GBe4rjgFR9iQC8Xv
 mt9umDwZmcs9hOpdMuidNsLhXTKk6EGOQ9bXe03vMqotf2ClBFRecbJjgDFeQFdtNwSZhZ
 wIpkksNtpKO1BlWVwgfN4gX5uKST9y4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-aq0kKo7QNYuZtH1lzeNN0w-1; Mon, 16 Jan 2023 05:46:08 -0500
X-MC-Unique: aq0kKo7QNYuZtH1lzeNN0w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4E443814588;
 Mon, 16 Jan 2023 10:46:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 196DE51FF;
 Mon, 16 Jan 2023 10:46:04 +0000 (UTC)
Date: Mon, 16 Jan 2023 10:46:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, kraxel@redhat.com,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 pbonzini@redhat.com, Eric Farman <farman@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, thuth@redhat.com,
 Halil Pasic <pasic@linux.ibm.com>,
 Michael Roth <michael.roth@amd.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ed Maste <emaste@freebsd.org>
Subject: Re: [PATCH v4 8/8] lcitool: drop texinfo from QEMU
 project/dependencies
Message-ID: <Y8Uq6sEL813/Suu+@redhat.com>
References: <20230110132700.833690-1-marcandre.lureau@redhat.com>
 <20230110132700.833690-9-marcandre.lureau@redhat.com>
 <87bkmyvljj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bkmyvljj.fsf@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

On Mon, Jan 16, 2023 at 10:06:07AM +0000, Alex Bennée wrote:
> 
> marcandre.lureau@redhat.com writes:
> 
> > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> >
> > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> I'm not sure how but this is re-breaking the windows build you just fixed:
> 
>   In file included from /usr/x86_64-w64-mingw32/sys-root/mingw/include/epoxy/egl.h:46,
>                    from /tmp/qemu-test/src/include/ui/egl-helpers.h:5,
>                    from /tmp/qemu-test/src/include/ui/gtk.h:25,
>                    from ../src/ui/gtk.c:42:
>   /usr/x86_64-w64-mingw32/sys-root/mingw/include/epoxy/egl_generated.h:11:10: fatal error: EGL/eglplatform.h: No such file or directory
>      11 | #include "EGL/eglplatform.h"
>         |          ^~~~~~~~~~~~~~~~~~~
>   compilation terminated.
> 
> I'm going to drop this patch for now.

We don't include mingw*-epoxy in the QEMU container, and AFAIK
nothing else we install has it as a dependency, so I'm guessing
you must have done a build locally rather than with our windows
containers ?

Ultimately this is a RPM packaging bug, which was recently fixed
in Fedora

commit 1e748f66e067d9332bc02f1ea994b6dd3b5e47f3 (HEAD -> f37, origin/rawhide, origin/main, origin/f37, origin/HEAD, rawhide)
Author: Kalev Lember <klember@redhat.com>
Date:   Fri Jan 13 14:36:35 2023 +0100

    Add missing runtime requires on mingw-angleproject
    
    This fixes gtk cross compilation in upstream CI that started to fail
    with:
    
    /usr/x86_64-w64-mingw32/sys-root/mingw/include/epoxy/egl_generated.h:11:10: fatal error: EGL/eglplatform.h: No such file or directory


So you should be able to just 'dnf update' to fix this.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


