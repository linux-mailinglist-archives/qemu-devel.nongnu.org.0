Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08CE17629F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 19:27:16 +0100 (CET)
Received: from localhost ([::1]:37070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8pmd-0006Qj-M7
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 13:27:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44656)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j8pl4-0005AS-2C
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:25:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j8pl2-0006To-Oy
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:25:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26322
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j8pl2-0006TN-LB
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:25:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583173535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U7pEBpP6LX8UTYBSVzV2hlCsPoYqcNocX30sCp2yp/o=;
 b=hWcB/8meg3GKDRAixqZGXwMb6jrJbAttmVF0u8YCO8wQ/ZXDoBLaKix5tq8BSc2+E9fJMC
 bmDTK08k/eM+onY47TMOLHe2+oVxVUDJMCs9AyXutJuRDTTuNOb4AwArEAuQEB02IAMDcp
 1xg1nFznYtGAMiG4tTsYm2UH+LijZ7k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-OmE1HkEEOnKVlZ8TlNbpYw-1; Mon, 02 Mar 2020 13:25:34 -0500
X-MC-Unique: OmE1HkEEOnKVlZ8TlNbpYw-1
Received: by mail-wr1-f70.google.com with SMTP id m13so79985wrw.3
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 10:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S/Q+SDRSBG6w7DoKrkqMo+fb7y+vXqM0lM+E2Dr/BwE=;
 b=e8wZE8E+Udb4kj5D2QOrb4l8gh22fR5dp2dT0svtYekHsODafZ7FtBcAUaU6wXFYkd
 TijtxYUK+KleyrkSipjBGQp68yJuEgryvussoDXngsTZgeMh1dBHMizBXpbqsGsgTJCH
 tJ898pLfXCweEm1XsV1N2RmTmG4iXzh8w5oxcozkhz++oTEKu3Uk3EXRJVnAeSf4iVqv
 AwAeSxh8lh3QQt2jSg6SPqtNgEj7f2iXHWAQHsv367ZU2aGWVZkZSlrIvGF1X+1efUxH
 jHPGsYsUpvijFdcv2IEbvKletl+BxpZrrJb044w/co8HFIuUS521aCTwCX6q4x3RzdXc
 o8vQ==
X-Gm-Message-State: ANhLgQ3FxvLeuksRno+SbShwXsnnV3zySya5kuCd9v33wqa0kC42Ojam
 zt53AQcQ/7OpCMTfLlM2syxf8GJmeC5PyFaAotOG7PIbPJw+uhjp8ogBlwu1Sxc0/yTVcGvFXiG
 DdZ4290VTwgRLrXI=
X-Received: by 2002:a5d:4b91:: with SMTP id b17mr788716wrt.325.1583173532936; 
 Mon, 02 Mar 2020 10:25:32 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsnIL9z90n4Jq1CA6cuF+iEZDD15tDm98fPwix/mynMHWSQ+0HUqNVfYxc295Ure60g9K0oWw==
X-Received: by 2002:a5d:4b91:: with SMTP id b17mr788696wrt.325.1583173532648; 
 Mon, 02 Mar 2020 10:25:32 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:3f7b:4b69:b9c:cdc0?
 ([2a01:e35:2fb0:49e0:3f7b:4b69:b9c:cdc0])
 by smtp.gmail.com with ESMTPSA id l17sm29148922wro.77.2020.03.02.10.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 10:25:32 -0800 (PST)
Subject: Re: [PATCH v1 08/10] configure: detect and report genisoimage
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200302181907.32110-1-alex.bennee@linaro.org>
 <20200302181907.32110-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <953b4e92-0d8f-20fa-3f94-1099ef1af351@redhat.com>
Date: Mon, 2 Mar 2020 19:25:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302181907.32110-9-alex.bennee@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Fam Zheng <fam@euphon.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Wainer

