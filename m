Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687934E3C50
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 11:19:39 +0100 (CET)
Received: from localhost ([::1]:39084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbc2-0004h3-H5
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 06:19:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWbaN-0002wJ-Pr
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:17:55 -0400
Received: from [2607:f8b0:4864:20::1129] (port=38485
 helo=mail-yw1-x1129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWbaL-0006js-6D
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:17:54 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2e592e700acso184827537b3.5
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 03:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O2HNh41q8davH3Me0DfSKmo2HiyD6SERaytlfmzNRwY=;
 b=tgm/DcjWelKUYtZYCnpcCoTdY4TH6sZEe7nGe7YwIXHz6Y9OSDiL335CEcFthTYySm
 pcOrEwJ385j5gZuagLbd2f1XrPXOcyIpQsdD9QbX581jEufWTeuiV4uEKGUxW/MHcXaP
 TjClaXntiMV3399/coegSUmYEAcXzOhyWPrVKKC6b9mRUMhzCdnLJ9jj4d24xIwEVJVf
 bV2Xt0nCt/H86S+cole0no14Buo+DRfc7D4aZVjqpgTDh5bmJLGc0VWciE/Zyi5r38zB
 2/rO4xpKbTBi+IxfXLDIPhC3RhT2Y7cVD/j7zkrssE3MiC1nqBS/jG5ktD0ajxTl5wkI
 AEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O2HNh41q8davH3Me0DfSKmo2HiyD6SERaytlfmzNRwY=;
 b=4rDAHXJYLcrBR9ZUltP2XD8Jc+aVtQiN+p7B3jQ7QGpPEo8fZNxmbrwAoc+H+h9cNc
 4oucYfAg1mtDv2DzsMNQBNdjCzHeRNPX9UxNiDGZoX9c+MAyySXrB/L1A3IuW0DwxfeM
 /BJnbuTe2QVAGslP6+fTdThL0oI5sOTaN6ib3F/rPnTcXbv7F5SEJECdJ0857VkAWvmc
 zm0p42iw+ajtRdEuzfBLgb0LYfAvcCH0JQ9bGrpEcGc3/f1tr0xn5wcRkmQyFmBYmYEK
 FuZ54TEnAq+uNtvre8t2HkHs3l7pL9N+ND/mTbuqKdFl04+nC6e+3u8612/efk3bjHW8
 pclw==
X-Gm-Message-State: AOAM530bXIVQAiSa1I/EJJ40qp2S0uflXq/2ZSiNOrBon8V7zoAf2itx
 B92guzUbwI4McpGUkbQv5hau6d9fXNb5VdPByP+OFDCKghn3eQ==
X-Google-Smtp-Source: ABdhPJyfRlQgdPDE0tl7Xpw94ZKduckd+inCnPyLJTbfyV9f+si5yh59y3Am3aQRaXUiJ0xTB/cpE12G7vyCbn5NiiE=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr29143746ywf.469.1647944272136; Tue, 22
 Mar 2022 03:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220321164502.201160-1-pbonzini@redhat.com>
In-Reply-To: <20220321164502.201160-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Mar 2022 10:17:39 +0000
Message-ID: <CAFEAcA8Zjio6e1qVA6T_eMcBM2pyVphiqhc6vjCAcr8UL43D=A@mail.gmail.com>
Subject: Re: [PULL 0/2] Bugfixes for QEMU 7.0-rc1
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Mar 2022 at 16:48, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit e2fb7d8aa218256793df99571d16f92074258447:
>
>   Merge tag 'dbus-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-03-15 16:28:50 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 17e6ffa6a5d2674cb2ebfd967d28b1048261d977:
>
>   hw/i386/amd_iommu: Fix maybe-uninitialized error with GCC 12 (2022-03-21 15:57:47 +0100)
>
> ----------------------------------------------------------------
> Bugfixes.
>
> ----------------------------------------------------------------
> Paolo Bonzini (2):
>       target/i386: kvm: do not access uninitialized variable on older kernels
>       hw/i386/amd_iommu: Fix maybe-uninitialized error with GCC 12


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

