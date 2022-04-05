Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7E44F3300
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 15:03:30 +0200 (CEST)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbiqG-0007wD-Og
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 09:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbioz-00079F-Go
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:02:09 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:33034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbiox-0003Jp-Om
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:02:09 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2eba37104a2so5995667b3.0
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 06:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=+9s7VmziGXP0t7zJfnMumSSsx5MemUN1FZQ+GjMnWLk=;
 b=Ddn9fdAO9daGlZlhRGBabmL/G5CS0qnv3Y2v545dUq4AIH7HTFPIdvwL+0s4Qq+EFg
 TPcWb0DQHrGU13t51d6FhRXa0k2fnr5ftfyUhPUQ7flZ/KEK7qwq3bUVfh0Z3+EBLMK8
 xSP1kTW8xmupmk+y2MkW/hRL+j1fdl+UIGqFYmMd/sIk3N/+eKqnzvOwMdcXVpARGRes
 5x002ljT4wJGrQCCSwox7EB31/GS+MFG3aaOua7ySj2LNtNV1/551rdikz8Bbo5bTf+z
 u0FfzkIg7xY2gdGvGfCaLoahOyDjCP2K7SJEFPhx0mx+J8ANVOKeyG86fBkE0zegrrPy
 EdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=+9s7VmziGXP0t7zJfnMumSSsx5MemUN1FZQ+GjMnWLk=;
 b=k6l8J8EFnHyuHZaDk114rgL0n+bI3UYW7jF/uc2tAaiUfETIEY46L2AVpoY1X3cfj1
 QdnI75e0cUwyYdMuQo1fLONoa+lxRQeaitqW/MUwhIBxnnzHrRXEYS1uJX4nXAOD6tdP
 HfICyAzb5Mx/YCotLbetkhjTn6YF0bJ99tWa2lWXbuimj/U8dck2nvrIub2xSNC+GkIV
 EoxSt2qM8ROrPrqX7N4c1bMYZm4DaItnequzlgCOXGyFuZHbBGeQW+6nWPSLpcJATlji
 7d0leNM1gCLkoCBWZ19GjekbnU/rany1hpwK9fL9cjjcYznbUcsllaUlgXcYS1dgYagR
 2hIQ==
X-Gm-Message-State: AOAM531pdfuQ/w78PA7RNhTS9uAxCgBgCbc3keYAAql4vE9K3taJ6Lmh
 Wu+YC4Wc2Gu1LAgBjDxozCujiRbrBbHws2g/V0fVI23lMC4=
X-Google-Smtp-Source: ABdhPJzfCrYRzaOcmwX1a0P1AgyEWIFckIgBfm9jwiAmvmlno5Ct8/m7QapNfX4vsQ3wsqvq9iFfcoR76hp7B64+Gvk=
X-Received: by 2002:a0d:e684:0:b0:2ea:7c43:3081 with SMTP id
 p126-20020a0de684000000b002ea7c433081mr2434067ywe.64.1649163718689; Tue, 05
 Apr 2022 06:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220405092651.725041-1-peter.maydell@linaro.org>
In-Reply-To: <20220405092651.725041-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Apr 2022 14:01:47 +0100
Message-ID: <CAFEAcA9T+Rx3CM684MsMVB7WKCNADniaLmva8NJtbgqdE5Q1oQ@mail.gmail.com>
Subject: Re: [PULL 0/2] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Apr 2022 at 10:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Couple of trivial fixes for rc3...
>
> The following changes since commit 20661b75ea6093f5e59079d00a778a972d6732c5:
>
>   Merge tag 'pull-ppc-20220404' of https://github.com/legoater/qemu into staging (2022-04-04 15:48:55 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220405
>
> for you to fetch changes up to 80b952bb694a90f7e530d407b01066894e64a443:
>
>   docs/system/devices/can.rst: correct links to CTU CAN FD IP core documentation. (2022-04-05 09:29:28 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * docs/system/devices/can.rst: correct links to CTU CAN FD IP core documentation.
>  * xlnx-bbram: hw/nvram: Fix uninitialized Error *
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

