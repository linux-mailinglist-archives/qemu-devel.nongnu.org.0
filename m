Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A461682CE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 17:08:43 +0100 (CET)
Received: from localhost ([::1]:60494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5Ar4-0001rP-D1
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 11:08:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43440)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j5Alm-0002VR-Bz
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:03:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j5Alk-0003my-6F
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:03:14 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36245)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j5Alk-0003mX-1r
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:03:12 -0500
Received: by mail-ot1-x344.google.com with SMTP id j20so2446502otq.3
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 08:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FqraemnxJ5CQq6PssQ0wTs3iGFxuokK7/zDadqWBAfc=;
 b=hBlCn5Pm/Kg+zzBQ568hYErGKz5CHQ1fGGVTugHlCOFaAI0d578aPqrRdVu4iUBklv
 C7qyFm6Mjur2x0beVH0PNU6if2IeMRcUF4/vKHZE6WZ5VOoOo+hlGVsX8h8YXlW+AiTN
 HYeFVtd2PbZH5y2REYMRHAcE2SmWoPuvJbLIMRJuzUQ90PYlseMfaLZl6o1Xpr1Q7GKp
 giuAVh3UiPTQj3QNZQLrsYFOdBMw90k4DYuQD1SCo5RYvq/zV7tHTBqHKoufNU7GVtiP
 0TUNVG1GZRLXnxZrWeJi+suf392i/gQeXRW1LfCAR+pcIymtsZ+36IJd6apNlbCMbBPL
 CdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FqraemnxJ5CQq6PssQ0wTs3iGFxuokK7/zDadqWBAfc=;
 b=FjucN7dTXdXDeS3PeGjcj30rCKdlouB0kvD0hB7nSI2li58kE1m+gYphTyxQ3L9wV0
 erm9RCRpJ9X5MxdQ0/pDb8sjUoAP/t1/qhsxtMuwGtkUNwZaNEDC3Mj2yfK7KaRTdHM8
 texTCzCnc3IIBx5TmXppIPF7WAwKOasPItIinEHsFqxGFDmKgjfZX9dcls7ypKGu8urv
 gAxcgUqIsqIC5NyT/ytZnz6Ujj9Lyv4wnYIwuhKtxuSM2B6v7z8Z8feQSbZ1+7dovOiT
 DHcHqKV2pz0zvc0PChOpfbzLumdjfCPHGDJKKnA6gPfTZFcNccaBC1u7mTsjim+vKXZ4
 IfOQ==
X-Gm-Message-State: APjAAAUFUMPBE6DpKb8e+uX3mFBhgByC8Cg5TD1oDd4+5DQa4GUYLZO1
 8FsRYDSAy3hiU28QwmvrNo8c8YKi5zuYn8fecGKzqvON
X-Google-Smtp-Source: APXvYqzXekXO7DtR0u4bcZw9htq2PyOv2kJ+hZMODJGeH0pFEiLzuG8QcXsBIwTejwPXfSAV3c1GCQlUl3J1cWElECw=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr29025592otd.91.1582300990669; 
 Fri, 21 Feb 2020 08:03:10 -0800 (PST)
MIME-Version: 1.0
References: <20200214181547.21408-1-richard.henderson@linaro.org>
 <20200214181547.21408-5-richard.henderson@linaro.org>
In-Reply-To: <20200214181547.21408-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Feb 2020 16:02:59 +0000
Message-ID: <CAFEAcA-sp8FxhSzCS49o4p2s4hAnZoi6ZZnm_npJbJu8i=sfOA@mail.gmail.com>
Subject: Re: [PATCH 04/19] target/arm: Set MVFR0.FPSP for ARMv5 cpus
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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

On Fri, 14 Feb 2020 at 18:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We are going to convert FEATURE tests to ISAR tests,
> so FPSP needs to be set for these cpus, like we have
> already for FPDP.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

