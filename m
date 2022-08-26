Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53195A2EA0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 20:40:23 +0200 (CEST)
Received: from localhost ([::1]:57810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oReFi-0001CM-OX
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 14:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oReCl-0007Bz-IC
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 14:37:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oReCi-0006EX-7B
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 14:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661539035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ji7f1H6EGeK5+QBaB2Hc1oUsGVMpSCOw1Nj0ruL1d/I=;
 b=dS0txiyuJYaFmVEMJlYzi3R3yhL44lvUw1/8WijDbCjXqMHNvQ8/UYaoSJZxGuPjjEe0IN
 R8YhtlciyFeuROZROv0G9rLhq4sRXhm1SUbpJSMCRhwN5yWMFgjqQ+rSAak8vgdAIHNSLk
 54vfDD7WHL6IiCkJGZ4CiBOR1cIZ1B4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-Ek_T6s0eOpGHYSzU7LUqKQ-1; Fri, 26 Aug 2022 14:37:13 -0400
X-MC-Unique: Ek_T6s0eOpGHYSzU7LUqKQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 b16-20020a05600c4e1000b003a5a47762c3so1326413wmq.9
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 11:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Ji7f1H6EGeK5+QBaB2Hc1oUsGVMpSCOw1Nj0ruL1d/I=;
 b=4VjnXQQUyAZFkTY0aj+y6ZWYsx1VFeqBWHuiyvWsAuodAQnI17NqzpV05peKI+CrI/
 gvw4T/h2GPJkejVPlu9AIKfesbs/cxO70Jcw4FUnVwyC6tzN6lrk/bGFiXGtcIwrIH85
 40jcGS0AqSrsBoOdH6XL+dKFmG7ei+UigdEN3wAuOAr0A3nZBYDJlJKTCDUasDTd4gmn
 4fqUht4SZxBI8WIZt9Rs7q/HEyi2u4cS9pkCd11EqBubGez0lbNOr917XDAYrI8zF99g
 1DknFLZFj7EZQ2ettDkVVahPE63yknmJ/dKwvbOpFtGZbEkxkYNO0sOfVwWICjhlprVA
 jxdw==
X-Gm-Message-State: ACgBeo3dqsdg4Ap6tAl7ZJcUfa4DYdpGr88K4fi+j0XW0ZNM60B2G/bt
 4n5GD6RxRMAdC8GdXL6yasq4d6lRd2i6lN0LjAGXIxMvGEUxGG0B9sEW8+y1dli2p6QORGrGGeh
 GXtXqe9YenJjmILI=
X-Received: by 2002:adf:fd0b:0:b0:225:760b:9198 with SMTP id
 e11-20020adffd0b000000b00225760b9198mr501726wrr.551.1661539032835; 
 Fri, 26 Aug 2022 11:37:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR62/oQTJlsC+ePwbTJioOTiBECylwc4SGyRPXY89q2ZkI5ZNddsSiKwUCahEioehndliAQWNQ==
X-Received: by 2002:adf:fd0b:0:b0:225:760b:9198 with SMTP id
 e11-20020adffd0b000000b00225760b9198mr501709wrr.551.1661539032555; 
 Fri, 26 Aug 2022 11:37:12 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c400f00b003a54f1d007csm430738wmm.10.2022.08.26.11.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 11:37:12 -0700 (PDT)
Message-ID: <3381587e-a056-7b5a-d479-54e5f1aa09a3@redhat.com>
Date: Fri, 26 Aug 2022 20:37:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 18/25] tests/lcitool: bump to latest version
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-19-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/08/2022 19.21, Alex Bennée wrote:
> We need this to be able to cleanly build the x86 cross images. There
> are a few minor updates triggered by lcitool-refresh.

Maybe mention that this will add "libslirp" to the freebsd vars - which will 
be helpful when we finally remove the slirp submodule from QEMU (thanks to 
Daniel for refreshing lcitool for this!).

Reviewed-by: Thomas Huth <thuth@redhat.com>


> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/cirrus/freebsd-12.vars           | 2 +-
>   .gitlab-ci.d/cirrus/freebsd-13.vars           | 2 +-
>   tests/docker/dockerfiles/opensuse-leap.docker | 2 +-
>   tests/docker/dockerfiles/ubuntu2004.docker    | 2 +-
>   tests/lcitool/libvirt-ci                      | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
> index 8fa5a320e9..1a5959810f 100644
> --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
> +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
> @@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
>   NINJA='/usr/local/bin/ninja'
>   PACKAGING_COMMAND='pkg'
>   PIP3='/usr/local/bin/pip-3.8'
> -PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
> +PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
>   PYPI_PKGS=''
>   PYTHON='/usr/local/bin/python3'
> diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
> index 8ed7e33a77..5e5aafd7e5 100644
> --- a/.gitlab-ci.d/cirrus/freebsd-13.vars
> +++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
> @@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
>   NINJA='/usr/local/bin/ninja'
>   PACKAGING_COMMAND='pkg'
>   PIP3='/usr/local/bin/pip-3.8'
> -PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
> +PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
>   PYPI_PKGS=''
>   PYTHON='/usr/local/bin/python3'
> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
> index 047a435ab5..193df305af 100644
> --- a/tests/docker/dockerfiles/opensuse-leap.docker
> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> @@ -127,7 +127,7 @@ RUN zypper update -y && \
>       ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
>       ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
>   
> -RUN pip3 install meson==0.56.0
> +RUN /usr/bin/pip3 install meson==0.56.0
>   
>   ENV LANG "en_US.UTF-8"
>   ENV MAKE "/usr/bin/make"
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> index 99803b343b..e1f4ed7c80 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -137,7 +137,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>       ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
>       ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
>   
> -RUN pip3 install meson==0.56.0
> +RUN /usr/bin/pip3 install meson==0.56.0
>   
>   ENV LANG "en_US.UTF-8"
>   ENV MAKE "/usr/bin/make"
> diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
> index 324355cf62..be7d1f2c7f 160000
> --- a/tests/lcitool/libvirt-ci
> +++ b/tests/lcitool/libvirt-ci
> @@ -1 +1 @@
> -Subproject commit 324355cf62e86fb551408575afb123bac989ac37
> +Subproject commit be7d1f2c7fb8c1462592b96c15c4358285d37230


