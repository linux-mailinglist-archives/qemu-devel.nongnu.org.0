Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10607409415
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:30:17 +0200 (CEST)
Received: from localhost ([::1]:45874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmyO-0003vK-3H
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPmN2-0000oX-Gz
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:51:40 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPmN0-0001o9-3m
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:51:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id g16so14862017wrb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 06:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WhQ9rWRN2WvfMXULaMC1cIHfEHmJnm5f+oONuJMueCE=;
 b=tLlsWT8tr7IYa51iJUBmzwLTOc4WjePIvX6lhmYdY8VaGxrwphxVlcoIspIEeVeanr
 1b9cD+XEUT506RdlRU5bZFkxt0QzssPdEgByRL+/zq2WARa5DErjFQeD18Vp9lG9CbzF
 4JYhcPyRhE07WfW3SiDVysfWj3Wfvd+UMqkcRJkpNEMwznPKiXEreNIxQZ4k95ToGX/p
 WndmaCleXFdx1Emw1qAtWWyCgQK+m6/DA1XB6O+541dFnopyiMdJEWCMYTOIbcU6jByP
 WAWBWXF3zHmFsOOHXpOUo/fn7nYO+O1pRlU/7hTSAcEyL9PrDnbQV9Y0moD9OImoGBDZ
 1/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WhQ9rWRN2WvfMXULaMC1cIHfEHmJnm5f+oONuJMueCE=;
 b=DJjW3Id7HK6zJZ3GgUvNt9VNaCZB7uE+6veQ0ZpGYW7rfOJdE3CgjjYK6dTvEdjyd4
 uaDa7toAFWXozqdGq90ZXr9WTo0gnXVEOzAt9fGc4cHXfi7z3dhDQRVWS83fO1J/Dyon
 WyAJpheudkveOU+C/WTJRFEkFeQu8mJhD7br92efsy2tt7DbdWchPdYFetECX9HaRx4I
 AyIWSW7daGIBcI9ZY39cvD/v7UqJGUwKsJ0rVaG5X6D8K5auOV9DJ6asGYi1jdeTvrA9
 zUDY1kDpbgRg5Z/NPEZbBtqNXq4bXDdIs8yWkBcpRrdFlW97uiLteD6vhPnyTEL8qm4S
 qSHg==
X-Gm-Message-State: AOAM531lKVSh+MtgeOvudwkiercaJ0rU3mPHbmowoZS0aDUu8ZPuPyhO
 hFSBJMpN38YJ68x/fSqDseJvlxs0IsTOqVsFtUflvQ==
X-Google-Smtp-Source: ABdhPJxHQAKr1TJbrEFuIkfGIawDoUFbDGl61a4Mnz6KX2Fejo6TgHO/vf6lv+0bS97ZwAaa5If1IQ3GYJpMk7hj8lY=
X-Received: by 2002:a5d:4647:: with SMTP id j7mr12878442wrs.149.1631541095352; 
 Mon, 13 Sep 2021 06:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210913130950.214756-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210913130950.214756-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 14:50:44 +0100
Message-ID: <CAFEAcA97pX7qHLXkGL23_ygFk2hcJEw2J7CSKDJukdbxpvgKpg@mail.gmail.com>
Subject: Re: [PATCH v2] docs: add supported host CPU architectures section
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 14:10, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> I was looking for such documentation, but couldn't find it. Add it to
> the build-platform.rst document.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/about/build-platforms.rst | 28 ++++++++++++++++++++++++++++
>  meson.build                    |  2 +-
>  2 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.=
rst
> index 692323609e..518a19aff7 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -29,6 +29,34 @@ The `Repology`_ site is a useful resource to identify
>  currently shipped versions of software in various operating systems,
>  though it does not cover all distros listed below.
>
> +Supported host architectures
> +----------------------------
> +
> +Those hosts have a native TCG backend and are regularly tested:
> +
> +  .. list-table::
> +   :header-rows: 1
> +
> +   * - CPU Architecture
> +     - Accelerators
> +   * - Arm
> +     - kvm (64 bit only), xen
> +   * - MIPS
> +     - kvm
> +   * - PPC
> +     - kvm
> +   * - RISC-V
> +     -
> +   * - s390x
> +     - kvm
> +   * - SPARC
> +     -
> +   * - x86
> +     - kvm, xen, hax, hvf (64 bit only), nvmm, whpx (64 bit only)

I still wonder if this would be clearer if we listed 'tcg' as
an accelerator like all the others, rather than describing it as
a kind of special case in the text above the table. After all, you
can select it with '-accel tcg' the same as any other.

I think the information in the table is correct now.

Sort the list of accelerators alphabetically ?

> +
> +Other architectures are not actively maintained. They may be removed in =
future
> +releases.
> +
>  Linux OS, macOS, FreeBSD, NetBSD, OpenBSD
>  -----------------------------------------
>
> diff --git a/meson.build b/meson.build
> index 9a64d16943..27593c9b90 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -78,7 +78,7 @@ endif
>
>  accelerator_targets =3D { 'CONFIG_KVM': kvm_targets }
>  if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
> -  # i368 emulator provides xenpv machine type for multiple architectures
> +  # i386 emulator provides xenpv machine type for multiple architectures
>    accelerator_targets +=3D {
>      'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
>    }

This change appears to be unrelated ?

thanks
-- PMM

