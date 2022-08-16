Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122985957AF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 12:11:21 +0200 (CEST)
Received: from localhost ([::1]:46394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNtXc-0002dL-4m
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 06:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNtSq-00042V-6X
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 06:06:24 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:34533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNtSo-0002s2-DW
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 06:06:23 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-333b049f231so26080987b3.1
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 03:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=nj5CYFBzeUSey2i8rGPQhDmgbPxh3BPDWQVX54U0AUU=;
 b=lDnjUQ8oLG8axquGD8OqHK/vSl1oDd1vrXjO/w3OiC/vzsxqW5LYT89WLOVsEQAqEz
 3LlT1PYMPJJw8AmzxAuZIQcOruyzl+Hc4RbcgtQtawjec2tilOXR3Yt1D/ozq1iGE6FZ
 gPuXrwY1yXtFXLyF/5JunCfj0o/qyDqsRcEeH5HseTj7Lbyorg0aUjkD1dNwiP6MoeA5
 xbxLgToz/wZLRCBNGLqWk447t213aBiJXQ6070XDDwZmM1Oe6R0NbqawM38vv3N8lArb
 XoDHQkIOr7l8tsiMOPwX8gOkP6mZ3fupLyvcGRZIRpPBFgzdbObrvHbA0lG0ZWABbvjH
 w93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=nj5CYFBzeUSey2i8rGPQhDmgbPxh3BPDWQVX54U0AUU=;
 b=jXBet+/bzNDTc4NEsuqkQS4DP+4cSmIhLomrH7gFTS9wGaAtB0zJ3oatIELXE4kUQ0
 DqmNpLHr7STvsOVl89SmQNIU2gfshJuZLQBdeQFqGdZr3dDrW9yFzDeLY+iE70kO7nLy
 0GjE3fQnIlur5FYDaIeFXXs8bsx2J9FavGC+WAxEn9sx4xPNZ7n46bl5VVVZuU6OxyE/
 OtQtwdIWEYRR2eEsnDLEMkAwH/mdYcNr8IvOPB8zrUGuEEWZ0KPutt5Z63I5tyg+ENb8
 nnKlgorJgcDNXaO3uA8hLBcTGBzECqCEg3JRT4ey8En54vmCgkUeyLlHB2X/ApGu4EiG
 97Xg==
X-Gm-Message-State: ACgBeo31ftz7UZplSxr3Ns3PrB2FeqaAlYMlsC21c3n+sK1Zm6NZUN2C
 e08kNTzBIACLsYK2Oq/PvbmfLR6Ucf9VYacGHzX6oA==
X-Google-Smtp-Source: AA6agR6xdZkurRaeaSnddhLsRh95GjMHu3H7Dj5Req3MIrdmnMvJ37kZYo14keDq+anHMJjx6cqA2uOQKUzE47vMZVs=
X-Received: by 2002:a25:40cc:0:b0:68d:5ef2:67c8 with SMTP id
 n195-20020a2540cc000000b0068d5ef267c8mr2517617yba.39.1660644381216; Tue, 16
 Aug 2022 03:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
 <CAFEAcA81OfC_Z_uQvrSRUKHQf4mmOgbLrHYiwsfzmgH8u8sUqg@mail.gmail.com>
 <CAJtCPL3yNpNkK0Ljzo=QOFX_gLQtGGcqDoomwJ+RH0hq5G=YQA@mail.gmail.com>
 <87r11gbjbv.fsf@linaro.org>
In-Reply-To: <87r11gbjbv.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Aug 2022 11:05:40 +0100
Message-ID: <CAFEAcA-6X=ptfDXGWA79-L9kRCQRq6jtci7ODPy0Ct369_EvCA@mail.gmail.com>
Subject: Re: Teensy 4.1 Implementation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Shiny Saana <shinysaana@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Tue, 16 Aug 2022 at 10:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Shiny Saana <shinysaana@gmail.com> writes:
> > I personally don't need any of the GPIO interfaces, but if needed
> > by someone else, that could be a good second step to
> > work on once that part of the board is implemented.
>
> Handling GPIOs in QEMU is fine (we have things like the qdev_init_gpio_*
> functions to handle them). The problem is usually what to do with the
> actual general purpose pins which aren't wired to something we emulate
> in the board. Some boards expose their values via QMP properties but I
> suspect whats really needed is a generic mechanism for exposing GPIO to
> external scripts rather than have every board define it's own thing.

Yes. However one key thing for trying to get a new board model
in is not to get tangled up in trying to improve/extend
the core QEMU facilities for something. That's much harder
than "my board model supports GPIO output lines to the same
extent as the other existing board models" :-)

thanks
-- PMM

