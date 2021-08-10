Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8E23E58EA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 13:14:28 +0200 (CEST)
Received: from localhost ([::1]:47632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDPiF-0002DO-PB
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 07:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDPhH-0001Y0-Cd
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:13:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDPhE-0003f1-71
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:13:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628594003;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jv3n3C/MZIu/oEOP9q+MXg2Yo/AVXc0J6hW05KKan60=;
 b=SiTBwzosGbqtIdiVAIrj5UB1C7GhhU9sRXqZEmJM7kFBRr9OSTkVYtCWM+CzAuRbrBj8cR
 y2sOJ6HrpYhMPNewONaCmji1ErlfBe2P30AZEKQxx9Q5VjqrsTnEE67SwLcD6mUneKQvRB
 vbtw/8FpBKsogNyQMmIRZoFBAuSBH/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-7FFhhtLYNSK_jGMXcnMUjg-1; Tue, 10 Aug 2021 07:13:19 -0400
X-MC-Unique: 7FFhhtLYNSK_jGMXcnMUjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04C2B107ACF5;
 Tue, 10 Aug 2021 11:13:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3804260C05;
 Tue, 10 Aug 2021 11:13:18 +0000 (UTC)
Date: Tue, 10 Aug 2021 12:13:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] docs: make sphinx-build be quiet by default
Message-ID: <YRJfS7yRmwO+bQBt@redhat.com>
References: <20210810110023.3923155-1-berrange@redhat.com>
 <CAFEAcA_J2T92Gr6-koxofLw5cFEad4evLkSXS9L9gef1OV1yLQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_J2T92Gr6-koxofLw5cFEad4evLkSXS9L9gef1OV1yLQ@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 10, 2021 at 12:06:47PM +0100, Peter Maydell wrote:
> On Tue, 10 Aug 2021 at 12:01, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > The sphinx-build is fairly verbose spitting out pages of output to the
> > console, which causes errors from other build commands to be scrolled
> > off the top of the terminal. This can leave the mistaken impression that
> > the build passed, when in fact there was a failure.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  docs/meson.build | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/docs/meson.build b/docs/meson.build
> > index 300b134329..29e119a3cc 100644
> > --- a/docs/meson.build
> > +++ b/docs/meson.build
> > @@ -21,7 +21,7 @@ if sphinx_build.found()
> >    run_command('mkdir', ['-p', tmpdir / 'sphinx'])
> >    run_command('touch', [tmpdir / 'sphinx/index.rst'])
> >    sphinx_build_test_out = run_command(SPHINX_ARGS + [
> > -    '-c', meson.current_source_dir(),
> > +    '-q', '-c', meson.current_source_dir(),
> >      '-b', 'html', tmpdir / 'sphinx',
> >      tmpdir / 'sphinx/out'])
> >    build_docs = (sphinx_build_test_out.returncode() == 0)
> > @@ -98,8 +98,9 @@ if build_docs
> >                                input: this_manual,
> >                                install: build_docs,
> >                                install_dir: install_dirs,
> > -                              command: [SPHINX_ARGS, '-b', 'man', '-d', private_dir,
> > -                                        input_dir, meson.current_build_dir()])
> > +                              command: [SPHINX_ARGS, '-q', '-b', 'man',
> > +                                        '-d', private_dir, input_dir
> > +                                        meson.current_build_dir()])
> >
> >    alias_target('sphinxdocs', sphinxdocs)
> >    alias_target('html', sphinxdocs)
> 
> Can we make meson pass '-q' only for non-verbose builds, so that
> if you pass make 'V=1' you still get the verbose sphinx output ?

The meson.build rules are turned into a ninja.build file at configure time.
IOW, at the time that conversion happens the V=1 arg isn't present, so we
can't conditionally pass '-q'. 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


