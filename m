Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AF337AB46
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:02:31 +0200 (CEST)
Received: from localhost ([::1]:46012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUq6-0006dK-BG
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUlG-0001fa-TY
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:57:32 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUlA-0002zo-B7
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:57:30 -0400
Received: by mail-ej1-x629.google.com with SMTP id j10so3465815ejb.3
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p2rJ0zoo8G2DJw8BhlBTljLEehJKUUHaIUJln9zB0Oo=;
 b=tVKLeLOjIAbNuYC/UKdFt7maKQ4YbwfrXH0ONNBPE4TAFPuAa7lYdEU6AYqCSzzn6y
 2qqj+/N77mHQAxFBLA2ngqgvq8F0tc/UsYtQZm1WT5t+aB1cerUptwTjjHMAUb5GbJcn
 ezpeHLkIRZFaXHl74f4/DE/eRe0EJweC5j+mEbnd7xEzzdcbeOUv8KwSE+pS+mcnPLes
 AyGfpI38uoJ5czZqulsV88dankQ85kbISVyJoO37Xgjb00GsK9tNgUnsIHmDBozDEBus
 uVQidaVzoBG5LFYuVVVYqnXAZ38fTn1ICwzH8gceEs+Z2bt4VoA9BOb+JFYIpc6B/5ny
 02yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p2rJ0zoo8G2DJw8BhlBTljLEehJKUUHaIUJln9zB0Oo=;
 b=UYQNQTXMIcqW9MyI+occnfLn17PMpepqNccaCb8io0KxmJJSpSGfCdLiJppCR3IRwN
 nFlpamRxWta4L+gbVN94t2yt1nxC5VcnntmgSqealx6oDkf6Zdc00eiip5c70RFqZzsm
 NqZEVXC+2Q67cmjzV0+HXC6T1cBAh9B9FluCe8VIReXI3oJCQfm1qe3PfhcTGbpDlBNq
 YAZvHJEzA3km0sV9Mt6V+T+0Q6LPqlLs4VhD9iG8F9D0CPbJtjBP6emAgkyUB1aFVkSa
 yWLwRYNIQqvyDbIOEkcAXZ+9CY2DXGORiYLVcPy9TlP8VUuxxIgbHxKAVvSWKRjKpcXr
 1NNw==
X-Gm-Message-State: AOAM532IjCdt5CyOWR7WimeutONdRzznRGgjQwkD7qIaxp3809XlfJa0
 FnKzzWf9Cl48/nPbMYgYIDp3ayBDCKgFyNMkRH6BYg==
X-Google-Smtp-Source: ABdhPJy3vNoc72bYTM8vQe2RIOu9qAQu5KZHlMJLRI138bZf29PDBqqumLPRGdGPHRK84oipKNPcPR/YEf6a0j7TLwE=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr32174913ejb.407.1620748642233; 
 Tue, 11 May 2021 08:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-7-richard.henderson@linaro.org>
 <CAFEAcA9Pv00takQH-2gJr27a58ivkcO8P+XowkziqDuf5BZKhQ@mail.gmail.com>
 <bf5b06b9-6b56-f006-eb58-5d5a9f249e07@linaro.org>
In-Reply-To: <bf5b06b9-6b56-f006-eb58-5d5a9f249e07@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 16:56:09 +0100
Message-ID: <CAFEAcA8+4QE=dvn0v3bCBmNJe=BDJA3QmTyJE5RUwT2cCCnY9A@mail.gmail.com>
Subject: Re: [PATCH v6 06/82] target/arm: Implement SVE2 saturating/rounding
 bitwise shift left (predicated)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 11 May 2021 at 16:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/11/21 3:43 AM, Peter Maydell wrote:
> >> +#define do_sqshl_d(n, m) \
> >> +   ({ uint32_t discard; do_sqrshl_d(n, m, false, &discard); })
> > Why pass in &discard rather than just NULL ? (Similarly below.)
>
> sat != NULL means enable saturation.
>
> Discard the results because unlike NEON, there is no architectural SVE flag to
> indicate that saturation has occurred.

Aha. Might be useful to expand the comment a little:

/*
 * Unlike the NEON and AdvSIMD versions, there is no QC bit to set.
 * We pass in a pointer to a dummy saturation field to trigger
 * the saturating arithmetic but discard the information about
 * whether it has occurred.
 */

-- PMM

