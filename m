Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CFD2A32A4
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 19:16:40 +0100 (CET)
Received: from localhost ([::1]:38704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZeNi-0008UQ-Qu
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 13:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZeMp-00084o-Qs
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 13:15:43 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZeMo-0006GW-3D
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 13:15:43 -0500
Received: by mail-ej1-x62c.google.com with SMTP id k3so20131060ejj.10
 for <qemu-devel@nongnu.org>; Mon, 02 Nov 2020 10:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N0xVh9Zvb8JYT6y6gJRkCQwdcfDve831c0+w/y1/VxU=;
 b=obFTcT/DNiam2gDNeFSqUMP3gdaGI/zDItyggu3dJIx+WqoGj4lwIi6AZQ+bFlIAZj
 u2j4gYVDXoND4ltTWCvf4tDeN8WxvVkxPiHIDKI68FEQ8owFK71sRrc8LlhXO3Wczy1Q
 Vi+h0MIfQYRCHUkY28nqd/UVTjehHws81bM8U7/DYcm3r8ILfL8attDDOcV82JTlP2IS
 ATp7Nk++Cw2mAUCGBee/to04FAtKgbO6iRfyQSkfr/GgbEDu/+L/+bCJFGeMon6UIecX
 TkSaemnI0F49VhSk81QmFq0h6gwvGlm1A+LcIfzwwsRepeLYGkz+AYV1SJtOuvEHYP4O
 CceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N0xVh9Zvb8JYT6y6gJRkCQwdcfDve831c0+w/y1/VxU=;
 b=dHohMHIWW3D44XZrIfvy7vi8lvfwGlW4uTgxgbzgOgbAUlKXFRMItAlYAcCIEIoSPZ
 FEqAmlV4J6QAWyGY0UYJPkEdeKCorov+x3+To2NJvpN0lZRzzPzYDeM6R0ha3yQrnEYM
 i9GvpmD5QqLmwvWxSNulOUkV3ZqeDH0nOX8RirHeOOAoZ1GfkGQPauDsMtXvnsYiakQV
 epFjSz61IM6V1e+kVYLrhTIE9IEtW0pGaqxxSfFO3C53ELG6n/9fQ881O2t0peKFLDrT
 +9DHc1R0XzuaTEU+wmPn1gFbo+SL0MRWDFeESXdV/LXes37kElC0dN8NZbVRXiYA4C3C
 WH9g==
X-Gm-Message-State: AOAM530s+KjL37qy5mKxl9e1G62XLC2kI9wWnjWXwM/Gr1rUdYFKt7Wz
 mbhMTwt+5o29hBtkn/m9X4Q+ttXwZpX5tWw/U7Z+gg==
X-Google-Smtp-Source: ABdhPJzBGss4GSmUToSeE15f1IG3LSn+gBpcyDECU+1tdYRqzOnrm6VG7dBTBdxOMZEXIRBNA1es22eWSV+ovLNk/zw=
X-Received: by 2002:a17:906:6949:: with SMTP id
 c9mr4378472ejs.482.1604340940381; 
 Mon, 02 Nov 2020 10:15:40 -0800 (PST)
MIME-Version: 1.0
References: <20200330102945.2388294-1-laurent@vivier.eu>
 <20200330102945.2388294-2-laurent@vivier.eu>
In-Reply-To: <20200330102945.2388294-2-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2020 18:15:29 +0000
Message-ID: <CAFEAcA97s+jiZxH+ObdFeFgs7-Wub6XjZvJFmL2s4voRrny38Q@mail.gmail.com>
Subject: Re: [PULL 1/1] linux-user: Support futex_time64
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 30 Mar 2020 at 11:31, Laurent Vivier <laurent@vivier.eu> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Add support for host and target futex_time64. If futex_time64 exists on
> the host we try that first before falling back to the standard futex
> syscall.

Hi; I dunno why Coverity's only just noticed this, but in
CID 1432339 it points out:

> +#if defined(TARGET_NR_futex_time64)
> +static int do_futex_time64(target_ulong uaddr, int op, int val, target_ulong timeout,
> +                           target_ulong uaddr2, int val3)
> +{
> +    struct timespec ts, *pts;
> +    int base_op;
> +
> +    /* ??? We assume FUTEX_* constants are the same on both host
> +       and target.  */
> +#ifdef FUTEX_CMD_MASK
> +    base_op = op & FUTEX_CMD_MASK;
> +#else
> +    base_op = op;
> +#endif
> +    switch (base_op) {
> +    case FUTEX_WAIT:
> +    case FUTEX_WAIT_BITSET:
> +        if (timeout) {
> +            pts = &ts;
> +            target_to_host_timespec64(pts, timeout);

...that here we call target_to_host_timespec64(), which can
fail with -TARGET_EFAULT, but (unlike all the other times we call
the function) we aren't checking its return value.
Is there missing error handling code here ?

> +        } else {
> +            pts = NULL;
> +        }

thanks
-- PMM

