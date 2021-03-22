Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA7C3440DB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:26:10 +0100 (CET)
Received: from localhost ([::1]:33842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJdJ-0007Lp-T3
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOJS8-0001Gx-UB
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:14:36 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOJS6-00008N-Mt
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:14:36 -0400
Received: by mail-ej1-x62b.google.com with SMTP id hq27so20852262ejc.9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 05:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xJRU/iCB2pt4zkQbe12Qq2LKvJNMxVcgWDJyClcv1ew=;
 b=WbS1dRUjeaUdsdrODzW1wxkpQbwlV2oRKpgKdkc3wPF7UShQfz78+Vj904oUoz20Vk
 LeypSLf+ZIImhv6T2gHgtnIhFF3EyI0FXBY447kI7TiBh6eDx1K1EIdjxH9ozPwLjs6z
 miAspOLVdXDGyUDvNW+MZbJO9q1JxY8CyTK1m3hYZsnHVASNjJeJSjfv8RU9/pmBB1/H
 bA7BGMqO+gzO2rJ46dwIxSIzEXlLmGiBDsieyIO2xeGo1N7x41VOzwwc680Ch72aCleQ
 //pti6U9nNdAarcwNEUjbqOnA8ECFhTWDGwkbWv/1MZFCt7fj7QETeLDpRtEc+21TJLE
 HMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xJRU/iCB2pt4zkQbe12Qq2LKvJNMxVcgWDJyClcv1ew=;
 b=oWOMooG42uFXpy5MA9ZlR/RFOxvWL0yMobjTiJ/bvAPiYKi/Mc/AnmxtnCKB7y0xks
 0sJ4sTG94wTkG/Iugiw5tARFu4gLDUAVCrdWwg3yilgdGS84DUnyzZN1EFNp7TAeDx0G
 x51wkBVa9B+gl+wNSoRt/bWw4xoUHQDxcVjZcNyBtbgO7KVM7z2K7RU0I35laqV4VqVM
 yfHrnrpJdjZI5OtuhqpUaEXgVMcI/UuC8ncbHTlln8HtZUCR5gdbKK3ONtYDoViHANDy
 aQ0X+Yi7qMyqEiMSn1fvHjqNKkN6nR9FnCmzAhfSDav8cC02lOK3G+ZIVV9Pkjdxq6EZ
 RnOg==
X-Gm-Message-State: AOAM531t5vT7KaZsl17cZ+GIBsbMI/4cTVNBfGr34Trii3YlrFxwie8L
 TvxzQR+Jo5M6q0+oh7cxQawDMg==
X-Google-Smtp-Source: ABdhPJy0DT7Oy6pz26QGmFBSutIN2KRnZsNlO5zYkF0npOnRrxPlInIsb7twJ+6GH954hmWqYDyNGg==
X-Received: by 2002:a17:906:5918:: with SMTP id
 h24mr19289233ejq.501.1616415269053; 
 Mon, 22 Mar 2021 05:14:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a9sm11604455edt.82.2021.03.22.05.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 05:14:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 543271FF7E;
 Mon, 22 Mar 2021 12:14:27 +0000 (GMT)
References: <20210319165138.117225-1-thuth@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] FreeBSD: Upgrade to 12.2 release
Date: Mon, 22 Mar 2021 12:14:17 +0000
In-reply-to: <20210319165138.117225-1-thuth@redhat.com>
Message-ID: <875z1jl719.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ed Maste <emaste@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> From: Warner Losh <imp@bsdimp.com>
>
> FreeBSD 12.1 has reached end of life. Use 12.2 instead so that FreeBSD's
> project's packages will work.  Update which timezone to pick. Work around=
 a QEMU
> bug that incorrectly raises an exception on a CRC32 instruction with the =
FPU
> disabled.  The qemu bug is described here:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.html
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Message-Id: <20210307155654.993-2-imp@bsdimp.com>
> [thuth: Disable gnutls to work-around a problem with libtasn1]
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tests/vm/freebsd | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> index 09f3ee6cb8..6e20e84322 100755
> --- a/tests/vm/freebsd
> +++ b/tests/vm/freebsd
> @@ -20,12 +20,16 @@ import socket
>  import subprocess
>  import basevm
>=20=20
> +FREEBSD_CONFIG =3D {
> +    'cpu'	: "max,sse4.2=3Doff",
> +}
> +
>  class FreeBSDVM(basevm.BaseVM):
>      name =3D "freebsd"
>      arch =3D "x86_64"
>=20=20
> -    link =3D "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.1/=
FreeBSD-12.1-RELEASE-amd64-disc1.iso.xz"
> -    csum =3D "7394c3f60a1e236e7bd3a05809cf43ae39a3b8e5d42d782004cf2f26b1=
cfcd88"
> +    link =3D "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.2/=
FreeBSD-12.2-RELEASE-amd64-disc1.iso.xz"
> +    csum =3D "a4530246cafbf1dd42a9bd3ea441ca9a78a6a0cd070278cbdf63f3a6f8=
03ecae"
>      size =3D "20G"
>      pkgs =3D [
>          # build tools
> @@ -61,6 +65,8 @@ class FreeBSDVM(basevm.BaseVM):
>          "zstd",
>      ]
>=20=20
> +    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
> +    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
>      BUILD_SCRIPT =3D """
>          set -e;
>          rm -rf /home/qemu/qemu-test.*
> @@ -68,7 +74,7 @@ class FreeBSDVM(basevm.BaseVM):
>          mkdir src build; cd src;
>          tar -xf /dev/vtbd1;
>          cd ../build
> -        ../src/configure --python=3Dpython3.7 {configure_opts};
> +        ../src/configure --python=3Dpython3.7 --disable-gnutls {configur=
e_opts};
>          gmake --output-sync -j{jobs} {target} {verbose};
>      """
>=20=20
> @@ -125,7 +131,7 @@ class FreeBSDVM(basevm.BaseVM):
>          self.console_wait_send("IPv6",                  "n")
>          self.console_wait_send("Resolver",              "\n")
>=20=20
> -        self.console_wait_send("Time Zone Selector",    "a\n")
> +        self.console_wait_send("Time Zone Selector",    "0\n")
>          self.console_wait_send("Confirmation",          "y")
>          self.console_wait_send("Time & Date",           "\n")
>          self.console_wait_send("Time & Date",           "\n")
> @@ -206,4 +212,4 @@ class FreeBSDVM(basevm.BaseVM):
>          self.print_step("All done")
>=20=20
>  if __name__ =3D=3D "__main__":
> -    sys.exit(basevm.main(FreeBSDVM))
> +    sys.exit(basevm.main(FreeBSDVM, config=3DFREEBSD_CONFIG))


--=20
Alex Benn=C3=A9e

