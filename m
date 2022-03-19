Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11154DE848
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 15:19:12 +0100 (CET)
Received: from localhost ([::1]:45460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVZvD-0002EN-Bp
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 10:19:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVZsZ-00007w-6A
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 10:16:27 -0400
Received: from [2607:f8b0:4864:20::b2b] (port=33302
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVZsX-0001AY-5H
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 10:16:26 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id j2so20712198ybu.0
 for <qemu-devel@nongnu.org>; Sat, 19 Mar 2022 07:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ytbBi2TbBQwCI4w8GKglO1yCNmq3HuHXxwUmmCPyax4=;
 b=dLmnyeFZRy3QVR0z6VjuQTmxTa/1C1qGImd/dQGJTVkcvZPwdu3bDE20uvvA9Qkk4R
 JBpyixNghMZifdg0Sa9SchdCxafp5rkkVVp8UnpXtGIan3Kx306ua45mjyIHTFprTrX1
 L1kuYrWDb2//fbEzIueFcJIf9q+sBwcJAAQesM2ffDHmZxw9rEl3MvdS+9gc816JUk1Z
 FrxoTtd8ZKAc5iKj8sX7aOT5MCA87YsDWwvoPbkth2BBQ9pqrC1eTqskQL1BleW8CBDo
 WEde7rXtxNAKDvis5EvCbnP/e8Oz6pX08SajHBHMPpEET4x39EtzIzl3Dw8JEpF77lBZ
 N0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ytbBi2TbBQwCI4w8GKglO1yCNmq3HuHXxwUmmCPyax4=;
 b=p6SfZASiNwKGn++rpiOYpfoKE2IZFQFbBFPcC1XURI9ECMgkkcBjqiFudapFQ3AGzk
 4jFTcs6qh51GB95BsYcHy9DN29LRRbmCjPuYrfC3/4418ZfruNlncruz36Ls3GafpssX
 Lv/Jq5U5g0gLRrxMt3kMvkRZQ2hJRFspJSNkV3yYpIl1uE8ZirNQd1uoppbqQygdHU/q
 hOh0LwLgmQVJCIYSnlmy1JKj8dor7Sv4XB1PFaf106ZGKO2LFRqrkfGRix3hL7PfWyVP
 Ylrm1d/15P1NhCJB1W2R0PBLBfColuR3QjW650LlcYQYNcUU6Kn+aJfH/hllNuSXJRwe
 hlHQ==
X-Gm-Message-State: AOAM531u7xsrLNXL4Hp5NX319bE5tPQsiBP/Zl4V8SBvIRjrmKQSMCPw
 wHQcpZl/bXwnGUKyOYopL65AT+nmA6doHtfHMb8q+A==
X-Google-Smtp-Source: ABdhPJyAPk5BCpp3q3bB0sVikzF/oYu5/amgxKYsvP+FHDYoDHHctUm3HUdmsZtYO8jkfdzWKN4manL/O1g4iS6ASlI=
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr14519271ybf.288.1647699383789; Sat, 19
 Mar 2022 07:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220318135634.2851040-1-kraxel@redhat.com>
In-Reply-To: <20220318135634.2851040-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 19 Mar 2022 14:16:11 +0000
Message-ID: <CAFEAcA_=hhO5MZQmzTi+4RCAJ2uO0uPtP8a5i47eRRLOw-fZiQ@mail.gmail.com>
Subject: Re: [PULL 0/6] Fixes 20220318 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Mar 2022 at 14:09, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 1d60bb4b14601e38ed17384277aa4c30c57925d3:
>
>   Merge tag 'pull-request-2022-03-15v2' of https://gitlab.com/thuth/qemu into staging (2022-03-16 10:43:58 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/fixes-20220318-pull-request
>
> for you to fetch changes up to 9eb840a20998a97c0ad0f5ced6ebc7e6a88a4dc4:
>
>   hw/display/vga: Report a proper error when adding a 2nd ISA VGA (2022-03-18 10:15:57 +0100)
>
> ----------------------------------------------------------------
> bugfixes for vga, audio, vnc
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

