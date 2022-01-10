Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2490548946F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:56:55 +0100 (CET)
Received: from localhost ([::1]:50120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qU2-0004q5-8e
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:56:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n6qNy-0007Pz-Fe; Mon, 10 Jan 2022 03:50:38 -0500
Received: from [2607:f8b0:4864:20::62c] (port=38431
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n6qNw-00079Y-KY; Mon, 10 Jan 2022 03:50:38 -0500
Received: by mail-pl1-x62c.google.com with SMTP id c3so11244703pls.5;
 Mon, 10 Jan 2022 00:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xxuAvKn4Wl+gZHshhIedfK74uaO1SAinyCMFCWVFoWw=;
 b=GsUoB1Kr9FxuEoMMSPYa//iKCDJBjWSJJEspGpdsOucuuMrScGSJlEN1jGymzpfuIz
 UU8GqCPpBK7XT+I9gO2CKkfEamZNgzVQP5VSlJxFGtun7X4CTzhYib6QOYYccKuxDCG9
 FmKHtvzyMWJ7bAkYB50l1sYq9zyniAOycB17vFfYdjOefKi4Xdmmu7R0doP/2tWgbQ+z
 Z3UkbDLrh9qn9RuvBFFiFOL/MPMpTTq4DWw+9KHXBWCXtVDms1D7JTiTYtlmmh/kdArh
 ndLTbxY1MQOWr34Uvaek82cFrgrI0W+G1QC1T5gSVBhniTuJ1E4edfQ/HPSY++KM88oV
 NBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xxuAvKn4Wl+gZHshhIedfK74uaO1SAinyCMFCWVFoWw=;
 b=uhHnEBnud3p4Ok7/Oa3PHrJE/XERMGaVTaExEsyxwNxAAusNc5EN8FV2jA9eLrP3VN
 ffo4GwSF+eQAhFJ6aIgj6NR1kII1iiMPJKpejZSfidnglmAUY2DNTiAdJ0WAzWEJZYmS
 QQSAVCwyAktNfM1iHP3I4uJhqEe+7sxflheIjiJHHkrxjcKb8CoLdk8O41yetaKO000F
 K1miWT7g850+phL+9l9R82gyMuhfZv5IyzISlPwd+3Hez490bYpuKz4bYx139kvqVg+1
 zvVZGxUEbX46L80DK+PTxoBVJBshBSG6biYbc7Ini1EIU54h89APbXy7NtOnwO+cDYtt
 RV3w==
X-Gm-Message-State: AOAM532tSnCzECZK+0nVlPGpH3XBX3S/wtptMfesf1dD4rCn9/7V1/wW
 HFqwP9p8wOpjImVVau0Mgdc=
X-Google-Smtp-Source: ABdhPJwUfX6vo/KC/2C+EJLIcUH1o7hZpW74Gk4wOLBXGYh56mkI+bkblS7SjGtOUo+txz8QDtxYUg==
X-Received: by 2002:a17:903:244a:b0:149:14a4:fd36 with SMTP id
 l10-20020a170903244a00b0014914a4fd36mr74777225pls.107.1641804633225; 
 Mon, 10 Jan 2022 00:50:33 -0800 (PST)
Received: from [192.168.64.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 x12sm1924034pjq.52.2022.01.10.00.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:50:32 -0800 (PST)
Message-ID: <4dde2e66-63cb-4390-9538-c032310db3e3@gmail.com>
Date: Mon, 10 Jan 2022 17:50:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 6/6] gitlab-ci: Support macOS 12 via cirrus-run
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220109170612.574104-1-f4bug@amsat.org>
 <20220109170612.574104-7-f4bug@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220109170612.574104-7-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2022/01/10 2:06, Philippe Mathieu-Daudé wrote:
> Add support for macOS 12 build on Cirrus-CI, similarly to commit
> 0e103a65ba1 ("gitlab: support for ... macOS 11 via cirrus-run").
> 
> Disable deprecation warnings on Objective C to avoid:
> 
>    [2789/6622] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
>    ui/cocoa.m:1411:16: error: 'setAllowedFileTypes:' is deprecated: first deprecated in macOS 12.0 - Use -allowedContentTypes instead [-Werror,-Wdeprecated-declarations]
>        [openPanel setAllowedFileTypes: supportedImageFileTypes];
>                   ^
>    /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: property 'allowedFileTypes' is declared deprecated here
>    @property (nullable, copy) NSArray<NSString *> *allowedFileTypes API_DEPRECATED("Use -allowedContentTypes instead", macos(10.3,12.0));
>                                                    ^
>    /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: 'setAllowedFileTypes:' has been explicitly marked deprecated here
>    FAILED: libcommon.fa.p/ui_cocoa.m.o
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Globally disabling deprecation warnings sounds bad. I came up with a few 
alternatives:
- Just remove the call of [NSSavePanel allowedFileTypes:]. Actually I 
think it is harming the usability rather than improving it. An image 
file, which is being chosen by the panel, can be a raw file and have a 
variety of file extensions and many are not covered by the provided list 
(e.g. "udf"). Other platforms like GTK can provide an option to open a 
file with an extension not listed, but Cocoa can't. It forces the user 
to rename the file to give an extension in the list. Moreover, Cocoa 
does not tell which extensions are in the list so the user needs to read 
the source code, which is pretty bad.

- Use a different method to provide the same functionality.

- To locally disable the warning, enclose the statement with:
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
and
#pragma clang diagnostic pop

Regards,
Akihiko Odaki

> ---
> Generated using lcitool from:
> https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/210
> ---
>   .gitlab-ci.d/cirrus.yml           | 16 ++++++++++++++++
>   .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++
>   2 files changed, 32 insertions(+)
>   create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars
> 
> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> index 19e6c21401b..719008b13ca 100644
> --- a/.gitlab-ci.d/cirrus.yml
> +++ b/.gitlab-ci.d/cirrus.yml
> @@ -90,6 +90,22 @@ x64-macos-11-base-build:
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
> +    TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
> +    CONFIGURE_ARGS: --extra-objcflags=-Wno-deprecated-declarations
> +
>   
>   # The following jobs run VM-based tests via KVM on a Linux-based Cirrus-CI job
>   .cirrus_kvm_job:
> diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
> new file mode 100644
> index 00000000000..997dbc762c8
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
> +PKGS='bash bc bzip2 capstone ccache cpanminus ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb libxml2 llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
> +PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme virtualenv'
> +PYTHON='/usr/local/bin/python3'

