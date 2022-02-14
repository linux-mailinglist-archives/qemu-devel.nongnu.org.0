Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E2A4B5D3F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 22:50:22 +0100 (CET)
Received: from localhost ([::1]:53492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJjEi-0005l8-Pj
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 16:50:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJjCx-0004jV-7P
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 16:48:31 -0500
Received: from [2a00:1450:4864:20::42b] (port=35373
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJjCv-0001mw-7a
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 16:48:30 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v12so29043448wrv.2
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 13:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZXGuxHjAjnNNA4X8OXE4Lvw03jI8rNbg828LhRdOB8U=;
 b=lYIOGrhqEjaI9hiPS8Q5/kROhFeVVC4uN0PRL3NQe2vip/NYivWeeErkZkltG62iTv
 ezLd216AoMxEDCUkbhCvAmGnav3pio0PHBhhFOp8sq7ClzjhWO3eVRniFstGsWy4o+e/
 EibUZ7uuFLT3cwe+web84YBmdazyulXQ8TvNIx8y/LLEtZ0pUJJfZaMgZ1aLiv7xsdGB
 hEW/ERfDYqGN20dtU+ivGvKJ50rgCP+AL1zvvYnTQcY2iy1VkduBXpjjCOUwiZJvuNeS
 9u+ExNeMSg/wEU/PeLZfhY06vodP+zRu8ek7U4dmOvgopxn3Zz9OlPuxPE4zxlUrR9WX
 On6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZXGuxHjAjnNNA4X8OXE4Lvw03jI8rNbg828LhRdOB8U=;
 b=s2d2JuwFAS0kWCmC57xnla2hK+2RvMRJMYEjz93omi4xmegLhDtEX9DA/pjXu3GRui
 PwjGYkUlDANX44K/89X/QiWS7/In8kR/j9bYo/JksQoeZGyerH2LjPe7kLojJWj70/Sd
 3wnCz9AHwbmh3koGB9uTxqbB1qBLyVo8rT98aMwPJUKh0ILK49rDC7dHCMMJAVK2VE3X
 PHM7pb8erwRz8yEAzOvWvofh29p8YpswL7/JwVLVWsQEBgqOQPEjPwL3HIkeZHWEDUZm
 ZgE3MPyXMUzhyF6x7QwL/fDuwbqEP2mdYBFeVgp6k3pqkZbM0jkXaWxCBVxeKaatNR8x
 poug==
X-Gm-Message-State: AOAM531eXkjRMXAnxr5RbOeFBxhdHjYk8h/u84qsZI0zmCl1MOZ65ln0
 Q3ec2XBWtRMJweoOktiEV86mBugXQSGxAg9RkC6hUg==
X-Google-Smtp-Source: ABdhPJxFrvy+5/AbuZ/ZqjRpiZXc7vlY7Hh3bMZND7Q7nxXD2Y4eCbgbs8tIzcxI9jUBJpzNFyL6MVvSN8S1v1odW/E=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr719393wrs.295.1644875307213; 
 Mon, 14 Feb 2022 13:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20220211175854.153798-1-kwolf@redhat.com>
In-Reply-To: <20220211175854.153798-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Feb 2022 21:48:16 +0000
Message-ID: <CAFEAcA9Hq2hAjztJoGB8QmThWvFtDLdqGKWrSpAL=moXe1U_GA@mail.gmail.com>
Subject: Re: [PULL 0/3] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Feb 2022 at 17:59, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132af:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220208' into staging (2022-02-08 11:40:08 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/kmwolf/qemu.git tags/for-upstream
>
> for you to fetch changes up to fdb8541b2e4f6ff60f435fbb5a5e1df20c275a86:
>
>   hw/block/fdc-isa: Respect QOM properties when building AML (2022-02-11 17:37:26 +0100)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - Fix crash in blockdev-reopen with iothreads
> - fdc-isa: Respect QOM properties when building AML
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

