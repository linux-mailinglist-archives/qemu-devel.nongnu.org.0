Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F214D2D16
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:26:55 +0100 (CET)
Received: from localhost ([::1]:56354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtWw-0008Cz-Vf
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:26:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRtUO-0006wj-GW; Wed, 09 Mar 2022 05:24:17 -0500
Received: from [2607:f8b0:4864:20::434] (port=44928
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRtUM-0006VH-SN; Wed, 09 Mar 2022 05:24:16 -0500
Received: by mail-pf1-x434.google.com with SMTP id e15so1816640pfv.11;
 Wed, 09 Mar 2022 02:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2vK6wFcez69LV6rNrihg+U359fsEtu7WP9kLi2NRq2U=;
 b=lW1C3xyUZ2ms6kvRw4KiDLlNnFMhT+V29cf833f5DbUjxBN9JbMWSX4bjfMVzMohIN
 VDFFJU5Ju6e/X92LQkd+gWxv3SMEJi3BYM42tzh7vLunVR3ukv7aZ8uMFqPt+WQnvroU
 vOi8OnuOzLyRKVjK2fa/aUr2tZYaqEirtvvYqJD3MXJvbil7pd09/fX9e0xMboPuRW8+
 aby7Yjn5f5QVTR6GAQCLWIyWmNqfEuOQgduHCmnTak9NcB7gdhdJk4yJ9Ry2ag7zVAjY
 uJuLtKPlNm6F8SoSDkdIpf0nSHw63SzTC3tDJqRGksjCQCYpkvOGPcbiI2WqvjsVFMa0
 jT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2vK6wFcez69LV6rNrihg+U359fsEtu7WP9kLi2NRq2U=;
 b=aUneHiW2usUlVc5quWEzA6ZNrhkaI39sA35vSSold+m1BVBrMHtfsGnuiIpmngQhrE
 ouobHin4tx+XAo4f1ATw+s3qTEoi1VKGb04ezjxnf523aGqZ3p3OnkDBrMtlMG8azeBH
 P4Qs/ipZTwi2lU5nLttemAmUnY2cvYiCJBug9Dkr+W4NorEtxliryupCOjtuJNupgMqN
 7IcDJ+DnCa/n1uDFAFxAp1pQDvvqVOoQCqPxhtAsX4VHYh4ZGa3mbZYj/4BPv5yTuaG/
 LgK6+Kr+mDzpW17hYQesFqU1bKZLFC/uiXTi4J7iS4WSK4loux+WHTwD++GzQAkmz0Re
 4BnA==
X-Gm-Message-State: AOAM531lTtBrFcLzTIUaMRSlmY9O5o60uFk37q7oWN8s89R3bbr2C0lM
 JhtLcRu6wVYkr8QzcbPnN6bkn0cHEBA=
X-Google-Smtp-Source: ABdhPJxpais8Zkc7daZI5UWd4McxBEIkjcEWOAE/qpJjvk7PmEB7olHCkkVcVzuG0+ZhFKCmX2YA5g==
X-Received: by 2002:a05:6a00:198a:b0:4f7:2d21:4531 with SMTP id
 d10-20020a056a00198a00b004f72d214531mr7762141pfl.44.1646821448194; 
 Wed, 09 Mar 2022 02:24:08 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 s30-20020a056a001c5e00b004f73f27aa40sm2356686pfw.161.2022.03.09.02.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 02:24:07 -0800 (PST)
Message-ID: <f2898408-5082-7121-2496-fb296c48244d@gmail.com>
Date: Wed, 9 Mar 2022 11:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v7 22/22] gitlab-ci: Support macOS 12 via cirrus-run
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-23-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220306231753.50277-23-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex, Thomas, Daniel,

Could you ack this patch?

On 7/3/22 00:17, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Add support for macOS 12 build on Cirrus-CI, similarly to commit
> 0e103a65ba1 ("gitlab: support for ... macOS 11 via cirrus-run"),
> but with the following differences:
>   - Enable modules (configure --enable-modules)
>   - Do not run softfloat3 tests (make check-softfloat)
>   - Run Aarch64 qtests instead of x86_64 ones
> 
> Generate the vars file by calling 'make lcitool-refresh'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .gitlab-ci.d/cirrus.yml           | 16 ++++++++++++++++
>   .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++
>   tests/lcitool/refresh             |  1 +
>   3 files changed, 33 insertions(+)
>   create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars
> 
> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> index b96b22e269..be1dce5d4e 100644
> --- a/.gitlab-ci.d/cirrus.yml
> +++ b/.gitlab-ci.d/cirrus.yml
> @@ -87,6 +87,22 @@ x64-macos-11-base-build:
>       PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
>       TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
>   
> +x64-macos-12-base-build:
> +  extends: .cirrus_build_job
> +  variables:
> +    NAME: macos-12
> +    CIRRUS_VM_INSTANCE_TYPE: osx_instance
> +    CIRRUS_VM_IMAGE_SELECTOR: image
> +    CIRRUS_VM_IMAGE_NAME: monterey-base
> +    CIRRUS_VM_CPUS: 12
> +    CIRRUS_VM_RAM: 24G
> +    UPDATE_COMMAND: brew update
> +    INSTALL_COMMAND: brew install
> +    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
> +    PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
> +    CONFIGURE_ARGS: --enable-modules
> +    TEST_TARGETS: check-unit check-block check-qapi-schema check-qtest-aarch64
> +
>   
>   # The following jobs run VM-based tests via KVM on a Linux-based Cirrus-CI job
>   .cirrus_kvm_job:
> diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
> new file mode 100644
> index 0000000000..a793258c64
> --- /dev/null
> +++ b/.gitlab-ci.d/cirrus/macos-12.vars
> @@ -0,0 +1,16 @@
> +# THIS FILE WAS AUTO-GENERATED
> +#
> +#  $ lcitool variables macos-12 qemu
> +#
> +# https://gitlab.com/libvirt/libvirt-ci
> +
> +CCACHE='/usr/local/bin/ccache'
> +CPAN_PKGS='Test::Harness'
> +CROSS_PKGS=''
> +MAKE='/usr/local/bin/gmake'
> +NINJA='/usr/local/bin/ninja'
> +PACKAGING_COMMAND='brew'
> +PIP3='/usr/local/bin/pip3'
> +PKGS='bash bc bzip2 capstone ccache cpanminus ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
> +PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme virtualenv'
> +PYTHON='/usr/local/bin/python3'
> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index 1f00281b44..e2f0bbd1b1 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -105,6 +105,7 @@ try:
>      generate_cirrus("freebsd-12")
>      generate_cirrus("freebsd-13")
>      generate_cirrus("macos-11")
> +   generate_cirrus("macos-12")
>   
>      sys.exit(0)
>   except Exception as ex:


