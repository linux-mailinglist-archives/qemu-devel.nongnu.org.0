Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D2B31BA02
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:13:08 +0100 (CET)
Received: from localhost ([::1]:45230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdgZ-00030B-W9
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:13:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBdY1-00062R-WE
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:04:22 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBdXy-0008WL-Vk
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:04:17 -0500
Received: by mail-ej1-x629.google.com with SMTP id f14so10956167ejc.8
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hv3W7CxK4FzL7vHYK8VH02A0Q2ghKZmjkLxXfr5OMOQ=;
 b=A3xa8GWBKg96qDbDhUMyEcITYS0KDULrSqF/bxU5TDkV7K4EZE5oGpr6Sdj0y8TM+H
 UYzg8v7NoJkh/DD8dm1genR8TOOehVMUGBFmigPlUFrykDRSR2sSbrtDAhrdU2IpqcRX
 S3c0sKfJHC7OuXqcIJ/9jHkP1s6ht3yjqYlQLfnAmjUJ5SiwSOSceOV7slXvlHCZgyLs
 nGMJiB/K9N/mekFE6cLaZ+OtQD3rRsaDEbN4l90s8QHwgPa5Z3fyFIeN0zv1soXRhF49
 0+4QJgZr9xV/H9L0UEU2LyYiUHoivq/ADRcaHL68/PbPMUItFVKOmpXUJnWjH8q2oPLh
 to4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hv3W7CxK4FzL7vHYK8VH02A0Q2ghKZmjkLxXfr5OMOQ=;
 b=Tb1RgYMQmf81TbEMKKYEXE83EWy1+8so6aUEAnjTrhMHkbrRJ78XXfLFcmuSvSTv7V
 5H8qORD5rD4AO2IVRf23nGTCycooV+KjBCdWgaCxyhcbiJhIAfuZAcW6Ex8QBGkzGQOr
 BU3uy9Z4IzxS6ToMw3BkuHVTZoA831vYDwSDi3mqXS5a6GTRZIkOmkOcmXumybYsTxVc
 iV7MgbhORebWqNBE2fHQOoCGk/aDtcv32kcUQHJESPkzZjOy76sBHXtdNN0tG8EAo2eB
 gFS2w6B/nLRAgVMCfWe1leFo7b3CntGSYpO4yWqLUN8BUP2kf57det0gZ5fFqUZPzDPW
 lnLQ==
X-Gm-Message-State: AOAM530xQRtyUR8USYhThLhpn2xD6IT2Xi6Mmow/1iK0WuNpr+XGYn/7
 iOyTtMC3yO2bFXB8V1X+5IYUV17tGNQqp4Vc1c/N8Q==
X-Google-Smtp-Source: ABdhPJw2c1cEnpbGRl3x8AEkEmj0n/MAgzJeyODGzroqyaE8j/1qHwikwkPMJ7z9I32aUQQ1JjT5iFMCRU3JIYnJVeE=
X-Received: by 2002:a17:906:b4a:: with SMTP id
 v10mr15073359ejg.382.1613394253180; 
 Mon, 15 Feb 2021 05:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20210215094244.12716-1-alex.bennee@linaro.org>
In-Reply-To: <20210215094244.12716-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Feb 2021 13:04:02 +0000
Message-ID: <CAFEAcA-mzT8VMKc1cy77Y7o9kqFr_SLrbTS0P4B4w0wbJ1WoQA@mail.gmail.com>
Subject: Re: [PULL 00/15] testing and gdbstub updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Mon, 15 Feb 2021 at 09:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 392b9a74b9b621c52d05e37bc6f41f1bbab5c6=
f8:
>
>   Merge remote-tracking branch 'remotes/ericb/tags/pull-bitmaps-2021-02-1=
2' into staging (2021-02-13 21:26:00 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-gdbstub-150221-1
>
> for you to fetch changes up to 8886ff2844dc1a62dc4722ac65daf57c27dda2ee:
>
>   tests/tcg: fix silent skipping of softmmu gdb tests (2021-02-15 09:38:5=
4 +0000)
>
> ----------------------------------------------------------------
> testing and gdbstub updates:
>
>   - more migration of Travis to GitLab
>   - drop Travis container
>   - remove last of shippable
>   - clean up gdbstub MAINTAINERS
>   - remove gdb_get_floatN() helpers
>   - don't be quiet about skipping gdb tests


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

