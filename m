Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D711C471E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 21:36:48 +0200 (CEST)
Received: from localhost ([::1]:53250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVgtT-0000jr-EI
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 15:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVgsi-0000CR-GC
 for qemu-devel@nongnu.org; Mon, 04 May 2020 15:36:00 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVgsg-0004HF-4d
 for qemu-devel@nongnu.org; Mon, 04 May 2020 15:35:59 -0400
Received: by mail-ot1-x341.google.com with SMTP id i27so9960770ota.7
 for <qemu-devel@nongnu.org>; Mon, 04 May 2020 12:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0UORFelBMexE2azhcMjpjSrXLvcgyC1tcAG30ql6g2Q=;
 b=SMGTjNo9mbJgMnWYrATtkk9afCrRkpM85WxsbvECPY9+DBsg9EUYF/Bx0MeYtdecNC
 mBTqRJ25mxjjs1GZfpguSSok73LKtfSeSe98zTrcNHuu4YEdKV4iuqxtlgDJhk4HW0bN
 PyTxMNxRKhRzxDpCsNC2pE+7wBinOc3s8KypaIllo8rVShdKqoyOtPZLc5WeUhmdcymv
 sgaaJgNrFrADader6nha6jD3BiZCCPshrPfah6GI3XJnRseP0kgvqakgEBpciAbr9dvK
 fuTS1gGPyhQicu2xtngUnO8NnrZRVS3a6zOtvVvjsMhYfy8QE+ZWgBHpD1a7UodQ7T3G
 cKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0UORFelBMexE2azhcMjpjSrXLvcgyC1tcAG30ql6g2Q=;
 b=SnVQ15JflQLbqdYph3hbQJYCg+SEqx+KR20nisCrnlyR590S/QB50E3h/nHVNN9pt5
 rfJM4K7eva9/KmvcoiqM+A8xXWYiHn5J6zyLKBdcBEMJ1nqCZa4J7On5uLt4aniJLpof
 tODvg8zd1G0GuDe/3mf2gYmTJWvPk22lSc/3kD4dbGUD1Ga2tTZmJ3/cLV8iiuAT3ouJ
 1NXtGuosoEgSLBW2VwEEAY24L2XN0w3mc94/kKjjbXYF7AlTaqicq6AZuwGdAG2Tef7N
 O4VmysJuV9gRNn/5PAUnkP9a4hlBarx7a4xPTmio0nLEuSEy9t5wqHA22s2zib4IPVzl
 6DnQ==
X-Gm-Message-State: AGi0Pua3OZkSaRTy0AGvmufKqX2gYCVARqIyaaxZJqQ10x3x+omOVuQq
 FcNlFl8LRKsB7kZzsZ8SFIGtz4+0wqydUGWhqWDvdg==
X-Google-Smtp-Source: APiQypKYp6iNboB3iKBWPRT7yZYyedfhmQ1F0aNvNYQJHP8B3PFyWSxRyJEZ9lbL7Lcdc/zJurUOjyPJUy1533q973o=
X-Received: by 2002:a9d:2c08:: with SMTP id f8mr15832220otb.135.1588620956526; 
 Mon, 04 May 2020 12:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200504142814.157589-1-mst@redhat.com>
In-Reply-To: <20200504142814.157589-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 May 2020 20:35:45 +0100
Message-ID: <CAFEAcA8VTz1P9kd2BD6H546umduqnMdXC8G35LSyjzshxWb2Gg@mail.gmail.com>
Subject: Re: [PULL 00/29] virtio,acpi,pci,pc: backlog from pre-5.0
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On Mon, 4 May 2020 at 15:29, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 9af638cc1f665712522608c5d6b8c03d8fa67666:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200504' into staging (2020-05-04 13:37:17 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to d8a05995bd64117bf5219d3ba7956277e608e3ca:
>
>   hw/i386: Make vmmouse helpers static (2020-05-04 10:25:03 -0400)
>
> ----------------------------------------------------------------
> virtio,acpi,pci,pc: backlog from pre-5.0
>
> Mostly fixes, cleanups, but also new features for arm/virt and pc acpi.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

