Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502A09AEB2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 14:06:42 +0200 (CEST)
Received: from localhost ([::1]:54792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i18L3-0006IX-8I
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 08:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54528)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18IP-0004Zq-0k
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:03:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18IM-00032Z-Qq
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:03:56 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42837)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18IM-00031r-Lp
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:03:54 -0400
Received: by mail-ot1-x341.google.com with SMTP id j7so8502096ota.9
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 05:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6+4y/sW/1VgDa0gt6P6z+fL5/QwCG+5SLlLJ0r7ArZA=;
 b=MRV2snWKnPImw7vLfXlLNcnF8jHrBUXVCbSr19sCTQxeas9immvqfHLAaYo4Pb/Thf
 m4pIcW3yRuiu8mY7ZILnINPkcVbw6BzHLWTdMZZu1SFcj3pqTNy/YRkA4MxxqGSgOK1v
 JjsWzmFwpzhWRBct1XGlPHN7zwAlZ11dyr8VOqa5Fveu7g6fv+9ZcgIRCuQDjGYMES1l
 fApWQ53alBhpjG/WxsqdtWhcdGMNQo5fIckUt/IXHJgEdvFiagAPEolb7tHh/3vFGbBX
 Y/S8npxBCx95iQpELwre4xWURQPe9Ts49ZOFXvGE2oUjEoVEe/DKeNrOn+icZENJIjQt
 ViPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6+4y/sW/1VgDa0gt6P6z+fL5/QwCG+5SLlLJ0r7ArZA=;
 b=i/N0MVAYSm8KhEsfL4rEJgu3ct214JhGMDDINyw2y6QEAw9uPAIHhAIhYpoLExf5Oy
 cKq7dcRgwSeJPAdwKNFTzE1JxGH2w6J0fsxRc+9P18gcuO93Jyijws7oDkUkZHS+TwoB
 RdsAKXS6s1ZRGkVVkJZNgVDtcygYrUmI0H/ADFXtGh0jpplMFzgcsLe31NOp9ZdOraDf
 Y5Bl2Ngu4CxUj8zuDPirEigA+fiJPHWXqiJZ3mUEn5owCbWRgrHlXrzaMiMiZ7A7HIeO
 B4ubZFz0PoXAeqb0DoHLplC0cj2FWUbDdZETg1FOklRipawbDeiFb8grmJkK3kedYZfq
 2vuQ==
X-Gm-Message-State: APjAAAVZeGemm9AQf44ePUNk5SJNnZWeCYTPOmrlpeMcVPQlUWZzImlU
 OuA6S4IVtVgxEPdiEn/49nfydZYWYJ1kOA3kNh8NUw==
X-Google-Smtp-Source: APXvYqw68jnZB+7iqNINFeuOhSwEFhrLhdzLajoHuJ5v0wUnjyyA5qpozhTPXt38pJbvyQ3UmvkvWws+eko92E0g7qQ=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr3970601oti.91.1566561832617; 
 Fri, 23 Aug 2019 05:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-19-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:03:41 +0100
Message-ID: <CAFEAcA9xx_bDZ3hf2aTaOxPupmSFQ11g4xTsHow6nxn6j2ZcEw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v2 18/68] target/arm: Convert the rest of
 A32 Miscelaneous instructions
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

In subject, typo: "Miscellaneous".

> This fixes an exiting bug with the T5 encoding of SUBS PC, LR, #IMM,

"existing"

> in that it may be executed from user mode as with any other encoding
> of SUBS, not as ERET.

Should this paragraph be in the commit message for the previous
patch? This change doesn't touch SUBS/ERET.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