On 3/2/20 7:19 PM, Alex Benn=C3=A9e wrote:
> This is used for some of the vm-build tests so lets detect it and
> behave sanely when it is not installed.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>   configure                 | 13 +++++++++++++
>   tests/vm/Makefile.include | 14 +++++++++++---
>   2 files changed, 24 insertions(+), 3 deletions(-)
>=20
> diff --git a/configure b/configure
> index caa65f58831..376ccb25623 100755
> --- a/configure
> +++ b/configure
> @@ -936,6 +936,17 @@ do
>       fi
>   done
>  =20
> +# Check for ancillary tools used in testing
> +genisoimage=3D
> +for binary in genisoimage
> +do
> +    if has $binary
> +    then
> +        genisoimage=3D$(command -v "$binary")
> +        break
> +    fi
> +done
> +
>   : ${smbd=3D${SMBD-/usr/sbin/smbd}}
>  =20
>   # Default objcc to clang if available, otherwise use CC
> @@ -6567,6 +6578,7 @@ echo "python            $python ($python_version)"
>   if test "$docs" !=3D "no"; then
>       echo "sphinx-build      $sphinx_build"
>   fi
> +echo "genisoimage       $genisoimage"
>   echo "slirp support     $slirp $(echo_version $slirp $slirp_version)"
>   if test "$slirp" !=3D "no" ; then
>       echo "smbd              $smbd"
> @@ -7616,6 +7628,7 @@ echo "INSTALL_PROG=3D$install -c -m 0755" >> $confi=
g_host_mak
>   echo "INSTALL_LIB=3D$install -c -m 0644" >> $config_host_mak
>   echo "PYTHON=3D$python" >> $config_host_mak
>   echo "SPHINX_BUILD=3D$sphinx_build" >> $config_host_mak
> +echo "GENISOIMAGE=3D$genisoimage" >> $config_host_mak
>   echo "CC=3D$cc" >> $config_host_mak
>   if $iasl -h > /dev/null 2>&1; then
>     echo "IASL=3D$iasl" >> $config_host_mak
> diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
> index 778e5067554..1bf9693d195 100644
> --- a/tests/vm/Makefile.include
> +++ b/tests/vm/Makefile.include
> @@ -2,7 +2,11 @@
>  =20
>   .PHONY: vm-build-all vm-clean-all
>  =20
> -IMAGES :=3D ubuntu.i386 freebsd netbsd openbsd centos fedora
> +IMAGES :=3D freebsd netbsd openbsd centos fedora
> +ifneq ($(GENISOIMAGE),)
> +IMAGES +=3D ubuntu.i386 centos
> +endif
> +
>   IMAGES_DIR :=3D $(HOME)/.cache/qemu-vm/images
>   IMAGE_FILES :=3D $(patsubst %, $(IMAGES_DIR)/%.img, $(IMAGES))
>  =20
> @@ -12,12 +16,16 @@ IMAGE_FILES :=3D $(patsubst %, $(IMAGES_DIR)/%.img, $=
(IMAGES))
>   vm-help vm-test:
>   =09@echo "vm-help: Test QEMU in preconfigured virtual machines"
>   =09@echo
> -=09@echo "  vm-build-ubuntu.i386            - Build QEMU in ubuntu i386 =
VM"
>   =09@echo "  vm-build-freebsd                - Build QEMU in FreeBSD VM"
>   =09@echo "  vm-build-netbsd                 - Build QEMU in NetBSD VM"
>   =09@echo "  vm-build-openbsd                - Build QEMU in OpenBSD VM"
> -=09@echo "  vm-build-centos                 - Build QEMU in CentOS VM, w=
ith Docker"
>   =09@echo "  vm-build-fedora                 - Build QEMU in Fedora VM"
> +ifneq ($(GENISOIMAGE),)
> +=09@echo "  vm-build-centos                 - Build QEMU in CentOS VM, w=
ith Docker"
> +=09@echo "  vm-build-ubuntu.i386            - Build QEMU in ubuntu i386 =
VM"
> +else
> +=09@echo "  (install genisoimage to build centos/ubuntu images)"
> +endif
>   =09@echo ""
>   =09@echo "  vm-build-all                    - Build QEMU in all VMs"
>   =09@echo "  vm-clean-all                    - Clean up VM images"
>=20


