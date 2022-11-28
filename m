Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D6963AE1A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:52:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhMa-0004nU-KW; Mon, 28 Nov 2022 11:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozhMQ-0004m8-DR
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:52:02 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozhMH-0006pp-8x
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:52:02 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id y83so14058076yby.12
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8uQ7u9AOf7jC9YG7idahusoMK8fTBBNUKcFaavhZ4d4=;
 b=E42/q5tYMD5wQiGn83442JsF7CnR0D/FBZA+5JFNzRxZFywfSjlA0Ao7Pvz8u09e3j
 aU3ELxJZKt2B2qK8hA2hesh6TttlQRc2ZTIq2kP5VCtchSUkJo1YI7uftAeCGUULeuxy
 L+GZAfiMJ6T5r6UV+AOgrsPBxA4t6xEzu8ofkFd0F2WMRPAJK8ri2tGcVv3z0zfWZ+II
 3HAXfZjobTkyfahHiqQ0xXewNYt/xDV/RHr1pBZz08Z1xn3mOWgYtAPMNt2iNA8C/XPf
 0yBlwhXUhRuPifUgki9KQa//xWVmUmRL9kYS9P7JgvX8tR/xhUfzxIngpnaeSwUF9j55
 IT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8uQ7u9AOf7jC9YG7idahusoMK8fTBBNUKcFaavhZ4d4=;
 b=vkabp6uK/p3yOSi5/zTL/GGlRZgp8Al+nzTPZh1BpvBlmQDQcAatx1awmwjoE3eMfo
 XjXhA8vool/jo2LHspcCJclmkH5cqHeI6sWRkJGxGuuKZBEeYrKXtzaMqObv7Pag8Dkx
 FkhEjA+T8gJTz6CAa6ckt+T4W2utWSZuKb6Eq7tqtts/BWwJMqq33YeNbwSuBaNjNnEt
 qT0yS/DXH1u9Fxb/08d0TDDR85pLHM+/KQE0j6GFIuS7DSTGNugt8cmJryw7443EI4mZ
 LGGBnLGW8sX3D0b9LjHoCeBwuKmA4PjJMImthhQqzZd0c0BKh1Rhj+i1HyuJ3sb1ULO8
 BFrw==
X-Gm-Message-State: ANoB5pk3aLGwxNzMDQO+QH2/QjkfzCDYGt8a8hNA2kbJslS1NEQ2LuJy
 2ZVVET9pK8jF4LqBZ1+aiQLqYvBqJpa5w22p1Aw=
X-Google-Smtp-Source: AA0mqf4bPB+qycvMelVBSG6Tx/NC++gWpWKqZrn+ZbPbSPeUDn4eOhFtRcoyI9SpxHy6+uwedoW8rH80MARxTdsPKRw=
X-Received: by 2002:a25:a189:0:b0:6ee:f3dc:b8d0 with SMTP id
 a9-20020a25a189000000b006eef3dcb8d0mr29663382ybi.642.1669654299554; Mon, 28
 Nov 2022 08:51:39 -0800 (PST)
MIME-Version: 1.0
References: <20221128092555.37102-1-thuth@redhat.com>
 <20221128092555.37102-6-thuth@redhat.com>
In-Reply-To: <20221128092555.37102-6-thuth@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 28 Nov 2022 11:51:27 -0500
Message-ID: <CAJSP0QW29Y55P2ywsEBqJjC77p1tqS3fYX=Q-VHx7b_uOyezqA@mail.gmail.com>
Subject: Re: [PATCH v2 for-8.0 5/5] scripts/make-release: Move roms into
 separate tarball
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2c.google.com
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

On Mon, 28 Nov 2022 at 04:28, Thomas Huth <thuth@redhat.com> wrote:
>
> Our current release tarballs are huge and caused already some trouble
> with the server traffic in the past. However, the biggest chunk (~80%)
> of the tarball is caused by the firmware sources - which most users
> don't need anyway (assuming that they just want to compile QEMU itself
> on their own). So we can certainly safe a lot of traffic by moving
> the firmware sources into a separate tarball, so that only people who
> really want to rebuild the firmware images on their own have to
> download it.
>
> This decreases the size of the main QEMU xz tarball from ca. 116 MiB
> to only 27 MiB!
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  scripts/make-release | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/scripts/make-release b/scripts/make-release
> index febeb6cb36..44408c24a2 100755
> --- a/scripts/make-release
> +++ b/scripts/make-release
> @@ -42,6 +42,19 @@ git submodule update --init --single-branch
>          CryptoPkg/Library/OpensslLib/openssl \
>          MdeModulePkg/Library/BrotliCustomDecompressLib/brotli)
>
> +tar --exclude=".git*" -cjf ../qemu-rom-sources-${version}.tar.bz2 roms
> +rm -r roms/*
> +
> +cat > roms/README.rst <<EOF
> +Please download the qemu-rom-sources-${version}.tar.bz2 tarball
> +and unpack it in the topmost directory of the QEMU sources in
> +case you want to recompile the QEMU ROM images.
> +EOF
> +cat > roms/Makefile <<EOF
> +%:
> +       @cat README.rst
> +EOF

Replacing files with different content worries me a little. If someone
is trying to match a git tree with a release these files will be
different and require manual inspection.

How about having no roms/ directory in the main sources tarball and
including a check for an empty directory in the build scripts? Then
there's no need to patch the roms/ directory.

Stefan

