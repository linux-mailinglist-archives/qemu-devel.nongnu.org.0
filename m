Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ACB3B7378
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:47:38 +0200 (CEST)
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyE5R-0000Bv-DL
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyE0s-0002Ml-Ej
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:42:54 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:39440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyE0o-00066r-Nw
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:42:53 -0400
Received: by mail-ej1-x636.google.com with SMTP id yy20so28689516ejb.6
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 06:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p17HE7hDXce1n71AxYOWi1oO24J4ufK5itugnEo8N/A=;
 b=IYrqnt2wFxvMkkXrUdXpS86MovSv0rp8yvrimNExoO0BW+78ez92UzSkj2HA5JHqqA
 QUQIIjas7O2B60gWT8Iy1q9Ej1g/4pgzm8dlht0xG/Il1k1ZaWN4nKlewlEb7F9h99zq
 uoy5c+VVOvYVuIg4sGeWPVgXbEgtCeYkpLIHC2iBOBt8BFELRw3WLwq5fnkJnvQYcSFm
 NoOptCWSwnLcPYF57dwmIxQgTa/uLPyyro5rq77wY/Efc0tMsoyvltQ8P1MBy/eT0wF1
 0BBtS4olcQp21Y3AF7r5rEUj36zvIuMcx6Fn1tfHvFaFqtYl62H1p2BQ3MTS0uvgLAn4
 fTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p17HE7hDXce1n71AxYOWi1oO24J4ufK5itugnEo8N/A=;
 b=Op2yoohIY+rX710tqh+XRKHXAGLvsRypaRjpsVR91SkjTsX4rRCp5y7qMlxmnpnPby
 6Rl6uAoo4S4PTWolT9SCIUHQd4Ws66qjjRnenf/6lsW9LAJz1qGWcwMYG4Z9/xwgMTFr
 PSLrMD17VTgmXUGXPl/XiP9rkWeoB8mxgb9y6Swia2UTqF+fLBkC8WMBIqFXlhHAOVco
 ye5EXnH4pxCNSIVcLNqKjfa5mSc2pPNbGiLhySc9vxbCbY+KesUnvrj/uWg1Itv2rxZB
 orupwOqHnZdrJRVIX5Gvu9N+ps7Gb0OL24VI3oh9zineteoIhwH8E9TqmlKPqY4gYfwp
 W4Yw==
X-Gm-Message-State: AOAM5300fypG/uY/upSbvCg3rI2HSyQQGw8GR5U0fPGJMKr1Gx/PvcHW
 HgxRg2Kt3gtJOmk9GHtP5QH53N0bO0X2tw9U29+cxg==
X-Google-Smtp-Source: ABdhPJxyJ/R8euBl43viH0kFhqcvo/fi6ugvJjvTvzj05mzP3zdQOAEWncrUa833EJ0wzRwUWOZtR6G5Ya8HgUK5epM=
X-Received: by 2002:a17:907:a064:: with SMTP id
 ia4mr30376630ejc.482.1624974169075; 
 Tue, 29 Jun 2021 06:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-21-git-send-email-gaosong@loongson.cn>
In-Reply-To: <1624881885-31692-21-git-send-email-gaosong@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 14:42:12 +0100
Message-ID: <CAFEAcA_swZQG=XCGN4U4XfqrvK2poJw33oEC-5NDFtU3dT1ZuQ@mail.gmail.com>
Subject: Re: [PATCH 20/20] target/loongarch: Add linux-user emulation support
To: Song Gao <gaosong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Bibo Mao <maobibo@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Jun 2021 at 13:05, Song Gao <gaosong@loongson.cn> wrote:
>
> Add files to linux-user/loongarch64
> Add file to default-configs
> Add loongarch to target/meson.build
>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  MAINTAINERS                                        |   1 +
>  default-configs/targets/loongarch64-linux-user.mak |   4 +
>  include/elf.h                                      |   2 +
>  linux-user/elfload.c                               |  58 ++++
>  linux-user/loongarch64/cpu_loop.c                  | 177 ++++++++++++
>  linux-user/loongarch64/signal.c                    | 193 +++++++++++++
>  linux-user/loongarch64/sockbits.h                  |   1 +
>  linux-user/loongarch64/syscall_nr.h                | 307 +++++++++++++++++++++
>  linux-user/loongarch64/target_cpu.h                |  36 +++
>  linux-user/loongarch64/target_elf.h                |  14 +
>  linux-user/loongarch64/target_fcntl.h              |  12 +
>  linux-user/loongarch64/target_signal.h             |  28 ++
>  linux-user/loongarch64/target_structs.h            |  49 ++++
>  linux-user/loongarch64/target_syscall.h            |  46 +++
>  linux-user/loongarch64/termbits.h                  | 229 +++++++++++++++
>  linux-user/syscall_defs.h                          |   8 +-
>  meson.build                                        |   2 +-
>  qapi/machine-target.json                           |   4 +-
>  target/loongarch/meson.build                       |  19 ++
>  target/meson.build                                 |   1 +
>  20 files changed, 1185 insertions(+), 6 deletions(-)

This is a massive patch that would benefit from being split up
into multiple smaller patches.

I'm told by a kernel developer that loongarch hasn't yet been
accepted into the Linux kernel mainline. Until it has been, the
syscall ABI for it is not yet stable, so we won't be able to take
the linux-user patches for it yet. (We have been burned in the
past by taking linux-user architecture support patches without
realizing they weren't for a stable ABI, and then being out of
sync with the eventual upstream kernel ABI that was accepted.)

We can certainly do code review in the meantime, though.

thanks
-- PMM

