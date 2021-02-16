Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8778631CB02
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:19:20 +0100 (CET)
Received: from localhost ([::1]:58378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0G7-00026V-Kn
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC0Cp-0000qN-GK
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:15:56 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:43633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC0Cn-0007oe-Ry
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:15:55 -0500
Received: by mail-ed1-x536.google.com with SMTP id r17so5477217edy.10
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 05:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hWf6Qjcmse9OLPkFZplSkmUjV0aXxlZ+z6bAu5QRxLk=;
 b=XRqymkir3dG+7ls4vdmQlBWnSjXi5jhK1nnGn2yInvVOgKRnpvEAgRcpbjBgG5PHhA
 MbqMnhtLCT274PFzpqxvXa5hGsTEILSeXsAvhd/iJqo11q6taJucKrkGb2ZPWZwM51HP
 doYM6uPkiRsxORJ+JgMVCsKdCy+E85gOeoAJrsnr6M5biADufG64DB7zlv4YmTGMxZpl
 oLQtecO1TVQb5H+nfoMjM7raveM/loV0lq95pkaCeBOHx63mSaWstg0v2B7CH/tx1u/G
 z/+JBUAB/EtdczkKt0zkj4tf2KFcmbH+jLQGPwRkF8ujGD1CEHBhxh5kWK1P1SWF77q/
 1Ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hWf6Qjcmse9OLPkFZplSkmUjV0aXxlZ+z6bAu5QRxLk=;
 b=geSFPpWeKW1yPutpUZM4e4UrI5TwT4cqLnDx/XjDItvmXm67VL7OhSls/ISrCUWauH
 Jk6uioGL3SQlAuN+G5O59pmgWDzvGWCt7rqcYQB4sX71Rw72/QA6OojJQiYDgDx0/MJ4
 i3C//NdnXX6PObpnNaN6x9Q3mbiTQOlRuP9WJv4uiqNCKg/8pNgpEiKkSVVCCxqqoFuh
 3YWWXn6vboTTbgoN5IuZMBcWqXuVoaww9k0aUB1wlW1706meu+NpL64lJz1Y7cjFaCZA
 u6b3UBqV1YSyFkY2aceIkL7xfXM/RDh0oKM32kbA4bbhwlZ5H/36Z0NlZ0B0SdbWtVf7
 Gzaw==
X-Gm-Message-State: AOAM532WhgPGgCWsOWUVsja/VozeQ5XCijyeFV498/sN4bKdRcT8Krcl
 +sh5a0SwbfbxjeOJ2hwP3xRf4bOvTZYhgj3WiUipXg==
X-Google-Smtp-Source: ABdhPJwMbCcvYXnkrt3eUfNV0+1oIAhBufhcy9pJrzONRVnZYhqWlKLNV4OXzbAiQb5DGSse1z+dB2PPhnW35eqHe68=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr20768218edd.52.1613481351814; 
 Tue, 16 Feb 2021 05:15:51 -0800 (PST)
MIME-Version: 1.0
References: <20210216131132.1116574-1-f4bug@amsat.org>
In-Reply-To: <20210216131132.1116574-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 13:15:40 +0000
Message-ID: <CAFEAcA9kg1qEMamBxgshqL0YADDX9e7U94wr9HuzCh0yV9w-mw@mail.gmail.com>
Subject: Re: [PATCH v4] MAINTAINERS: Add an entry for the Siemens SX1
 (OMAP310) machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 13:13, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Add the Siemens SX1 (OMAP310) cellphones with the other ARM machines.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v4: Maintained -> Odd Fixes (no test image known)
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8201f12271b..47f8c591760 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -656,6 +656,12 @@ S: Maintained
>  F: hw/rtc/goldfish_rtc.c
>  F: include/hw/rtc/goldfish_rtc.h
>
> +Siemens SX1 (OMAP310)
> +M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
> +S: Odd Fixes
> +F: hw/arm/omap_sx1.c

docs/system/arm/sx1.rst is already listed in MAINTAINERS
under the 'OMAP' section; if we want to have a separate
section for the SX1 we should move that F: line here.

thanks
-- PMM

