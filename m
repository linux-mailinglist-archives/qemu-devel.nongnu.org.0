Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090DA50B97D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 16:06:29 +0200 (CEST)
Received: from localhost ([::1]:53980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtvY-0005r9-5t
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 10:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhttO-0003iq-1p
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:04:14 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:34361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhttM-0006zu-I1
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:04:13 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id b95so14677689ybi.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 07:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DvjpuFa6exvvLwJ8+EreIaqheaPFNf/vzBAIb9uV+4M=;
 b=DidfI+UkaxIvPGw1WbJzHpwLzaSzexuj/dsFjQs0wXu91398dHOYm+2MaitQAOo/z8
 RVa2HOF3bZ0XRuRAQ6mZDP1geHGpONQKj1b4wtE0hrYC9R6DBK04gzcjxzS7J7p40Go5
 h4CMfy3VeiDGGzb06DQPg648a/uGarw/KlzxexOdGDP1BRxgpsQJNtMPMHI+8oIE0M8U
 gploX4UI+FOjhKj64suRV6ulFpcWHsIHj2tIiyp2SVbWyWS2hqwUVIez7hpCJD9gEeDY
 4noSXGKHMAEmn3WZs3p8eRaWZ1YB7KX2xypASP9Zm/P9OGOevye/+DDTSvfW/NaKTmP0
 1ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DvjpuFa6exvvLwJ8+EreIaqheaPFNf/vzBAIb9uV+4M=;
 b=dxE+ylTLWUVnroxnfTpmW2BNxcbXFFAnSHWCQhMa5rDLTTQQ685bWBvwbFSG1dQNLr
 kPOZGcQWso5kc2ydhppgGL/KxLC8YL0oofY1WPyINgYLBU9B2bC3SVk9p68uLrqIYKvS
 bIOp+1yC4ygXVtZrNVvXnyNeunW7iTdyJ4UNJ39iOxnL4hhr+21y9mQu8NF8pG6aSDw7
 8wOFwcAgIWNw4KwP7XKKkF8a7SCSsQC8/qG6KReshT+Hcr5c8uNSTXJczNuzEUKwO36T
 X5u/QzCMYSpfD1GgfCqKkSIsZsdhM92OVEjZPl4u7qPF1x3EQ2Fg/Fn/SZ7GPzbueaIE
 r/fg==
X-Gm-Message-State: AOAM532KkuQczZAtYmajGyHnuNN8GUy1Mq2oCcbFcllQjZCEkD7eRu2n
 lhjVvD2K9H38nlrQVRZtFZbLrVXbRTEsW8hQmhuJ8A==
X-Google-Smtp-Source: ABdhPJx6wQJMpg8WPCVpPrv5H6uOuAXcrjEj3Oo/sFaA0GlsplnN9y9z5N/2eRwJFJj93TkT6kyN+/LkbqJEXLZrZSk=
X-Received: by 2002:a25:c60a:0:b0:645:d925:64d3 with SMTP id
 k10-20020a25c60a000000b00645d92564d3mr1509169ybf.288.1650636251403; Fri, 22
 Apr 2022 07:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-9-richard.henderson@linaro.org>
 <875yn1uskp.fsf@linaro.org>
In-Reply-To: <875yn1uskp.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 15:04:00 +0100
Message-ID: <CAFEAcA-Evh0mTHOzsk=dv9MAKjPcKmSVTFfKzV42zzRyZ4hUfA@mail.gmail.com>
Subject: Re: [PATCH v3 08/60] target/arm: Change DisasContext.thumb to bool
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Apr 2022 at 15:01, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
> > Bool is a more appropriate type for this value.
> > Move the member down in the struct to keep the
> > bool type members together and remove a hole.
>
> Does gcc even attempt to pack bools? Aren't they basically int types?

It's impdef, I think, but it'll typically be a 1 byte integer
rather than a 4 byte integer, with the usual struct packing
rules for 1 byte type sizes.

-- PMM

