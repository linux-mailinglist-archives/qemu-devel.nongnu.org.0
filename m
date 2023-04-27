Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C636F05C9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:29:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps0kV-0005x8-Jv; Thu, 27 Apr 2023 08:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ps0kS-0005wz-65
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:29:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ps0kQ-0007Iu-0v
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682598557;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/AO40HmGUkOR6xF7Imhi9uHL3rAQ42gfquEM/G9taSo=;
 b=OIsfnNRlRd4KDLT4hwMSP9HPK8QtkSlxtbfz1SHL3ExKOOA1vxDa5bmlEkNvx+ggIMkYTS
 yL2yFALUV2xlh/ynHQL1EpxS36DfER5Ubs4bMOq6HUpGeHKqkqB7G3pi0prqgHTiPyNSXp
 fVlYBh4FV/1Q2Nd9ostlDzzP6xsQg0I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-0LJimcgLP0Cu4RdDX5_R0g-1; Thu, 27 Apr 2023 08:29:14 -0400
X-MC-Unique: 0LJimcgLP0Cu4RdDX5_R0g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB3848314EE;
 Thu, 27 Apr 2023 12:29:13 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90B9940C2064;
 Thu, 27 Apr 2023 12:29:12 +0000 (UTC)
Date: Thu, 27 Apr 2023 13:29:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] meson: Pass -j option to sphinx
Message-ID: <ZEpqlegE9XG/n19Z@redhat.com>
References: <20230426160347.8860-1-farosas@suse.de>
 <6b0da42b-1588-e3ee-6868-0592784f9483@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6b0da42b-1588-e3ee-6868-0592784f9483@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Apr 27, 2023 at 02:24:59PM +0200, Thomas Huth wrote:
> On 26/04/2023 18.03, Fabiano Rosas wrote:
> > Save a bit of build time by passing the number of jobs option to
> > sphinx.
> > 
> > To avoid warnings from sphinx, alter our plugins to inform whether
> > they support parallelism. The two plugins touched are quite simple and
> > I don't see anything that would indicate they do not support being
> > called in parallel, so return True for both reads and writes.
> > 
> > before:
> >   $ time make -j16 man html
> >   ...
> >   [1/2] Generating docs/QEMU manual with a custom command
> >   [2/2] Generating docs/QEMU man pages with a custom command
> > 
> >   real    0m49.770s
> >   user    0m49.425s
> >   sys     0m0.716s
> > 
> > after:
> >   $ time make -j16 man html
> >   ...
> >   [1/2] Generating docs/QEMU manual with a custom command (wrapped by meson because command contains newlines)
> >   [2/2] Generating docs/QEMU man pages with a custom command (wrapped by meson because command contains newlines)
> >   real    0m30.153s
> >   user    1m5.945s
> >   sys     0m2.440s
> > 
> > Signed-off-by: Fabiano Rosas <farosas@suse.de>
> > ---
> >   docs/meson.build           | 12 ++++++++++++
> >   docs/sphinx/fakedbusdoc.py |  5 +++++
> >   docs/sphinx/qmp_lexer.py   |  5 +++++
> >   3 files changed, 22 insertions(+)
> > 
> > diff --git a/docs/meson.build b/docs/meson.build
> > index f220800e3e..9e4bed6fa0 100644
> > --- a/docs/meson.build
> > +++ b/docs/meson.build
> > @@ -10,6 +10,18 @@ if sphinx_build.found()
> >       SPHINX_ARGS += [ '-W', '-Dkerneldoc_werror=1' ]
> >     endif
> > +  sphinx_version = run_command(SPHINX_ARGS + ['--version'],
> > +                               check: false).stdout().split()[1]
> > +  if sphinx_version.version_compare('>=5.1.2')
> > +    SPHINX_ARGS += ['-j', 'auto']
> > +  else
> > +    nproc = find_program('nproc')
> > +    if nproc.found()
> > +      jobs = run_command(nproc, check:false).stdout()
> > +      SPHINX_ARGS += ['-j', jobs]
> > +    endif
> > +  endif
> 
> Wouldn't it be better to use the value from "make -jXX" instead of always
> running with the maximum number of processors here?

IIUC, this is not exposed by meson.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


