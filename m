Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA8530909D
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 00:29:40 +0100 (CET)
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5dCt-0001Bp-Dp
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 18:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5dBJ-0000he-JI
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:28:01 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5dBH-000409-QI
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:28:01 -0500
Received: by mail-ej1-x62a.google.com with SMTP id rv9so15268441ejb.13
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 15:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yf+ayhaCWN08C9KIwxoILM2dvXOpfdmbMN9L+Snj6kA=;
 b=bbZNXy2+7Smtrhtr2W5nDakpLc3SvWEh1v/iJ+izdefWXaOf+Ozgy0ARk+EbimPHrs
 MtY4EznvlXEepkOyFTQKcJGNO4Wy3aob35mIIflJNMHbxPncsNbUjQmhJa6fSAkI0b9C
 mp13Mo2JFTDCGuj3X0exP0UWKm7T/xH1HnKyyk7moJonaDvXBfjIXSCDPM+/yWiHAEmq
 sa4vt7QnjzX0OWAD/W/Pz9Dl4FmiOCQn1Kw/hJhNgjYKGhhaThUobthRltcSQAEyux+3
 9K6hO9oH9m2hLaAJqnlzQZyaSxSru84uOkB6jrtg36fTrGycOWDbDfq3yqAm45sgEZaD
 up6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yf+ayhaCWN08C9KIwxoILM2dvXOpfdmbMN9L+Snj6kA=;
 b=fbgy2iNJ2BllQj7ABrXV5Gio0u4/PZsvJ0/3Y886evCe8X6J0z2DSJ5IWycDdAzHWW
 w8w2I3G720/GNcTNbRkdIPQUsnvt6GN0klsJ3h0A9gZSR8VAUdmlzEI4WVoDOoHASR0L
 bLE2lVih0khMC5sUd3OZKCad4lZLRygu/78IT9FhStd06kwDyVrpZ58Ym/TqiyMpEb+Y
 4f/ct5uSReGw9T6Bfte7ZTyYhpW7pMLsJfmBETfEH5iTaMWARAARU19HOW/UGY9BPkLS
 +BKz2nxRl7Z9+deo3gw+HEjnmzzKNFN5q1Pruko/NAYtimI/ubZW84ci1qnWFXrfqfUT
 yvcA==
X-Gm-Message-State: AOAM532BFsMfUdD0Qst6o02QLdmr4jWpNQi4mF2IVrhz/0yP/QVO2q/0
 AMbG94K+VgSSW44JEZxrhgN1psQpH+juBN9gyfQyRQ==
X-Google-Smtp-Source: ABdhPJzA9YcNMvHAMZrrkS8Cv+CF+2p9CIYTxZyC9APgPoVDYpAQBtk3RHXDDQaIQ+DDXFlIpGFJs/x12BkyjNpP9vY=
X-Received: by 2002:a17:906:4002:: with SMTP id
 v2mr6855025ejj.85.1611962878389; 
 Fri, 29 Jan 2021 15:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20210129201028.787853-1-richard.henderson@linaro.org>
 <20210129201028.787853-14-richard.henderson@linaro.org>
In-Reply-To: <20210129201028.787853-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 23:27:47 +0000
Message-ID: <CAFEAcA-qgiuwWs+pD4DVB3n_Ce=n-Yy40mUHGjEZ3dN0O6xQuA@mail.gmail.com>
Subject: Re: [PATCH v3 13/24] tcg/sparc: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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

On Fri, 29 Jan 2021 at 20:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc/tcg-target-con-str.h | 23 ++++++++++
>  tcg/sparc/tcg-target.h         |  5 +--
>  tcg/sparc/tcg-target.c.inc     | 81 +++++++++++++---------------------
>  3 files changed, 55 insertions(+), 54 deletions(-)
>  create mode 100644 tcg/sparc/tcg-target-con-str.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

