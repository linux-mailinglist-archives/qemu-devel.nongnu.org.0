Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AF26E6D0E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 21:47:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1porHP-000213-Q0; Tue, 18 Apr 2023 15:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1porHM-00020p-1H
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 15:46:16 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1porHJ-00081S-IK
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 15:46:15 -0400
Received: by mail-ej1-x631.google.com with SMTP id fy21so33134410ejb.9
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 12:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20221208.gappssmtp.com; s=20221208; t=1681847171; x=1684439171;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XxHcDbDUR8vQDpSbiBUCnCR8ngrU+JB8tQIeoaVgnZE=;
 b=FnLkMkxGFl3CXU5tS8jAQa/zKSHSwO8/xZqwPKit3MOfWWFqsw1GlbfMDmgItqBakM
 Acec+tWh2qANpCIsVGxlJ6nMxlq/utqQyqo30Jmn9qdXwHpHCXe+6kG7NTf/Xx++xGtG
 +8kVerbbUEQ+hpI9uRQe86cYYymeQxVHEwWdQU5c8aR75EbdDttS4LVptpEjQg91g7qa
 3enVOLuYEz5KeztNPuNbLGect6WbdcN+NBR8dGjCBrBV2+9w5b1gt8/VWrMw4MGPQLNL
 qKCpP9Yaq4aRURofj3Bv5DM9+OctMOrIpMoLYriOk5HQm0ILhK3RDEvACQkeOxVdMgtj
 Lt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681847171; x=1684439171;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XxHcDbDUR8vQDpSbiBUCnCR8ngrU+JB8tQIeoaVgnZE=;
 b=LB7jdT0C9Yr4QZ+Ex2yT65b87pQjo/WcauzHEBflCRU7wI8XhpYIxHnITXKhZOq0o0
 ATBU++Y9a6NNhr8ngTropmhMUfomUNAhEEkM6WJPjm3Z36ygvpPlWtdtMWbbMYpLgv6N
 xuDQCWnwzHAR634dxd3kIFw/B48BeM2531iYuH546HacralmzyayJKjH9QxYkheoMtWY
 wXilGnFVqvSLwCQOx5WLy/s3Jx6CI9rQkagaNqotdDeG27hIRuanDMVVJHe11eCN56G4
 TH5SnNgWu91EeTm0bychoUiSrw5dl47v/N3ZlJjqabhj17q6pcRJ7HHlcT7ABB3kVKye
 YpOA==
X-Gm-Message-State: AAQBX9fbAGWhvBhtKj32TmFYocIwSm3SoxeqfufwwhgYcVgQMA3TLM37
 Kr+bJeaaGgQe5DXJhHY7jTUPJ0baqX39/64IQnVfpA==
X-Google-Smtp-Source: AKy350a3GmqGk3f2XZIQcexRLa6ZQkb9K8pkl5LdP/UEkQK021rLC1klfICW0Lb7SRLg6m9gsq2F5pKoGkIT4iAanUE=
X-Received: by 2002:a17:906:4757:b0:94e:7ce:4d1f with SMTP id
 j23-20020a170906475700b0094e07ce4d1fmr5934269ejs.2.1681847171111; Tue, 18 Apr
 2023 12:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230418160225.529172-1-thuth@redhat.com>
In-Reply-To: <20230418160225.529172-1-thuth@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 18 Apr 2023 13:46:00 -0600
Message-ID: <CANCZdfpzw10B_cyV0mmbkE94GKTBVJg6BVZ2csjcMCur07nseg@mail.gmail.com>
Subject: Re: [PATCH] .gitlab-ci.d/cirrus: Drop the CI job for compiling with
 FreeBSD 12
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="00000000000033709505f9a18f40"
Received-SPF: none client-ip=2a00:1450:4864:20::631;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000033709505f9a18f40
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 10:02=E2=80=AFAM Thomas Huth <thuth@redhat.com> wro=
te:

> FreeBSD 13.0 has been released in April 2021:
>
>  https://www.freebsd.org/releases/13.0R/announce/
>
> According to QEMU's support policy, we stop supporting the previous
> major release two years after the the new major release has been
> published. So we can stop testing FreeBSD 12 in our CI now.
>

13.2 was just released this week, and the FreeBSD project will be
dropping support for 12 by the end of the year. 14.0 is up in late
string / early summer.


