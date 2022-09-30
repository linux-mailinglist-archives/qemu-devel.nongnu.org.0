Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754CB5F0C82
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:35:52 +0200 (CEST)
Received: from localhost ([::1]:41764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGBD-0000xu-0L
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeG1n-0000Kh-To
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:26:08 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeG1m-0004dq-2g
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:26:07 -0400
Received: by mail-ej1-x635.google.com with SMTP id dv25so8999400ejb.12
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=wk+M8yI53R91Z9Uq4Hj8qxpXLZOye7EmHbtxXy3z9pg=;
 b=ORnXB7klSDwgtWxmPVzZ3FTKVV4YEl0tNjxG6nXyaLxNyGjUxG52I2u5TowPdWCOrq
 Dd46ZIl3Wt2Y4xA+WAkaCYD+q1T32JRct/ASexy9YjpxkrD7PdYB+3i4CBAJlTRNAGWa
 iQ8E9GJjdlyhxa3rhPHlqJy6r3Yk8lCDH4ATfBhmH6macZ6DiaycXjexBLPhSQ9G1Ta7
 wmbX7WmChv/SK+gOKVIvVIHwWIXyK+95uBMphc7Rk382vUMew9m+NGcZEeAygc6N2RnO
 CDeOSeUBeV8hKcX+NkAaJ9Uw8GLX+n6vqn/EE4QNtevWtXibZSeD7BFZNh+sFNzELG/i
 260g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wk+M8yI53R91Z9Uq4Hj8qxpXLZOye7EmHbtxXy3z9pg=;
 b=f4SAP/ozGdXhUg0OTHMY7KcK8StnMDPwXJfMVsQbTj5i6VUX0UyoVlWNGglTLJ2vBF
 Ee+T4Pb7XjaV9Ef/VPAUijsEnjMRbHlsZ/usMbl2s9/d0GdXv829gDpVOzYyKn16Zc+T
 pKc0FRsk+iSqP/bWYjy3LAhVB6O7ROsyOg0yCHTMeCV6fzQRH1jIJi6SuSbeQOQnIkOx
 Yw+APapnw9NIgkIcFSTy3popf+aATbg/11cYPJqWA51Wz64vAScuLCjGbgyYLgwka+2y
 zUGPu2yMa9SQcIZb353PmyCTsgmtubtGpdolQ/C124pkLvcWco8eI8a43YnEzl+Qa5yX
 6t0Q==
X-Gm-Message-State: ACrzQf3wDhs7BLkzG9i4/Am7hxrAe/dDGjXRCdaaMs2GhayzmDCNKpbW
 b0bIgJMUUiaTqlopOt0AUkLZOF+H0+kbbFZN9URDaJsVVt4=
X-Google-Smtp-Source: AMsMyM5iRte3YI95/n0TYTgva8RflNAkFFQ0ExShMBLYhl/AfyeM83BLl5Hrf8v5DjD3IC/iclQS6nWMAfOgtBTvH7g=
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr6209983ejc.504.1664544364004; Fri, 30
 Sep 2022 06:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-17-richard.henderson@linaro.org>
 <CAFEAcA-WzwA6zzDFezBqUz8U7ZT6q9bCP0Jj1iXfHydDe1nvZQ@mail.gmail.com>
 <87pmfdxagx.fsf@linaro.org>
In-Reply-To: <87pmfdxagx.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Sep 2022 14:25:52 +0100
Message-ID: <CAFEAcA8c2_U7YMBej-9Me43bTLz=f8e6oemNy-kFkPfAwZ-+=g@mail.gmail.com>
Subject: Re: [PATCH v5 16/17] accel/tcg: Introduce TARGET_TB_PCREL
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 30 Sept 2022 at 14:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > This is going to break previously working setups involving
> > the "filter logging to a particular address range" and also
> > anybody post-processing logfiles and expecting to see
> > the virtual address in -d exec logging, I think.
>
> To be honest I've never found -exec logging that useful for system
> emulation (beyond check-tcg tests) because it just generates so much
> data.

It can be very useful for "give me a list of all the
PC values where we executed an instruction", for shorter
test cases. You can then (given several of these) look at
where two runs diverge, and similar things. I use it,
so please don't break it :-)

> > For the range-filter stuff, I'm not sure what to do.
> > Alex, any ideas?
> >
> > (I see the -dfilter option documentation doesn't say
> > whether it's intending to work on physical or virtual
> > addresses...)
>
> I have a feeling for system emulation phys-pc is the most natural but we
> could extend the filter spec to be explicit.

...isn't it currently based on virtual addresses, though ?

-- PMM

