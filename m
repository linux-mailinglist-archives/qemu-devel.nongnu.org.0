Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB0440291F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:44:25 +0200 (CEST)
Received: from localhost ([::1]:50376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaSe-0005Su-Cu
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNa9m-0007S9-A3
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:24:55 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNa9e-0008Hs-T2
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:24:52 -0400
Received: by mail-wr1-x429.google.com with SMTP id u16so14155273wrn.5
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 05:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IMGXbjShaz4y7ok4vfEvhZFveCcDCL2FarJRIuvv0Zc=;
 b=Y9tAhx6N4WQEQce7GxwRDYOxpMJIAgIECnkH4uHHQEWPCj5p6rH/WH269Kla5oB0BC
 oQTkB28WeH+IfLSK7Yoo6EGSYDd6Si3OWehDCBXIhWVf5+9XZCzRMUG9nFpBwMoknZOQ
 BF6mKz3GONc+3aGuWidUOXOtC5b58KsU8PnMmQS9TJ5OEvvooqBgc2JL1Rk1GycBrYjI
 LgYrcPKlI9nc62vyoWYFmfVHEUxoQVRylfCH3SEDWDEonvKcn+XF36JGay+mlQGQLxya
 D7nSuB7k/Ub2Cq2k7WxTTBDrNMe5F6Eb3B0evcSKfKL7/hOU9kcYhqHHcfIl/wDwNFI3
 QIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IMGXbjShaz4y7ok4vfEvhZFveCcDCL2FarJRIuvv0Zc=;
 b=h9yP8uJGf2t/Ws5bsXv3EaNR3fS9bOhl5dxvJzz6wCwn8L+WxOGcL/Z+mSAMbEvtYl
 CDHjvv2pmlxIeKr4sz8vG2A4Cv3CU+OY2IbbvlTLXZYU3c7sF8sCW4uaFLIbqgOpZY2V
 PL5pBcTJVSINVdowtS0hZDLwpd+QldzKBUY+ESsds33tZKHB19eoHvb1LFWvavX3tuek
 25RnIYXE1Y11WG5zOUK9na4DsRTNDkGukzcmyg8XvsNlZydJtHdtVFEald8HRVOwbJ1r
 wFplV6ct+S7PJiqSaGBOSo5YC0GPZ8cLtAZPFXkfYmdswUTJ4L4Y+P7GJBxDe8ymxKu/
 CPUQ==
X-Gm-Message-State: AOAM530LnW/W6BAkOrG9qJ8oenJP1uVy3uTcIYGmgClsWAWvoApaSfmF
 6Q1wsz4GFlyKzcnokU53TaiaiQEnMciPD1XR3vzF47Bijp4=
X-Google-Smtp-Source: ABdhPJzgzC4cdHtgNzZn65/b5suxr2wMNjlzN0lPCoYPV7WsWq4g8mrcXqGm72l0BZEE0dB2enzpZFiOpf3397eZi1Y=
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr18307189wrq.263.1631017482731; 
 Tue, 07 Sep 2021 05:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1630941575.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1630941575.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 13:23:53 +0100
Message-ID: <CAFEAcA8M-vXr2wN=0yD23_q6+c-Rur_WE7BxToGH+0SiW2uPGQ@mail.gmail.com>
Subject: Re: [PULL] qemu-socket unix socket bugfix 2021-09-06
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

On Mon, 6 Sept 2021 at 16:21, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit 935efca6c246c108253b0e4e51cc87648fc7ca10:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-09-06' into staging (2021-09-06 12:38:07 +0100)
>
> are available in the Git repository at:
>
>   git://git.corpit.ru/qemu.git tags/patch-fetch
>
> for you to fetch changes up to 118d527f2e4baec5fe8060b22a6212468b8e4d3f:
>
>   qemu-sockets: fix unix socket path copy (again) (2021-09-06 17:18:54 +0300)
>
> ----------------------------------------------------------------
> qemu-socket unix socket bugfix 2021-09-06
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