> Signed-off-by: Thomas Huth <thuth@redhat.com>
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> ---
>  We should likely also update tests/vm/freebsd ... however, FreeBSD 13
>  seems not to use the serial console by default anymore, so I've got
>  no clue how we could use their images now... Does anybody have any
>  suggestions?
>

I should look at this... It should still be using serial console by
default...

Warner


>  .gitlab-ci.d/cirrus.yml             | 13 -------------
>  .gitlab-ci.d/cirrus/freebsd-12.vars | 16 ----------------
>  tests/lcitool/refresh               |  1 -
>  3 files changed, 30 deletions(-)
>  delete mode 100644 .gitlab-ci.d/cirrus/freebsd-12.vars
>
> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> index 502dfd612c..1507c928e5 100644
> --- a/.gitlab-ci.d/cirrus.yml
> +++ b/.gitlab-ci.d/cirrus.yml
> @@ -44,19 +44,6 @@
>    variables:
>      QEMU_JOB_CIRRUS: 1
>
> -x64-freebsd-12-build:
> -  extends: .cirrus_build_job
> -  variables:
> -    NAME: freebsd-12
> -    CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
> -    CIRRUS_VM_IMAGE_SELECTOR: image_family
> -    CIRRUS_VM_IMAGE_NAME: freebsd-12-4
> -    CIRRUS_VM_CPUS: 8
> -    CIRRUS_VM_RAM: 8G
> -    UPDATE_COMMAND: pkg update; pkg upgrade -y
> -    INSTALL_COMMAND: pkg install -y
> -    TEST_TARGETS: check
> -
>  x64-freebsd-13-build:
>    extends: .cirrus_build_job
>    variables:
> diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars
> b/.gitlab-ci.d/cirrus/freebsd-12.vars
> deleted file mode 100644
> index 44d8a2a511..0000000000
> --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -# THIS FILE WAS AUTO-GENERATED
> -#
> -#  $ lcitool variables freebsd-12 qemu
> -#
> -# https://gitlab.com/libvirt/libvirt-ci
> -
> -CCACHE=3D'/usr/local/bin/ccache'
> -CPAN_PKGS=3D''
> -CROSS_PKGS=3D''
> -MAKE=3D'/usr/local/bin/gmake'
> -NINJA=3D'/usr/local/bin/ninja'
> -PACKAGING_COMMAND=3D'pkg'
> -PIP3=3D'/usr/local/bin/pip-3.8'
> -PKGS=3D'alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache
> cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex
> fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libf=
fi
> libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1
> llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy
> py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3
> rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract
> usbredir virglrenderer vte3 zstd'
> -PYPI_PKGS=3D''
> -PYTHON=3D'/usr/local/bin/python3'
> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index c0d7ad5516..4c568242d2 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -182,7 +182,6 @@ try:
>      #
>      # Cirrus packages lists for GitLab
>      #
> -    generate_cirrus("freebsd-12")
>      generate_cirrus("freebsd-13")
>      generate_cirrus("macos-12")
>
> --
> 2.31.1
>
>

--00000000000033709505f9a18f40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 18, 2023 at 10:02=E2=80=
=AFAM Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
reeBSD 13.0 has been released in April 2021:<br>
<br>
=C2=A0<a href=3D"https://www.freebsd.org/releases/13.0R/announce/" rel=3D"n=
oreferrer" target=3D"_blank">https://www.freebsd.org/releases/13.0R/announc=
e/</a><br>
<br>
According to QEMU&#39;s support policy, we stop supporting the previous<br>
major release two years after the the new major release has been<br>
published. So we can stop testing FreeBSD 12 in our CI now.<br></blockquote=
><div><br></div><div>13.2 was just released=C2=A0this week, and the FreeBSD=
 project will be</div><div>dropping support for 12 by the end of the year. =
