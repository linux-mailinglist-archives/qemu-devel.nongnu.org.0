Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074BB6A3C91
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:25:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWYhF-0006ep-Ry; Mon, 27 Feb 2023 03:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pWYh3-0006Rj-FW
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:17:14 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pWYh0-0007I7-D5
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:17:09 -0500
Received: by mail-lf1-x130.google.com with SMTP id g17so7410548lfv.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 00:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+bkqhBRZHg8qQPHx+k2kr1sYRLKANsnjKs40P01rtDk=;
 b=guu8pYv6i+gYhtlE/X9UpQsDqHvLN8RcfLdypEX0Krf4cwFVz/TO8Zjp+nW6J/xyMW
 7rGcsf9l6+fBAQ25Hh8OGuxWbLOtUG9avzUTdZJrKK1Za1n7RRHsqiiRtb35lPPr6h1B
 vDuMZXyev/ZhxHBdr+ZK/1CU+kBDiPK7ppWErXLqZRKEssn+Zs3U+Vf7qV/UyhpSpW+3
 1PN0GBayqgyhcvRzsvGtMOyt1ILJVDvcKN+OH1bs5dh4Fdtyzqkk/oT91khy2kNi/6jI
 0ByV6RaJEevW4gGXAvdehM3n+eU3XwGnLR5XscocQ6gBEHF7EClA89z4PtVMDZuatPfH
 sdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+bkqhBRZHg8qQPHx+k2kr1sYRLKANsnjKs40P01rtDk=;
 b=7PhH0MSyEGxlEXtVQFuoYbNBtasmA2iabDCJXQ9ZwSejEuGf1D267N8nv7oSNSeKd0
 9P9kgeqSfmXuVvYfARR7KxFjTiqiEoHcu+lHeMKWUC9ays4GSFUAO2DYl2pBEJyOFtRo
 bMHuImf57SOvC9tjaIzuR7MsE5HSfJox/R4yo4RS2Mau+1MDi6x9wIOmP2C6nGCak/wj
 lOJ5SYoIo+PJELvikhIBGVMahw1QIhaRpkPbqC5Lufm1bdwPChQN7htNCej/qD4MyiCf
 PPs+uzLvPlTf6MP0D++owMgS+B1nKNxS/fPHRyf6Jr/d0q4+REWKe0Ht11d2Hj5v7/Y2
 WAJg==
X-Gm-Message-State: AO0yUKXitKahvAYLU55ARvhjXkaDEUx3UCX2dX67eVLS8I9eZbKx6v1r
 Z2IQV0Ad4lN9DD6mZB5+TdDevkDEwtizjwkiOkc=
X-Google-Smtp-Source: AK7set8LlhdsA1bXZq+2DKkiTOeQKxPJHOqAy+KYtP6/9W7DqSMKDZag8y38PmFI6S1Ut1OM0DCFiQ8ESqY4mMlacq8=
X-Received: by 2002:ac2:46d1:0:b0:4d5:ca32:68a0 with SMTP id
 p17-20020ac246d1000000b004d5ca3268a0mr7217707lfo.5.1677485824157; Mon, 27 Feb
 2023 00:17:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677197937.git.dxu@dxuuu.xyz>
 <d4b8f60e02ae9f6fd12f2d05feae3c903cfe9e82.1677197937.git.dxu@dxuuu.xyz>
In-Reply-To: <d4b8f60e02ae9f6fd12f2d05feae3c903cfe9e82.1677197937.git.dxu@dxuuu.xyz>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 27 Feb 2023 12:16:52 +0400
Message-ID: <CAJ+F1CLY=8fnvqkn9OBwqvDw=-mgjsDeMr1pa-p2xBw3Oc4Nxg@mail.gmail.com>
Subject: Re: [PATCH 1/3] qga: test: Use absolute path to test data
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x130.google.com
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

Hi

On Fri, Feb 24, 2023 at 8:31 AM Daniel Xu <dxu@dxuuu.xyz> wrote:
>
> It looks like qga's working directory is in a tempdir. So the relative
> path that the test case gives qga through the QGA_OS_RELEASE=3D
> env variable does not resolve correctly.
>
> Fix by doing a poor man's path canonicalization of the test data file.
>
> Note we cannot use g_canonicalize_filename() b/c that helper was only
> introduced in glib 2.58 and the current GLIB_VERSION_MAX_ALLOWED is
> pinned to 2.56.
>
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>

This breaks "meson test test-qga" for me. How do you run the tests?

> ---
>  tests/unit/test-qga.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
> index b4e0a14573..9d8e1d1cd3 100644
> --- a/tests/unit/test-qga.c
> +++ b/tests/unit/test-qga.c
> @@ -881,13 +881,16 @@ static void test_qga_guest_get_osinfo(gconstpointer=
 data)
>  {
>      TestFixture fixture;
>      const gchar *str;
> +    g_autofree const gchar *cwd;

const is not appropriate here, interesting I don't get a warning

>      g_autoptr(QDict) ret =3D NULL;
>      char *env[2];
>      QDict *val;
>
> +    cwd =3D g_get_current_dir();
>      env[0] =3D g_strdup_printf(
> -        "QGA_OS_RELEASE=3D%s%c..%cdata%ctest-qga-os-release",
> -        g_test_get_dir(G_TEST_DIST), G_DIR_SEPARATOR, G_DIR_SEPARATOR, G=
_DIR_SEPARATOR);
> +        "QGA_OS_RELEASE=3D%s%c%s%c..%cdata%ctest-qga-os-release",
> +        cwd, G_DIR_SEPARATOR, g_test_get_dir(G_TEST_DIST), G_DIR_SEPARAT=
OR,
> +        G_DIR_SEPARATOR, G_DIR_SEPARATOR);
>      env[1] =3D NULL;
>      fixture_setup(&fixture, NULL, env);
>
> --
> 2.39.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

