Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC97182FCB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 13:04:37 +0100 (CET)
Received: from localhost ([::1]:40448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCMZo-00065N-Ep
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 08:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33779)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCMY9-0004yp-7Z
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 08:02:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCMY8-0006rJ-4E
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 08:02:53 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:40449)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCMY7-0006qa-VM
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 08:02:52 -0400
Received: by mail-oi1-x241.google.com with SMTP id y71so5178719oia.7
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 05:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TyTwDg+EN/hhI8fmdjAbEYPe4BoQlHinZlVtRoD/N+s=;
 b=hXPX105GyYd7i3ky+ffrxwgAmMXtKiPkeOpDCDJ+tLhXBeW2EAI6OPl+iEHW9iCVor
 9Zj3jBlCLmZJywBwpx7HZX3tkzgX3vyqkP0jIG2qtHv2keKgrpgcvtCCAl3sCC86jTSS
 n7xS+rX70pi//H05px0sw6KLsVXoolzy7nifDXy82eP2pSiBrcLi5w3K59lMXVQg4G8B
 /92hmAoWVBDVEhgAgBaugqrjKMgBnQH/8BhHlK04iGNQkmhHki4R6kZ7S0aLGM42mJpp
 2E2PMZ4EeRp1fpSWkaCvLmrfDesGtHcv87WSlyymWaFK/bSNxmagFNGVFpJ3YmeTNSY2
 qHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TyTwDg+EN/hhI8fmdjAbEYPe4BoQlHinZlVtRoD/N+s=;
 b=LIg2+tBPKUqrbj+o9LIcGJ4gYIFVycHWpYNW4vZDrS40sS+0/jr8VZEalGOfpj+j6R
 B/8n3+D8a2nYNE6UvM8qncuT31GM5SYHDsb55QwEB4t19pyoipqcH2Yv5hfDrYFwvXu/
 I076EC0VI1BWt1cEGXp51H6MXb/TNB9bva/+ndkkVjYI2X3H4buDZ/MCLYSW/IW68YRo
 zi+u4FntE2KafdZ3EECHTeIXPMJsnKV0vcfNASEpYwb0nldk1FsfWt4Gjeihocm/PfYI
 gJSlhaKYjKQO2tjRZAg9PiN4pBFQTGfLYXt0k0iHsd4RuRDPesikgrXUnYe6FQL7Iob1
 weng==
X-Gm-Message-State: ANhLgQ1AduJzGGDn8DClvMJlE8R3KqkEkzFkO/LJ2UhX0/7Ni1LwTsu7
 vj0qlVI67HVCubAaGsKn8xUwWtg48tjwUL9oFR2l5A==
X-Google-Smtp-Source: ADFU+vtktqR0fvBBavs68p82Z0uZzPR2xuh6W1tqUQ/S87alAD6BEqKMAEcgsakUafI7GMmXTRjvGhbZ1AyNf1lVJJA=
X-Received: by 2002:aca:c608:: with SMTP id w8mr2365613oif.163.1584014571125; 
 Thu, 12 Mar 2020 05:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200308012946.16303-1-richard.henderson@linaro.org>
In-Reply-To: <20200308012946.16303-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Mar 2020 12:02:40 +0000
Message-ID: <CAFEAcA9KdR8ZcjngFfSf7Y_zG8+VL+6pXDOJpWxP+VM7dj-XUg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] target/arm: Misc cleanups surrounding TBI
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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

On Sun, 8 Mar 2020 at 01:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v3:
>   * All but 2 patches are now merged.
>   * Use regime_el to determine aa64-ness of physical memory addressing.
>



Applied to target-arm.next, thanks.

-- PMM

