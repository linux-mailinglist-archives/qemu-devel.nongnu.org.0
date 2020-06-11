Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DE21F6779
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 14:08:33 +0200 (CEST)
Received: from localhost ([::1]:50494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjM0W-0003h7-E6
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 08:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjLzh-000307-7k
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 08:07:41 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e]:36458)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjLzg-0007m7-1z
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 08:07:40 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id 18so1172196ooy.3
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 05:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tQbxPD6vxxm56LIsg0F00c3Gy9ILe4yzOL7Vdy7GuVQ=;
 b=fxUnLdD0RWNJN95xtwiqCeWt6cLBlHWfHgxclEEJV+njTlvuFSCM/dNBorvdsub+bW
 xuByTqp+ONlkli7pjQa1E3ky5Xth7zaNSR3C85VbYNGNxHLRSlCGqsn1WbwMkYIBiVbN
 tXn+F1Z0lM7GNmDcdWfUgsAIyLhvLgxhtcLmvrmx2WS3D0ScwxZDp7QetCdAjvC8k5fD
 Pyeipkdf6E8yqfPh40QgyD5D2ZyesQtXigbqngdkFLY0ZMRsCOf05gGq3iHP1AtIc9yt
 FVWKM/GQLFRmrv70ZDEmp23Gc1Cnl6nfs8cCP8SAnaYtidlhkhLCLraZGHreeXwlpbHH
 mF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tQbxPD6vxxm56LIsg0F00c3Gy9ILe4yzOL7Vdy7GuVQ=;
 b=GQdZ1JvyhoZh9mOxnDT5cDLh2sJ1LMTUJPKmUME9x2QZdpNlGWALDRiYVO8NbXUQgW
 ICxHNq9etGR0yMyQ3vq4e8PHetiLDhbebonvR42wkWhYhdbNWmlLdOU9dEsuoDePJ6Du
 XCshJr5FveNHxbqn3tkRFTtc+aPnAOLNoYwB1La/x/gd1FYJ4oSIJtJ7gdYKI9yMEjNu
 rHxsEDl6tDrcomwmyk4Q7cmcZdF5nvHb3hKX2zOfSnK+Fg1REuOLkO4ALLtVAhR06G77
 nD+9Q4Z6+9mOTqiiEWvOCDcFBABwKmp9hioO1ysxmXHgCggwQObCEnIlsHFobd8DfIyF
 Pkew==
X-Gm-Message-State: AOAM531x7mbiU7+aLJnVwwJ0e5vn8STjVJ0AIRvgojxHSn4FzTxj4ktF
 +zGgowJvhfOv4sBBi3QXtwksT9kgmnyU124rreSYUg==
X-Google-Smtp-Source: ABdhPJwi6IoGglCiCiak6bwX64+UB0kKwB6Xo270VEw0n9DKyfcsQ4jiWjsgbWZZT/2qmjTZFQM/V7nkC4if997HWCc=
X-Received: by 2002:a4a:9528:: with SMTP id m37mr6194897ooi.85.1591877253055; 
 Thu, 11 Jun 2020 05:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200609162504.780080-1-richard.henderson@linaro.org>
In-Reply-To: <20200609162504.780080-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jun 2020 13:07:22 +0100
Message-ID: <CAFEAcA_=3MAZg15vEoUMHdCYfWxwb4-noKJx7s1uFnn8r4FCiA@mail.gmail.com>
Subject: Re: [PULL 0/9] decodetree: Add non-overlapping groups
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc2e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

On Tue, 9 Jun 2020 at 17:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 49ee11555262a256afec592dfed7c5902d5eefd2:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-5.1-pull-request' into staging (2020-06-08 11:04:57 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/rth7680/qemu.git tags/pull-dt-20200609
>
> for you to fetch changes up to d6084fba47bb9aef79775c1102d4b647eb58c365:
>
>   target/arm: Use a non-overlapping group for misc control (2020-06-09 09:21:19 -0700)
>
> ----------------------------------------------------------------
> Add non-overlapping groups
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

