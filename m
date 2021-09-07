Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D411402CD7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 18:29:59 +0200 (CEST)
Received: from localhost ([::1]:33300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNdyw-0000SL-D7
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 12:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNdy2-0008BZ-TR
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:29:02 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:34617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNdy1-00036V-4O
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:29:02 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so2149252wmh.1
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 09:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8/7wMXmBl+ybFbrDz9qrNVbCuFZacWPTKVoP8VdiOtU=;
 b=iIo9hFeUKryucVgmj3W1CEe4zGNZs/4aOJDHl3sRsqPfv+VzuEwL6RP+qt5KT7ZSnw
 9bvUz8YdCf7J4ILwpHFKLbCObdEC+ndLb1b1aWeCjOnpPVSRSR57M5HIzwJTmfq0XNpk
 LkX2Lr6NtNeJSwatRCfarMCq+YmnainwGcTHqI1r+ifdzNR1lATjHp/jnedu5HzAXyNI
 d4sz1r7Bois1N5xMUC/KO/UCcdhlRmfUtnJ9uL2gAGOahXWT8ZIUdYj4/NDdLX2lrDEK
 D6NAcTRPapXyBEBXPmiC3mKUC1gPyt7UvoTz/SUemaFXrb5KEJHqySHkeTb/894vEKxw
 tPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8/7wMXmBl+ybFbrDz9qrNVbCuFZacWPTKVoP8VdiOtU=;
 b=gg5uFBo+HHGJra9+M8J8eD5uBQrUEF/2hwOMbcgYjOl/vOXcReGMkY0U3ikFuKYcgx
 6RjUciwNfwGudciieLB1cAJkRN8/IMjhPH0EPP/lvyEWJDTb90Xki6kb+z+9cyDrCawB
 1NUILoVtPTBkEQ6A7TtEHH1kML2xGZvdyLQaMZLwW0wwLBLMeB6HH8YDJyhugLcTAcQj
 Kqyb5Fx+pyo7Frq0UZGXNJqjz/CR8nEeGOHRcimOX6Wbx+bD28Odh6Z3OYYkBuskNVXK
 EtU6gZYeYFLFgNPUnmAnGOp3nPIjSzEo9f3MGqPbWhluwjwv97B+shOMnidih/gXWBfA
 sZVw==
X-Gm-Message-State: AOAM531+8y1/Q+OpjtG0guYyjfbFFHcPQsRw1N0fJq8K5lWf2iGGfMfZ
 Xjo13UMwdWm5BNe6hp6kzMXxNXwusqrlmG8HY8Lb6A==
X-Google-Smtp-Source: ABdhPJwzgL9EvSH3XV7Z5v6Mytq0RQhCAPlGvRh7dePyA5HENlKMZzym7rTqhqlws/Z+zOIiIMVXn8WxCNMojGI7n68=
X-Received: by 2002:a05:600c:4f46:: with SMTP id
 m6mr4876505wmq.133.1631032139653; 
 Tue, 07 Sep 2021 09:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210907155641.197844-1-pbonzini@redhat.com>
 <20210907155641.197844-6-pbonzini@redhat.com>
In-Reply-To: <20210907155641.197844-6-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 17:28:10 +0100
Message-ID: <CAFEAcA9C0+ADP+FBoBSeuk9e8Gr22vKXAvHLM=gtbf=JQsieBQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] docs/system: move SGX documentation within the system
 docs
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

On Tue, 7 Sept 2021 at 16:56, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Convert to reStructuredText, and adopt the standard === --- ~~~ headings
> suggested for example by Linux.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/{intel-sgx.txt => system/i386/sgx.rst} | 70 ++++++++++-----------
>  docs/system/target-i386.rst                 |  1 +
>  2 files changed, 35 insertions(+), 36 deletions(-)
>  rename docs/{intel-sgx.txt => system/i386/sgx.rst} (83%)

>  Due to its myriad dependencies, SGX is currently not listed as supported
>  in any of Qemu's built-in CPU configuration. To expose SGX (and SGX Launch
> @@ -86,9 +85,9 @@ All SGX sub-features enumerated through CPUID, e.g. SGX2, MISCSELECT,
>  ATTRIBUTES, etc... can be restricted via CPUID flags. Be aware that enforcing
>  restriction of MISCSELECT, ATTRIBUTES and XFRM requires intercepting ECREATE,
>  i.e. may marginally reduce SGX performance in the guest. All SGX sub-features
> -controlled via -cpu are prefixed with "sgx", e.g.:
> +controlled via -cpu are prefixed with "sgx", e.g.::
>
> -$ qemu-system-x86_64 -cpu help | xargs printf "%s\n" | grep sgx
> +  $ qemu-system-x86_64 -cpu help | xargs printf "%s\n" | grep sgx
>    sgx
>    sgx-debug
>    sgx-encls-c

This should probably use a ".. parsed-literal::" block so it can
use the "|qemu_system_x86|" macro.


> -The following Qemu snippet passes through the host CPU (and host physical

Not a conversion issue, but "QEMU" should be capitalized.

> -address width) but restricts access to the provision and EINIT token keys:
> +The following Qemu snippet passes through the host CPU but restricts access to
> +the provision and EINIT token keys::
>
> - -cpu host,host-phys-bits,-sgx-provisionkey,-sgx-tokenkey
> -
> -Note:
> + -cpu host,-sgx-provisionkey,-sgx-tokenkey
>
>  SGX sub-features cannot be emulated, i.e. sub-features that are not present
>  in hardware cannot be forced on via '-cpu'.

'something' isn't valid rST (or at least it's not rST that does anything
sensible for us); if you want monospace that's ''something''.
You should probably check for other uses of single-ticks in the file.

>
>  Virtualize SGX Launch Control
> ------------------------------
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>  Qemu SGX support for Launch Control (LC) is passive, in the sense that it
>  does not actively change the LC configuration.  Qemu SGX provides the user
> @@ -127,41 +124,42 @@ for SGX guest by our design. If host is in locked mode, we can still allow
>  creating VM with SGX.
>
>  Feature Control
> ----------------
> +~~~~~~~~~~~~~~~
>
>  Qemu SGX updates the `etc/msr_feature_control` fw_cfg entry to set the SGX

Backticks? Should probably be '' ... '' .

>  (bit 18) and SGX LC (bit 17) flags based on their respective CPUID support,
>  i.e. existing guest firmware will automatically set SGX and SGX LC accordingly,
>  assuming said firmware supports fw_cfg.msr_feature_control.

Otherwise looks OK.

-- PMM

