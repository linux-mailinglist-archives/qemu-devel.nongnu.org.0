Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6990010252D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 14:09:10 +0100 (CET)
Received: from localhost ([::1]:45198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX3Fl-0004vh-1L
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 08:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32770)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1iX3Ey-0004Sm-2J
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 08:08:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1iX3Ew-0003ya-Un
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 08:08:19 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:46811)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1iX3Ew-0003y6-Mn
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 08:08:18 -0500
Received: by mail-lf1-x141.google.com with SMTP id a17so863209lfi.13
 for <qemu-devel@nongnu.org>; Tue, 19 Nov 2019 05:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=OLoB1mYloJZ1qAv1fr3m3TE+Hwm/SR+b7DY4P0FdxaU=;
 b=Slr3uO5s8Vq1uJ+1GD8H3VZZ2F3DjPsiavM33vVqJhrtT4bhADokKXnxUYiQKiTOWJ
 rVG48Ajc1BUHUJ8+uazGcb4C3wBc/8FmcuNnmju1TI9x5+VV8jBkORS5WLYQ1jLb9g4D
 FHVJn4yMbDiHAtKeXBToQ6pzdb7XBSce6ezkr6pWcb1hENg7LS538Csd5sc7AV9DAsfi
 PbZB/FI3McZ5wrObTH8oISU9xThMizsPrNGiJdYays1xBHbF7QXj0b9FIDk/efUxCr85
 gpjiKLEZocaE6z5cccs8oKQU8cUzq7cyLMggAogr5PnSvF16Y+iv0Uz/QsBgx14NYKkw
 Kcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=OLoB1mYloJZ1qAv1fr3m3TE+Hwm/SR+b7DY4P0FdxaU=;
 b=ZcLv7ad3LVjDgMHYrJ7VxLMaQemtbvP+1Gu3Exvm6jYokNzMVrZsNYpU9Kf9sNHO7w
 Ys9955UnlFzcBr5QHUCctbxTOY+xCpz4uV7OE4FHPv/UwJpRPZBC94+VwlJhyHbDXuhl
 6b7uvdiIdgJtCE01gEBnX3/Y1lmIGfHke5Za47yZiSCcUriiz8i2neJqKMxHFIgKLPql
 IQGUYYGEG57zF1/gIYsN2JuXAn9Txq5KcL86HRxL9EGft/w0A0hssG+nWQgTHrSOATb+
 Y+XXjvyAS0d2QvzkXLmr70ucE5SpRWaEauUPYZmiAdFg5h9hN/jYzcWLYQpZXND2+iqh
 sNVw==
X-Gm-Message-State: APjAAAWJj1Tv/BnMsKLrzfSu18iH2c1tnjWeSzCQCEUGWdEhYQUJEFTh
 nuRo64pMxTxEpljz6XKk7kkTAzVOxOZU5NWLnOvE1Q==
X-Google-Smtp-Source: APXvYqyyDuuln1HUDJndpMEil8tF32V+YbnWJKa7jCpS6n/XCRv4FDIjfnj4QxW0v371GzeFDUSXdjy7I078p+Y6/ik=
X-Received: by 2002:a19:40cf:: with SMTP id n198mr3813645lfa.189.1574168896648; 
 Tue, 19 Nov 2019 05:08:16 -0800 (PST)
MIME-Version: 1.0
References: <SN6PR13MB2272A9BECAC02344BAEFDED5804C0@SN6PR13MB2272.namprd13.prod.outlook.com>
In-Reply-To: <SN6PR13MB2272A9BECAC02344BAEFDED5804C0@SN6PR13MB2272.namprd13.prod.outlook.com>
From: Robert Foley <robert.foley@linaro.org>
Date: Tue, 19 Nov 2019 08:08:05 -0500
Message-ID: <CAEyhzFvPD2J6FTXQiTmmq7XJbbEwAU=VJ1PnOrynXpSe9h58cA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Do not reject rt == rt2 for strexd
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:
>
> There was too much cut and paste between ldrexd and strexd,
> as ldrexd does prohibit two output registers the same.
>
> Fixes: af288228995
> Reported-by: Michael Goffioul <michael.goffioul@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Robert Foley <robert.foley@linaro.org>

