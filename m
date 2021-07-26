Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3793D56F7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 12:04:07 +0200 (CEST)
Received: from localhost ([::1]:46606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7xSw-0002Ua-NL
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 06:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7xRg-0001QQ-Hh
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:02:48 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7xRe-00087X-02
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:02:48 -0400
Received: by mail-ed1-x533.google.com with SMTP id f13so7072207edq.13
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 03:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m4VkulIYQcMhIJJ2RLtcbuvBhPAP3tn/v0h72b4fJeM=;
 b=QjD3cZWr9hBORB3y8gA+4zsv153/Mv5171AlZ3Fl0eexKu92DN3n/k1sa2+p+pdGll
 luCI71ynBZUsM9ylg//hT10cwaANwA3/0KiL0iXhlawLa4DviNq7d0Ki92mFK+OJ2uAZ
 sdfjH8zETjLdf5OZbiiiQi7LvquY8kTv9bKLYmyS3Nu6Q0mjx62dvQVPWi7JyysP8AR+
 k9ppihKYAy/iuTOF4lfeoq44vhh4147v9gbr0R8Vr769c4Z/UVzSAxDuNocAi6aeAtnv
 TtlReCqFJGWofNwjNE8ZWwC+RotrVT247HC1iDMUfkubuXX+hCWmb0mM2URY0VNSFBb4
 7o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m4VkulIYQcMhIJJ2RLtcbuvBhPAP3tn/v0h72b4fJeM=;
 b=LT84ffe9BTfIIuKCg0yFUCKR3y6o0hdiGs/H5kovVqbzTWMTP780+QPFdztraZt3jj
 Ay+pQ6TXY5XK28sKQ1gHVREUHzpEwOH1ZjtCfxctEDCjsNVyPrGWXxiTtwq4qP9SuDNb
 RpaiaYCu+Obu+2xAtkWfGWk1QgZ97DL24a5yQkWu5evwwS4ih4cqI6ESE7WR04cETUHq
 6fswKkjuK2QoRG64gRnqa9NVgUslRwMJhv5Ew7jez7bIisdgIUsWKfmth4attbI3mHV6
 Pq7IbrY+BM5pPWkR5t/cWDNo7KHIhVgoIRfzl6nGWYyIhJA7SvUhbwiZqDu8pnGJoPVO
 baRg==
X-Gm-Message-State: AOAM531puRB0aj5KaV4XLrdyXsd/ZUBljOjmXpgvYjZaFGMKX9qN/M5T
 ezt10SvDxNiurT0xIjSK3GaXQDcQPjCCSX51B50byA==
X-Google-Smtp-Source: ABdhPJxzKOAXz7FyJdx2ZJFwRupphhf39Y+5bWb4FSb1O5Qck6l5nhD0maaE8b79lzGxNvIE8jGgVRlNUenwp6Z1tjU=
X-Received: by 2002:a05:6402:1ca4:: with SMTP id
 cz4mr20400397edb.52.1627293764011; 
 Mon, 26 Jul 2021 03:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <1627287631-6595-1-git-send-email-ishii.shuuichir@fujitsu.com>
In-Reply-To: <1627287631-6595-1-git-send-email-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 11:02:01 +0100
Message-ID: <CAFEAcA8dJ_=zroP1vuXA2Lndq=ahTjQ8N=jXSzUDvBmw-QQmUA@mail.gmail.com>
Subject: Re: [PATCH v2] This is a test mail
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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

On Mon, 26 Jul 2021 at 09:21, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> This is a test mail to check the behavior of my mail
> because it is not listed in the ML of qemu-devel.
> I may send several test mails.
>
> I apologize and thank you for your patience.

These ones seem to have reached both qemu-devel and qemu-devel \o/

https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg06355.html
https://lists.gnu.org/archive/html/qemu-arm/2021-07/msg00391.html

-- PMM

