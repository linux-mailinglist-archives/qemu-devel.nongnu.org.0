Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CB13B7518
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:21:12 +0200 (CEST)
Received: from localhost ([::1]:44228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyFXz-0005Av-0a
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyFW9-0003ZF-OT
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:19:17 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyFW7-0007uB-4R
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:19:17 -0400
Received: by mail-ed1-x52f.google.com with SMTP id i5so31866472eds.1
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LJonbArQa50gGC82Hc+0edn9vuAO1fy5ZJ1Y75mN5A0=;
 b=zL5Dz49KQQKst9gBagyKlEFvFhDRVWNDXKqUjxuIMIDnqkczGX440iKsuH97h5ZLgo
 S2tiK+jmdeGweTFcEx6SVvEzPXvz41o29tW5XAgfKGL7wxLwSdo81tvAJgolr+5l/aEe
 klKlO1cs6Y9KUh3k2/fjGXoaW0bHqyA2BGTidaZNUa9gY3u8kp+AF0aS0ND+BFWWy7VJ
 qgwc9zOs4ZAMDfiz+zNs9Yx9yicACfuXpeKXwAfycbL1IV+KhCf4Cln8HBZhVpMehmgO
 8tVMqqTGeEEZ9r86KbUz89WYyqFw75VRq+jLmaO5xRtMzDbtQYagLGsp+PzL+xAGe8qC
 OvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LJonbArQa50gGC82Hc+0edn9vuAO1fy5ZJ1Y75mN5A0=;
 b=HGClFkjB50SMbdMWzFWi9Jl/bnrFajn/O76MmoNxa5lP8QPRVV1SmGA+V62VAoRCMA
 oh98gL2LP3PhTmnDmLiBzSErFqRgi52Nygnt9jxNydTu5gsImiYGSwKXtNs8kRmd425g
 YvWhp1CXc70KyTYyqvQTPWQXeFNNCoOlC3ZlcYBrpsWBJlYtYzoXZrDdVIIncFjhRunJ
 yvwh6asVg+szg1PKLU8cErlALAKmPDwB6N6GASXSbp5dNnG0WBdP61JQHrsoPmXmFoUJ
 5lUqqN4ZhBOy9n9fVlO32BjsWU+uYmJbmnWSG09m+tMPnLtSn8Wkt4KS7/s6i4BI0ixG
 hTBw==
X-Gm-Message-State: AOAM532DDiuZ1ECJNra31IerZXl+8wwU0KyfUOxm0aGCZ370LU1gFBYX
 dsQI+iCUqBTSfEpfiFiceozPq5ZUmuWkUItaUO6jsw==
X-Google-Smtp-Source: ABdhPJzGZZbuyY/QzyGNVAlSvQCSteXTEWIDn/JL+l4LNiVJhfb1s1EaR5Had7rzXixSFwxrHw6gEs2sYJunk2sgDWc=
X-Received: by 2002:a05:6402:759:: with SMTP id
 p25mr41455335edy.146.1624979953478; 
 Tue, 29 Jun 2021 08:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210619091342.3660495-1-f4bug@amsat.org>
 <20210619091342.3660495-3-f4bug@amsat.org>
In-Reply-To: <20210619091342.3660495-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 16:18:36 +0100
Message-ID: <CAFEAcA80d-W_S0mS93XinAC-OL8D=VDJn_uPVJcYTWY=aWYetQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] coverity-scan: Add 'sysemu' component
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 19 Jun 2021 at 10:13, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Issues related to system emulation currently appear under the 'tcg'
> component. We commonly refer to system emulation as 'sysemu', so
> add it as a new Coverity component to cover files that have nothing
> to do with TCG.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  scripts/coverity-scan/COMPONENTS.md | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/=
COMPONENTS.md
> index 183f26a32c9..7ed3f0a0077 100644
> --- a/scripts/coverity-scan/COMPONENTS.md
> +++ b/scripts/coverity-scan/COMPONENTS.md
> @@ -115,7 +115,7 @@ slirp
>    ~ (/qemu)?(/.*slirp.*)
>
>  tcg
> -  ~ (/qemu)?(/accel/tcg/.*|/replay/.*|/(.*/)?softmmu.*)
> +  ~ (/qemu)?(/accel/tcg/.*|/replay/.*|tcg/*\.?)

Makes sense not to call softmmu/ part of "TCG"...

>
>  trace
>    ~ (/qemu)?(/.*trace.*\.[ch])
> @@ -129,6 +129,9 @@ usb
>  user
>    ~ (/qemu)?(/linux-user/.*|/bsd-user/.*|/user-exec\.c|/thunk\.c|/includ=
e/exec/user/.*)
>
> +sysemu
> +  ~ (/qemu)?(/softmmu/.*|/accel/(hvf|kvm)/.*)
> +

...but maybe we should have a component for each accelerator
instead of lumping hvf and kvm under here ? We already have
components for xen and tcg.

>  util
>    ~ (/qemu)?(/util/.*|/include/qemu/.*)
>
> --
> 2.31.1

thanks
-- PMM

