Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4DF1C94E5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 17:22:44 +0200 (CEST)
Received: from localhost ([::1]:43860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWiMF-00042S-BE
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 11:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWiKw-0002pG-GY
 for qemu-devel@nongnu.org; Thu, 07 May 2020 11:21:22 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30]:38456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWiKv-0005VG-CQ
 for qemu-devel@nongnu.org; Thu, 07 May 2020 11:21:22 -0400
Received: by mail-oo1-xc30.google.com with SMTP id i9so1403658ool.5
 for <qemu-devel@nongnu.org>; Thu, 07 May 2020 08:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4mCD4KJ+Eib5gP/XAUVRY32MfBCuCpkwjOt+CwYZfGk=;
 b=F9bJUSE4o0KpdRmxgC/+C1D3ocdU/V72BMNYL3taC9llvBDYvHKckDW4+5jUnAIpAs
 m8ZYGU8nBZFVPfII0Y+V0h85CSK53uWS6ZQGlSgVWssWKiPo83peiGTuMGWdzFCWmsXZ
 p1vR+2z5B8mtfRCkZvLTnrIcNwMS9PLHkYr3x3YiH16LGXhuLN7ISYYwC6fMd0wM8P9h
 W7z1xIZydn8aZ+3zdI7h9ypwRfdTODw6BcpwFlfVjY0WpGu1pznJE5COaKuPYPlpgJMk
 2jIs0h37wc7aWeBnm5vksDWNrHx/vyV3TJRxuI8P8qkE6vIFEjOf3hMMUdSdO4jq/xPL
 vI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4mCD4KJ+Eib5gP/XAUVRY32MfBCuCpkwjOt+CwYZfGk=;
 b=L/ViBbV/HsMmLQxvCkwcVDGTrHqwJpNaseYbemPHW4cUlTB+Lkp+V3CduQibvpLceY
 TVIZ5S8fPdl1E7FxOQevPDTcFSmD/G+D4sFuO3PPXaDKSh18phqfN9ZDPn1xiTjie4wl
 OY07KXTnESiYBeSitkdsaNqBu14QvcFaf9CKdT1L3fYWlCCDr68mjUfdyHlj29EVaBDK
 aCJkLoHh0tesrQOwEZmHZwENj2USTWQEeaJ35tXd5tkJ3vgzY0gKHhY9d61ICFZlEcB2
 02AQAfK4GCuODdvzZpNMkTGzXHvfd+yA4qZNYnWeV8U7Wwt74yApR5NxoCbLZEaAyriC
 KW4A==
X-Gm-Message-State: AGi0PuaShisjGWNuggNFjtfm2USUvAHg9KejO1GPwNLjrUsQjvjtecwX
 xPW5vofLepmJrw+ZiOGPzROJFtdBY3Co0RhSzvuMHQ==
X-Google-Smtp-Source: APiQypL7n4Oj6/9vh6Frdq2EKwzIDeur/JXFIG1eDJUEMO1r8WlgV45AstEYjqMIRkpogIyO5Vb64ObQt1qSIUw5yvg=
X-Received: by 2002:a4a:d136:: with SMTP id n22mr12137262oor.85.1588864878241; 
 Thu, 07 May 2020 08:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200507115803.1122661-1-berrange@redhat.com>
In-Reply-To: <20200507115803.1122661-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 May 2020 16:21:07 +0100
Message-ID: <CAFEAcA9ryabGKgAbQu+zzy3WwDs_AGJQyNX3hUM8RPu4aeTTuw@mail.gmail.com>
Subject: Re: [PULL 0/5] Misc crypto subsystem fixes
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc30.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 May 2020 at 12:59, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> The following changes since commit 609dd53df540edd72faee705205aceca9c42fe=
a5:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20200506' into =
stag=3D
> ing (2020-05-07 09:45:54 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/berrange/qemu tags/qcrypto-next-pull-request
>
> for you to fetch changes up to 6022e15d146d8bba9610a9d134afa4bc6e5d9275:
>
>   crypto: extend hash benchmark to cover more algorithms (2020-05-07 12:5=
2:51=3D
>  +0100)
>
> ----------------------------------------------------------------
> Misc crypto subsystem fixes
>
> * Improve error message for large files when creating LUKS volumes
> * Expand crypto hash benchmark coverage
> * Misc code refactoring with no functional change
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

