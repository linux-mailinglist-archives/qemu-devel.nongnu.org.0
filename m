Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB601E96EB
	for <lists+qemu-devel@lfdr.de>; Sun, 31 May 2020 12:27:50 +0200 (CEST)
Received: from localhost ([::1]:45396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfLBz-00005e-Mf
	for lists+qemu-devel@lfdr.de; Sun, 31 May 2020 06:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jfLAM-0007Zh-I0
 for qemu-devel@nongnu.org; Sun, 31 May 2020 06:26:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55031
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jfLAK-0006wj-18
 for qemu-devel@nongnu.org; Sun, 31 May 2020 06:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590920760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fWNdxfRnrtikAmBs37z7laJk54ZkzlrweOO9J4iSZ94=;
 b=aHm6oJPlANTff4ikv82RM4ggTzTFL6YHW/2yx87LGkimarDZDSHVjDX5WMdyhskjrC4THi
 lgq9ZfGPHxjpKOCNYhPX/l8e713Zya8sc7t9gFYnvnAX10c/OGM8gl8WcWv62Z/kE7vua6
 A7FqEUIZxSQ8u7mGrh7IeH1D2tarREU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-lFlT_wiYOCKjYcD2QEH4fw-1; Sun, 31 May 2020 06:25:56 -0400
X-MC-Unique: lFlT_wiYOCKjYcD2QEH4fw-1
Received: by mail-wr1-f71.google.com with SMTP id w16so3298987wru.18
 for <qemu-devel@nongnu.org>; Sun, 31 May 2020 03:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fWNdxfRnrtikAmBs37z7laJk54ZkzlrweOO9J4iSZ94=;
 b=CyZCQ430rQ3MMmfiPkwrVsZQNtMAdcFoVPyKNb+n8KdaX35/A/R+G0TWlnLpUI8/FF
 25xfGZKriLtKuDr1Spp37ePczyeMgDCbMzg5YrED8RjEWH4S6uynR4bKTdgGmum2AZMf
 ZjXEQQvzDhZS2Fq8PJzhHF4NgsCs9/8yxlxgi+kqIph+3EuIWwjmb0e5kTDl510cTnnL
 6A+sayrM8+uPkULgCkrZWfs1Cjq7t31ue0wBK7VViyCN9pNYTplu/m+OWa6A1mKfYaN9
 hRHx+OA3ISkP6WAQ6jz3mUO/JFm41TilCOAzHlV8I36cflEQx6Hq2/DB8kZ+XWyDTb75
 Uucw==
X-Gm-Message-State: AOAM533TGqaw+jB9y9wtHM0bmIw2jx/tBbMB59Ap6xncPlPLIgMZU1mo
 TU2NPc1oyveYOYA2hwb+ca1BuagZxydaehdGL8TeiVNYbZxqpy6yGS2rBr/uJAqL8rP9qBHv62k
 YCMjJG8iHA+uhcSQ=
X-Received: by 2002:a05:6000:104f:: with SMTP id
 c15mr10195419wrx.391.1590920754992; 
 Sun, 31 May 2020 03:25:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0qfOplL08Gk4Lqqr8tP9nc1tMaY/04OEnxoEMtPahU9nGPO8FCwRck2T19M+aTQeq+Vkzyw==
X-Received: by 2002:a05:6000:104f:: with SMTP id
 c15mr10195403wrx.391.1590920754596; 
 Sun, 31 May 2020 03:25:54 -0700 (PDT)
Received: from [192.168.1.34] (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id z9sm6000633wmi.41.2020.05.31.03.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 May 2020 03:25:53 -0700 (PDT)
Subject: Re: [PATCH v8 08/12] tests/vm: Added a new script for ubuntu.aarch64.
To: Robert Foley <robert.foley@linaro.org>, qemu-devel@nongnu.org
References: <20200529203458.1038-1-robert.foley@linaro.org>
 <20200529203458.1038-9-robert.foley@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <6f29b51c-b8d6-772c-eb24-b4c88c6c2d62@redhat.com>
Date: Sun, 31 May 2020 12:25:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200529203458.1038-9-robert.foley@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/31 05:59:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, peter.puhov@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Robert,

On 5/29/20 10:34 PM, Robert Foley wrote:
> ubuntu.aarch64 provides a script to create an Ubuntu 18.04 VM.
> Another new file is also added aarch64vm.py, which is a module with
> common methods used by aarch64 VMs, such as how to create the
> flash images.
> 
> Signed-off-by: Robert Foley <robert.foley@linaro.org>
> Reviewed-by: Peter Puhov <peter.puhov@linaro.org>
> ---
>  configure                 |  20 +++++++
>  tests/vm/Makefile.include |  11 ++++
>  tests/vm/aarch64vm.py     | 106 ++++++++++++++++++++++++++++++++++++++
>  tests/vm/basevm.py        |  12 +++++
>  tests/vm/ubuntu.aarch64   |  68 ++++++++++++++++++++++++
>  5 files changed, 217 insertions(+)
>  create mode 100644 tests/vm/aarch64vm.py
>  create mode 100755 tests/vm/ubuntu.aarch64
> 
> diff --git a/configure b/configure
> index d82de47fdd..8a286e75a5 100755
> --- a/configure
> +++ b/configure
> @@ -411,6 +411,7 @@ prefix="/usr/local"
>  mandir="\${prefix}/share/man"
>  datadir="\${prefix}/share"
>  firmwarepath="\${prefix}/share/qemu-firmware"
> +efi_aarch64=""
>  qemu_docdir="\${prefix}/share/doc/qemu"
>  bindir="\${prefix}/bin"
>  libdir="\${prefix}/lib"
> @@ -1099,6 +1100,8 @@ for opt do
>    ;;
>    --firmwarepath=*) firmwarepath="$optarg"
>    ;;
> +  --efi-aarch64=*) efi_aarch64="$optarg"
> +  ;;
>    --host=*|--build=*|\
>    --disable-dependency-tracking|\
>    --sbindir=*|--sharedstatedir=*|\
> @@ -1753,6 +1756,7 @@ Advanced options (experts only):
>    --sysconfdir=PATH        install config in PATH$confsuffix
>    --localstatedir=PATH     install local state in PATH (set at runtime on win32)
>    --firmwarepath=PATH      search PATH for firmware files
> +  --efi-aarch64=PATH       PATH of efi file to use for aarch64 VMs.
>    --with-confsuffix=SUFFIX suffix for QEMU data inside datadir/libdir/sysconfdir [$confsuffix]
>    --with-pkgversion=VERS   use specified string as sub-version of the package
>    --enable-debug           enable common debug build options
> @@ -3548,6 +3552,20 @@ EOF
>    fi
>  fi
>  
> +############################################
> +# efi-aarch64 probe
> +# Check for efi files needed by aarch64 VMs.
> +# By default we will use the efi included with QEMU.
> +# Allow user to override the path for efi also.
> +if ! test -f "$efi_aarch64"; then
> +    if test -f $source_path/pc-bios/edk2-aaarch64-code.fd.bz2; then
> +        # valid after build
> +        efi_aarch64=$PWD/pc-bios/edk2-aarch64-code.fd
> +    else
> +        efi_aarch64=""
> +    fi
> +fi
> +
>  ##########################################
>  # libcap-ng library probe
>  if test "$cap_ng" != "no" ; then
> @@ -6604,6 +6622,7 @@ if test "$docs" != "no"; then
>      echo "sphinx-build      $sphinx_build"
>  fi
>  echo "genisoimage       $genisoimage"
> +echo "efi_aarch64       $efi_aarch64"
>  echo "python_yaml       $python_yaml"
>  echo "slirp support     $slirp $(echo_version $slirp $slirp_version)"
>  if test "$slirp" != "no" ; then
> @@ -7667,6 +7686,7 @@ echo "PYTHON=$python" >> $config_host_mak
>  echo "SPHINX_BUILD=$sphinx_build" >> $config_host_mak
>  echo "SPHINX_WERROR=$sphinx_werror" >> $config_host_mak
>  echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
> +echo "EFI_AARCH64=$efi_aarch64" >> $config_host_mak
>  echo "PYTHON_YAML=$python_yaml" >> $config_host_mak
>  echo "CC=$cc" >> $config_host_mak
>  if $iasl -h > /dev/null 2>&1; then
> diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
> index f6c3892bb2..cc71e6ed0a 100644
> --- a/tests/vm/Makefile.include
> +++ b/tests/vm/Makefile.include
> @@ -5,6 +5,9 @@
>  IMAGES := freebsd netbsd openbsd centos fedora
>  ifneq ($(GENISOIMAGE),)
>  IMAGES += ubuntu.i386 centos
> +ifneq ($(EFI_AARCH64),)
> +IMAGES += ubuntu.aarch64
> +endif
>  endif
>  
>  IMAGES_DIR := $(HOME)/.cache/qemu-vm/images
> @@ -23,6 +26,11 @@ vm-help vm-test:
>  ifneq ($(GENISOIMAGE),)
>  	@echo "  vm-build-centos                 - Build QEMU in CentOS VM, with Docker"
>  	@echo "  vm-build-ubuntu.i386            - Build QEMU in ubuntu i386 VM"
> +ifneq ($(EFI_AARCH64),)
> +	@echo "  vm-build-ubuntu.aarch64         - Build QEMU in ubuntu aarch64 VM"
> +else
> +	@echo "  (install qemu-efi-aarch64 to build centos/ubuntu aarch64 images.)"

