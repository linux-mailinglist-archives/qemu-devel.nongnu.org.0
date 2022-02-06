Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597CD4AB125
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 19:04:41 +0100 (CET)
Received: from localhost ([::1]:54744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGltv-0006mi-WD
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 13:04:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGls7-0005lw-0o
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 13:02:47 -0500
Received: from [2a00:1450:4864:20::430] (port=33674
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGls5-0001YP-CU
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 13:02:46 -0500
Received: by mail-wr1-x430.google.com with SMTP id e3so7103139wra.0
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 10:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C03QgUPJxzj4cRko9adPM3AY/Vzd6bs/VEroHJGjxpI=;
 b=USXvl4Ba7j934wpROmaMfmzMpSytw/z0AlQA+v2yWC9DOIWAwFTOLpomtBo7GsBcRZ
 aYzgozE1AXUhoO/1KG/EEodDlLQ6RBv6K7fPel9zWRRGYU4Bth5X/Z29wHfyNmKHrmPc
 zpq8wTkHhrkcVCTDhxblSggeWI1DU4EoDBZCc4kBRiENPF8rbvQXJzbSbm3tysTHWmwv
 DKKhGqgSRxKLHoDsinleaIrunTjzsQvO0J2LhAXAFBEUBuMXr9zY1R4pmDF9oh+p+ipz
 ZRPhIfk0gttsYZNPXP9ol29n+Qcrd46rF7JxsCMkW8v7gtVw6Z1pc5z3pLv84VHtJdKO
 1IDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C03QgUPJxzj4cRko9adPM3AY/Vzd6bs/VEroHJGjxpI=;
 b=wWpCRzvZuCmkNkxDSP6Yf1mTXcG79a1Q2Qkpm5qZEgwT3kOCuxuwh776mqcVhAkHYa
 uct9HxzduorKerfghAaBTC2A+rW5SPuKq63id+z3NDzblqB5oxQEyR4Rmf1/QVVLQxmA
 s+D7q4UHWLRNJTeH3vCf/JTww9InLO70NImzUOVB6BZIVaArC0WBsKNLlvnM35PievMr
 p/QfP3eYEo2rK1nK/ZDIOPYvrkm8MkhKBOqTZjBO51OXDTEptojJDRH5RR2FLELftt3A
 aBKyIo9BqmFwk8HsjllhcxGRAlMwGwINpJ2eVXHG8/cLRP3qeunz6f+FHiLsfPMRYf4p
 idHg==
X-Gm-Message-State: AOAM530aZofn/9gIeKQID9feacXQXTcvi/0V1GFbqXs8Eko3Vl2/MgiM
 gA51+5U9HDL9PwMW0/vyPNtvTG1VRQp4GxtDw3Fipw==
X-Google-Smtp-Source: ABdhPJw4E9NxqBsldJa3nwvXRqr0D9F/7KYscLVe4XPF0EB893l/oenYvwKlCiggZd4gRwyDJJ5aJCPyIll0zF1JlzI=
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr7239975wry.319.1644170563342; 
 Sun, 06 Feb 2022 10:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20220206093702.1282676-1-mst@redhat.com>
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 6 Feb 2022 18:02:32 +0000
Message-ID: <CAFEAcA_z+JsFdjVLg+MCRFPEh8e1ZmCjSngz4ZJsE6CRv=kvnQ@mail.gmail.com>
Subject: Re: [PULL v2 00/24] virtio,pc: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On Sun, 6 Feb 2022 at 09:37, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> Changes from v1:
> erst patch fixups
> virtio introspection patches dropped
>
> The following changes since commit 8f3e5ce773c62bb5c4a847f3a9a5c98bbb3b359f:
>
>   Merge remote-tracking branch 'remotes/hdeller/tags/hppa-updates-pull-request' into staging (2022-02-02 19:54:30 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to dd4fc6058557cd2a9e23a37da44d054f724ca3e8:
>
>   util/oslib-posix: Fix missing unlock in the error path of os_mem_prealloc() (2022-02-06 04:33:50 -0500)
>
> ----------------------------------------------------------------
> virtio,pc: features, cleanups, fixes
>
> Part of ACPI ERST support
> fixes, cleanups
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

