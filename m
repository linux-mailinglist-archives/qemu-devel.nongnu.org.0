Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D48583B02
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 11:12:33 +0200 (CEST)
Received: from localhost ([::1]:41344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGzZH-00042p-Ir
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 05:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGz7h-00086z-3W
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 04:44:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGz7b-00047F-SV
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 04:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658997835;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DKNOBGTGACsgOQZJS4Zl38xeuF7YIi0IINaUI035qwg=;
 b=XoqsbnOCYFbvRd6Mh4p2E/MT95j8AxzJD5Un7SHI62icdA5JcQwuawnP1yYEXvm4msjuQd
 mFuukrBRYpcCVIZys48Xc+vAZqZk2Q0f9hKRvk/geSy5Rws7U7+dayDusqeqB2VWH8+et0
 naYCRX9CJT4CQ6+dS0v0wz4QSnujWeg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-gma4at5XNbCpNDqACChqpg-1; Thu, 28 Jul 2022 04:43:46 -0400
X-MC-Unique: gma4at5XNbCpNDqACChqpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C5002806AB0;
 Thu, 28 Jul 2022 08:43:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF5A31121314;
 Thu, 28 Jul 2022 08:43:44 +0000 (UTC)
Date: Thu, 28 Jul 2022 09:43:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Erik Skultety <eskultet@redhat.com>
Subject: Re: [RFC PATCH 8/8] tests/docker: Selective line reading by python
 script
Message-ID: <YuJML2PaiIRE2vGU@redhat.com>
References: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
 <20220727163632.59806-9-lucas.araujo@eldorado.org.br>
 <CAAdtpL6=AZkgs7rLGGxwmnyaB6WPDXdUwN2Cj4unZTkkci_YZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAdtpL6=AZkgs7rLGGxwmnyaB6WPDXdUwN2Cj4unZTkkci_YZQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jul 27, 2022 at 11:20:56PM +0200, Philippe Mathieu-Daudé wrote:
> +Erik/Daniel
> 
> On Wed, Jul 27, 2022 at 6:37 PM Lucas Mateus Castro(alqotel)
> <lucas.araujo@eldorado.org.br> wrote:
> >
> > Building some images failed on ppc64le because the dockerfile tried to
> > install some packages that are only available in x86 and arm64, to solve
> > this while still having those packages be available in those architectures
> > a comment was put before the installation command to instruct the python
> > script into ignoring those lines for some architectures (in this case
> > ppc64le)
> >
> > Overall I'm not a big fan of the way I solved this problem, so I'd like
> > to know if anyone has a better way to make these dockerfilse work in
> > PPC64LE.
> >
> > For context the base images used here are available in PPC64LE but some
> > of the packages installed are not (in alpine's case it's XEN, which is
> > only available to x86 and ARM), so this patch create a ignore_list which
> > is set on a per-architecture basis, and any packages in a dockerfile in
> > this ignore_list will not be copied to the temporary dockerfile used in
> > the docker command.
> 
> Shouldn't this be done on lcitool side?
> (https://gitlab.com/libvirt/libvirt-ci/-/tree/master/lcitool)

Yes, to fix this properly we'll need to identify which packages are
architecture specific, and create separate 'RUN' commands that skip
those packages on arches in question. Doable, but not entirely easy.

> 
> > Signed-off-by: Lucas Mateus Castro(alqotel) <lucas.araujo@eldorado.org.br>
> > ---
> >  tests/docker/docker.py                 | 15 ++++++++++++---
> >  tests/docker/dockerfiles/alpine.docker |  2 ++
> >  2 files changed, 14 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/docker/docker.py b/tests/docker/docker.py
> > index d0af2861b8..9b962d1c78 100755
> > --- a/tests/docker/docker.py
> > +++ b/tests/docker/docker.py
> > @@ -14,6 +14,7 @@
> >  import os
> >  import sys
> >  import subprocess
> > +import platform
> >  import json
> >  import hashlib
> >  import atexit
> > @@ -207,8 +208,15 @@ def _read_qemu_dockerfile(img_name):
> >
> >  def _dockerfile_preprocess(df):
> >      out = ""
> > +    ignore_list = []
> >      for l in df.splitlines():
> > -        if len(l.strip()) == 0 or l.startswith("#"):
> > +        if len(l.strip()) == 0:
> > +            continue
> > +        if l.startswith("#"):
> > +            if len(l.split()) >= 3:
> > +                if l.split()[1] == "ignore":
> > +                    if platform.processor() in l.split()[2].split(','):
> > +                        ignore_list += l.split()[3].split(',')
> >              continue
> >          from_pref = "FROM qemu/"
> >          if l.startswith(from_pref):
> > @@ -219,7 +227,8 @@ def _dockerfile_preprocess(df):
> >              inlining = _read_qemu_dockerfile(l[len(from_pref):])
> >              out += _dockerfile_preprocess(inlining)
> >              continue
> > -        out += l + "\n"
> > +        if not any(x in l.split() for x in ignore_list):
> > +            out += l + "\n"
> >      return out
> >
> >
> > @@ -330,7 +339,7 @@ def build_image(self, tag, docker_dir, dockerfile,
> >          tmp_df = tempfile.NamedTemporaryFile(mode="w+t",
> >                                               encoding='utf-8',
> >                                               dir=docker_dir, suffix=".docker")
> > -        tmp_df.write(dockerfile)
> > +        tmp_df.write(_dockerfile_preprocess(dockerfile))
> >
> >          if user:
> >              uid = os.getuid()
> > diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
> > index 2943a99730..5cec46d8f2 100644
> > --- a/tests/docker/dockerfiles/alpine.docker
> > +++ b/tests/docker/dockerfiles/alpine.docker
> > @@ -6,6 +6,8 @@
> >
> >  FROM docker.io/library/alpine:edge
> >
> > +# Lines to by ignored when this file is read by the python script
> > +# ignore ppc64le,ppc64 xen-dev
> >  RUN apk update && \
> >      apk upgrade && \
> >      apk add \
> > --
> > 2.25.1
> >
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


