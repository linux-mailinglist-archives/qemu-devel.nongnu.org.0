Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6441370BA8
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 15:34:40 +0200 (CEST)
Received: from localhost ([::1]:36306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldCF5-0007LX-BH
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 09:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldCDg-0006wq-3P
 for qemu-devel@nongnu.org; Sun, 02 May 2021 09:33:13 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldCDd-0004EI-21
 for qemu-devel@nongnu.org; Sun, 02 May 2021 09:33:11 -0400
Received: by mail-ej1-x635.google.com with SMTP id b25so3970393eju.5
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 06:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NQ302kg/Cb7OJkv1wh7BG9cIEii0uYRvdNp7KZx0Dz4=;
 b=jhmYwhSiNdMxhssWNRJyyvJRoqVzQrRRlEjrTHrflDsyLgUiDdojb/N0WX3/rDomsy
 /M4lGwAIy/MIvTDsaOzWR/BVzpr3WJpAebFEFDZi7K4parN9boPUUK74sTXdPW2fqATt
 Ss2Ysap6HCsPkxHmIRVxuPgD80R7jpROF6zuQY826N5mKR3iv8cvy+2CXWy4Sus6Q0fm
 OitZUQ4cYQ/CXadIsFNoktAH6GNHnGw10JFpJjthnz3+BDFXkTIYlCPF+TWpnwEfjzvS
 /5z6KnJm6ny2n5C5XJz05Pox9PWqswM4ZHtUqfHSBe7hGgpPqYwCHsTSwbtfgfaLTcbA
 MZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NQ302kg/Cb7OJkv1wh7BG9cIEii0uYRvdNp7KZx0Dz4=;
 b=cH9SLKFd2ibt4XUOxsVJjrtrgIg86K+v4ZBiHZV29AXfYGzBZYK835vpFdfMggvEIk
 uoMqTlWzaVrX5mMG30uuhQTGB7IjIx+NuZeTz7elmL+oSx7ZYbvjNxEiujrz+pI0jUkO
 wcm0//za6H2mC1QcaSY/2dypluembN26e4E6bcUtujybwkOQVb+08GR0Frs33J1NWQw8
 keUj8tD1r6xVgoXSOqZAKYfxp5hPvxeWSA3EilN37Jd2Zkpt3brU1JUE6AxL1f6jT0xe
 N3z4OGetxYQEdyAN63BDyaeR2//iVJPHMPY8J9PZ5TB86/+UDhLSRU+hGa7DdlhJzvBp
 3fSw==
X-Gm-Message-State: AOAM533va3aAXcG1DrvW7SQurCZm8CcRt8fEDRV+xQy1OTTKJgAZEq7N
 WSO64CpuHHsqjlcm/h6O/caEbl02DhocU9GiD2qBVw==
X-Google-Smtp-Source: ABdhPJwG+GN2pXBlITEM9vN7Wy+gStxtVVrFxbDMQg4lKjJXrJTfrdPE2g3k7XP0bXjkAkap6jSPGMi8/oDlRuXvQ8c=
X-Received: by 2002:a17:906:953:: with SMTP id
 j19mr12798147ejd.56.1619962387376; 
 Sun, 02 May 2021 06:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210501185116.1338875-1-richard.henderson@linaro.org>
In-Reply-To: <20210501185116.1338875-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 2 May 2021 14:32:03 +0100
Message-ID: <CAFEAcA9mWeC4UuRKi9wb-BEX8NF5xd0-VufA_256S3B6+BtFwg@mail.gmail.com>
Subject: Re: [PULL 0/5] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Sat, 1 May 2021 at 19:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 8f860d2633baf9c2b6261f703f86e394c6bc22ca:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-04-30' into staging (2021-04-30 16:02:00 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210501
>
> for you to fetch changes up to af93ccacc772019298be4c3e47251cdaa60d0c21:
>
>   decodetree: Extend argument set syntax to allow types (2021-05-01 11:45:35 -0700)
>
> ----------------------------------------------------------------
> Include cleanups.
> Decodetree enhancements for power10.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