I'm not sure your test is working well, I have qemu-efi-aarch64
installed and it not automatically discovered.

# apt install qemu-efi-aarch64
qemu-efi-aarch64 is already the newest version
(0~20191122.bd85bf54-2ubuntu3).

Hint: I'm using out-of-tree builds.

> +endif
>  else
>  	@echo "  (install genisoimage to build centos/ubuntu images)"
>  endif
> @@ -65,6 +73,7 @@ $(IMAGES_DIR)/%.img:	$(SRC_PATH)/tests/vm/% \
>  		$(if $(V)$(DEBUG), --debug) \
>  		$(if $(GENISOIMAGE),--genisoimage $(GENISOIMAGE)) \
>  		$(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
> +		$(if $(EFI_AARCH64),--efi-aarch64 $(EFI_AARCH64)) \
>  		--image "$@" \
>  		--force \
>  		--build-image $@, \
> @@ -80,6 +89,7 @@ vm-build-%: $(IMAGES_DIR)/%.img
>  		$(if $(J),--jobs $(J)) \
>  		$(if $(V),--verbose) \
>  		$(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
> +		$(if $(EFI_AARCH64),--efi-aarch64 $(EFI_AARCH64)) \
>  		--image "$<" \
>  		$(if $(BUILD_TARGET),--build-target $(BUILD_TARGET)) \
>  		--snapshot \
> @@ -102,6 +112,7 @@ vm-boot-ssh-%: $(IMAGES_DIR)/%.img
>  		$(if $(J),--jobs $(J)) \
>  		$(if $(V)$(DEBUG), --debug) \
>  		$(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
> +		$(if $(EFI_AARCH64),--efi-aarch64 $(EFI_AARCH64)) \
>  		--image "$<" \
>  		--interactive \
>  		false, \
> diff --git a/tests/vm/aarch64vm.py b/tests/vm/aarch64vm.py
> new file mode 100644
> index 0000000000..bb04cb19c9
> --- /dev/null
> +++ b/tests/vm/aarch64vm.py
> @@ -0,0 +1,106 @@
> +#!/usr/bin/env python3
> +#
> +# VM testing aarch64 library
> +#
> +# Copyright 2020 Linaro
> +#
> +# Authors:
> +#  Robert Foley <robert.foley@linaro.org>
> +#
> +# This code is licensed under the GPL version 2 or later.  See
> +# the COPYING file in the top-level directory.
> +#
> +import os
> +import sys
> +import subprocess
> +import basevm
> +from qemu.accel import kvm_available
> +
> +# This is the config needed for current version of QEMU.
> +# This works for both kvm and tcg.
> +CURRENT_CONFIG = {
> +    'cpu'          : "max",
> +    'machine'      : "virt,gic-version=max",
> +}
> +
> +# The minimum minor version of QEMU we will support with aarch64 VMs is 3.
> +# QEMU versions less than 3 have various issues running these VMs.
> +QEMU_AARCH64_MIN_VERSION = 3
> +
> +# The DEFAULT_CONFIG will default to a version of
> +# parameters that works for backwards compatibility.
> +DEFAULT_CONFIG = {'kvm' : {'cpu'          : "host",
> +                           'machine'      : "virt,gic-version=host"},
> +                  'tcg' : {'cpu'          : "cortex-a57",
> +                           'machine'      : "virt"},
> +}
> +
> +def get_config_defaults(vmcls, default_config):
> +    """Fetch the configuration defaults for this VM,
> +       taking into consideration the defaults for
> +       aarch64 first, followed by the defaults for this VM."""
> +    config = default_config
> +    config.update(aarch_get_config_defaults(vmcls))
> +    return config
> +
> +def aarch_get_config_defaults(vmcls):
> +    """Set the defaults for current version of QEMU."""
> +    config = CURRENT_CONFIG
> +    args, argv = basevm.parse_args(vmcls)
> +    qemu_path = basevm.get_qemu_path(vmcls.arch, args.build_path)
> +    qemu_version = basevm.get_qemu_version(qemu_path)
> +    if qemu_version < QEMU_AARCH64_MIN_VERSION:
> +        error = "\nThis major version of QEMU {} is to old for aarch64 VMs.\n"\
> +                "The major version must be at least {}.\n"\
> +                "To continue with the current build of QEMU, "\
> +                "please restart with QEMU_LOCAL=1 .\n"
> +        print(error.format(qemu_version, QEMU_AARCH64_MIN_VERSION))
> +        exit(1)
> +    if qemu_version == QEMU_AARCH64_MIN_VERSION:
> +        # We have an older version of QEMU,
> +        # set the config values for backwards compatibility.
> +        if kvm_available('aarch64'):
> +            config.update(DEFAULT_CONFIG['kvm'])
> +        else:
> +            config.update(DEFAULT_CONFIG['tcg'])
> +    return config
> +
> +def create_flash_images(flash_dir="./", efi_img=""):
> +    """Creates the appropriate pflash files
> +       for an aarch64 VM."""
> +    flash0_path = get_flash_path(flash_dir, "flash0")
> +    flash1_path = get_flash_path(flash_dir, "flash1")
> +    fd_null = open(os.devnull, 'w')
> +    subprocess.check_call(["dd", "if=/dev/zero", "of={}".format(flash0_path),
> +                           "bs=1M", "count=64"],
> +                           stdout=fd_null, stderr=subprocess.STDOUT)
> +    # A reliable way to get the QEMU EFI image is via an installed package or
> +    # via the bios included with qemu.
> +    if not os.path.exists(efi_img):
> +        sys.stderr.write("*** efi argument is invalid ({})\n".format(efi_img))
> +        sys.stderr.write("*** please check --efi-aarch64 argument or "\
> +                         "install qemu-efi-aarch64 package\n")
> +        exit(3)
> +    subprocess.check_call(["dd", "if={}".format(efi_img),
> +                           "of={}".format(flash0_path),
> +                           "conv=notrunc"],
> +                           stdout=fd_null, stderr=subprocess.STDOUT)
> +    subprocess.check_call(["dd", "if=/dev/zero",
> +                           "of={}".format(flash1_path),
> +                           "bs=1M", "count=64"],
> +                           stdout=fd_null, stderr=subprocess.STDOUT)
> +    fd_null.close()
> +
> +def get_pflash_args(flash_dir="./"):
> +    """Returns a string that can be used to
> +       boot qemu using the appropriate pflash files
> +       for aarch64."""
> +    flash0_path = get_flash_path(flash_dir, "flash0")
> +    flash1_path = get_flash_path(flash_dir, "flash1")
> +    pflash_args_str = "-drive file={},format=raw,if=pflash "\
> +                      "-drive file={},format=raw,if=pflash"
> +    pflash_args = pflash_args_str.format(flash0_path, flash1_path)
> +    return pflash_args.split(" ")
> +
> +def get_flash_path(flash_dir, name):
> +    return os.path.join(flash_dir, "{}.img".format(name))
> diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
> index 1aab9e3a24..f406a20466 100644
> --- a/tests/vm/basevm.py
> +++ b/tests/vm/basevm.py
> @@ -92,6 +92,7 @@ class BaseVM(object):
>          self._guest = None
>          self._genisoimage = args.genisoimage
>          self._build_path = args.build_path
> +        self._efi_aarch64 = args.efi_aarch64
>          # Allow input config to override defaults.
>          self._config = DEFAULT_CONFIG.copy()
>          if config != None:
> @@ -496,6 +497,14 @@ def get_qemu_path(arch, build_path=None):
>          qemu_path = "qemu-system-" + arch
>      return qemu_path
>  
> +def get_qemu_version(qemu_path):
> +    """Get the version number from the current QEMU,
> +       and return the major number."""
> +    output = subprocess.check_output([qemu_path, '--version'])
> +    version_line = output.decode("utf-8")
> +    version_num = re.split(' |\(', version_line)[3].split('.')[0]
> +    return int(version_num)
> +
>  def parse_config(config, args):
>      """ Parse yaml config and populate our config structure.
>          The yaml config allows the user to override the
> @@ -573,6 +582,9 @@ def parse_args(vmcls):
>      parser.add_option("--build-path", default=None,
>                        help="Path of build directory, "\
>                             "for using build tree QEMU binary. ")
> +    parser.add_option("--efi-aarch64",
> +                      default="/usr/share/qemu-efi-aarch64/QEMU_EFI.fd",
> +                      help="Path to efi image for aarch64 VMs.")
>      parser.disable_interspersed_args()
>      return parser.parse_args()
>  
> diff --git a/tests/vm/ubuntu.aarch64 b/tests/vm/ubuntu.aarch64
> new file mode 100755
> index 0000000000..6f903c029c
> --- /dev/null
> +++ b/tests/vm/ubuntu.aarch64
> @@ -0,0 +1,68 @@
> +#!/usr/bin/env python3
> +#
> +# Ubuntu aarch64 image
> +#
> +# Copyright 2020 Linaro
> +#
> +# Authors:
> +#  Robert Foley <robert.foley@linaro.org>
> +#  Originally based on ubuntu.i386 Fam Zheng <famz@redhat.com>
> +#
> +# This code is licensed under the GPL version 2 or later.  See
> +# the COPYING file in the top-level directory.
> +#
> +
> +import sys
> +import basevm
> +import aarch64vm
> +import ubuntuvm
> +
> +DEFAULT_CONFIG = {
> +    'cpu'          : "cortex-a57",
> +    'machine'      : "virt,gic-version=3",
> +    'install_cmds' : "apt-get update,"\
> +                     "apt-get build-dep -y --arch-only qemu,"\
> +                     "apt-get install -y libfdt-dev flex bison pkg-config",
> +    # We increase beyond the default time since during boot
> +    # it can take some time (many seconds) to log into the VM
> +    # especially using softmmu.
> +    'ssh_timeout'  : 60,
> +}
> +
> +class UbuntuAarch64VM(ubuntuvm.UbuntuVM):
> +    name = "ubuntu.aarch64"
> +    arch = "aarch64"
> +    image_name = "ubuntu-18.04-server-cloudimg-arm64.img"
> +    image_link = "https://cloud-images.ubuntu.com/releases/18.04/release/" + image_name
> +    image_sha256="0fdcba761965735a8a903d8b88df8e47f156f48715c00508e4315c506d7d3cb1"
> +    BUILD_SCRIPT = """
> +        set -e;
> +        cd $(mktemp -d);
> +        sudo chmod a+r /dev/vdb;
> +        tar --checkpoint=.10 -xf /dev/vdb;
> +        ./configure {configure_opts};
> +        make --output-sync {target} -j{jobs} {verbose};
> +    """
> +    def boot(self, img, extra_args=None):
> +        aarch64vm.create_flash_images(self._tmpdir, self._efi_aarch64)
> +        default_args = aarch64vm.get_pflash_args(self._tmpdir)
> +        if extra_args:
> +            extra_args.extend(default_args)
> +        else:
> +            extra_args = default_args
> +        # We always add these performance tweaks
> +        # because without them, we boot so slowly that we
> +        # can time out finding the boot efi device.
> +        if '-smp' not in extra_args and \
> +           '-smp' not in self._config['extra_args'] and \
> +           '-smp' not in self._args:
> +            # Only add if not already there to give caller option to change it.
> +            extra_args.extend(["-smp", "8"])
> +
> +        # We have overridden boot() since aarch64 has additional parameters.
> +        # Call down to the base class method.
> +        super(UbuntuAarch64VM, self).boot(img, extra_args=extra_args)
> +
> +if __name__ == "__main__":
> +    defaults = aarch64vm.get_config_defaults(UbuntuAarch64VM, DEFAULT_CONFIG)
> +    sys.exit(basevm.main(UbuntuAarch64VM, defaults))
> 


