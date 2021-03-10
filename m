Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41E13345C9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:56:56 +0100 (CET)
Received: from localhost ([::1]:59712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK34p-0004v0-LN
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lK2VK-0003li-0c
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:20:14 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lK2VI-0004R6-2M
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:20:13 -0500
Received: by mail-ej1-x629.google.com with SMTP id ci14so40140910ejc.7
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=ceovYVIymUofTEh4MBQXFN+G6MKpNNM6t4sR9rLXkQg=;
 b=pLMRRKYtkI1kDgWz0PEKQbI3+nvLu57C8NlJoTjraHzd0B0GoYdwlpWlfmdq0h/nIZ
 DlIRLZPtyh8DUo7TdJh/ttecy6im7QJxV2mBZCSKwh/RMGPgT9LcV4iyklXJ2qGBdLSw
 G9BhV0v1cjFZCEeug0n1yx4IFYTLcqk/3r/ubLr4VgDdFZi1zzqiUZyonV2LF7gK30w7
 A++L5NvTYtMNkMz2MzOAP8/9Z9pLaBael+f/zzMTEuLwVfD/V64ef2o+dOhG1Cd5ktnq
 ahK7AhFXcYKLeyzLuHjd2eZWFd3AgsEFu3BuyHYhDcH2rVwK+eyMnnaYpcJ6dYOEmb4m
 YNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ceovYVIymUofTEh4MBQXFN+G6MKpNNM6t4sR9rLXkQg=;
 b=ifyjmreJ5uLSdN4AM68JxFKbvoPTpDnknzW1BIhqOD+xZ4SXqNhlxZK8A3NyorXQz5
 Hx52P98ld7JL3yJlLta4rI1SOc+GGyrGZypeXTgdYOES8rJhKKlkVP39zJiw18TnM/Fq
 mg5pKPEcnCRNkTmYgv/b3p1wV9EPdAnlrarmbT8wp4IdHCkmiamM4uqolL/FsVCty1cz
 3UYVujugQI8RK8a8gRxJ8P5fjq9eSVynB3osrjY3FFA6hVf8rosG7qrm0btSbFIHV4Pw
 r3aeaCH3oTl5S2zbukMoREvwmJ0Aa5OiwJrMxPCjkI9bDXzPRvSU3r57aaZiEhVYr7NS
 IxfA==
X-Gm-Message-State: AOAM531Hbz2fgprOQ+ufEFDlOXFbwaRte9M87jTcGDZSFRbRyQLi/1/f
 9mwWQuxr39Ls6IA1b2yZlacb30o1rN5y9/COyNxLFRla/3o=
X-Google-Smtp-Source: ABdhPJwMtsV5X7BtopGUrIA1/m/p6GyHxXLcXSbFmxGAmyRBGtfqsw9R0Wc5YFvvaDi0lBUIbCzL1TGc4sOCvjQxgoI=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr4869698ejb.56.1615396810487; 
 Wed, 10 Mar 2021 09:20:10 -0800 (PST)
MIME-Version: 1.0
References: <20210310135719.29084-1-peter.maydell@linaro.org>
In-Reply-To: <20210310135719.29084-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Mar 2021 17:19:52 +0000
Message-ID: <CAFEAcA9hdLxM_vd3obX9Uafw1uQxLyD0UR=4C2n_fLbBHBw1=g@mail.gmail.com>
Subject: Re: [PULL v2 00/54] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Mar 2021 at 13:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v1->v2: fix format-string errors on 32-bit hosts in xilinx csu dma model.
>
> -- PMM
>
> The following changes since commit 0436c55edf6b357ff56e2a5bf688df8636f83456:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-03-08 13:51:41 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210310
>
> for you to fetch changes up to 81b3ddaf8772ec6f88d372e52f9b433cfa46bc46:
>
>   hw/timer/renesas_tmr: Fix use of uninitialized data in read_tcnt() (2021-03-10 13:54:51 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Add new mps3-an547 board
>  * target/arm: Restrict v7A TCG cpus to TCG accel
>  * Implement a Xilinx CSU DMA model
>  * hw/timer/renesas_tmr: Fix use of uninitialized data in read_tcnt()


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

