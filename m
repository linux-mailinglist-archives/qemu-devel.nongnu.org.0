Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA600230DCB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 17:28:58 +0200 (CEST)
Received: from localhost ([::1]:35900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0RXG-0006y4-0I
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 11:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0RWP-00060S-IG
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 11:28:05 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0RWN-0002Wo-Rf
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 11:28:05 -0400
Received: by mail-ot1-x341.google.com with SMTP id a26so6364048otf.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jul 2020 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xGn+hPttuKSZ5D6i4FBqX65nRKEoDNdUCW3hb3L+7aA=;
 b=Em+N7m/D81JOE0szhaMTk+bT2t+SC9SNk2f2T02E9ZC3E7KmHSqieCptcBkOCiukxN
 H3MKWo7H7b4EZnfXfPy9Jqe+i4vhQjiWoN0tH6rSMFLTgdeEIf3RZK3yp6njLiJZroH8
 igH+1Sf9tqLZZJRkLtp7FgTvtD3QlVkXH+qkzCVfiC1yQCSpE0E86Sa/FkcI0ob8Tonc
 hs/CkGzsb7fm42dyJH2/Fd7JL5D41/MmszsnmPWGUjuUxfzq0aJz6jHJR4ZAGXp/rt3d
 IqnBq+XZb6+x0uspPzsMtGLvBv5CtK8kHyr42IbOvt0ZOt3e3jzYrHzfzD/qlOMv10VL
 Zchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xGn+hPttuKSZ5D6i4FBqX65nRKEoDNdUCW3hb3L+7aA=;
 b=ErQk210ydMCQtVwMiA75PK98K6HXLWGR4z/mYgIqle0eiJ0XAg2+dxSF0jtwrA+pIN
 eiC/tiCIUZB8ERPU5l60Zt82KvVa9oJgnFBRDddmHwrbdep6exnGhARGufBbPr3jpqiq
 sBri7BBxiSIHfwRJbiHQompcq+V57okL0b6a3MbJpqoDdyRt07bGu4TlIvleTBSZfVt6
 tIdPzgqIPZHbPqfcUXVaZXocaXN7rQrMyFTv1t/rBfMwBOh/FRRZLwb/C+GPvOvO7D1W
 eEYdB90cJyk2EHWDHShsY7naeTuZsC9KGxARZgAOzRUvNeBzVZcSBnlMCREGFpPnw1/G
 q5MQ==
X-Gm-Message-State: AOAM533fNKNNHe3FssJGuKzgBogmLvstttDUKh2uCqdD/ImC765A3zPJ
 ynq/0gfso3gekNhToZwvnfMhk+QZW0NlDmCBfpjMzA==
X-Google-Smtp-Source: ABdhPJwQuC4SeNBozGj6ZyR059CNpBq8cOvPOdvTqUGovpS4ie09l77kdetScF7x/FoyxtC47OZPk4A6dYFaCgr1cQU=
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr25541302oto.135.1595950082469; 
 Tue, 28 Jul 2020 08:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200727232237.31024-1-mdroth@linux.vnet.ibm.com>
In-Reply-To: <20200727232237.31024-1-mdroth@linux.vnet.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2020 16:27:51 +0100
Message-ID: <CAFEAcA_Tu3FK3fhBb5ZzOkmy6Usqk7utDU_OW0_kQ7GRSYo10w@mail.gmail.com>
Subject: Re: [PULL for-5.1 0/2] qemu-ga patch queue for hard-freeze
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
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

On Tue, 28 Jul 2020 at 00:23, Michael Roth <mdroth@linux.vnet.ibm.com> wrote:
>
> The following changes since commit 9303ecb658a0194560d1eecde165a1511223c2d8:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20200727' into staging (2020-07-27 17:25:06 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/mdroth/qemu.git tags/qga-pull-2020-07-27-tag
>
> for you to fetch changes up to ba620541d0db7e3433babbd97c0413a371e6fb4a:
>
>   qga/qapi-schema: Document -1 for invalid PCI address fields (2020-07-27 18:03:55 -0500)
>
> ----------------------------------------------------------------
> qemu-ga patch queue for hard-freeze
>
> * document use of -1 when pci_controller field can't be retrieved for
>   guest-get-fsinfo
> * fix incorrect filesystem type reporting on w32 for guest-get-fsinfo
>   when a volume is not mounted
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