14.0 is up in late</div><div>string / early summer.</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Re=
viewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com=
</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
---<br>
=C2=A0We should likely also update tests/vm/freebsd ... however, FreeBSD 13=
<br>
=C2=A0seems not to use the serial console by default anymore, so I&#39;ve g=
ot<br>
=C2=A0no clue how we could use their images now... Does anybody have any<br=
>
=C2=A0suggestions?<br></blockquote><div><br></div><div>I should look at thi=
s... It should still be using serial console by default...</div><div><br></=
div><div>Warner</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
=C2=A0.gitlab-ci.d/cirrus.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 13 -------------<br>
=C2=A0.gitlab-ci.d/cirrus/freebsd-12.vars | 16 ----------------<br>
=C2=A0tests/lcitool/refresh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 1 -<br>
=C2=A03 files changed, 30 deletions(-)<br>
=C2=A0delete mode 100644 .gitlab-ci.d/cirrus/freebsd-12.vars<br>
<br>
diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml<br>
index 502dfd612c..1507c928e5 100644<br>
--- a/.gitlab-ci.d/cirrus.yml<br>
+++ b/.gitlab-ci.d/cirrus.yml<br>
@@ -44,19 +44,6 @@<br>
=C2=A0 =C2=A0variables:<br>
=C2=A0 =C2=A0 =C2=A0QEMU_JOB_CIRRUS: 1<br>
<br>
-x64-freebsd-12-build:<br>
-=C2=A0 extends: .cirrus_build_job<br>
-=C2=A0 variables:<br>
-=C2=A0 =C2=A0 NAME: freebsd-12<br>
-=C2=A0 =C2=A0 CIRRUS_VM_INSTANCE_TYPE: freebsd_instance<br>
-=C2=A0 =C2=A0 CIRRUS_VM_IMAGE_SELECTOR: image_family<br>
-=C2=A0 =C2=A0 CIRRUS_VM_IMAGE_NAME: freebsd-12-4<br>
-=C2=A0 =C2=A0 CIRRUS_VM_CPUS: 8<br>
-=C2=A0 =C2=A0 CIRRUS_VM_RAM: 8G<br>
-=C2=A0 =C2=A0 UPDATE_COMMAND: pkg update; pkg upgrade -y<br>
-=C2=A0 =C2=A0 INSTALL_COMMAND: pkg install -y<br>
-=C2=A0 =C2=A0 TEST_TARGETS: check<br>
-<br>
=C2=A0x64-freebsd-13-build:<br>
=C2=A0 =C2=A0extends: .cirrus_build_job<br>
=C2=A0 =C2=A0variables:<br>
diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/free=
bsd-12.vars<br>
deleted file mode 100644<br>
index 44d8a2a511..0000000000<br>
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars<br>
+++ /dev/null<br>
@@ -1,16 +0,0 @@<br>
-# THIS FILE WAS AUTO-GENERATED<br>
-#<br>
-#=C2=A0 $ lcitool variables freebsd-12 qemu<br>
-#<br>
-# <a href=3D"https://gitlab.com/libvirt/libvirt-ci" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.com/libvirt/libvirt-ci</a><br>
-<br>
-CCACHE=3D&#39;/usr/local/bin/ccache&#39;<br>
-CPAN_PKGS=3D&#39;&#39;<br>
-CROSS_PKGS=3D&#39;&#39;<br>
-MAKE=3D&#39;/usr/local/bin/gmake&#39;<br>
-NINJA=3D&#39;/usr/local/bin/ninja&#39;<br>
-PACKAGING_COMMAND=3D&#39;pkg&#39;<br>
-PIP3=3D&#39;/usr/local/bin/pip-3.8&#39;<br>
-PKGS=3D&#39;alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-=
genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-lib=
s3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt=
 libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 me=
son ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow p=
y39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 s=
dl2_image snappy sndio socat spice-protocol tesseract usbredir virglrendere=
r vte3 zstd&#39;<br>
-PYPI_PKGS=3D&#39;&#39;<br>
-PYTHON=3D&#39;/usr/local/bin/python3&#39;<br>
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh<br>
index c0d7ad5516..4c568242d2 100755<br>
--- a/tests/lcitool/refresh<br>
+++ b/tests/lcitool/refresh<br>
@@ -182,7 +182,6 @@ try:<br>
=C2=A0 =C2=A0 =C2=A0#<br>
=C2=A0 =C2=A0 =C2=A0# Cirrus packages lists for GitLab<br>
=C2=A0 =C2=A0 =C2=A0#<br>
-=C2=A0 =C2=A0 generate_cirrus(&quot;freebsd-12&quot;)<br>
=C2=A0 =C2=A0 =C2=A0generate_cirrus(&quot;freebsd-13&quot;)<br>
=C2=A0 =C2=A0 =C2=A0generate_cirrus(&quot;macos-12&quot;)<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--00000000000033709505f9a18f40--

