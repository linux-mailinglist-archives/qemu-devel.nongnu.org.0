Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A311495E9D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:52:51 +0100 (CET)
Received: from localhost ([::1]:37414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAsTK-0004tZ-6p
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:52:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAsOK-0001CD-PX
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:47:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAsOJ-0002MW-7u
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642765658;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WJa4CFLImtv1ghIzbvQizL62OMtL8KIsRCGQBwW6mUo=;
 b=S0HcyLYK5YL6+2cB5jq74+aBEc2rvSWS+xK7jNtrTyMrLd81jy/9BIAlOVnpzSfZKccGY7
 Zy0mnfV/1gWuUL9FQrnUm5XZ+zY4lJFdb47X1KkgH8LiR/ZfLgdpu9FekTYHhRgUOyqUzU
 vNdGfLrRWZlOZhNmxDsitORxztNANsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-UHCKTRn8MQi7BZkD_pW24w-1; Fri, 21 Jan 2022 06:47:24 -0500
X-MC-Unique: UHCKTRn8MQi7BZkD_pW24w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DD2484BA40;
 Fri, 21 Jan 2022 11:47:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E4F30795B2;
 Fri, 21 Jan 2022 11:47:19 +0000 (UTC)
Date: Fri, 21 Jan 2022 11:47:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 4/8] tests: Refresh lcitool submodule
Message-ID: <YeqdROki4KJkT8RR@redhat.com>
References: <20220121103623.288054-1-f4bug@amsat.org>
 <20220121103623.288054-5-f4bug@amsat.org>
 <9d09394f-20b3-eb07-d962-9d723b0d3c3d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9d09394f-20b3-eb07-d962-9d723b0d3c3d@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Yonggang Luo <luoyonggang@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 21, 2022 at 12:40:48PM +0100, Thomas Huth wrote:
> On 21/01/2022 11.36, Philippe Mathieu-Daudé wrote:
> > Refresh lcitool submodule and the generated files by running:
> > 
> >    $ make lcitool-refresh
> > 
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > ---
> >   .gitlab-ci.d/cirrus/freebsd-12.vars           | 2 +-
> >   .gitlab-ci.d/cirrus/freebsd-13.vars           | 2 +-
> >   tests/docker/dockerfiles/alpine.docker        | 3 ++-
> >   tests/docker/dockerfiles/centos8.docker       | 3 +--
> >   tests/docker/dockerfiles/fedora.docker        | 3 +--
> >   tests/docker/dockerfiles/opensuse-leap.docker | 2 +-
> >   tests/docker/dockerfiles/ubuntu1804.docker    | 2 +-
> >   tests/docker/dockerfiles/ubuntu2004.docker    | 2 +-
> >   tests/lcitool/libvirt-ci                      | 2 +-
> >   9 files changed, 10 insertions(+), 11 deletions(-)
> > 
> > diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
> > index 9c52266811f..bdcce578edf 100644
> > --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
> > +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
> > @@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
> >   NINJA='/usr/local/bin/ninja'
> >   PACKAGING_COMMAND='pkg'
> >   PIP3='/usr/local/bin/pip-3.8'
> > -PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
> > +PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
> 
> Aren't the FreeBSD jobs currently failing due to lttng-ust not being
> available anymore? ... I'd somehow expected that this update might fix this,
> too, but I still see lttng-ust in the list here?

I had prepped an update to drop it, but @bsdimp indicated that it ought
to be a transient problem so I never applied it, hoping it would fix
itself.

https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/211

It has been broken for ~2 weeks now though, and lttng-ust is not an
especially critical feature so we should probably just go ahead and
disable it regardless.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


