Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC5F9AF36
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 14:23:04 +0200 (CEST)
Received: from localhost ([::1]:55104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i18at-0000Yn-Ii
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 08:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57197)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18Wo-0006TV-U3
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:18:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18Wn-0001kh-Nf
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:18:50 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45168)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18Wn-0001k1-JZ
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:18:49 -0400
Received: by mail-ot1-x344.google.com with SMTP id m24so8521168otp.12
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 05:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I0C3/joVFUOtgynTDfg2nK4FAcVaShynoVdQ7RiFvBw=;
 b=jO5nSRTW7/h6jcJGHBgxceG3GfleWSGUtvPR67mAXXhEkboyDsT9F43toEb7UxaaFa
 TKHst7h2msJumUDGshP6hnzcfq7OiUTWNPU3gVh/XGapi6DFrtLeruzU6fDRvAwZI0wX
 fw59cb0oczyD1KFlUIQvO8t6K+erpA31iG8T73j2ugT99/3tidtJKGar/djVOHIMIggk
 6zwagODiotSN+azCBSwmh9Zyq5zkRSpiAFDJe7wyAc5j3tgNryGBMcFPpzH71dshVRU+
 aqlI/DMXM9zdfyikhtIzmssdeWggcedyB3dWpFeQ8X20nQtd/OPCTkqfo91lGb4+pH+w
 j75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I0C3/joVFUOtgynTDfg2nK4FAcVaShynoVdQ7RiFvBw=;
 b=bw+MR9ODiNMgprpbTySDmPozwQFAQI4g+e74NIemnAS9Be8w16hNUdC6IpjA0lE5BA
 XkZR4HUqkkIe4AB3U/hWJeGqBDJ2z+dhy6E5wk0XxGcICzqvy0iunDuomvqD1solxcD7
 P/O0FT+Xcbqff/4TmGFzOyxYi6YKGUsVtsiLVgGPpvUFCIN2xnpcVFIih8+IAS5xcYVu
 89fC5HNDLer81aJG+YBKN3Tz/x7ZgqtS9yOEMQqrxqoOyKwkS/H0qg0n/GtAJkrlByMC
 ldGT+2oG13UlEnHRA/RNuPDAigqN24W8J1n1+UoGWOzh0vYWFbNR1umFAiQz/l3Iw46g
 A3yw==
X-Gm-Message-State: APjAAAVv+zOShCPr9QCRq+2OO1utagJEDJ8w8R7yRldIZxEgX/1j9F23
 stb+7U9geVnLboF2vPYo+m2fdQZH0K34jux6kMSSPw==
X-Google-Smtp-Source: APXvYqwkfcdXQ8J4levLuQGvtQKY+AGBZlVLSiVhWTgr322rFP4/3HXqCfd8OijbLDUZVWkZ4NLYtdO0fYA1K8h8TXo=
X-Received: by 2002:a9d:4817:: with SMTP id c23mr1031355otf.97.1566562728883; 
 Fri, 23 Aug 2019 05:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-7-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:18:38 +0100
Message-ID: <CAFEAcA96pH8LSKPaYq9yDpO7nmgxw8LTChRvcEz3M6MKK4+Fdg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v2 06/68] target/arm: Convert multiply and
 multiply accumulate
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 248 +++++++++++++++++++++++------------------
>  target/arm/a32.decode  |  17 +++
>  target/arm/t32.decode  |  19 ++++
>  3 files changed, 177 insertions(+), 107 deletions(-)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

