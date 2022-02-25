Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232774C4762
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 15:26:01 +0100 (CET)
Received: from localhost ([::1]:57352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNbXj-0007Wx-VG
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 09:25:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNb1x-0005CT-Pc
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 08:53:10 -0500
Received: from [2607:f8b0:4864:20::1131] (port=46255
 helo=mail-yw1-x1131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNb1t-0004KQ-7u
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 08:53:09 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2d07c4a0d06so33772367b3.13
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 05:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eZLiM7xFqiwz66voI0PGvAb7BXko28vheKdrACB/Aio=;
 b=qYhyH1idvUSujH6IiTAoIrVXPuGGolM9RFrWxPsC6Zr9Qw/PUOzDS0QsHNEqG7kVSU
 OUmBtBR2HdkrGOszbwXA2Se08xnfE8J0ECa0kkj6fspc/b12B/ssATjovMJxPvQvnAgJ
 tWFulpyFQEcZ2s+8mODihUXG5fBQWCcTCuThmcdwJKiuVhkZ9S6cBTuE7dCj2R/sFRWV
 c4Lkmab/ovbOFuyfrMhXErUFMN6xEY6X7pRv+CSbAyXdLGoBtUU2dbh0buRQcdhUXS+F
 AnO+HH3CidfiCIu9KPMMBJRdUD5RSqoQvxxd3vWcQuGLPDygZv5Dg89ksr2fN3pbTmK8
 YFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eZLiM7xFqiwz66voI0PGvAb7BXko28vheKdrACB/Aio=;
 b=3V0xy4fLFzy8UMTN7yZ47SADg/RWq//jspnOJUMSapijIZdQ7e734Op7VsOGb7uv8n
 2pul6UhIGeL73bFJRcGkeqmceePOyGau8KhHuzLWFtTEMzrUeZbmAMYPE6svOuJnqOGr
 Z+ecK/qqzFAatG7dr7n0UTXMQmR8AmQ6J10B9b8uLS+q6uwOTrppK454Bo8EzfPRS80t
 vmgL768LoZea3TjHl0ZUZK0Y3V15P8vs+BdG5LPcPPJ+SyiSVH7gchsZLCCyHbqBdl5R
 FLWkpiq8ICiV281copgi59EuRfXjpxAiSd0Up10ZLnKRyt5Eh1TL9s6LbCRNdzp9QFyf
 tFNA==
X-Gm-Message-State: AOAM530KhQzfj3XkRgDZJeO+6gDQRNf7lRWtOFVIZFEJhli8xcdNpZRf
 5WaJYqX35D/uAeQW/o+qFXhlhKg1d7fD73uPOMO9fg==
X-Google-Smtp-Source: ABdhPJyjtTy6ar5lVIZ62bffUpNvj4bJ3J9ovex9AZbUlN+J16OXZS9FADThjk7DcybOcMaigecAOj0SJ3gi8rdKPmI=
X-Received: by 2002:a0d:d5c8:0:b0:2d5:e0a:56c0 with SMTP id
 x191-20020a0dd5c8000000b002d50e0a56c0mr7472973ywd.10.1645797183969; Fri, 25
 Feb 2022 05:53:03 -0800 (PST)
MIME-Version: 1.0
References: <20220225083222.1174517-1-shorne@gmail.com>
In-Reply-To: <20220225083222.1174517-1-shorne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 13:52:52 +0000
Message-ID: <CAFEAcA-YSBDpS5+nfJxqAJ6fjHheLO=jOnH=+WFXsDPo6Y=J=g@mail.gmail.com>
Subject: Re: [PULL 0/6] OpenRISC DTS Generation patches for 7.0
To: Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Development <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Feb 2022 at 09:19, Stafford Horne <shorne@gmail.com> wrote:
>
> The following changes since commit 4aa2e497a98bafe962e72997f67a369e4b52d9c1:
>
>   Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-next-pull-request' into staging (2022-02-23 09:25:05 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/stffrdhrn/qemu.git tags/or1k-pull-request
>
> for you to fetch changes up to 94c71f14e9ca15ede4172e0826d690b15069a7f8:
>
>   hw/openrisc/openrisc_sim: Add support for initrd loading (2022-02-25 15:42:23 +0900)
>
> ----------------------------------------------------------------
> OpenRISC patches
>
>  - Add automatic DTS generation to openrisc_sim
>
> ----------------------------------------------------------------
> Stafford Horne (6):
>       hw/openrisc/openrisc_sim: Create machine state for or1ksim
>       hw/openrisc/openrisc_sim: Parameterize initialization
>       hw/openrisc/openrisc_sim: Use IRQ splitter when connecting UART
>       hw/openrisc/openrisc_sim: Increase max_cpus to 4
>       hw/openrisc/openrisc_sim: Add automatic device tree generation
>       hw/openrisc/openrisc_sim: Add support for initrd loading

Hi; this fails to build on various CI configs, eg:
https://gitlab.com/qemu-project/qemu/-/jobs/2137393314
https://gitlab.com/qemu-project/qemu/-/jobs/2137393335

../hw/openrisc/openrisc_sim.c:40:10: fatal error: libfdt.h: No such
file or directory
40 | #include <libfdt.h>
| ^~~~~~~~~~


This happens because meson doesn't put the include path for libfdt
on the include path for every .c file -- you have to do something
special in the meson.build file for the files that include it.
Paolo can tell you what that is, I expect.

Paolo: are we going to be able to stop doing this at some point
and get meson to just DTRT and put includes on the path for
every C file ?

thanks
-- PMM

