Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEA91AC589
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 16:22:51 +0200 (CEST)
Received: from localhost ([::1]:34870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP5Pn-0006CK-0R
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 10:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40355)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5P2-0005fg-Lc
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:22:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5P1-0007T9-Pf
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:22:04 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40494)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP5P1-0007Sh-FK
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:22:03 -0400
Received: by mail-oi1-x244.google.com with SMTP id t199so13298401oif.7
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 07:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WZ9gBOnZkR+w5AZji1QgSi2rpgUv4KYH+pVA6xYbRPA=;
 b=WI2WvsMKIE/aErhc1QKm7sAdGym79z1mHj2jzGOPH1rPw/wSjmVaUnIHakhymv8LM/
 hBunMPBXHuW4a30XGx/CBd3aV+3Cq+oVhIWVa2JgCbEkiviZQ19pDQDe3UQuTb3eAXiC
 Hyn5tNPM6XkqRMXY4zNBAEpBhgCku1lRWriLE/R81PjwozazFNDHRldt3QWZ3BHB+T77
 PQspwye5zaXNf6CqNMqGnHSiVS3fAqOV6iLAPtf7xrZ3A8wc/fpL7P7uecYM/uBHdyLe
 qN6cKxwXIGGReYTa4PzFYpNlK8wfzeglWIbfGJccu3985qWomvOt0XQkCSyXES1c46bQ
 CDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WZ9gBOnZkR+w5AZji1QgSi2rpgUv4KYH+pVA6xYbRPA=;
 b=ZUinC/pF6DRLsL4N/Hc8iZkCEz7uSs9/i5VhxjQIsp7eDMAIrO2gXKu9dXS8JxHjKZ
 K+rB3IfJFxb1HCoOFOzEqL5kngomxwh1N5/auIyD3vltTV35CmxJ7km9I90iN2mO54WW
 xQg89MuMOX5Pqy9EbcawErfFwFCtbI01J1LTa6D2idfaS19av0ndN063XdpBMAGuoLqA
 j7UVr+1+6ZDtOI+dxwnX9r9zeD1rKTKHP08raUGuILSdiU83oQnGGXd0Ie5EXJQJww2r
 mOEjqf4hBKTs2IxKScCujKSwYAdc3yqJ7WwfZGCRjDqXOR+lNKNs3ECDhNt2RYgfNcuT
 u1Tg==
X-Gm-Message-State: AGi0Puayd/pfob/E43zqichbqJe+MV88PDlKeYSr2SYerj0d51Fy8mYN
 ko7UPduHaDgEz1zrzwvY3n6NE531Qz00za5dYChiyg==
X-Google-Smtp-Source: APiQypI/ZW7KQbi2tOVCr9fowYpbISs8X6OcaboQhzNuee12PgfwNmYRPrhG26R1ocggjRoL8T+M7FnWidcxoB+mIXE=
X-Received: by 2002:aca:dc56:: with SMTP id t83mr2893971oig.48.1587046922400; 
 Thu, 16 Apr 2020 07:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-16-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 15:21:50 +0100
Message-ID: <CAFEAcA8hPAGSjKraTUQ99BwgROMA_BHcsUvJeCi=9vgeh04Msw@mail.gmail.com>
Subject: Re: [PATCH 15/16] target/arm: Reuse sve_probe_page for gather loads
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 208 +++++++++++++++++++++-------------------
>  1 file changed, 109 insertions(+), 99 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

