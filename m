Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE239AF73
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 14:29:35 +0200 (CEST)
Received: from localhost ([::1]:55280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i18hC-0006qm-Mx
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 08:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57629)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18Zg-0000bs-Lx
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:21:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18Zf-0003VT-IM
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:21:48 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40446)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18Zf-0003Tb-D9
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:21:47 -0400
Received: by mail-ot1-x341.google.com with SMTP id c34so8554929otb.7
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 05:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qs9ug2VzD50kUJI8rgX0X3AUihll733jvDMEFt3Tuuc=;
 b=F0d79iMFSK/9iEqgFQCRL/nBWPci0OtkrIduBN7kyBtoX7V+47VVRnnwgWa+MLXmer
 x51Hb216ZGS71z7OHoznrPSiDn0DR7Am4t91H8MKCmXTKwvvMLAfmpIJsV5mA4dJLrrB
 bofkFMW/OKf3K/ctl5UWgrzkO+7oOIlg8Z24opd15UCn1zj6tQrUkuCwlIAaxfw8M9py
 u0ooMuytf1vGC994IXcCVpyCMQ/f6muGFXxwEEFRfAUQu9klQ2scnn7qBpF9LTAYymDN
 Y3fujXZ9XytMNztCi/ji+vCBIfx9eOTfPcZp07IAlA5MWSMYKjR4Ex4rNkI0qHOxSfPy
 uL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qs9ug2VzD50kUJI8rgX0X3AUihll733jvDMEFt3Tuuc=;
 b=pJDecsc1QVZLIJyPUn9XxqoW6NRuUFdeU01Eywc1qOzB2Cu+qvqGTACfQRDgcMwaeI
 lYt/dh70D0LfVShD9NWGoUJzX6QchgBz6R3ShJAxUxxC27uYAgc6YTA5dXCPq+PMQxCH
 LhLaxkNiKBRuYyQgrgu8Em99kvLE1JlrDlAWCOn9vTB70867EsqWwEAM+JoWr/obRHVR
 1Jc/KnfDKVI0YvS7Rnd2crsfXu8NOXeMHdH63jtpNWnNRepo1XSHnggtNjYVyo+wPWQS
 d1IXTScb3EiayJSYHLTiyN/mzZkb2LLfdVKglDItVPaDIX1d20hFUF01YOOe0/sK1NMb
 YKOw==
X-Gm-Message-State: APjAAAUVYuEp+gjSWyTMDnWDLw5414us8G2yzgOeXfLuuihf4Mg6qOGi
 fe4ujaOwrPIr/REdWD4/yEPRCW5xQFm3v2EbW492Ng==
X-Google-Smtp-Source: APXvYqwY5vBBwl6y7EOowDZppG0IeKdE+P0SMxkpxpsjlCCdvIKZGdrKP1Tc8UBbyOXgemCaQG7LEKETH6kubZFos1U=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr4043233oti.91.1566562906818; 
 Fri, 23 Aug 2019 05:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-11-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:21:35 +0100
Message-ID: <CAFEAcA-mP41ie=4e6KPjjVekPTMTMvqf9FMMh3FJ2ZLFghGKjA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v2 10/68] target/arm: Simplify op_smlaxxx
 for SMLAL*
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

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since all of the inputs and outputs are i32, dispense with
> the intermediate promotion to i64 and use tcg_gen_add2_i32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

