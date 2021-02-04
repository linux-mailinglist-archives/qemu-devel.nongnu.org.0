Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F6330EC4A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 07:03:57 +0100 (CET)
Received: from localhost ([::1]:46378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7XkB-0006ih-KD
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 01:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l7Xiz-0006BG-2L; Thu, 04 Feb 2021 01:02:41 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:41541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l7Xit-0004tf-DE; Thu, 04 Feb 2021 01:02:40 -0500
Received: by mail-yb1-xb32.google.com with SMTP id e132so2043926ybh.8;
 Wed, 03 Feb 2021 22:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WD8XcinHNckhzz1oofp0MBbemCQPyHOGo5O6+OEs3NY=;
 b=ahEFFrCKK9kxJGLIkPxvMhYPyWwBzMtsGvnxo/tqtEeQaVaTiCM1JzObWCSlsl5hfa
 9tuBMhIPaJacp4gISUMLiZEKcRuD82dhfJnBbRMcS8/TPWxy/HHQBWTFwh0cTeT7t8ze
 q1DG2dAYvAYpyugZlZBDgZogch1iMNuQkN+XH6aMdzUGK+ixTa/dEa91fcc7zUQRz1+j
 VIrVf6v9BS4rg9LM3Z8G/H6TsnVUgj4sfEyTB365FKnk8q8Xz8K6Qfx8KGlifhd7uec/
 AtOg2Jky24g055qB723uoNbyRoIQeeUZ6T9OynzU0i79TIS/+bEuLk3nssOmGiAf+2ci
 tw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WD8XcinHNckhzz1oofp0MBbemCQPyHOGo5O6+OEs3NY=;
 b=hKIUS9dS/jp/93hapyzQ/qPRbD/OHWYFXOdc6ScTEBHeaN1u1oaW5uw185pEBzVLj5
 Q84zxXoyg4rEgCTFPZT4qbj6DbzC+6d8oX8o2m2N4z36Q4+LrhN73oDkBl+YjgYE6Xgn
 JzkQ879AqaLPlgYGIdUN7Pb5eAZPLEiReGi4essgOjXDcsPTvIMcIbByUuviJVzVUPql
 KMAQTVJjq81Kg76Qsix6DhCxFwHTJEzQZewGfu5ZJq+Z4Fau2dcfP7mgcM//x1+um92a
 eKUWYYeZqFNruEqpPaI/grgJ2L3HDUP2kHREMX5rQSd+WQxYfZzlQZCMUpcUpFMYnono
 iOGQ==
X-Gm-Message-State: AOAM533zU9RIMrV2JXDdA4C2gcwavS7w9pRpFoY0OfLaapQ52uYUAW+O
 qaZHFnPs4m6mYBcsLOrERD5yJqB2IUfkUWlKG+4=
X-Google-Smtp-Source: ABdhPJyW2w5zhfN47a/CdEAZijB7qa1nOHePO3k32+EW3Gx4Ca0qYevXfeGqLZXM3AF8FajBWLpD7TmZRS6zNn2FUHM=
X-Received: by 2002:a25:7d01:: with SMTP id y1mr8495673ybc.152.1612418553506; 
 Wed, 03 Feb 2021 22:02:33 -0800 (PST)
MIME-Version: 1.0
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
In-Reply-To: <20210128063035.15674-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 4 Feb 2021 14:02:21 +0800
Message-ID: <CAEUhbmXofQq9AerwBQfjDZkwp0kA9w+y+x_F0LUWZ6ArP+9H=g@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] hw/sd: Support block read/write in SPI mode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qemu-block <qemu-block@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 28, 2021 at 2:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This includes the previously v3 series [1], and one single patch [2].
>
> Compared to v3, this fixed the following issue in patch [v3,6/6]:
> - Keep the card state to SSI_SD_CMD instead of SSI_SD_RESPONSE after
>   receiving the STOP_TRAN token per the spec
>
> All software tested so far (U-Boot/Linux/VxWorks) do work without
> the fix, but it is better to comform with the spec.
>
> In addition to [2], one more issue was exposed when testing with
> VxWorks driver related to STOP_TRANSMISSION (CMD12) response.
>
> [1] http://patchwork.ozlabs.org/project/qemu-devel/list/?series=226136
> [2] http://patchwork.ozlabs.org/project/qemu-devel/patch/1611636214-52427-1-git-send-email-bmeng.cn@gmail.com/
>
> Changes in v4:
> - Keep the card state to SSI_SD_CMD instead of SSI_SD_RESPONSE after
>   receiving the STOP_TRAN token per the spec
> - new patch: fix STOP_TRANSMISSION (CMD12) response
> - new patch: handle the rest commands with R1b response type
>

Ping?

