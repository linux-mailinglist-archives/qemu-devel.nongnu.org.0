Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D246AAA55
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 15:01:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYSRR-0002Lo-2w; Sat, 04 Mar 2023 09:00:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYSR3-0001vK-Hi
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 09:00:37 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYSR0-0001iN-E8
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 09:00:27 -0500
Received: by mail-pg1-x52d.google.com with SMTP id s18so3056904pgq.1
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 06:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677938425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NeiQphHlMzktu9vt0AmjRkGANH9Jn3FuteNn0G+SIuU=;
 b=y76eYiixNVszC2oY/+uqIdX75MU3JbSe1wUqsfVJmof1O39Q7af9ZCz8bnenJDqqxf
 Ds39bfyHMnKbN3V44h8DHgwkAMV8d1HU7mssIaC3LLpSI0gLe8CdMzHMYeLkoPaYqOFf
 ts1X4f8D8tMMnTx8kMQKeXUynH7+jfPZyerNHom+Si9sHjoVMOPrJGp3ymqKmkNssdSs
 VsS4aSNlFBWfHN8aO0a/mAd0sVKkNRLseetNuNu23xa4OgquS0hzUbBBiknNaSRao5xn
 RaPc8Au+vaYHQu+8Y9vFPNKWCXpM0ziryXqFVjwKPYIsvJC33fTX8WoJL/q1s2AgYiJ0
 Zu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677938425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NeiQphHlMzktu9vt0AmjRkGANH9Jn3FuteNn0G+SIuU=;
 b=rt5NQ65zuiO2UN50fYxaYf8Y0cot4BRvdIgPCz9oWsjSVJ8E78ZDIMxvSCL1rrAUKx
 Uh3nSdajUfZjxr/F0dEBpgevqPgP+8YPOSjbZef1Rt+BdVuGpaC6R5NCw9mtsEnCCE0f
 vhBW+z98ttYqJ1s3ZuqdfPFtga7J6gptQvCGKzDpk3VKR8+lsCJwIhze2fjB+Ml1/ja5
 KkDf9y2rOxyiMzORW3OzPNCyiZLo/vRnD9sd9KBpkH8qKeD5bbBOBN1HSwJiOyNyRv4+
 Hh3bUqhDbCFBfkL2276DpTJ1VJGEgv/z2PPamUbWzP/oSwmBubSkNEbQQ6p4TJohQUrr
 RzcA==
X-Gm-Message-State: AO0yUKXvEDOJEqffxYSxRyQtsCDLAKxgDJAly0Rgp535i2+uujv+eBf2
 yilXqBUSPfJeMi0t8kjU22WQQ+RiNltbJH3dLt32Zrh7ynMaxtap
X-Google-Smtp-Source: AK7set+1xndq+NSYxoZMiQKRxho+50HkDwkVbR4ns8/BAXjp0t8FmPFwa+SANeTe0pFQGktyP8FxiNhhWiwFUFtF//U=
X-Received: by 2002:a63:f0a:0:b0:502:f5c8:a00c with SMTP id
 e10-20020a630f0a000000b00502f5c8a00cmr1560055pgl.9.1677938425060; Sat, 04 Mar
 2023 06:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20230302174206.2434673-1-clg@kaod.org>
In-Reply-To: <20230302174206.2434673-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Mar 2023 14:00:13 +0000
Message-ID: <CAFEAcA_htipnv3SC+DgSW+pHuTedw9RXtAW-TDFv8NZuxX3+JQ@mail.gmail.com>
Subject: Re: [PULL 00/11] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2 Mar 2023 at 17:42, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit a2b5f8b8ab7b2c947823088103a40f0ff11fe0=
6b:
>
>   Merge tag 'pull-tcg-20230301' of https://gitlab.com/rth7680/qemu into s=
taging (2023-03-01 19:19:20 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20230302
>
> for you to fetch changes up to b22a2d409b1acfdf0d63d1bb3595194ceb3d94da:
>
>   aspeed/smc: Replace SysBus IRQs with GPIO lines (2023-03-02 13:57:50 +0=
100)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * fix for the Aspeed I2C slave mode
> * a new I2C echo device from Klaus and its associated test in avocado.
> * initial SoC cleanups to allow the use of block devices instead of
>   drives on the command line.
> * new facebook machines and eeprom fixes for the Fuji
> * readline fix


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

