Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D195564EA8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 09:28:12 +0200 (CEST)
Received: from localhost ([::1]:38224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8GV9-0003Nu-7B
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 03:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o8GTp-0002LN-M6; Mon, 04 Jul 2022 03:26:49 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:36693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o8GTn-000386-UW; Mon, 04 Jul 2022 03:26:49 -0400
Received: by mail-yb1-xb31.google.com with SMTP id c143so6820727ybf.3;
 Mon, 04 Jul 2022 00:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9sWdMjXLgwMI4KTWyfAdMYChMD4JPzLtx9XDU2LhjTo=;
 b=IT0ZQJBDtfrPh791wUzlEYorttjymUtp099qN/buEjdU9z2v1zDXuoKBSvH638OKF+
 w1gaRyt/MGk5BBIA+ohp0dA20t3hCe+UWC7BC9IP8eNijwWwzC/AG2S/Bij1AQzEPC8t
 klRtOWmI2ZTYYy4ayq1v9Cc4umnbisUXf+GKv8wB4vaDJnOOIbTilGFMYqoqdUnQPSJL
 3byHVfrXLiCRmQYCFNL11zhiQZM/bKBSvz+WtREt2esPXa+7pktsxk1vacygGNr4M8uT
 j804lYov1X4SAg5bk9HzanuVq62PDcx/79xdnsn2OkKuZu4eIQaWmxDpEdLVlz9VR7pY
 R3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9sWdMjXLgwMI4KTWyfAdMYChMD4JPzLtx9XDU2LhjTo=;
 b=dqmvj3mYiSSe6WSrrcv3F3hEsR/rc+4j0PfPYY2xBdSG5w1wetNqbgOBgjq3HTbdL3
 2IeL1UcvkYNQ60egEZ2LUdcdVcYajwePjyBAg9DkQnkB9Y8UH20NS5XwdaQKLOlbLiaw
 u972HOWjRmnAHx2klADslhAUsSs5z2JqBrY+UgTOQzje3ajdG/26y1nNBJy5Xc3Sjmhn
 GmffevPSERiGnXGXD3No5ePBCvw0AISqXS0EvdmJs5RbPyuHZBNQB5Y9s1dBwCSlRyJ6
 fgpebxVTNq7OCaPYKpvyqqqiTwlHd3aVzH5Xi4O+NR+KDh0C00Fchux/gFWYlns1PjNP
 Stug==
X-Gm-Message-State: AJIora85fXlCwdXlNMDItQvW7XCzs39GjTxl4Uf2lTKNnLC6GY6zmiv4
 3fV/xoVB/iNjjj2UNmoKN07i6jreCz2nYEJEpOs=
X-Google-Smtp-Source: AGRyM1u0hgVr1RXQ42b4dIrG0vGvDsfW1I1J7j/YqK03mhEiNriKru7Sogsl/4KnJ0PslgHy81OfaxXhrEAedW2MzFA=
X-Received: by 2002:a25:4d4:0:b0:66e:29d0:4d81 with SMTP id
 203-20020a2504d4000000b0066e29d04d81mr11712386ybe.118.1656919605948; Mon, 04
 Jul 2022 00:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220704064254.18187-1-thuth@redhat.com>
 <20220704064254.18187-2-thuth@redhat.com>
In-Reply-To: <20220704064254.18187-2-thuth@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 4 Jul 2022 08:26:34 +0100
Message-ID: <CAJSP0QUx8456jPp4=MOjRwZMPrBYgU1669HnEpC_+gDobhOiCQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] scripts/make-release: Do not include the edk2 sources
 in the tarball anymore
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, 
 Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, 
 Brad Smith <brad@comstyle.com>, Kamil Rytarowski <kamil@netbsd.org>, 
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Jul 2022 at 07:45, Thomas Huth <thuth@redhat.com> wrote:
>
> The edk2 sources are bigger than the sources of QEMU - so they double the
> size of our release tarballs if we include them. Fortunately, edk2 has a
> permissive license, so there is no need for us to do this as long as we
> continue to distribute the edk2 license information in our release tarball.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  scripts/make-release | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/make-release b/scripts/make-release
> index 05b14ecc95..f79ed7a2ae 100755
> --- a/scripts/make-release
> +++ b/scripts/make-release
> @@ -20,19 +20,34 @@ git checkout "v${version}"
>  git submodule update --init
>  (cd roms/seabios && git describe --tags --long --dirty > .version)
>  (cd roms/skiboot && ./make_version.sh > .version)
> -# Fetch edk2 submodule's submodules, since it won't have access to them via
> -# the tarball later.
> +
> +# Fetch edk2 submodule's submodules to get their license information.
> +# Edk2 is distributed under permissive licenses, so we don't have to
> +# include the full source tree here (which is bigger than QEMU's sources)
> +# as long as we provide the license information in the tarball.
>  #
>  # A more uniform way to handle this sort of situation would be nice, but we
>  # don't necessarily have much control over how a submodule handles its
>  # submodule dependencies, so we continue to handle these on a case-by-case
>  # basis for now.
> -(cd roms/edk2 && \
> -    git submodule update --init -- \
> +cd roms/edk2
> +git submodule update --init --depth 1 -- \
>          ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3 \
>          BaseTools/Source/C/BrotliCompress/brotli \
> -        CryptoPkg/Library/OpensslLib/openssl \
> -        MdeModulePkg/Library/BrotliCustomDecompressLib/brotli)
> +        CryptoPkg/Library/OpensslLib/openssl
> +mv ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3/COPYING.txt \
> +   License-softfloat.txt
> +mv BaseTools/Source/C/BrotliCompress/brotli/LICENSE License-brotli.txt
> +mv CryptoPkg/Library/OpensslLib/openssl/LICENSE License-openssl.txt
> +edk2rev=$(git rev-parse --short=12 HEAD)
> +rm -r $(ls | grep -v License) .[a-z]*
> +cat > sources.txt <<EOF
> +The edk2 sources can be downloaded from:
> +
> +https://github.com/tianocore/edk2/archive/${edk2rev}.tar.gz

Please use QEMU's edk2 mirror:
https://gitlab.com/qemu-project/edk2

QEMU mirrors all dependencies so that even if upstream projects go
offline we can still rebuild all of QEMU from source.

Thanks,
Stefan

