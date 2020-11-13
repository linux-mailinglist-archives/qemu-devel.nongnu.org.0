Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C9E2B1B32
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 13:35:13 +0100 (CET)
Received: from localhost ([::1]:60132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdYIK-0002KB-Sh
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 07:35:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdYGw-0001R7-Lc
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 07:33:46 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:44830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdYGt-0003VT-C5
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 07:33:46 -0500
Received: by mail-ed1-x52e.google.com with SMTP id l5so10483370edq.11
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 04:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ez31ZkGUnFI7+izhSCRk6nNRDru2kkeBN5papS0Bwdc=;
 b=Tj8sZgK5vWcCIEHO6cr4wspylIMq4UAsGR7Jr8W+oWS9CUCWyudhuKmwJTbGhm4EiW
 Z/bqBg/eNkU8tbVuy/QlbXcItZVs8Dq+Yt6WAYMrDYmU2OIwLGXsu5r38F2jwTE3jHjC
 iFtnRV+oyF6ZPGfTcxzXUotZ1wrpx3Mzhq7wXGpsPUm/QJ/UTOcyE5PeU5//O1OnxwKk
 G6sJSxjgD+bpNph4TS6Ttr76GlZNpNtKTNV27awWYC94lTsJtGG7DK3NrLKmaPbabdiM
 zqeyNXnE2Yy/TKc57LGBoePX0cmBo1MTZx2IKeCr+pqhCnny2gXLCX7Emzmw7GU+HbbY
 eXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ez31ZkGUnFI7+izhSCRk6nNRDru2kkeBN5papS0Bwdc=;
 b=KXvRQfU0ZTDsp/zgBQ+vCwZljE6xwRDpLQ/xByypcZiTF4V3tEaPQxqALqpISqUPj7
 97gLGuWg++8PzCGhyo1+i4uXUF4STCNukeRBCLI+eD3Ohy8wckR7RfOjDQ91R4lEMAFF
 XwueXldqMYA5ty0iZ8TfjPaYQtbrc1IOzTEoBgBFPPernnef9lPQOz30KdrNL2hBYXw6
 CANQJrZRm3N4TZgWEGkB5KJfRxiSr5m0b/OB626F9flkHxiSAYAPooC+T9Dn1LhNA9Z4
 W9gBuuFJDiowPx5h4cVrQVSs2mzTffabKsfki9IAECSAXlS1dQL7e84erqumM4YbC58y
 pt9w==
X-Gm-Message-State: AOAM531Sy8pY1+dnxmenHXYSfxyGAq7Mndh4lQ+uDNrxKhkPNH4vOOEN
 EE2DXbs2i8lBmZDJk7NGAqQ7FVyqJzOaeuBgUhfURg==
X-Google-Smtp-Source: ABdhPJzZap6J/YzldlNiUTBQoJy4+pr9dFvxMEQO27VtQqLFCA4fHY0rvFNFByIrm7EO4lJc0HV49QeEj5eMh+E1QFk=
X-Received: by 2002:a50:fa92:: with SMTP id w18mr2196051edr.44.1605270821807; 
 Fri, 13 Nov 2020 04:33:41 -0800 (PST)
MIME-Version: 1.0
References: <20201113044044.782249-1-richard.henderson@linaro.org>
In-Reply-To: <20201113044044.782249-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2020 12:33:30 +0000
Message-ID: <CAFEAcA_1swMB7vbo3PEcdwmk5wQ7cTBx==4Jdk4cG3hwE1CG4A@mail.gmail.com>
Subject: Re: [PULL for-5.2 0/1] MAINTAINERS: Replace my twiddle.net address
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Fri, 13 Nov 2020 at 04:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit cb5d19e8294486551c422759260883ed290226d9:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-macppc-20201112' into staging (2020-11-12 11:33:26 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/rth7680/qemu.git tags/pull-tcg-20201112
>
> for you to fetch changes up to 336f744e148a7b9d50ebf205d5dba7b0fec271d9:
>
>   MAINTAINERS: Replace my twiddle.net address (2020-11-12 20:35:43 -0800)
>
> ----------------------------------------------------------------
> Use richard.henderson@linaro.org in MAINTAINERS


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

