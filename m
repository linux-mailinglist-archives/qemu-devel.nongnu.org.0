Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524D41157A5
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 20:18:07 +0100 (CET)
Received: from localhost ([::1]:44410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idJ77-0004nO-Qs
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 14:18:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32994)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idJ3t-0003Gj-Hq
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 14:14:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idJ3r-0004Xb-Lq
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 14:14:45 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:42470)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idJ3r-0004Vw-2T
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 14:14:43 -0500
Received: by mail-oi1-x243.google.com with SMTP id j22so738340oij.9
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 11:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L9MwmijQhT1PhAmb0lKFFAliXL6Ys+bHHveI02HhyzI=;
 b=P0rLVNyEGSTpArs/701yoQtasc/6M1v8HSdQm2EsUuJa5niLgxBwmeRamdYUNtDYs/
 lPdhTpVH6fbazJ1jC2/uOILCmDm7tQKRqPwK53X2liH2ELqLPGx9Lgl0AUDiXD4HZ9Ut
 YoBcTjeHYUnQ41L99BOlk1h4v124/nfDxgCFLmNAIodpM7a5aouClxex9Mc5/NMCVaMs
 tuF8/QE5lEkxcE96hqPFCJvAqk9/b9wynO+Ey4+kUKzSV8l9ISO7LGVD0ncW3TIPc5OP
 djbrSRj06q6MpFEVV6EBADGwCM+M+Ntc8bzlSv74ndL4bmaWnuhqmkTHR25tMPmbCmZ/
 35LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L9MwmijQhT1PhAmb0lKFFAliXL6Ys+bHHveI02HhyzI=;
 b=lBPammpaaC5fJcp+IRn6C4jU2of8CmmBkWBAk8y0cnAFACh6evZbjAt5p1bCQH8zZd
 /oZy11ZkThxdzBKuxgbsUqCtvhU+KObvk8tkg3bLVjhtGUNA8plZhH7k+yuyipVtEvqu
 cwq0dZDwwY456MesvhWNn6jTtUCM+4jDmV9yeNQi5+XtJEu3XvyM5SOAqhPznM5qgjnp
 K2AUxvR1SnMOsf0fBDZ7EO537rhszZLg4hUWvzGasqllxpt5GLGNwY8bQrbk7XLc689S
 mwcsfJN9De4KdJtHOfZ8jYIhbsHyts1ZC8jUzIr8XeEyDVKV02cK3bHqINomsBAGYP9S
 jyzA==
X-Gm-Message-State: APjAAAX115+nr8PsFzqR589nCkHhhQDt2VFTpJMf203qZPvzPV7MKrer
 oScLnfKeo8wXcW6xLAwqSFIdBy4WhQXZCJEMuQ3Uog==
X-Google-Smtp-Source: APXvYqxDndtJvMRyHjriM3uaingDrzrJ8C3JJjiv/tq3LEiGtaxVymthY09XF2EHSaAm3oq9z66ej8lMIczOP5fCZuk=
X-Received: by 2002:aca:f484:: with SMTP id s126mr13113972oih.48.1575659681590; 
 Fri, 06 Dec 2019 11:14:41 -0800 (PST)
MIME-Version: 1.0
References: <20191203225333.17055-1-richard.henderson@linaro.org>
 <20191203225333.17055-12-richard.henderson@linaro.org>
In-Reply-To: <20191203225333.17055-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 19:14:30 +0000
Message-ID: <CAFEAcA8vbCcizkqJc3Sp+_tBjkPXF2vF1tpmroA0aVaAuA5n0g@mail.gmail.com>
Subject: Re: [PATCH 11/11] target/arm: Enable ARMv8.2-ATS1E1 in -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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

On Tue, 3 Dec 2019 at 22:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes enablement of ARMv8.1-PAN.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

