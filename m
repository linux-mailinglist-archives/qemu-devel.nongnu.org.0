Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B8096438
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 17:23:46 +0200 (CEST)
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i05z7-0007r8-V0
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 11:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34175)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i05xT-0006mp-Mi
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 11:22:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i05xS-00087Z-AQ
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 11:22:03 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:44518)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i05xS-00085n-4b
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 11:22:02 -0400
Received: by mail-oi1-x241.google.com with SMTP id k22so4365232oiw.11
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 08:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y6Ki5dUmafFpVbXIzk/GSG4kD2HSc6Q/1jjH1ORseMQ=;
 b=j4s/2GABFz/A1Y8QwNVEcIznvyp1Akmd9l/f7ZBnjXCYLnpmkNLFJx+b/QDQB43zou
 OHVF+GskobqORyMZrLmzT+0tykqiwzwjpOUDhuKSOKYRgHcW0EfqGG7k36OBmOo4oNyW
 Z9r0uSJcy+BVX0L6H8NcYj5tPcoA2rYdSg7yyLax9DT3N4adsU3R/JeAnwO92JWHiqQN
 N8dcn+h9eZCBM+8GwK7g+yvr+ylSBaWVsNtWM+dXQWZC8vCQcAQ7r78Om40HSPGbwZXQ
 4NuGNZO84IuYHiBW7u055U93u7PNNECnHnavmJYkCvbvTJ03QfnVvt7eLulQAJn7fxC+
 pM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y6Ki5dUmafFpVbXIzk/GSG4kD2HSc6Q/1jjH1ORseMQ=;
 b=gIk9d/6c6bhNIpfr1M7tWCjzzUgNcEcdEibUuErf+dm0915LWO38gsPKFfSNvd8SK1
 OgDiXHBx8gUWJ+Y5EUcBcMBEmWGp0PSG7UvJakkH1ObYAj7jaHe5mA8NSMU2TxuSYlCw
 AN5yAfopVQMLXbXwBgyTalMDYeCf9bftkcz9555jL9C22+9ucIIHChe0ZI1EiqMFfas3
 OZHrTwxsWFVuo3+AsBpXNFAF/N7Tc9PhoPDec6BMcUgsLAMLoq1sETvwf7unyFvFhr9g
 txTNVWiuMwWd37WSQabjCgX5h6j0py0PQfecpUxAr0UZw+0fGC3wma0wAPU9HQqMVHd0
 jkVA==
X-Gm-Message-State: APjAAAU+rsB6XznhXqv9zSKxEGy1hG3Urdafc8ilYmy0prOoSt2zp+OV
 OlsI0rUs1cHMG5TlOwiqStIqwGmRoPHKPWp7JFk42g==
X-Google-Smtp-Source: APXvYqxIb2FRdBJttjpaf/rH3p6hKRErQs8SSBdvwQGJy37RPF0sZYBzz6nXc3fP+ZHcUyvfF2/gAF7ZO9HjRWFZMDQ=
X-Received: by 2002:aca:4814:: with SMTP id v20mr458521oia.98.1566314520769;
 Tue, 20 Aug 2019 08:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <1564481593-776647-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <7a3c6043-7fff-7589-875a-9f81754af275@virtuozzo.com>
In-Reply-To: <7a3c6043-7fff-7589-875a-9f81754af275@virtuozzo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Aug 2019 16:21:49 +0100
Message-ID: <CAFEAcA9PCk_zpPBDBxXJPYdLvJAE=Lyy_vcytaRMjdA7bCaRLA@mail.gmail.com>
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH] Fix: fp-test uninitialized member
 floatX::exp
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Denis Lunev <den@virtuozzo.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "cota@braap.org" <cota@braap.org>,
 "jhauser@eecs.berkeley.edu" <jhauser@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Aug 2019 at 16:18, Andrey Shinkevich
<andrey.shinkevich@virtuozzo.com> wrote:
>
> PINGING...

Hi -- Alex asked you a question on the 13th when you last
pinged this patch, which I don't think you've replied to
yet (or if you did then my mail client has filed it somewhere
unhelpful).

thanks
-- PMM

