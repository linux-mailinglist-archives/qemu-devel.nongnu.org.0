Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65DB5EED38
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 07:28:21 +0200 (CEST)
Received: from localhost ([::1]:52806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odm5r-0006Bw-7Z
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 01:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1odlxC-0004LZ-9a
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 01:19:23 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:38704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1odlxA-0003Y3-26
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 01:19:21 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4MdM9K26RFz3x1D
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 05:19:17 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4MdM9K1HhJz3rLh
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 05:19:17 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1664428757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7ffEIxUtaoSjzvNq0lJCsnFESlQwxdPN5nvy8VPK14=;
 b=e4rGOngsdL2IMn1UZa7gereN6WuXv+8fhrc5aKHKwjo7MU+rurmMh+aPNzEfOm9IVqYbf1
 dB9pMI9PxXeOgdl9C+k/BajDXkKqi6tMpBojAzw9gQiPR4/QcFEehvZ77L2b4MhN+pS0if
 lVNPA1IfDoKnVfghbSbKVqISBF/7c/zwAl+2OEsPntH1qha9uTGhSTgNdRC0o3uT/LQkw4
 OBpEhBF/X0FqFlsUwHHQiwgYyxAT8XOy1FTbBgdLcVy+l3cFAISTpHwidJIOZTmbhO5Iu/
 laaNP7cRH6TqVdyIcKmKUpftK0HDzokcu/H2gckiDp3OAumIrEtLdvJNcMwI+w==
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4MdM9K0BwxzvhR
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 05:19:17 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f174.google.com with SMTP id gb14so188008qtb.3
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 22:19:17 -0700 (PDT)
X-Gm-Message-State: ACrzQf0klvf/BjSvBYaOuLsEr8bqYveye7aglU70hj9/hjTC/ZC920zV
 DD3LuIJkxq/3e90jC3IUKlY5jY5jQsAtbp63bcw=
X-Google-Smtp-Source: AMsMyM44Y+uxvMBOY64NF1kErykI7fUDYU81aZ2nKAUj0pycLP84ZN1qq/OdYQrb3Tm4TdyJh1gVlltF52RkeQkbGpY=
X-Received: by 2002:ac8:5c45:0:b0:35c:cd2c:c8f8 with SMTP id
 j5-20020ac85c45000000b0035ccd2cc8f8mr982052qtj.105.1664428756690; Wed, 28 Sep
 2022 22:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <YzUoFisbfVsurncb@humpty.home.comstyle.com>
In-Reply-To: <YzUoFisbfVsurncb@humpty.home.comstyle.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Wed, 28 Sep 2022 22:19:05 -0700
X-Gmail-Original-Message-ID: <CACNAnaHETaJVQ78guba2t-z1bB4qHyEu6zAW5LzCGfdCZ1U8JQ@mail.gmail.com>
Message-ID: <CACNAnaHETaJVQ78guba2t-z1bB4qHyEu6zAW5LzCGfdCZ1U8JQ@mail.gmail.com>
Subject: Re: [PATCH] tests: Add sndio to the FreeBSD CI containers / VM
To: Brad Smith <brad@comstyle.com>
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Ed Maste <emaste@freebsd.org>, 
 Li-Wen Hsu <lwhsu@freebsd.org>, Alex Benn_e <alex.bennee@linaro.org>, 
 Philippe Mathieu-Daud_ <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1664428757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7ffEIxUtaoSjzvNq0lJCsnFESlQwxdPN5nvy8VPK14=;
 b=qQFb31ZeSFRL5+3oyUrwGrqWldRhdMnzaGb4jMXhGTynN2vebTzFgF8ttiZEJ62Y1BpqY5
 tyfKkkYPjrMe7cH1vrBQOkM8wOEWY28Mjs1DMlnmpHrbIBnNoYeXQVL4ng5WJn9nGcBXf9
 M6NbRntOHBC1Ti45NnLX+uYgAN8sXAfiUs3CVyUrNi5ukY97XMKBHGx9adQDeo8j4o69Z+
 btF8SsQBlxZ/wJEGAJsemuE9lufonfr0+xzEDR9ZEYRm08UbNNlFkIZpgps6yhlbKM499B
 xb1gz1mc7HVV1nJhiGVxnGbYT8gMh5Q7t9wFR2SonOoqrBA4gi2gU17BZCmEog==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1664428757; a=rsa-sha256; cv=none;
 b=sajRYOnUj6pgtAuRUHhuMrYI3Q4B45lcrRPghEKbAqDU1OskFxiWJE6AuNsx7yzuRn1+nG
 3zyAztQyF4WP4Yc/5zR/RG+zcX/XUGI3TQJkFASZzd9Z2ysORloZ+8rRuO3vfXBuNsaBwr
 imD3/pxICe9hknl47o65gBc6wG2ZK2tbeetw9N1jvXZAeToyvPjb9Nhvu+FVRhRSi6OtQH
 c1ZeGi/siGdUh0QSuRUc9wYOYrXuI1wpxmhNw2jFj7Y1cFAFiB5GOvT0xvrCI84623hKDv
 /fn+yUQwCAbD67G/kiKrs9PXdXIbRh8wHmEk5kqStkesZN1IrZBnzHU9M7PQzg==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 10:07 PM Brad Smith <brad@comstyle.com> wrote:
>
> tests: Add sndio to the FreeBSD CI containers / VM
>
> Signed-off-by: Brad Smith <brad@comstyle.com>
> ---
>  .gitlab-ci.d/cirrus/freebsd-12.vars | 2 +-
>  .gitlab-ci.d/cirrus/freebsd-13.vars | 2 +-
>  tests/vm/freebsd                    | 3 +++
>  3 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/fr=
eebsd-12.vars
> index 1a5959810f..4a2b41a46c 100644
> --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
> +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
> @@ -11,6 +11,6 @@ MAKE=3D'/usr/local/bin/gmake'
>  NINJA=3D'/usr/local/bin/ninja'
>  PACKAGING_COMMAND=3D'pkg'
>  PIP3=3D'/usr/local/bin/pip-3.8'
> -PKGS=3D'alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoim=
age cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext gi=
t glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turb=
o libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses n=
ettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip=
 py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_ima=
ge snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd=
'
> +PKGS=3D'alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoim=
age cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext gi=
t glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turb=
o libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses n=
ettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip=
 py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_ima=
ge snappy sndio spice-protocol tesseract texinfo usbredir virglrenderer vte=
3 zstd'
>  PYPI_PKGS=3D''
>  PYTHON=3D'/usr/local/bin/python3'
> diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/fr=
eebsd-13.vars
> index 5e5aafd7e5..dc306aa858 100644
> --- a/.gitlab-ci.d/cirrus/freebsd-13.vars
> +++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
> @@ -11,6 +11,6 @@ MAKE=3D'/usr/local/bin/gmake'
>  NINJA=3D'/usr/local/bin/ninja'
>  PACKAGING_COMMAND=3D'pkg'
>  PIP3=3D'/usr/local/bin/pip-3.8'
> -PKGS=3D'alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoim=
age cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext gi=
t glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turb=
o libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses n=
ettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip=
 py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_ima=
ge snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd=
'
> +PKGS=3D'alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoim=
age cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext gi=
t glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turb=
o libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses n=
ettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip=
 py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_ima=
ge snappy sndio spice-protocol tesseract texinfo usbredir virglrenderer vte=
3 zstd'
>  PYPI_PKGS=3D''
>  PYTHON=3D'/usr/local/bin/python3'
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
>      BUILD_SCRIPT =3D """
> --

I'm afraid I'm not at all familiar with qemu's test setup, but sndio's
a valid pkg name and I can deduce well enough from the context that
these are indeed names that will be more or less passed to `pkg
install` and thus, installed in the respective environments. FWIW:

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

