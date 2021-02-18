Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779D331E902
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 12:21:51 +0100 (CET)
Received: from localhost ([::1]:41700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lChNU-0005Mn-5y
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 06:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lChM3-0004n1-99
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 06:20:20 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lChLy-00076U-J0
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 06:20:18 -0500
Received: by mail-ed1-x530.google.com with SMTP id s11so3885222edd.5
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 03:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gk8i1iZpFpYAt2wLRN90+560lQ7D7xWVk/HACfhe9YM=;
 b=IP54cEZ/vfhdoNAmiDEJ9KiDZ0zT5zpjfipKs+rmdd0e3Lu3gbaKe7nxQJtJKvxWPM
 XK6Id+g99Yxu98DXnLhBKB4vGj+Ac5WHFviu/E5C8m5yyrvJ22/tmiQ3xEUq4GLk//0t
 v4L8AZjJOwnOu4SUgHpI10U7SvSTp89fdyaxGnhdT3jx4LLWpm6RnTFmHsJRMg5ejiqZ
 jEkOVpS3AlHPljR83nOQEi6asdv+cGjeX4PH7kuiPVZ7rt2cX6U3wr+a7N4+2jCj9P3Z
 dDgTdRT5yO7uO21M9e97QOkha7qX+q11iLTpgKHWqkg8AXN/uC70GAo4T1gGE1oyqSiq
 ksoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gk8i1iZpFpYAt2wLRN90+560lQ7D7xWVk/HACfhe9YM=;
 b=bhbQs3ptY4RmbGpgMVGlNBbAZDFQiZOVfmUSdE/NFnOFO4P/c/tSiun6xlDW8z2tM0
 itD5EAlLip/3wDxx7rw4K3DR3IrjgRku9wlWUOfpgAcd84gYKESeenKbzV1Qi26b3eGl
 L4SmV12DIW5vO8dGILwCZkoKB/IhnaeAPtiIaIgd33CeV3FhzUgQOrg2XijKdd+xqGZd
 jrcSJZgBPvEzlCCJpah3Lb9hNEv+10MvRJ4J4bJEXR3neVipZzWkzHbnI+wAPVW95d69
 f6VKCgNUzuRqdEU7Mt34M1h3kn205PUXd8YRGX+VvsiUy2rwnq5hDwkf8SvI6boaiIM/
 655g==
X-Gm-Message-State: AOAM533VKX/l+I67EwoMw0YiCaZXQcYaoIoROWFQ6I1s9lujcDbSKk1e
 c1kP3fAtKOtso6y2ZqMzMgIrbi51f/69C22kTIMqsQ==
X-Google-Smtp-Source: ABdhPJy5xsV2EQ/Us7MiIgtihMpJJqM32Paq7o/flOCHxTQqEy2IUj1wTg2gimCgdBz42qbwYOsIhaysEhNZdzmAoMc=
X-Received: by 2002:a05:6402:541:: with SMTP id
 i1mr3693751edx.36.1613647211906; 
 Thu, 18 Feb 2021 03:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Feb 2021 11:20:00 +0000
Message-ID: <CAFEAcA90TARuGKPLkONWEto5Pdf8aXjhd24qdjq_-hs93=B2BQ@mail.gmail.com>
Subject: Re: [PULL 00/35] hexagon initial commit
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Wed, 17 Feb 2021 at 23:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit f0f75dc174b6c79eb78a161d1c0921f82d7f1bf0:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-02-17 13:04:48 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-hex-20210217
>
> for you to fetch changes up to 91bdc01a235a0065411e29ad78859587fee85bc6:
>
>   Hexagon build infrastructure (2021-02-17 12:55:21 -0800)
>
> ----------------------------------------------------------------
> Initial commit for the Qualcomm Hexagon processor.
>
> ----------------------------------------------------------------


Fails to build on the FreeBSD and NetBSD VMs:

Configuring config-host.h using configuration
Program scripts/hxtool found: YES
Program scripts/shaderinclude.pl found: YES
Program scripts/qapi-gen.py found: YES
Program scripts/qemu-version.sh found: YES
Run-time dependency threads found: YES
Program keycodemapdb/tools/keymap-gen found: YES
Program scripts/decodetree.py found: YES
Program python found: NO

../src/target/hexagon/meson.build:20:0: ERROR: python3 not found

A full log can be found at
/usr/home/qemu/qemu-test.FAG4lS/build/meson-logs/meson-log.txt

ERROR: meson setup failed

Something isn't honouring the configure --python option.
(On these BSDs, python3 isn't "python3", it's eg "python3.7".)

The top level meson.build does get this right:

Program sh found: YES
Program python3 found: YES (/usr/local/bin/python3.7)
Program bzip2 found: YES

I think target/hexagon/meson.build should be using the python
that the top level meson.build found, not going out and
trying to find its own one.

thanks
-- PMM

