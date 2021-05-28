Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2613D3946FC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 20:27:51 +0200 (CEST)
Received: from localhost ([::1]:34184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmhD4-0000VL-6e
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 14:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmhAy-0006FT-5Y
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:25:40 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:33667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmhAw-0005KB-BZ
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:25:39 -0400
Received: by mail-ed1-x52e.google.com with SMTP id b17so5936529ede.0
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 11:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hLKrAXlNLIQebSDCFMP5SYJu9yVjNJ5ec5/0YkYNLmg=;
 b=QKqrCB32u/jj2HZNgOdLg2XsZ+7NBjeXBCgF7N9ukbG/3pgziWXHfCmWXj33hCSx8W
 9EDUKe1SyaUjFaaPYXTRre9tXj9tdJL6Q/eSHndaJbmu8gpN7G+TC499ZrM2Mu+MuIo8
 s36pDU0rFjT3kkwqJJJWIcLpZohVpz7lq5iUafjaEcowV2d+uwj1MBbQcj+bFLo6ubmx
 0jTvVKxkPpH8Y7fU+VlBavUTSWwHX8kpwoTOimW5Oen7GkAdl/pHdnS576alPBu/VxPE
 d+3Pc2vvlblCsuNKxZKoWoPIX45xKZhq9qy4xWb2sRGcIKQYQ+j5+oc1FeZoQmjuN1Ch
 p+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hLKrAXlNLIQebSDCFMP5SYJu9yVjNJ5ec5/0YkYNLmg=;
 b=Oq9dWLEs0ax7lZ+Fg3OkZ5GYpwaRIPoZAHb+UVGV19CG3/D+QHz8dOOrPfkDcnkDzK
 7NOM/1n05oAAGXzyR/wsO1bOS63UfxP+0CiZ4Is8xVWEKgrIl0mRJsQxLzoWmERQaIWV
 +GYc6/7g+opMT2C3tgXHpE0BzVt4uSGenymTaV91nEIxBqCURUf/v4EFa4TJQ74P2jn8
 O1aFEzide05bNeymCwwJepbH+wdLMujofNYNBKDHTQOlFuTgg1Un2+zRZbe4DanZ1L/b
 EeW1dFEXWukqEaGMxR8gQQD9nzbC/e4linnVj6M6mNcMQdeZTKtbOPBSjNWR9wdsZUxp
 FQXA==
X-Gm-Message-State: AOAM531+0ud4MNXGYAHFvtUkKJXRRX6QBNIt7TIDgColyLOxcWniggnj
 Rc050MBFPH7mXrE7u6EeNEDRWkrM+ECg35o5q5D08Q==
X-Google-Smtp-Source: ABdhPJzr1yxdyX2Y24pG/aVEwKcksSwzShQPN1iW+0rsYQAnRznXKXnwLglyN5I8MFZXR4NbFia7CCCME9nGeraSUWE=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr11228979edv.44.1622226332692; 
 Fri, 28 May 2021 11:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210526234710.125396-1-richard.henderson@linaro.org>
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 May 2021 19:25:05 +0100
Message-ID: <CAFEAcA8Db-bxMS4FrVawtYQXcZByRf8W-i+1x1PU6cYa5tA8Hw@mail.gmail.com>
Subject: Re: [PULL 00/31] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Thu, 27 May 2021 at 00:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 0319ad22bd5789e1eaa8a2dd5773db2d2c372f20:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-and-misc-updates-250521-2' into staging (2021-05-25 17:31:04 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210526
>
> for you to fetch changes up to 119065574d02deffc28fe5b6a864db9b467c6ffd:
>
>   hw/core: Constify TCGCPUOps (2021-05-26 15:33:59 -0700)
>
> ----------------------------------------------------------------
> Adjust types for some memory access functions.
> Reduce inclusion of tcg headers.
> Fix watchpoints vs replay.
> Fix tcg/aarch64 roli expansion.
> Introduce SysemuCPUOps structure.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

