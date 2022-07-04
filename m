Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DD756508F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:16:37 +0200 (CEST)
Received: from localhost ([::1]:40978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IC4-00067z-O5
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8IA6-00053z-VR
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:14:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8IA3-00023k-Hb
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656926068;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3u1BWvclzkU74SeVV2/KiAHu2dxAEuuyeyxP23vA5KY=;
 b=eXJ0jS6tgLoD3RRW2+VbQOSV0uc/gEgyhraqiqMgNbJ2TUMi5C9U9Q5R2798zvKA3yA+Zs
 5lmLv/KUlsvs31wLc68UZ/pOKcXDvC5UN4i213bs5xADVW+MDxiPFLHqETSz0wLewiXx9T
 VVoAhTPcBDaadrUqXdjr/K6cjGxkWA8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-dIPApKgYMtKHtvwb-TNuTg-1; Mon, 04 Jul 2022 05:14:25 -0400
X-MC-Unique: dIPApKgYMtKHtvwb-TNuTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51E921C05EB7;
 Mon,  4 Jul 2022 09:14:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6A9F141510F;
 Mon,  4 Jul 2022 09:14:20 +0000 (UTC)
Date: Mon, 4 Jul 2022 10:14:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Brad Smith <brad@comstyle.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>
Subject: Re: [PATCH 1/3] scripts/make-release: Do not include the edk2
 sources in the tarball anymore
Message-ID: <YsKvalrPIO96wWuP@redhat.com>
References: <20220704064254.18187-1-thuth@redhat.com>
 <20220704064254.18187-2-thuth@redhat.com>
 <CAJSP0QUx8456jPp4=MOjRwZMPrBYgU1669HnEpC_+gDobhOiCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJSP0QUx8456jPp4=MOjRwZMPrBYgU1669HnEpC_+gDobhOiCQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, Jul 04, 2022 at 08:26:34AM +0100, Stefan Hajnoczi wrote:
> On Mon, 4 Jul 2022 at 07:45, Thomas Huth <thuth@redhat.com> wrote:
> >
> > The edk2 sources are bigger than the sources of QEMU - so they double the
> > size of our release tarballs if we include them. Fortunately, edk2 has a
> > permissive license, so there is no need for us to do this as long as we
> > continue to distribute the edk2 license information in our release tarball.
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  scripts/make-release | 27 +++++++++++++++++++++------
> >  1 file changed, 21 insertions(+), 6 deletions(-)
> >
> > diff --git a/scripts/make-release b/scripts/make-release
> > index 05b14ecc95..f79ed7a2ae 100755
> > --- a/scripts/make-release
> > +++ b/scripts/make-release
> > @@ -20,19 +20,34 @@ git checkout "v${version}"
> >  git submodule update --init
> >  (cd roms/seabios && git describe --tags --long --dirty > .version)
> >  (cd roms/skiboot && ./make_version.sh > .version)
> > -# Fetch edk2 submodule's submodules, since it won't have access to them via
> > -# the tarball later.
> > +
> > +# Fetch edk2 submodule's submodules to get their license information.
> > +# Edk2 is distributed under permissive licenses, so we don't have to
> > +# include the full source tree here (which is bigger than QEMU's sources)
> > +# as long as we provide the license information in the tarball.
> >  #
> >  # A more uniform way to handle this sort of situation would be nice, but we
> >  # don't necessarily have much control over how a submodule handles its
> >  # submodule dependencies, so we continue to handle these on a case-by-case
> >  # basis for now.
> > -(cd roms/edk2 && \
> > -    git submodule update --init -- \
> > +cd roms/edk2
> > +git submodule update --init --depth 1 -- \
> >          ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3 \
> >          BaseTools/Source/C/BrotliCompress/brotli \
> > -        CryptoPkg/Library/OpensslLib/openssl \
> > -        MdeModulePkg/Library/BrotliCustomDecompressLib/brotli)
> > +        CryptoPkg/Library/OpensslLib/openssl
> > +mv ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3/COPYING.txt \
> > +   License-softfloat.txt
> > +mv BaseTools/Source/C/BrotliCompress/brotli/LICENSE License-brotli.txt
> > +mv CryptoPkg/Library/OpensslLib/openssl/LICENSE License-openssl.txt
> > +edk2rev=$(git rev-parse --short=12 HEAD)
> > +rm -r $(ls | grep -v License) .[a-z]*
> > +cat > sources.txt <<EOF
> > +The edk2 sources can be downloaded from:
> > +
> > +https://github.com/tianocore/edk2/archive/${edk2rev}.tar.gz
> 
> Please use QEMU's edk2 mirror:
> https://gitlab.com/qemu-project/edk2
> 
> QEMU mirrors all dependencies so that even if upstream projects go
> offline we can still rebuild all of QEMU from source.

Note that the github/lab generated tarballs are not signed, while
QEMU's release tarballs are gpg signed, so from that POV this would
be a regression no matter which site we point to.

Also it would need more guidance on what to actually do with the
tarball, as if you merely unpack it into this dir, it won't work
as it will be one level of dirs nesting too deep for QEMU's
build scripts to work.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


