Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFC52AFAD1
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 22:53:15 +0100 (CET)
Received: from localhost ([::1]:45498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcy3G-0006MH-HB
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 16:53:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcy21-0005Q8-DT
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 16:51:57 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:33783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcy1y-0007Mi-9E
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 16:51:56 -0500
Received: by mail-ed1-x535.google.com with SMTP id v4so3946992edi.0
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 13:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Te+Jwr72KghlTsTZtNiJqNS/nNsRSdUlSnHbgOsSYH4=;
 b=qnJRVpQTvZVwzc0f0xz8dc6gaNpnSe5kc/TW+U1csF0DODTDtnQAx/eWqM0Z1mleub
 zPBlQN+57kBmKI/2VtBVHrcmvgG5joa1Buh4Eg41tOfjFVwLquZCandLmD4dQssfBBR9
 qgVJtKB9ZweMwKRtwWl+6ELLgI6nseoZ269IKyKk5AFDi2b9xptJmVrWuEmXvrAwVANE
 2SLUqY2z2gwmeY6b5FI0tNVE/LowUGDaMVqmRU+swQrH+5lFPII6pZGvcz8/PfkQR4Jd
 oFY4LD5NF/PVuB93Q2SayaBfjtL+L4u6hWRh5Uv/EQAgBT+dxXF4OPsXFfWyeEcmGLpK
 xaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Te+Jwr72KghlTsTZtNiJqNS/nNsRSdUlSnHbgOsSYH4=;
 b=pYVSpVk8x/12jsIrWsE5PncpeEWbm2bu69QXcStNmCBSIDu4TJjd8wkifKKdviTJ9G
 XhBF3CzGStbBk/z9VR364mqvpQBWPsbW/jbD0Xgx5PjqXCo64r5saSchKZK7zzG4SeE9
 oSdjscbdOUdd9F5unlihBMqsNbjycACrwuH6Ft4J+3EWeTTf7NAP1pdifAY0DNllHMnp
 lP86tc7H/6KGXXxc+rP4vXapdp3nYHkdF0fJXTFCd+O15xRxJ2jD0DGOwCSvxlzS0Ow+
 A3ctsvZbjIQ0dl2YUDE/+FjT8iN/MY/fFdYmEteryLyAUoneaSUjaiZp29r9e0Jlg7kE
 Tvug==
X-Gm-Message-State: AOAM530a+KUPeL/zyX1w1T0tP0abphQLyzU3hUMLvlzbhHVb3Xorgenb
 LjrfbR7aXvPPYzkMDH7Xo4W5qqjK5sxO4yVUiZTJMw==
X-Google-Smtp-Source: ABdhPJz2RJnnI2HWMPMz7BS76T3Oow0v2JTh1Ds8LCF5+7YMHC1s4ShQ0aHS2MDNCK5+TO9w+FjTMr56xS+uUM70lg4=
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr1804608edt.204.1605131512209; 
 Wed, 11 Nov 2020 13:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20201111155654.1430860-1-stefanha@redhat.com>
In-Reply-To: <20201111155654.1430860-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 21:51:40 +0000
Message-ID: <CAFEAcA_c1p-=LjnZ405SG0rqpzAyJXpmkdr3b48Fy4DN3oqs5w@mail.gmail.com>
Subject: Re: [PULL for-5.2 0/2] Tracing patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Nov 2020 at 15:57, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit c6f28ed5075df79fef39c500362a3f4089256c9c:
>
>   Update version for v5.2.0-rc1 release (2020-11-10 22:29:57 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/tracing-pull-request
>
> for you to fetch changes up to 35e28cb0f210cae3d9c98113d519fe5a4bef5866:
>
>   scripts/tracetool: silence SystemTap dtrace(1) long long warnings (2020-11-11 13:10:38 +0000)
>
> ----------------------------------------------------------------
> Tracing pull request
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

