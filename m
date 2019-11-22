Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E369F1075A9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 17:21:03 +0100 (CET)
Received: from localhost ([::1]:52730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iYBg6-0006Xj-Qw
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 11:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49903)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iYBdM-0005F1-6t
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:18:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iYBdL-0000Yt-6m
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:18:12 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42029)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iYBdL-0000Yb-1i
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:18:11 -0500
Received: by mail-ot1-x343.google.com with SMTP id 66so503144otd.9
 for <qemu-devel@nongnu.org>; Fri, 22 Nov 2019 08:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LczJ6ckAjjLNeFsJmGc6glSU11U0OB5HElVF056rojM=;
 b=yFi8ifxsnMoRbvxJQQa6OWSVuw6ZdAJ9yCBdRH8kHSve+FS7tuiZmr1eUhj8dDQTd/
 i5IkBM1qGcvBVrm00bTvjzBpxuvCafkx3ZEpu2xO2aB14OE8ejRmwCI0CAGmc0tjj4nI
 24mZHDxUxw7idO0/rln2k8PCuccxkDI0O3tGH3II/dwqpF0ASzOYpkZCPg+Q0AFIMCXj
 D41CeuJpTkyrz0jeGQgK/2o20CbS+PudNJvq7w+FoFE084CL0MjU17U5PwfoF0yvJstB
 d+jS+3c80Tpo3jxo1srmyr149U4n4+sDPiAhq+P5pmIKUznqO8LjaUAHIKvBZF3mdNB6
 EuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LczJ6ckAjjLNeFsJmGc6glSU11U0OB5HElVF056rojM=;
 b=LWVvT4WLKaVSwnIIlID6G2FUWhDYOuH18s8iNwzvK8/Cug0qaMrRO5pDuHqAQ/MiNW
 UvfGON4a77D8dPlZsd6Uf4MgGz27jS6KmPFhuAdyekRAlKA0HZh0B5ilVuAWxCTlAQ4x
 Ha1agDeHd/Ofp69XGALNCoIGkmlHi4Ht/KZ4tHJwQk+oVoQFlnYEID5hUPDsahPmnJao
 TAzjOaafzopB4SSqdtJCsBb7IP4CngKO9Ziu/dZ+mZuFQcE/tTXJk6hU2oRm2NoMj+CX
 cYe4OgbpOKw0IA9atOWFIpE0FDupJxS4qrlFjE8Lfm1mylBM1t13iPjRfFXg0QUqOBle
 XaoA==
X-Gm-Message-State: APjAAAXxmV70GgJPYg2KUq/+jcTFslblYJo9a+Q4sNzWv65yInYjT+cn
 +puFw5WaWVZstJtm55gcMVp8vqywijKpPStgqCQUMw==
X-Google-Smtp-Source: APXvYqzgh05s1iI2tEwN7iAGgn62cm1GV20iVALbdTaL7RpzJMzUF2i9iFpS4xJfHPQ4M8TM3rTX3+POCIRUfwXw3CE=
X-Received: by 2002:a9d:68cc:: with SMTP id i12mr10452158oto.97.1574439490115; 
 Fri, 22 Nov 2019 08:18:10 -0800 (PST)
MIME-Version: 1.0
References: <20191122160511.8377-1-kwolf@redhat.com>
In-Reply-To: <20191122160511.8377-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Nov 2019 16:17:59 +0000
Message-ID: <CAFEAcA_JU9GfNYDuD2K0MKmAD7GZ7vBUHsXU+WS-6mvPCvf8ig@mail.gmail.com>
Subject: Re: [PATCH for-4.2? v3 0/8] block: Fix resize (extending) of short
 overlays
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
 Stefan Hajnoczi <stefanha@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Nov 2019 at 16:08, Kevin Wolf <kwolf@redhat.com> wrote:
>
> See patch 4 for the description of the bug fixed.

I guess my questions for trying to answer the "for-4.2?"
question in the subject are:
 1) is this a security (leaking data into the guest) bug ?
 2) is this a regression?
 3) is this something a lot of people are likely to run into?

Eyeballing of the diffstat plus the fact we're on v4 of
the patchset already makes me a little uneasy about
putting it into rc3, but if the bug we're fixing matters
enough we can do it.

thanks
-- PMM

