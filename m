Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DC5582297
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:00:52 +0200 (CEST)
Received: from localhost ([::1]:49134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGcuR-0006Ln-Fd
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGcou-0001I9-QJ
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:55:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGcor-0005oP-BF
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658912104;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1nYV3sm+8cvRWyUnKYzKeek0x9TAEoBQyXnqgIxwXA=;
 b=bkovGRhDz5J3Wnn1LoPO5+cXQCeLs6/kR7zI0eA9OwDCqG7jEelSCbIU5HGWetLXCi57tx
 OBdD378vknYCHzW4QxFswjIQfvHEcn6aHFxv5aEatYG5ZSBE3VloZNJpHdaJIpB+Zfa/7t
 tZ6B0XfvNAt7iH70ZcrTu6NcRehkqj8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-Zz0keAkLNCmcMCw5wnSEIQ-1; Wed, 27 Jul 2022 04:55:02 -0400
X-MC-Unique: Zz0keAkLNCmcMCw5wnSEIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 644DA2804078;
 Wed, 27 Jul 2022 08:55:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F307F1121314;
 Wed, 27 Jul 2022 08:55:00 +0000 (UTC)
Date: Wed, 27 Jul 2022 09:54:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH] .gitlab-ci.d/windows.yml: Enable native Windows symlink
Message-ID: <YuD9YuSbmCbzo9kB@redhat.com>
References: <20220725123000.807608-1-bmeng.cn@gmail.com>
 <874jz5i9qr.fsf@linaro.org>
 <CAEUhbmWBaCrODGY_KMncAmTy53gmid4R=OKDMTi1T1fR0PUBMw@mail.gmail.com>
 <CAEUhbmWkVfjEgkg6uQ8cVVO7ipdiKuKeuco+fGNQ4zZdCnrA4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEUhbmWkVfjEgkg6uQ8cVVO7ipdiKuKeuco+fGNQ4zZdCnrA4Q@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Wed, Jul 27, 2022 at 02:02:48PM +0800, Bin Meng wrote:
> On Tue, Jul 26, 2022 at 9:38 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Mon, Jul 25, 2022 at 9:48 PM Alex Bennée <alex.bennee@linaro.org> wrote:
> > >
> > >
> > > Bin Meng <bmeng.cn@gmail.com> writes:
> > >
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > The following error message was seen during the configure:
> > > >
> > > >   "ln: failed to create symbolic link
> > > >   'x86_64-softmmu/qemu-system-x86_64.exe': No such file or directory"
> > > >
> > > > By default the MSYS environment variable is not defined, so the runtime
> > > > behavior of winsymlinks is: if <target> does not exist, 'ln -s' fails.
> > > > At the configure phase, the qemu-system-x86_64.exe has not been built
> > > > so creation of the symbolic link fails hence the error message.
> > > >
> > > > Set winsymlinks to 'native' whose behavior is most similar to the
> > > > behavior of 'ln -s' on *nix, that is:
> > > >
> > > >   a) if native symlinks are enabled, and whether <target> exists
> > > >      or not, creates <destination> as a native Windows symlink;
> > > >   b) else if native symlinks are not enabled, and whether <target>
> > > >      exists or not, 'ln -s' creates as a Windows shortcut file.
> > > >
> > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > >
> > > I'm still seeing Windows build failures such as:
> > >
> > >   https://gitlab.com/stsquad/qemu/-/jobs/2765579269
> >
> > I've seen this one before. Looks like this one can be easily reproduced.
> >
> > >
> > > and
> > >
> > >   https://gitlab.com/stsquad/qemu/-/jobs/2765579267
> >
> > This one seems to be a random failure?
> >
> 
> Saw another random failure today in the msys2-32bit build in CI.
> 
> [313/1788] Generating texture-blit-vert.h with a custom command
> (wrapped by meson to capture output)
> FAILED: ui/shader/texture-blit-vert.h
> "C:/GitLab-Runner/builds/lbmeng/qemu/msys64/mingw32/bin/python3.exe"
> "C:/GitLab-Runner/builds/lbmeng/qemu/meson/meson.py" "--internal"
> "exe" "--capture" "ui/shader/texture-blit-vert.h" "--" "perl"
> "C:/GitLab-Runner/builds/lbmeng/qemu/scripts/shaderinclude.pl"
> "../ui/shader/texture-blit.vert"
> [314/1788] Generating texture-blit-flip-vert.h with a custom command
> (wrapped by meson to capture output)
> ninja: build stopped: subcommand failed.
> make: *** [Makefile:162: run-ninja] Error 1

IMHO we need to just drop the msys jobs from GitLab. They are too
unreliable and causing frequent failed pipelines. 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


