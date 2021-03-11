Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FA73374C3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 14:56:27 +0100 (CET)
Received: from localhost ([::1]:60128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKLne-0001Rn-6r
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 08:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKLQS-0002RI-Kf
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:32:28 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:47071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKLQQ-0007gZ-Ns
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:32:28 -0500
Received: by mail-ej1-x636.google.com with SMTP id r17so46203061ejy.13
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 05:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4ipHLlonzrQInRy88e+IeqBbKdwOvK5v7iD9IRxrYFs=;
 b=W1OuUa+Pn/D701DSec3nDmT0MkskNnfoi0mO835QD010aFBsX6h0N8dt37WWwLmxPj
 vAXJPlr68j0GpVGoPhGKnc7lAdvEk7fX7rTxdpSmQyjWTF63XuuLelcG19wu46vozDYQ
 VdPUcutCP4HlF6PDswfGJvtn6tm1fERRXaLHAxtg3GJZ1XDFjWrBUpdyUZqALZ1q+5cZ
 Q4Yp4Tewx4jAxgpBPauOV5ae4OgOoYr3rLJOaTwJPN9tGIsjpz+VI+SDgxFPW3WuuFv5
 KyzyTiJeq+dlIXXZsdXJBFuWVthOqVseAnzmEkWAercFNxlnJm3denU2+5ib+xR1M1w9
 1eDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4ipHLlonzrQInRy88e+IeqBbKdwOvK5v7iD9IRxrYFs=;
 b=M4fK5ZnILOLPix7mTdeuAZPZudpFL5uJlzikOLOD+xW/AgPVCl3me8Jj8X/XoJRWPz
 Dz2/HPC+76yZTl87FFID0ptfGma3Mf/EnUuwt2uYtMMUIhlJHrVV+irFvWzC6ciCG5Qz
 A1CbFAcswb2/1+7SIh14LlWCX+CNGaMHs/ovDP1qCsqRmtfCjzV2aRns82JeSLeHpCF4
 U1NaLt3LsXg617txfaOIQbEJCKI4id02TGwsxEPMT1kIX0v0MI5yrqNH45Xl+687HrLi
 Xtd8WPO6paWLtsw1dCVl/IZUNW5FfS8wC63R9e4iL6Ewhh8MvNRzOARvGyfHTVC1ldhY
 +3OQ==
X-Gm-Message-State: AOAM531Y529tiWt2tzAMvIw3BH+5x3inlYeprUFfQsq63hWNYNZsfnJz
 g/5xa93NRTmi8yc5fiQWE6ORDYlIlgmIo/yylstffA==
X-Google-Smtp-Source: ABdhPJwBEHdM2WGFSYai8ddJgmB/rWkTPRpSPMKPr49f1Z1LTcAqMOhae9FlEM1bv00akSXuetdg4Uu/aReGLlu6HqA=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr3123663ejg.482.1615469545036; 
 Thu, 11 Mar 2021 05:32:25 -0800 (PST)
MIME-Version: 1.0
References: <20210309172127.20470-1-alex.bennee@linaro.org>
In-Reply-To: <20210309172127.20470-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 13:32:06 +0000
Message-ID: <CAFEAcA-hiMrr4gs_Z6aEDzXSdLwYDqHCbzp8T0sp4eYhOka-Dg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] semihosting/next (SYS_HEAPINFO)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Keith Packard <keithp@keithp.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 19:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Hi,
>
> Hopefully the final revision, instead of hacking about args to
> reverted to the orignal code (with minor tweaks for args). Still based
> on my in-flight PR:
>
>   pull-testing-docs-xen-updates-080321-1
>
> which already moves the semihosting code out of hw/. Please review:
>
>  - tests/tcg: add HeapInfo checking to semihosting test
>  - semihosting/arm-compat-semi: deref parameter register for SYS_HEAPINFO
>  - semihosting/arm-compat-semi: unify GET/SET_ARG helpers
>  - semihosting: move semihosting tests to multiarch
>
>
> Alex Benn=C3=A9e (4):
>   semihosting: move semihosting tests to multiarch
>   semihosting/arm-compat-semi: unify GET/SET_ARG helpers
>   semihosting/arm-compat-semi: don't use SET_ARG to report SYS_HEAPINFO
>   tests/tcg: add HeapInfo checking to semihosting test

Patch 3 never made it to the list or to patchew:

https://patchew.org/QEMU/20210309172127.20470-1-alex.bennee@linaro.org/

Could you try resending the series, maybe ?

thanks
-- PMM

