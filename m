Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9AB2DAD3C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 13:30:00 +0100 (CET)
Received: from localhost ([::1]:55982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp9Sp-0006qP-SQ
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 07:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kp9Rp-0006Jp-Tu; Tue, 15 Dec 2020 07:28:57 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:34784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kp9Ro-0006Ch-FU; Tue, 15 Dec 2020 07:28:57 -0500
Received: by mail-il1-x141.google.com with SMTP id x15so19046862ilq.1;
 Tue, 15 Dec 2020 04:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2WBmes5cTX5TWzmyl33H0ixPKOnEm9qf4h9/yIyQsfw=;
 b=MFaLupbcj9F/L5rTUdpLtmGvSWFcQfwd4QxEhX73avK38K5cxwhJbS6iyPGUC8LuUs
 6gqMl/kGePiF1w+MInoAsL4A2eqdMVLa7wB1Qj61nN1kjWih2N7Z9kE49GFuDDJjNcb4
 h6aoo2zKKhL3rVp+yZ29rHw7dsFyk5Zz0aQldJkWKCredES8QQtkrGfukGsn5SAwnSQr
 cdpAWsGbu4If/vQZ8Wmpcb26uz/udsfwgEvPbnCVsqng7ARvAFW6yi/HdXXRj6PKhYV0
 Ry/XzZll4LGKqcLZKaXxO4DQvmZBkaJIX3MLSKNoLvM/g2q7lzb8UxM7N7dmwn/BpoNw
 TL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2WBmes5cTX5TWzmyl33H0ixPKOnEm9qf4h9/yIyQsfw=;
 b=N0MFTatxILm0s1LF+puwi9I6w4bM7r6LKOpalzhIbcpogXR0E9hFQIT/paMYSbJhWW
 oCt+KLYXInkVEoh2MSbOFMzz9Yi/DbHkFABrQgTcIgiNDnYHcfTZmO/LFYu0aa3NKRGa
 UW9Rr7HTPibYcV/A7jd5TmEPtCMjhjKz4opqN0I1IpoKCwlILUoxzmzZelklil8OT4wC
 1sbtNLg6K8cSIf12d6Vnsz05uh4tO7cY1+0YSg3JKdWUF1afFNIZxnwAck4oqMG/vGhB
 4OWedNpLJ7/FoBKYGneA2+UT8P+I4sKaGaH4Qrshx6WXPqQU+a5xbY41KDb+q6puRuFC
 +nxw==
X-Gm-Message-State: AOAM530JHqYaaps6bQl7IDH+XnIFcpwEWz60+oUJbo8uyzNADdQJkaMe
 0t0850cFYj78AMD+3gXnwKP1GdNToWw86B6WIc4pbpvM2lGw1h0T
X-Google-Smtp-Source: ABdhPJx5UA84q2/XJUoXbajYgPS1omUchv5wyTwFQCx1+zXyBuu9jpL5GHnpyaH1Xm3a2IcUqLA4KssSauNnK/Q+u2A=
X-Received: by 2002:a92:d11:: with SMTP id 17mr41181561iln.84.1608035335091;
 Tue, 15 Dec 2020 04:28:55 -0800 (PST)
MIME-Version: 1.0
References: <20201215114828.18076-1-leif@nuviainc.com>
 <20201215114828.18076-5-leif@nuviainc.com>
In-Reply-To: <20201215114828.18076-5-leif@nuviainc.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Tue, 15 Dec 2020 13:28:44 +0100
Message-ID: <CABoDooO7n968VDyZYxR=oXKARFVNNdk02ypHCja=OCJ093Hb+g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] target/arm: add aarch64 ID register fields to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=laurent.desnogues@gmail.com; helo=mail-il1-x141.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 15, 2020 at 12:51 PM Leif Lindholm <leif@nuviainc.com> wrote:
>
> Add entries present in ARM DDI 0487F.c (August 2020).
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  target/arm/cpu.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 90ba707b64..efa977eaca 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1895,6 +1895,9 @@ FIELD(ID_AA64ISAR1, GPI, 28, 4)
>  FIELD(ID_AA64ISAR1, FRINTTS, 32, 4)
>  FIELD(ID_AA64ISAR1, SB, 36, 4)
>  FIELD(ID_AA64ISAR1, SPECRES, 40, 4)
> +FIELD(ID_AA64ISAR1, BF16, 44, 4)
> +FIELD(ID_AA64ISAR1, DGH, 48, 4)
> +FIELD(ID_AA64ISAR1, I8MM, 52, 4)
>
>  FIELD(ID_AA64PFR0, EL0, 0, 4)
>  FIELD(ID_AA64PFR0, EL1, 4, 4)
> @@ -1905,11 +1908,18 @@ FIELD(ID_AA64PFR0, ADVSIMD, 20, 4)
>  FIELD(ID_AA64PFR0, GIC, 24, 4)
>  FIELD(ID_AA64PFR0, RAS, 28, 4)
>  FIELD(ID_AA64PFR0, SVE, 32, 4)
> +FIELD(ID_AA64PFR0, SEL2, 36, 4)
> +FIELD(ID_AA64PFR0, MPAM, 40, 4)
> +FIELD(ID_AA64PFR0, AMU, 44, 4)
> +FIELD(ID_AA64PFR0, DIT, 48, 4)
> +FIELD(ID_AA64PFR0, CSV2, 56, 4)
> +FIELD(ID_AA64PFR0, CSV3, 60, 4)
>
>  FIELD(ID_AA64PFR1, BT, 0, 4)
>  FIELD(ID_AA64PFR1, SSBS, 4, 4)
>  FIELD(ID_AA64PFR1, MTE, 8, 4)
>  FIELD(ID_AA64PFR1, RAS_FRAC, 12, 4)
> +FIELD(ID_AA64PFR1, MPAM_FRAC, 16, 4)
>
>  FIELD(ID_AA64MMFR0, PARANGE, 0, 4)
>  FIELD(ID_AA64MMFR0, ASIDBITS, 4, 4)
> @@ -1923,6 +1933,8 @@ FIELD(ID_AA64MMFR0, TGRAN16_2, 32, 4)
>  FIELD(ID_AA64MMFR0, TGRAN64_2, 36, 4)
>  FIELD(ID_AA64MMFR0, TGRAN4_2, 40, 4)
>  FIELD(ID_AA64MMFR0, EXS, 44, 4)
> +FIELD(ID_AA64MMFR0, FGT, 56, 4)
> +FIELD(ID_AA64MMFR0, ECV, 60, 4)
>
>  FIELD(ID_AA64MMFR1, HAFDBS, 0, 4)
>  FIELD(ID_AA64MMFR1, VMIDBITS, 4, 4)
> @@ -1932,6 +1944,8 @@ FIELD(ID_AA64MMFR1, LO, 16, 4)
>  FIELD(ID_AA64MMFR1, PAN, 20, 4)
>  FIELD(ID_AA64MMFR1, SPECSEI, 24, 4)
>  FIELD(ID_AA64MMFR1, XNX, 28, 4)
> +FIELD(ID_AA64MMFR1, TWED, 32, 4)
> +FIELD(ID_AA64MMFR1, ETS, 36, 4)
>
>  FIELD(ID_AA64MMFR2, CNP, 0, 4)
>  FIELD(ID_AA64MMFR2, UAO, 4, 4)
> @@ -1958,6 +1972,7 @@ FIELD(ID_AA64DFR0, CTX_CMPS, 28, 4)
>  FIELD(ID_AA64DFR0, PMSVER, 32, 4)
>  FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
>  FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
> +FIELD(ID_AA64DFR0, MTPMU, 48, 4)
>
>  FIELD(ID_DFR0, COPDBG, 0, 4)
>  FIELD(ID_DFR0, COPSDBG, 4, 4)
> --
> 2.20.1
>
>

