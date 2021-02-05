Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616F3310E49
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:05:31 +0100 (CET)
Received: from localhost ([::1]:39884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84Xy-0002YT-Dx
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84G1-0001eS-Sp
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:46:57 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Fu-0006bJ-5V
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:46:57 -0500
Received: by mail-ej1-x633.google.com with SMTP id hs11so12988941ejc.1
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 08:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/GUOa9TLWwFZiZdOV40WO2QvwihoLLSzcoArnduH/Y=;
 b=yMsGNI7THrDogr7avD3fWikv/mNWc2pPbvh48AiV3Jnh/VXiBmpONGiVsLeiyHDk3d
 zPxW4FGtykizGqnNcKbNADplK/goCUTgAuJm3R/a8BvDhD2gMDtU6ieg750/H1lnOES1
 RXCmjEQXfH6tY4YmCo98z/kkqDu2RDMo6Qcemvj6q2KUKUaGnao1/dVYUNwh7Z62GlhJ
 NyiRq9+UHsLlDbmRXOeNpKjDangiswykPj1mw7Tb5sojjwHmgR2ocduiHM6GtMUPu9fY
 D22V7KiivNT8BfzYlfhL4nZ1ya0oSX7k9PwugapsZQwkQVhIOPnpVZOM6ZCkFo17hecY
 Nozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/GUOa9TLWwFZiZdOV40WO2QvwihoLLSzcoArnduH/Y=;
 b=L9BlL/b2n2HJcFcW/pcQns7HQmBafzQWtWRGnRifqA+aw/27fuGVS7lfqnAJ5iOngE
 vxoF11/zhNFgBNn7MNLTb0ALAaOkQ3nWN7UlHz0xmRCiPRFrgmjiARJmU1XyfQTiysCF
 Dv3hhkzvtSCrynpHlSLZMcrMWepzfZpAw1PKIqnYHoyKLujZyJdOR1hDAgBur5ceMPxt
 dR2sIzBPziwvMouus/RO58JOZXG069us3EN5deeOQAFug73dkdwwL/+qdOzuYWq0ajeU
 i9QToMqFGPYvWM7YGvBYlC1le6CDjycylAAeVnS+B+uin1/QMG8dcCTpGphzZSzNs/X5
 K+Uw==
X-Gm-Message-State: AOAM532eGO/RLXwxXA+xUdfsDxTMKqc7f+WLIZ9g9iHHxL6xT4XlWY3l
 P5OQJEbCOqOtKKqYzbYckMSJLORKmOiPvB4mtVDEtg==
X-Google-Smtp-Source: ABdhPJydebCl1jTKMPKS2VlB0VpWGiddOcOOE2S7WJyFDWF2Wx/qOsjpLEorVUIDaIn7LaIFHqws/4ipc/Qz1aAGf1s=
X-Received: by 2002:a17:906:3a89:: with SMTP id y9mr4811064ejd.4.1612543604411; 
 Fri, 05 Feb 2021 08:46:44 -0800 (PST)
MIME-Version: 1.0
References: <20210205150135.94643-1-mst@redhat.com>
In-Reply-To: <20210205150135.94643-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 16:46:33 +0000
Message-ID: <CAFEAcA9JzsZSz9UV2giE8ZNKnnhgaf_TZLpCV1TLsEuJw3LiNg@mail.gmail.com>
Subject: Re: [PULL v2 00/16] pc,virtio,pci: fixes, features,code removal
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Fri, 5 Feb 2021 at 15:03, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> changes from v1:
>     - fix build warning on latest gcc
>     - add rom size feature
>     - more bugfixes
>
> The following changes since commit 923abdb4bdfb6d93bfe6c941ead70f3ea6707e40:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/vga-ui-20210205-pull-request' into staging (2021-02-05 10:09:16 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 277a582bf88a3058fa094e078a5310a2deb37da6:
>
>   tests/acpi: disallow updates for expected data files (2021-02-05 08:52:59 -0500)
>
> ----------------------------------------------------------------
> pc,virtio,pci: fixes, features,code removal
>
> Fixes all over the place.
> Ability to control ACPI OEM ID's.
> Ability to control rom BAR size.
> Removal of deprecated pc machine types.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

