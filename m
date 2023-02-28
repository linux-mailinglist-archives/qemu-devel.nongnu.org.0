Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D996A56E9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 11:40:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWxNW-00077F-VR; Tue, 28 Feb 2023 05:38:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWxNS-0006tP-E7
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:38:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWxNQ-0001Ye-D1
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:38:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677580711;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oEgNSVxFzIXU0kN/Ma+tLlR7sRWE/MFBauqEp+e7ZGE=;
 b=TljR0Lp39hcp87763ZMGZhK7+uE0hogRj1shRn+TVaSB33WedLZ0xqlEeE7nHUOXRjPjQ2
 ni4bClyYQTJ9Adqi0HRikJ2EnMEKLBilX6Uvnv79/8NEnJLfkZHXZn5s/rfotCjKU6K78o
 wgJReXAQxACOIlKf2J9L+T7wVDDOL+0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-Iu5r7JQrN_Sf8_GM_dAkvQ-1; Tue, 28 Feb 2023 05:38:28 -0500
X-MC-Unique: Iu5r7JQrN_Sf8_GM_dAkvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49627800B23;
 Tue, 28 Feb 2023 10:38:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2B7A1121318;
 Tue, 28 Feb 2023 10:38:22 +0000 (UTC)
Date: Tue, 28 Feb 2023 10:38:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Ed Maste <emaste@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: Re: [PATCH 3/7] tests/lcitool: append user setting stanza to
 dockerfiles
Message-ID: <Y/3ZnMeOFKD7rNSy@redhat.com>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-4-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230224180857.1050220-4-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

On Fri, Feb 24, 2023 at 06:08:53PM +0000, Alex Bennée wrote:
> For the cross-compilation use-case it is important to add the host
> user to the dockerfile so we can map them to the docker environment
> when cross-building files.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/cirrus/freebsd-12.vars                   |  5 +++++
>  .gitlab-ci.d/cirrus/freebsd-13.vars                   |  5 +++++
>  .gitlab-ci.d/cirrus/macos-12.vars                     |  5 +++++
>  tests/docker/dockerfiles/alpine.docker                |  5 +++++
>  tests/docker/dockerfiles/centos8.docker               |  5 +++++
>  tests/docker/dockerfiles/debian-amd64-cross.docker    |  5 +++++
>  tests/docker/dockerfiles/debian-amd64.docker          |  5 +++++
>  tests/docker/dockerfiles/debian-arm64-cross.docker    |  5 +++++
>  tests/docker/dockerfiles/debian-armel-cross.docker    |  5 +++++
>  tests/docker/dockerfiles/debian-armhf-cross.docker    |  5 +++++
>  tests/docker/dockerfiles/debian-mips64el-cross.docker |  5 +++++
>  tests/docker/dockerfiles/debian-mipsel-cross.docker   |  5 +++++
>  tests/docker/dockerfiles/debian-ppc64el-cross.docker  |  5 +++++
>  tests/docker/dockerfiles/debian-s390x-cross.docker    |  5 +++++
>  tests/docker/dockerfiles/fedora-win32-cross.docker    |  5 +++++
>  tests/docker/dockerfiles/fedora-win64-cross.docker    |  5 +++++
>  tests/docker/dockerfiles/fedora.docker                |  5 +++++
>  tests/docker/dockerfiles/opensuse-leap.docker         |  5 +++++
>  tests/docker/dockerfiles/ubuntu2004.docker            |  5 +++++
>  tests/docker/dockerfiles/ubuntu2204.docker            |  5 +++++
>  tests/lcitool/refresh                                 | 11 ++++++++++-
>  21 files changed, 110 insertions(+), 1 deletion(-)


> 
> diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
> index 44d8a2a511..0bff53be44 100644
> --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
> +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
> @@ -14,3 +14,8 @@ PIP3='/usr/local/bin/pip-3.8'
>  PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 zstd'
>  PYPI_PKGS=''
>  PYTHON='/usr/local/bin/python3'
> +# As a final step configure the user (if env is defined)
> +ARG USER
> +ARG UID
> +RUN if [ "${USER}" ]; then \
> +  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
> \ No newline at end of file

The cirrus/*.vars files aren't dockerfiles, they're shell
scripts, so don't modify them


> diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
> index 56cf14e553..7b82dec8e5 100644
> --- a/tests/docker/dockerfiles/alpine.docker
> +++ b/tests/docker/dockerfiles/alpine.docker
> @@ -124,3 +124,8 @@ ENV LANG "en_US.UTF-8"
>  ENV MAKE "/usr/bin/make"
>  ENV NINJA "/usr/bin/ninja"
>  ENV PYTHON "/usr/bin/python3"
> +# As a final step configure the user (if env is defined)
> +ARG USER
> +ARG UID
> +RUN if [ "${USER}" ]; then \
> +  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
> \ No newline at end of file

Add a trailing newline to these perhaps ?


> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index cc9e34ac87..88bf33fb74 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -40,6 +40,15 @@ def atomic_write(filename, content):
>          tmp.unlink()
>          raise
>  
> +# Optional user setting, this will always be the last thing added
> +# so maximise the number of layers that are cached
> +add_user_mapping = [
> +    "# As a final step configure the user (if env is defined)",
> +    "ARG USER",
> +    "ARG UID",
> +    "RUN if [ \"${USER}\" ]; then \\",
> +    "  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi"
> +]
>  
>  def generate(filename, cmd, trailer):
>      print("Generate %s" % filename)
> @@ -51,9 +60,9 @@ def generate(filename, cmd, trailer):
>      content = lcitool.stdout.decode("utf8")
>      if trailer is not None:
>          content += trailer
> +    content += "\n".join(add_user_mapping)

  if filename.endswith(".docker"):
       content += "\n".join(add_user_mapping)

to avoid splattering the cirrus vars files


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


