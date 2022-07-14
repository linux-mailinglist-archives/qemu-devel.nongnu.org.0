Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FB057501B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:54:31 +0200 (CEST)
Received: from localhost ([::1]:53176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBzIT-0002kl-OW
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oBzG7-0000ND-KZ
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:52:03 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:45790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oBzG6-0008Lo-0k
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:52:03 -0400
Received: by mail-yb1-xb34.google.com with SMTP id 64so3256940ybt.12
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oOCJOlVY09Po+YJO2FJacNmTU1B/Df4uqACOL2QQFS4=;
 b=BRNhgiDYRLJmj6LpQDzFFX/4mUbyorakF2qjxcTaaXIwJVT1Dw2wnalo7HkOyhG7gb
 t1OwA6yI+QgIIXrRQ9JvdAjDK6h+Opz+uqls0O4Wy1Xiv221Gk+8giQSI5aYv3ufLfBu
 61lfidvoWynAFr1LaYKpdrmbZ9fxTrmJn9olJ0DMOuSQx4H3SxiaFOLk4OWstzGlnh5L
 ow/2p3j9oghuh3j2h2nKHhSJlo+DAIGExVGKsMF00DxIRn8tQSkLoQFEBzSI9zl6KrQG
 3oteeWxV5ESXKFDBGd3+v6IGqpKLaA9m2UCJoH3UdzNd1FBRA3QOfAYgY/Ke004B+d7F
 oQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oOCJOlVY09Po+YJO2FJacNmTU1B/Df4uqACOL2QQFS4=;
 b=7V7tt29sExXDdRYXBXXsD6IofP44tl8C/2nVVjh6vaCsRCttK+S1W/k8jdfYZSWnUI
 9KLhx0ZpuhCPM+v4HkqCa6vDewfEWBdlgf9TQzh+hfwDzBRqc0KFVHnOyksKQEXwBg3x
 JMd3KDNBMTG517KO3Kpyh/XfxH9/I16qeGay9zXmsKlIGm2Ko98grE8/4X0vLXVeZ3dB
 EuBKtolIOTcQGE39nhL6V3ECjPa+j6OPVOT4qK4XHhGSTnct28zuGWnpwUHqhCYlz81a
 LyCXNd4dPEpNAsZ6079h02cQJEzb415iuny/APtwDTCLO8a5xCRQGE1DrLGPr4DyWTh+
 uCMQ==
X-Gm-Message-State: AJIora/XAWAS26jMAeXfthO4mH7YrzNE89vGrD/ED8mvjMKwYAn+4GfU
 ArHCACOlDoct9eMdr884uOkYmuIymLLajD9fy/+9fw==
X-Google-Smtp-Source: AGRyM1uFEFiOYNvbY/BKLu2eTR0irlkEz8RQpB4A4w2E2U0ql4DVChQqTeeTV6fgnc86imTFBQWuppWqmSJyNeDrCF0=
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr9250140ybj.479.1657806720631; Thu, 14
 Jul 2022 06:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220713075255.2248923-1-clg@kaod.org>
In-Reply-To: <20220713075255.2248923-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 14:51:21 +0100
Message-ID: <CAFEAcA8xxt3k932pgAj45ivZWq3VQoc2GSEQy1j9PtrP42ig9g@mail.gmail.com>
Subject: Re: [PULL 00/19] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

On Wed, 13 Jul 2022 at 08:53, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 8e3d85d36b77f11ad7bded3a2d48c1f0cc334f=
82:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into stagin=
g (2022-07-12 14:12:15 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20220713
>
> for you to fetch changes up to 053b2ee5629d1b822127cc454634ec272624bab2:
>
>   aspeed: Add fby35-bmc slot GPIO's (2022-07-13 08:16:46 +0200)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * New ISL69259 device model
> * New fby35 multi-SoC machine (AST1030 BIC + AST2600 BMC)
> * Aspeed GPIO fixes
> * Extension of m25p80 with write protect bits
> * More avocado tests using the Aspeed SDK
>
> ----------------------------------------------------------------

Build failures:
https://gitlab.com/qemu-project/qemu/-/jobs/2722152320

hw/arm/fby35.c isn't passing enough arguments to blk_pread().

Your pullreq probably collided with the recent merge of the
block patches including
commits 3b35d4542c853 and a9262f551eba44 which add a new
argument and swap two of the existing arguments to this function.

thanks
-- PMM

