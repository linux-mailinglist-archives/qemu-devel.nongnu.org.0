Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC365798D7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 13:55:43 +0200 (CEST)
Received: from localhost ([::1]:35376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDlpG-0003iA-MW
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 07:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDlnv-0001mG-Pe
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 07:54:19 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:43000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDlns-0007FE-TS
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 07:54:19 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2ef5380669cso137720447b3.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 04:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qocfg9qJ04T7xFhqdbAcWdB/gCyqjRDLs9dTn4C8jss=;
 b=FJwkuGwYckvefgbTNaZOg1tEBOVZT5etircGshLKhbYNeNk/Yq7VrkhnDYOKFJeS3Y
 /zJRN8kbsNa88y/Lcw65gC9u/sdb8DxdQlSjkegZhP7pNJSThTbrEXJ23xwJqM+uRVQE
 1BN3CESlboiQR/WuGK4TRXK8TJV5ulhyd7jtSwf+27Pngsv4uFxlcbUTex5v0L/798wF
 th88HhNieqGByuqFsrAIghRDmfocJVaela8ttqpXnCE8r2DY0Gzn/trCjP6Z84ss1dFL
 5pi4CIBRDQqLSyJCThUBxk/m/1knHnrscyTJMafgUPqP0rzzjCdX29VKewwGanxw0axW
 FJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qocfg9qJ04T7xFhqdbAcWdB/gCyqjRDLs9dTn4C8jss=;
 b=YZM1AUguO8+4CVW64iBJtzoh7N7vkZP3mVsKKDiCgKzFYxQGQub0nZGQlz5I1U/amF
 V1BperVaavhg9Yuy89vEckobAWtuokzQYymiSGVIUTU6itmmAc/7He6q+OiDMkqgGutJ
 0MGz/TkxokrBnz9tR29gTpEbd7/80/Pqxz470izlBfRWhqJgES+DVKC5YlKTuhwnCMs7
 Juw9TmJBFTNhrrWMhnOWsLktOe5pZfTXawHEAszGkPjCCjdwacDoxqpgoDtory1PQ1m3
 7PEnB+qHxep9cN5EYPcivFYh2hnvQXfYpqiJ+6sPIaTeptHcUTSF/7tFrHUUOzggsqM/
 gn9g==
X-Gm-Message-State: AJIora+nWVY/CO+aIJSfyBopSMxs7YAHy0+KJNR5haSMW3gzKF4BPY8Y
 S10D2V2KYuWM51IiXvYGznQJgAoz4at69A5MjxC3Jg==
X-Google-Smtp-Source: AGRyM1vpnRMIv06THDw7HiV1gxUjvS1RiSsn4X7bvg9/YKpozCDnid7TCalwMoQBMfQvwVZnsY2cwo+fsvAdYDMRukA=
X-Received: by 2002:a81:4c8a:0:b0:31d:d6d8:cd72 with SMTP id
 z132-20020a814c8a000000b0031dd6d8cd72mr27035706ywa.10.1658231654391; Tue, 19
 Jul 2022 04:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 12:54:03 +0100
Message-ID: <CAFEAcA8cx7m1NAsuVCE9+mY-fSwjSeGMaGwfcYY2_RQk0ZmUbg@mail.gmail.com>
Subject: Re: [PULL 00/40] qemu-sparc queue 20220718
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Jul 2022 at 19:33, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit 782378973121addeb11b13fd12a6ac2e69faa33f:
>
>   Merge tag 'pull-target-arm-20220718' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-07-18 16:29:32 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/mcayland/qemu.git tags/qemu-sparc-20220718
>
> for you to fetch changes up to b704d63d094cc757c20c186ff40d692deb5e30de:
>
>   pckbd: remove legacy i8042_mm_init() function (2022-07-18 19:28:46 +0100)
>
> ----------------------------------------------------------------
> qemu-sparc queue
> - This is the second half of the PS2 QOMification patchset
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

