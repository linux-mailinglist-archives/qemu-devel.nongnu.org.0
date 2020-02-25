Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE92A16C392
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 15:13:50 +0100 (CET)
Received: from localhost ([::1]:57466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6ay6-0006MY-2A
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 09:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39740)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6aIa-0002OV-Qd
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:31:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6aIW-0000ol-NU
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:30:56 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37704)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6aIW-0000oR-HQ
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:30:52 -0500
Received: by mail-ot1-x341.google.com with SMTP id b3so12044679otp.4
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 05:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W00TYEGv3o3wTI6WlTZXldTZ7RdbF0jWLul8rx17LRo=;
 b=mjXAp/jRux95OCK3rTAr1wBK2KraYyMtCymOO8VWHnyzA8s+tfJ/SBHDxKs8QCymsW
 54KTR6+kWPJQx/VV729vpEpw8zK+5g7iPFL7pNGw0DmrOPsTYi8iSsMzU44NOGnd9dYR
 xOUMW2NNygTPPsRyB1s1kleDoQoxH5xiG2RGXrvmpkECkztL7W6S8kRRlNx64+2U7wUb
 h5gCuwLPHMdM7eev5NZOkWqotBF5sEu9KKxWoaS0mv1Xm6AWkQMoEMVQSbqrRHPDS1Mt
 vay2/UUc3uBX3wBw7OAEcjehZxLXG+nKiT3CSZNywTlpTaqDa+y8FAVaYq8Hl/qrU2Mz
 K4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W00TYEGv3o3wTI6WlTZXldTZ7RdbF0jWLul8rx17LRo=;
 b=UbEbSlyYITIEgHWiVaTmYKy9f4t77UlfqFMsBohDHw38tp7m/QIe0g/EYmip1lJXV2
 lLez/CZYW52oJ9yTU+c4gAXUT7ONOzuImTsPULjKPfn8gmGFFTYMeHJ3pgD4mSC936mF
 7Vp9jmODG3xgMnM1AKclruCow046vwQ/DYhsKcXVsta+6otFhliAeKW5Q+9tG5cl97i1
 Ha1fLeOiFPe9krUfyvfFfGRrbaw2P/Vihvw0tdc+9GsWkI2CSEYof7MacGagnqdZlErV
 xB9+nhEk57m8TTBcZ4MMxdDEmG9tVW1GjV3RSh/W+HRnmd8yrcN4TN8PLFON7tVaLkr+
 yUWg==
X-Gm-Message-State: APjAAAWIma8weBCMcThE5OdNyafdlABv4R4rR4x+zE9sEBmpFrM0vUcW
 ps+C6LpvnFNXrHBQ0NI6Vaz8/RcBeLPL3iB8PPY/UQ==
X-Google-Smtp-Source: APXvYqwYFu7QWTSW+/Kn6KA211hYsolFNVV3Y6lEjUmRuYvMw+cVUmAiJ7arecPsT9uZJrntvPoIzJmH+1Ecoa+J3vY=
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr42540624otq.221.1582637451828; 
 Tue, 25 Feb 2020 05:30:51 -0800 (PST)
MIME-Version: 1.0
References: <20200224222232.13807-1-richard.henderson@linaro.org>
 <20200224222232.13807-14-richard.henderson@linaro.org>
In-Reply-To: <20200224222232.13807-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 13:30:40 +0000
Message-ID: <CAFEAcA8HWfbxuk89zjZ9q=i61NXS7pdRj77NV0sX03W2iPVk5A@mail.gmail.com>
Subject: Re: [PATCH v2 13/17] linux-user/arm: Replace ARM_FEATURE_VFP* tests
 for HWCAP
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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

On Mon, 24 Feb 2020 at 22:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use isar feature tests instead of feature bit tests.
>
> Although none of QEMUs current cpus have VFPv3 without D32,
> replace the large comment explaining why with one line that
> sets ARM_HWCAP_ARM_VFPv3D16 under the correct conditions.
> Mirror the test sequence used in the linux kernel.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Use isar_feature_aa32_vfp.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

