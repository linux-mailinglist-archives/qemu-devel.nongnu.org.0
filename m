Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7856F575186
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:15:42 +0200 (CEST)
Received: from localhost ([::1]:47404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0Yx-0003OY-Ty
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0Qp-0004ha-TX
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:07:12 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:35750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0QO-0000Hn-Lr
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:06:45 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id e69so3710855ybh.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 08:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w94TND9b1ro3SswaBU70jxy93ghQCxNFLgV1cF3V5SA=;
 b=iwfLnoBmBzuzNHEEr8Fg6rwPkCgB2iN4D+JFd93qqJBoN/jQc2WJrKLW5208/ZzQev
 jLQhHpmcAtZ7W9Hc68IioteZx7qFnzFZCej0IpSkWibEEBij0OB15S4E0WSQqY5txr4v
 TYaEO66hmOd9BpWJ+qqs6FqtPa5Vrkkx8hLFUrRL3bT6YfROF49QSPvOfGXjlhmsFkSW
 nYwR3tq5/69CbB7a64QojXX6gri4qMBNqBYQL1rNJ92nWfOwoK2jk17O1mRzEANEcpg4
 FROdCRFBJ/kO5OWKjd2GxfxcI1CSIt71hgDAQVmEKXdgyZ5QMvll3w6K6wKQZzkQBkz6
 HqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w94TND9b1ro3SswaBU70jxy93ghQCxNFLgV1cF3V5SA=;
 b=0fqg9WBA7NOPy3g51gR9JZoamP12sNi5nWoAeuVUpzBPpfsiYMkGe4n2SNS0/4Bvnq
 6PSiCQf02Bacg0q/pCrMihXprIfH0L5xUPavNojCU4/gd+3ouT+yUu58+CqJc3BoM7hT
 qIIf3xquP2mKi3KQQcqp2idLEhmTpD6EskyDQgmvF1qmOwp78RGgfffe4XgqoeNzn0ee
 /TiGxvRnv32N9R4H/bm4ISqdSR/HHNJcO9OZBn96Kf8dPcB06gswcvW8sk6kVksWOIUC
 ur2z6R++tgRNcOoROWXAI4hg9jF0f6rrMXFPaAMX83XCjLcftwXpeFAawfCQq/Kbqieu
 s9hw==
X-Gm-Message-State: AJIora+UYTRHo1iUZIbRfoteRYVxwP5AiPJcEkSw4ntSqWUX4bU2oS5p
 mK0yEsxGuv5mOqHsbtf3iYo9Mf3IOzj8zgUCffQ6DQ==
X-Google-Smtp-Source: AGRyM1vl48GPEq1M5leSdA3ZDXpZkY1hWKQLBvcDACY9uQFnkRU0JjQR4qCJs/5xZdz3io//5GJ6IPwlVHYS3MLsF14=
X-Received: by 2002:a25:cb0e:0:b0:66f:7b31:3563 with SMTP id
 b14-20020a25cb0e000000b0066f7b313563mr9234177ybg.85.1657811203552; Thu, 14
 Jul 2022 08:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220713081735.112016-1-shentey@gmail.com>
 <20220713081735.112016-12-shentey@gmail.com>
In-Reply-To: <20220713081735.112016-12-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 16:06:04 +0100
Message-ID: <CAFEAcA-M0FeDRzcBeNyr8HMxvkrM2Esh7pFvtAZ_Zn-Z1qiofA@mail.gmail.com>
Subject: Re: [PATCH 11/11] hw/isa/piix3: Remove extra '; ' outside of functions
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Wed, 13 Jul 2022 at 09:52, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Fixes the "extra-semi" clang-tidy check.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

