Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812B231CEAF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:11:25 +0100 (CET)
Received: from localhost ([::1]:51894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3si-0000jC-G4
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC3Ut-0007ct-GJ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:46:47 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:45489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC3Ui-0007Ia-DZ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:46:47 -0500
Received: by mail-ej1-x630.google.com with SMTP id n13so11006854ejx.12
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=izwDidEVuwnBRZDetpbLngJt4XIl5T9X/eb6BgiM2vo=;
 b=ABx0DU78LLaqvP6ZubEpy0Bj7XnuA4len4p4Y5w8RRhPRWTVCgmKH0o2zLZWDMIHfD
 rl0v8E5LOGdfV9x4BntWF4hG6zIPJdz2U+lhh3vZMe3FPoguKn3imgMD9sSHrXaGVpbu
 xhXgdYdP6H+ghbqyb7pDKPgLbJsyh9lIboZ40mXTyzbU/i3uQe5oPBEBMDETXsBoBJRQ
 C58srQPb6wrPMWR6yA6rMTsR0jEvyXM6g5VOjReCEcKRip+DhmnQHSVn9UUBpFdjl7zQ
 qYAlq2fZ20YMiWQf4W1UBMtKdAOBaO6kH5JSZygeCC97YzdFjEu0y1Y7Fie3OCyuTOdw
 qNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=izwDidEVuwnBRZDetpbLngJt4XIl5T9X/eb6BgiM2vo=;
 b=lyHuv10Iy0Fy81wyqFbqlvUOff5UEdHd0YhOl2sBNGfPHlerto0U++eycZa+bBR4EP
 yOmhfwkoIr9SjN8VD/qDZUFG3i5GSStgou50FIiHLlx3R3nTwroMnMNucvNQwy1DmdeJ
 fG37zBLW6NoeX4nr6OS8Z1FYqT2AYU8tRtEdpdQDsqiSFMay8LzskRndsDIGtjiCQ/wz
 wlZ/JTmaeklCavjtc2P3TLwKgi74Wmgmwqkch9/7LnuuLi87rD/jHh3Riqsax9Gbk/4F
 pzLLORj6ZxWMw+OOBZ7dqEiWxbTbhFu8KuaP6EFtxPxM1CNYUx/aNm79GqyihpfQ+LsA
 ypKA==
X-Gm-Message-State: AOAM533aoJiiV9ouUzyo0+W/yKK2jXCC3S4orQWB5OrXeRazBdlHpsYK
 UqrR8FlFngShMBGFngsy+BZJLNy5McOPMRZUg68UJg==
X-Google-Smtp-Source: ABdhPJx/6Nnx6hmypTePc+midTmHyiy5yWuC/XCEW6jB/vPDZi2BDqoWu5bdAdMqWyR5cufeByNUvlFzmQtrmzgRkUU=
X-Received: by 2002:a17:906:b4a:: with SMTP id
 v10mr20745798ejg.382.1613493990396; 
 Tue, 16 Feb 2021 08:46:30 -0800 (PST)
MIME-Version: 1.0
References: <20210216045705.9590-1-crosa@redhat.com>
In-Reply-To: <20210216045705.9590-1-crosa@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 16:46:19 +0000
Message-ID: <CAFEAcA9jzCxY8Fri+S9sOqyN+rY_j09xDiptg_J2CAjOkoLJ4w@mail.gmail.com>
Subject: Re: [PULL 0/9] Acceptance Tests and Python libs patches for 2021-02-15
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 04:57, Cleber Rosa <crosa@redhat.com> wrote:
>
> The following changes since commit 8ba4bca570ace1e60614a0808631a517cf5df67a:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging=
>  (2021-02-15 17:13:57 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/cleber.gnu/qemu.git/ tags/python-next-pull-request
>
> for you to fetch changes up to c0c5a7f18e623b8f6eb7a9ccebdccdc56db2cec7:
>
>   Acceptance Tests: set up existing ssh keys by default (2021-02-15 22:30:06 =
> -0500)
>
> ----------------------------------------------------------------
> Acceptance Tests and Python libs improvements
>
> Along with the Acceptance Tests and Python libs improvements, a
> improvement to the diff generation for Python code.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

