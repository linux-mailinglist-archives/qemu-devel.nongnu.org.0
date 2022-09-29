Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1AB5EF092
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 10:35:04 +0200 (CEST)
Received: from localhost ([::1]:46632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odp0Y-0007Ov-SQ
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 04:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odogS-0001Kw-Db
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 04:14:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odogO-00043p-Aw
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 04:14:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664439249;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=M+jtD8xQZth37BQUJoyediUeKu7VvTzRMIc0shVI3H0=;
 b=WN0uH1mDKlkzeQ3LISz9gwjRcUnwNaNY3NRE1nYVAL9GQcPztZ2edDXkvJslrlXXzeQ9Xn
 c7RoC9nPDKfY+m1YCgX3fgS6xo2ZJU5C7wPAqfakwgqwIlzOdgHVJPYxg9eguqjxU4uWw8
 0rLtNM3S5ejWJpZzdv/76aNJkHm2qVQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-RkZOouWiMEyez3kO2PFX4Q-1; Thu, 29 Sep 2022 04:14:06 -0400
X-MC-Unique: RkZOouWiMEyez3kO2PFX4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E35381C09C83;
 Thu, 29 Sep 2022 08:14:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC6F1C15BA4;
 Thu, 29 Sep 2022 08:14:03 +0000 (UTC)
Date: Thu, 29 Sep 2022 09:14:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Brad Smith <brad@comstyle.com>
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] tests: Add sndio to the FreeBSD CI containers / VM
Message-ID: <YzVTyRiiXHEuj2QF@redhat.com>
References: <YzUoFisbfVsurncb@humpty.home.comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YzUoFisbfVsurncb@humpty.home.comstyle.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Thu, Sep 29, 2022 at 01:07:34AM -0400, Brad Smith wrote:
> tests: Add sndio to the FreeBSD CI containers / VM
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>
> ---
>  .gitlab-ci.d/cirrus/freebsd-12.vars | 2 +-
>  .gitlab-ci.d/cirrus/freebsd-13.vars | 2 +-
>  tests/vm/freebsd                    | 3 +++
>  3 files changed, 5 insertions(+), 2 deletions(-)

I already mentioned offlist, but for the benefit of others following along,
I'll point out that (in common with most of our dockerfiles) the '.vars'
files are auto-generated by lcitool  so should not be hand-editted. There
are docs on how to add new build pre-requisites in docs/devel/testing.rst,
under the heading "Adding new build pre-requisites". If anyone has questions
or needs assistance with lcitool I'm here to help.

> 
> diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
> index 1a5959810f..4a2b41a46c 100644
> --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
> +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
> @@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
>  NINJA='/usr/local/bin/ninja'
>  PACKAGING_COMMAND='pkg'
>  PIP3='/usr/local/bin/pip-3.8'
> -PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
> +PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
>  PYPI_PKGS=''
>  PYTHON='/usr/local/bin/python3'
> diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
> index 5e5aafd7e5..dc306aa858 100644
> --- a/.gitlab-ci.d/cirrus/freebsd-13.vars
> +++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
> @@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
>  NINJA='/usr/local/bin/ninja'
>  PACKAGING_COMMAND='pkg'
>  PIP3='/usr/local/bin/pip-3.8'
> -PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
> +PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
>  PYPI_PKGS=''
>  PYTHON='/usr/local/bin/python3'
> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> index 3643fe325d..d6ff4461ba 100755
> --- a/tests/vm/freebsd
> +++ b/tests/vm/freebsd
> @@ -66,6 +66,9 @@ class FreeBSDVM(basevm.BaseVM):
>  
>          # libs: networking
>          "libslirp",
> +
> +        # libs: sndio
> +        "sndio",
>      ]
>  
>      BUILD_SCRIPT = """

These tests/vm files *do* however need hand editting, as we have not yet
converted them to use lcitool auto-generated package lists.

The actual addition of 'sndio' is of course fine, once we get the lcitool
integration wired in.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


