Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01807489B32
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:22:29 +0100 (CET)
Received: from localhost ([::1]:60562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vZ5-0008OA-CE
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:22:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6vTD-00052y-Ud
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:16:24 -0500
Received: from [2a00:1450:4864:20::432] (port=47043
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6vTC-0004Uq-6s
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:16:23 -0500
Received: by mail-wr1-x432.google.com with SMTP id l25so16188363wrb.13
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X3E0PAO746q8JVH+VnMgtFWDuQr/nUPTfxITSvUIkrI=;
 b=kSaxQohSDaWzZcyTuK+X8GsXxu1jJmiDl6Xbn/LK05ITV5BnDaaudVzDoQoqtMfmn0
 izww67qUYBkFfmzN8ImsRAzc9jUMj3wvkD2EniRHQVW/TnG9Vy7b4Z5ILLznvsfNFgB/
 RE5IHaZ3qqPOIRlRPvtQwmNq04BztZ0bYFMovU6WB4KP6/dx+unvITg9rrlP29NXuUTB
 NOKBdPiZYJ/hJWFDy8gK5SrPUbF7wwdl00pdZHufrVGuAfw1ILFTyQtNjgIL+1zW9OZL
 pA8Nc/f0Ab3yM/DzVUaziig0s0+V7cCHjI2L7T3/ydWz04FbkfRG7SYTWl3+FiloRHyy
 gFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X3E0PAO746q8JVH+VnMgtFWDuQr/nUPTfxITSvUIkrI=;
 b=CjD7wY+8Y52nnSMCP2RYe2ioBk2L40LDdjQb8EbD9/KPV/v1kclgdFTEaik6LagBi4
 +MQ+r1TGOsfa6LPVHlDm6La2KtYOpzcGLpqrZwjpt5ePB12mKBNXoLQq4sIEEXdo9DX7
 Rurm/aVeB2eH6R9mQjdBUUdsIPmmC6DD/PF0eUNAR5tBwc29RkQ/f1tAiPnp/M44ODzp
 NuPsQkizMVKUfzhyZgCCXvJdS5MCykW0Bp+aQpDNZ61misUZPfr5Bc8LlVmBwcpM1C8E
 HRy4C9AjRoOeq4WLY7bGgLVLgjyxQ00wQyFdu+LzI4D+vl1PysudEmVGPEIeEQApBxbu
 ZYgA==
X-Gm-Message-State: AOAM532C4Gq5s43xB4CHdj0RYGJKLZLoP+CFvoBxooG2TePFgVp7F2+f
 VHy5KbWcB2XA1mICWQ42AQf5Yvvsg/5Fm9HBbKj9PFmGDt4=
X-Google-Smtp-Source: ABdhPJxJ43HvgxDFf4GpG1ALNraGirV77iCarbcxCHEvv8Ra7H/FrUnrVUdX1uK3YCVMEFK+IKw/7oVtQAGaMe7xyes=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr7143491wrw.2.1641824180706;
 Mon, 10 Jan 2022 06:16:20 -0800 (PST)
MIME-Version: 1.0
References: <20220110134644.107375-1-kkostiuk@redhat.com>
 <14abede7-090b-8a8e-41d7-3b782455d6d4@amsat.org>
In-Reply-To: <14abede7-090b-8a8e-41d7-3b782455d6d4@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jan 2022 14:16:09 +0000
Message-ID: <CAFEAcA-FSy7kYFp1fijhueLitBPZiiZz1U=ORF5Ygm3rHsRoQg@mail.gmail.com>
Subject: Re: [PULL 0/9] qemu-ga-win patches
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Jan 2022 at 14:14, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 1/10/22 14:46, Konstantin Kostiuk wrote:
> > The following changes since commit df722e33d5da26ea8604500ca8f509245a0e=
a524:
> >
> >   Merge tag 'bsd-user-arm-pull-request' of gitlab.com:bsdimp/qemu into =
staging (2022-01-08 09:37:59 -0800)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/kostyanf14/qemu.git tags/qga-win32-pull-2022-01-10
> >
> > for you to fetch changes up to 206ce9699fae1f631ac74b7e1115db2affc759fd=
:
> >
> >   qga-win: Detect Windows 11 by build number (2022-01-10 13:05:25 +0000=
)
> >
> > ----------------------------------------------------------------
> > qemu-ga-win patches
> >
> > * Fix memory leak in get_pci_info function
> > * Add support for Windows 11 in guest-get-osinfo command
> >
> >
> > Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> >
> > ----------------------------------------------------------------
>
> I see the patch 'Message-ID' tag is not required on the guide:
> https://www.qemu.org/docs/master/devel/submitting-a-pull-request.html
> but it is sometime useful.

I don't think we should be adding extra requirements if we don't
need them. The pullrequest handling infrastructure doesn't need
message-id tags.

thanks
-- PMM

