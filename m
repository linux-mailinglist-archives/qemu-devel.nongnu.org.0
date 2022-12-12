Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4AC6499D1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 08:58:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4dgp-0005DT-3r; Mon, 12 Dec 2022 02:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4dgn-0005DE-1f
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:57:29 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4dgl-0006ET-1B
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:57:28 -0500
Received: by mail-lf1-x136.google.com with SMTP id b3so17201980lfv.2
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 23:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BI8BplsK3nOjf4dqZD0PCo2weJyPOSjU+Z5WshG0foI=;
 b=dK6eonWzYqyXVBrL+OgQr0Li74Ra4BFQA9FRIBEmdLoi/1Yn3dWhgA8gKMWj85aNHx
 U4JZweFAwjCvwwotgo4Frbakm4yPH/Cme4q1dtdETXAesF90ms23DfaN53sVfZ1E+G6Z
 +o/D7Xo5hB12mJ/rMumjODLhQr2CBOs2jkSlxxriRbxfDPcwBzdn0b9OEMt/71D7Q1MG
 hIQVYYfqWkuR+FnjpUylfvD5HFefJxILSlw3p6i4Wgn5OouzzmP6yZkGGhAu4lJwmpJe
 SlH0vrfY89/GOvYuObYZusZBapTMpr9FkRhJXGxmVwFOqOiDUZq34Ujpr77locOVI1CN
 XqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BI8BplsK3nOjf4dqZD0PCo2weJyPOSjU+Z5WshG0foI=;
 b=i165dcOy0Envl1WjnXP5X7ZkKqmWMa/PjdcdG/CYYaeAPwsqf/YyGxZtm9pFx3sIPX
 phvZ9Hh6zoTH5WrB4amj+O0SudNEmmeJ2sMFUmH6FlJCe1eSWycOoqTEPeLqxa/JtGbb
 Ijkqv+kSH6WhR+ulJqqrv0NvEQ0ggvUNxCj2p2C4+AwIXfHE6McKAjiXYtGeXOtDO58F
 bW/cTFKPiUmH4J7W1lvYx73QcTZgA4gHpl5fYG8l3DnS0+Wq8YReghmmlMEG5sf5dg+s
 NGNyFPW+hwnW2+PGcO0bC7sUvqTtdyoESysZyz9RdXyvJ9VCp2BkrG66jltsHGaKJnis
 DJnw==
X-Gm-Message-State: ANoB5pmnfZFSZ9nAuCESiOqGF/wg0o5rtIAdjviJRMF5k7vZ3y6mupDW
 eY1HJmKvX5UkCtXaSGg1bj5o4Qa/3pmq1ISioyV7nM0pH9Q=
X-Google-Smtp-Source: AA0mqf5jNEwjoFZsjz8O1QQV8Cb+kNzShCrjDoj8MXR1fk5eF4mu1NDp+Gk4iUl4CYpA0iXmUB9hNFeTtUn2sTP04c0=
X-Received: by 2002:a19:f016:0:b0:4b5:886b:d4af with SMTP id
 p22-20020a19f016000000b004b5886bd4afmr4994445lfc.276.1670831844972; Sun, 11
 Dec 2022 23:57:24 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-6-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-6-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 11:57:13 +0400
Message-ID: <CAJ+F1CL3k3wiGOq68NBwkOESCjhphTf0xqkatPMZ07if4-W8+A@mail.gmail.com>
Subject: Re: [PATCH 05/30] configure: remove backwards-compatibility and
 obsolete options
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri, Dec 9, 2022 at 3:43 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure | 20 --------------------
>  1 file changed, 20 deletions(-)
>
> diff --git a/configure b/configure
> index 4d14ff9c319c..adfff30a6204 100755
> --- a/configure
> +++ b/configure
> @@ -838,17 +838,6 @@ for opt do
>    ;;
>    --with-coroutine=3D*) coroutine=3D"$optarg"
>    ;;
> -  --disable-zlib-test)
> -  ;;
> -  --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
> -      echo "$0: $opt is obsolete, virtio-blk data-plane is always on" >&=
2
> -  ;;
> -  --enable-vhdx|--disable-vhdx)
> -      echo "$0: $opt is obsolete, VHDX driver is always built" >&2
> -  ;;
> -  --enable-uuid|--disable-uuid)
> -      echo "$0: $opt is obsolete, UUID support is always built" >&2
> -  ;;
>    --with-git=3D*) git=3D"$optarg"
>    ;;
>    --with-git-submodules=3D*)
> @@ -868,19 +857,10 @@ for opt do
>    ;;
>    --gdb=3D*) gdb_bin=3D"$optarg"
>    ;;
> -  # backwards compatibility options
> -  --enable-trace-backend=3D*) meson_option_parse "--enable-trace-backend=
s=3D$optarg" "$optarg"
> -  ;;
> -  --disable-blobs) meson_option_parse --disable-install-blobs ""
> -  ;;
>    --enable-vfio-user-server) vfio_user_server=3D"enabled"
>    ;;
>    --disable-vfio-user-server) vfio_user_server=3D"disabled"
>    ;;
> -  --enable-tcmalloc) meson_option_parse --enable-malloc=3Dtcmalloc tcmal=
loc
> -  ;;
> -  --enable-jemalloc) meson_option_parse --enable-malloc=3Djemalloc jemal=
loc
> -  ;;
>    # everything else has the same name in configure and meson
>    --*) meson_option_parse "$opt" "$optarg"
>    ;;
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

