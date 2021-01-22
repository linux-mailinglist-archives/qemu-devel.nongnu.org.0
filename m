Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0DA30005B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 11:35:50 +0100 (CET)
Received: from localhost ([::1]:44206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2tnB-0007IJ-8S
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 05:35:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2tko-0006AO-7b
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:33:22 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2tkm-0000Ma-En
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:33:21 -0500
Received: by mail-ej1-x62e.google.com with SMTP id g12so6944674ejf.8
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 02:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dk8H3gEc4BNDfom7gVeby49uPfRV2W1p4HHLbt7lccg=;
 b=f38FDnA3+HEs1Skt3TN/apy6Ksu6s2wi6BaVosnnEd3VvcyCVGvPE7ys1I4AG/kpEc
 p2c10oVe5b9WV77FWIai2s65LH151nnSHQsSedc1zOMqz9q+5k7vYAGGTMgPhBvqEp8h
 BW78JQYhdsUwe1ZAQYYH9WSl2yYEJ48731WhYDlCbumBABNkeVg+YOk/pxU68QLtE+4s
 4pHiycL+6dxHDDnntZMj5/HlgDWofHO4ho1ki1KqmvWIXALAHZbQ09x2mx58VwBnzArF
 fhBodBpSFL86UB+QTNe5yRic/3EZAbg6T9jgRZvMH37YNvjpiwBFuEqL+udqu2LTpYm7
 ytgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dk8H3gEc4BNDfom7gVeby49uPfRV2W1p4HHLbt7lccg=;
 b=bJlVHkjVNQ4whpqisECTuDBxoMKSFQ0/0pi/KRW9zoJ8R6MABxelPRuIJ2X71k5F99
 aFtr/WHrVJ9HKppwwVrJntZwsac6Y9RfoM8zA+15gDvSvG2+ZEu9bHtaUFkj3fuMYMjc
 9LCdpFmXh/5zkdFoFfzzndMwGfhGOZBeOEFZ8yk61nHcV2ulSE0kVTr1nA9NrcglbgLW
 u/1XSy8Dn+79Zl/GB5ubbBpT6KNcAnhM6Ls5r/jVtio8A1BmKrjb8ik0SyFf1Xz7AfCJ
 kJ7uO4wUgoQI4bwz78kYhRv+KRBMSxnbBJvUGjYVh9/LNMDzU1nSy3mZmNXWiYCEZqaS
 OH4Q==
X-Gm-Message-State: AOAM530RaKmOYQpB4ZJrsSGdLguSldoozdyALRWltFC5HdsVZdqxJkQp
 L36dTdaE0pM8nBpB/wcwS94F56PPKuo6JBZ40HL8pnxYJGo=
X-Google-Smtp-Source: ABdhPJyYWbj2vu59ipeq1DOiO2ZGMXhW++h4zYbDXc4wzhaStPzNkSZeXq5+IrmuBe/bekfar+3ynrJcFkrDRbTMgaw=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr2569335ejc.482.1611311598881; 
 Fri, 22 Jan 2021 02:33:18 -0800 (PST)
MIME-Version: 1.0
References: <20210121121629.530506-1-cohuck@redhat.com>
In-Reply-To: <20210121121629.530506-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 10:33:07 +0000
Message-ID: <CAFEAcA_kFLaRWzFh1adCvNhxhj+-Xpu0OppcEGhPpRe---dmQQ@mail.gmail.com>
Subject: Re: [PULL 0/9] s390x updates
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Jan 2021 at 12:16, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit 954b83f13236d21b4116b93a726ea36b5dc2d303:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2021-01-20' into staging (2021-01-20 17:44:31 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/cohuck/qemu.git tags/s390x-20210121
>
> for you to fetch changes up to e6a80232f4087e8c7ec253f573319f69165b859d:
>
>   s390x: Use strpadcpy for copying vm name (2021-01-21 11:19:45 +0100)
>
> ----------------------------------------------------------------
> s390x updates:
> - headers update to Linux 5.11-rc2
> - fix tcg emulation for some instructions that are generated by
>   clang Linux kernel builds
> - vfio-ccw: wire up the device unplug notification mechanism
> - fix a gcc 11 warning
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

