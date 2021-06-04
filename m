Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198A639B6DC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 12:16:00 +0200 (CEST)
Received: from localhost ([::1]:42406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp6ru-0002g7-PS
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 06:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp6pR-0007It-17
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:13:25 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp6pI-0006pl-6K
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:13:24 -0400
Received: by mail-ej1-x636.google.com with SMTP id g8so13711100ejx.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 03:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jXvm//Isv9HcEzA+gWccDA5Ek/mUD8ObFODLnxV4iDU=;
 b=a9dC+ctQwYqYeuc3wYPgdtelHtWX1qq8714qhEpLvG/VJ7Li9oe3PzGuCpJ/VRfK49
 +IozCo6yBPr2eJYQBvyRp59Kr+GMh3hUcFeoBUELsKbcMcSJZc7XJ7pgWOyR0TYYYMYM
 2Sm6tnmB4Cv61PwrsmcY7njCZXqHV+ORPdF2cy3OgusbSUcSO3N97hguedruOZAEt6s9
 vDT44dZF1RUg/KOwzlpqCZi4HrXjVnSC/j3s+hwFSYkmucnV1jBNjJDaWVqAm6EllVhf
 X3YVFssdcCbod7WBPm0aUWvJr04uLEsGWX4aqUc/LwDj/e/djF9ANkPPJoM7/mfUuDTc
 iepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jXvm//Isv9HcEzA+gWccDA5Ek/mUD8ObFODLnxV4iDU=;
 b=Qm4GnLo58crGk2/ecnxAp5pcIoOTdvraCG5Ijr87XTsLzFRTJ6JY8IUiESunUQTa2N
 i9z3D95JLXfM6ubOLct3sHuYsphPNPzF/fkGHUW4K6jQVgx07EbyqHP4yWj8IJCrCDnn
 eGPkhoEBKZ3Jaj+ZUlUdctsc8HPWk4fl7EzAQLxrDVzH+MZzPiUGp+u0mEpLU0btsjcc
 CfMBtrzDzRRcKHtZu/rEy/PpbqT8MXMsYoxG5tZsqDevEjA/ZRFQaTT5gyUPXlbHOjGJ
 A7XKmrHvhETdj91Be6hzkBtqVL1u36JvHx+4CwzZdMc37GAjnsOLDDaVEpOOEsqU05ke
 D9hw==
X-Gm-Message-State: AOAM531DRArrJwqrLBUJ576ZzhPB1sfmFf/SzkdJsD60hLYdug4VlUa8
 ThQTmKYbNSnQZEFFmBrFXTr/UnsKgwRrHJwKeAG4sxPwbtM=
X-Google-Smtp-Source: ABdhPJwwjAT7y8NqxSAI+0WunHZq6vKFjPux9MdnY/y2WsR8WsBaxQb1uX7D9vnGXivcxwwU1Ger3B/a7KmtJVniBa0=
X-Received: by 2002:a17:906:4109:: with SMTP id
 j9mr3558969ejk.250.1622801593411; 
 Fri, 04 Jun 2021 03:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210527052122.97103-1-ysato@users.sourceforge.jp>
 <20210527052122.97103-8-ysato@users.sourceforge.jp>
In-Reply-To: <20210527052122.97103-8-ysato@users.sourceforge.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jun 2021 11:12:40 +0100
Message-ID: <CAFEAcA8X17EX5pKETJxQSiPW+x4eUnZTv0cy9EM8FxL7UCJ12g@mail.gmail.com>
Subject: Re: [PATCH 07/11] hw/timer: Renesas 8bit timer.
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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

On Thu, 27 May 2021 at 06:30, Yoshinori Sato <ysato@users.sourceforge.jp> wrote:
>
> Rewrite timer api.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  include/hw/timer/renesas_tmr.h  |  58 ----
>  include/hw/timer/renesas_tmr8.h |  67 ++++
>  hw/timer/renesas_tmr.c          | 493 -----------------------------
>  hw/timer/renesas_tmr8.c         | 540 ++++++++++++++++++++++++++++++++
>  hw/timer/Kconfig                |   5 +-
>  hw/timer/meson.build            |   2 +-
>  6 files changed, 609 insertions(+), 556 deletions(-)
>  delete mode 100644 include/hw/timer/renesas_tmr.h
>  create mode 100644 include/hw/timer/renesas_tmr8.h
>  delete mode 100644 hw/timer/renesas_tmr.c
>  create mode 100644 hw/timer/renesas_tmr8.c

> +static const VMStateDescription vmstate_rtmr = {
> +    .name = "renesas-8tmr",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_END_OF_LIST()
> +    }
> +};

This seems to be missing the fields for the actual state ?

More generally, complete rewrites of devices are a pain
to code review. Could this be structured as incremental
improvements to the existing code ?


thanks
-- PMM

