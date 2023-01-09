Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31993662F69
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 19:43:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEx7R-00033a-O0; Mon, 09 Jan 2023 13:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEx73-00033I-3n
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:43:13 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEx70-0002eZ-Rj
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:43:12 -0500
Received: by mail-pg1-x536.google.com with SMTP id v3so6515683pgh.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 10:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hcXk/TuYrbqUcA+nSzivhFrQuLP21HA2GsRUwvi4qbY=;
 b=qzHO2cvU/5zv5DJIFkAUOJxzoblIY8MHbbRkUmuh7ShN9QvVtK72s2dYUZH99A2tDS
 mn+nn3SDWkXFP8J14MjVaQ1qdURm6rmJ/qN7m6RV8/ICZS279xPJVG/I/74lMRdwaFYj
 NNNFj0sCx8gjpITsgzDFJzK4bBykrcXzt/x1h4AMQeJIyOt8XLh/+RnrpBGSZ7Bg9Hnn
 5yo8FoR50VgBWekRxSAUQ84rOt2PlyjX/UYpVlvjqd+tle9dqPraUbq4BNCFvynO/RO5
 LuedvWcD1Yxpx93D5JSjm30Io/ChRREb7r0wJDBzRD1u4RC/hzV8ed1Liw93W5yJkWdt
 Mlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hcXk/TuYrbqUcA+nSzivhFrQuLP21HA2GsRUwvi4qbY=;
 b=SvkoPRPNMwmfwz+64rxZ6jQGFkcAOOb8tWdYJ/PI8eoC1Axbc2tXcRv1QwnJ6mQQM2
 /JPQnPsmHcSi9YWeDeUCeZ96R1qU+KTf3JxPGIOMgeuDMnlVR3XMWZ+yjv3miSujrwyR
 n7oJ4qCcmX/oGdH+KwGkVlIP/icDqaJRaMvd9RnaQ8cbr81S8Gqe4wsoTO3GG3IGYQMQ
 wo834gZumGNmEL875rEC9yfQbyICJXiKSrK0CjFQCjSXWG/4xmz3/3pgxT+g2tMID51W
 iJmeB66G1tkSsLx+0h1zDlLHxsYgcqNv3B5GGLbDN2E/9V1ROhrUS+7rZ2TDKeTltJrJ
 UnrA==
X-Gm-Message-State: AFqh2kpBF2GBl4i8Vu7hMdOVZDIKxgovmuKS8JArMayEQnM23k6EUWbV
 JxbHvw3DJj1AR6UnjqLP4db1JpO5AtLaLh32rsdrAg==
X-Google-Smtp-Source: AMrXdXt4lI6MD2TE+kfMOX+6Ur6+WNifgvGgaNpo7TMQa6bgzZ8bq/5reSlt6bI1cvkSu+uDm125iwu/Ti00UlL51+A=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr4219574pgh.105.1673289789245; Mon, 09
 Jan 2023 10:43:09 -0800 (PST)
MIME-Version: 1.0
References: <20230109181447.235989-1-marcandre.lureau@redhat.com>
 <20230109181447.235989-4-marcandre.lureau@redhat.com>
In-Reply-To: <20230109181447.235989-4-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jan 2023 18:42:57 +0000
Message-ID: <CAFEAcA9H+V2GL=4ajLWr6gt5H7PoAaeokBmEH8TDbEDPFTTR1w@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] configure: replace Perl usage with sed
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Ed Maste <emaste@freebsd.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Eric Farman <farman@linux.ibm.com>, John Snow <jsnow@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Li-Wen Hsu <lwhsu@freebsd.org>, David Hildenbrand <david@redhat.com>,
 kraxel@redhat.com, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 9 Jan 2023 at 18:16, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Let's try to reduce our Perl usage during config/build-time.
>
> Note: this patch might be dropped if "configure: remove
> backwards-compatibility code" is merged earlier.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  configure | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/configure b/configure
> index 2281892657..e45acde404 100755
> --- a/configure
> +++ b/configure
> @@ -2571,11 +2571,9 @@ else
>    if test -f meson-private/cmd_line.txt; then
>      # Adjust old command line options whose type was changed
>      # Avoids having to use "setup --wipe" when Meson is upgraded
> -    perl -i -ne '
> -      s/^gettext =3D true$/gettext =3D auto/;
> -      s/^gettext =3D false$/gettext =3D disabled/;
> -      /^b_staticpic/ && next;
> -      print;' meson-private/cmd_line.txt
> +    sed -i.bak 's/^gettext =3D true/gettext =3D auto/g' -e \
> +      's/^gettext =3D false/gettext =3D disabled/g' -e \
> +      '/^b_staticpic/d' meson-private/cmd_line.txt

This doesn't work on macos sed, because POSIX sed allows

 sed command file
or
 sed -e command -e command file
but not
 sed command -e command file

The fix is easy, prefix the first command with '-e'.

-i is not POSIX sed, but luckily the BSD sed implements it.

The two gettext matches have lost the trailing '$' in the regex.

thanks
-- PMM

