Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F806866E5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 14:30:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDAl-0004tE-Vn; Wed, 01 Feb 2023 08:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNDAA-0003Ys-NF
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:28:34 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNDA8-0005kC-IW
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:28:34 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 on9-20020a17090b1d0900b002300a96b358so1993475pjb.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 05:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fWFchcrsfWE9286AodINxdXucHsCHpsS6AGb2S+vvGc=;
 b=NVyx5X/fHDLQavZgtxrS426ZjvpHZWMuP1cBhcvGNdYwUGBjC3HmpsJboieJNE5L0M
 qRvOqE6PRO+eT+x1po3sgYidgOYHa7suUs4sazN9OA3ZrEvuGtJDmErxVpZzKan/X/4B
 YMVYxbyEc9vOrwZtGO7ZlIiJfr9GCOsAnFvGE7TINXrG2JxJiSZtuhD9t86O0X6KQ5fp
 YG1JezEyySWmTd+R+ONWLFwg2lZR40+0n0Nxm04lS7uATEtJbT1u+mWe0FhcYvQJ3xZt
 YMTD4KYvRYuFUmEizaTXLJJHLkUX9TVIPFFFOjZUwxxuwJZt0vUdZl7bJyDOWl337F+C
 uo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fWFchcrsfWE9286AodINxdXucHsCHpsS6AGb2S+vvGc=;
 b=h9dkw9OcnozBTXYKyPzN85aeniGn44huqORQCG/5+A3hucL5PVpYLlJ5IWEyHBHnWd
 a2i6hPP7LMDGAQ9YUERSHuax7GmRnwujSvxLbM5/gGQiiMoFHW7MR7UyX9iuRmpV7tRX
 R4Nit69QRBWNj43b0w8wsPPX2q0rJgyFRaeL4LZPqf1ToGHYkxlNSsB/QeVfyoL9oY7z
 LDuDk0HbZ/VmiYs5PU7gd+mahwjgg+N9dL6EapYo/1/Bv0ooxH7GR+Ntrmq3oBp+FlW+
 w1R+aWgbWY3jhtXLfug2h6piBeeXa+QBpdMcoCy2I/lhN32qNHrc81bV0hS5mm0DKdVF
 GD6Q==
X-Gm-Message-State: AO0yUKXk2ioQVx9tZPACF4QAt2621JIxhQJG6k7F+E5/+UgJuQbsEzfy
 6lg9ixJN82dgBsm53d9AoMfyLHrI2V9FLNCzeGYW5Q==
X-Google-Smtp-Source: AK7set/zESqU+wXRAysk+ZnH3sTs05EX2hKqsqiQDAB8i4X4cgLUABVTnEMSL+UcC1AIxnJHt6s3kqsavo2X774cEEY=
X-Received: by 2002:a17:902:d508:b0:196:7127:2240 with SMTP id
 b8-20020a170902d50800b0019671272240mr613633plg.11.1675258111144; Wed, 01 Feb
 2023 05:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20230124174549.75758-1-kwolf@redhat.com>
In-Reply-To: <20230124174549.75758-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Feb 2023 13:28:19 +0000
Message-ID: <CAFEAcA9jOQcPNTkkStSEMsxU3ja2zsXaQKaqHUpDunrg_8O1AA@mail.gmail.com>
Subject: Re: [PULL v3 00/38] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
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

On Tue, 24 Jan 2023 at 17:45, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:
>
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 1fb9d23f06e0eea297fd57ac62f0fa9efbce865f:
>
>   qemu-img: Change info key names for protocol nodes (2023-01-24 18:40:18 +0100)
>
> v3:
> - Make the compiler happier on BSD and CentOS Stream 8
>
> v2:
> - Rebased to resolve merge conflicts in coroutine.h
>
> ----------------------------------------------------------------
> Block layer patches
>
> - qemu-img info: Show protocol-level information
> - Move more functions to coroutines
> - Make coroutine annotations ready for static analysis
> - qemu-img: Fix exit code for errors closing the image
> - qcow2 bitmaps: Fix theoretical corruption in error path
> - pflash: Only load non-zero parts of backend image to save memory
> - Code cleanup and test case improvements

Fails tests on macos-12:

https://gitlab.com/qemu-project/qemu/-/jobs/3696008061

The line
+/private/var/folders/76/zy5ktkns50v6gt5g8r0sf6sc0000gn/T/cirrus-ci-build/tests/qemu-iotests/tests/qemu-img-close-errors:
line 62: truncate: command not found

in the logs suggests that the new script is assuming the
presence of a command that doesn't exist on all hosts.

The openbsd VM also hits this.

thanks
-- PMM

