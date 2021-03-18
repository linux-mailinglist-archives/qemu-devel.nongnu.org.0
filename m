Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5BC340FCE
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 22:30:33 +0100 (CET)
Received: from localhost ([::1]:45390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN0Dw-0008LY-I3
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 17:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lN0CX-0007cU-Bq
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 17:29:08 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:45976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lN0CR-00054J-W0
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 17:29:04 -0400
Received: by mail-ej1-x630.google.com with SMTP id va9so6251864ejb.12
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 14:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e96zrz3bBkHkSRTd5wrEVa/AuScRiO2HztO8NjaOxcg=;
 b=cTFbh8ouw652/gr5ri874gGVMntqOKs1+JGAVc9lcA/9Zz3aAOcSSL9S9Sk93/q7UC
 cywZEPj9qGDw43ROGSYItZDkb+N3yiWc9WYY4zceEB8o53FYo0reWs/oc4fymcMIAT/Z
 ORxwG5Dg48PVoi0ee2bhz4sc3V5Mba4rSwxKzNc2vuhHiPDXQB0s4VSPKotAd9aFCBac
 hvu1rsQnV0s7alOyi2FIzkSCCSuK7nvkEz90qp9s7tQZQ8hFU6sGGI8WXB2e9GIVE2K1
 zs8HbfsCE/x5oEhAQ2PRHwvPHOkt3J494PZht5frrAEOtghSsoZSYMdBouk5Ltwwgcw/
 V18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e96zrz3bBkHkSRTd5wrEVa/AuScRiO2HztO8NjaOxcg=;
 b=L7uFKWQmrl0eye/xKuvaefU4yQq1RKqD0j7ZBhATGd6XltipADRsP6BSGYf5oLMLkX
 qtMLB+tSnkT1VsNqsA17aP/ZWymK/fcmFVGIgP9iiUjqMuZnABy9dx1jAH/FaQ/QARk1
 osMrrvnY+YVNoLvwRTsNx5mTp05gG6B4YWw0Y1R/IL/p8tbOJ9JlB0Kz0pv0euFeZQY5
 YYrTF+Y69soCZHQD0kaBznuZShx0rLkaIrBFiVxEO58KCkTJ+kKpSfgMTiA9GAm/aoNq
 azPF6WBqsjV4ayOOOmIvK4Lqj7wUJAkm0bnQaiw4p/HFOKViofCH/3FOzHpCvlTTRtVL
 cdOg==
X-Gm-Message-State: AOAM532jShvRlidz9o/RejoJ/0a8b6orHADTenCrDu/2WuK6z6SFsDi1
 SF+MX5m/a3FekFecug2GKCKpXZX0XY6i4RGd4grkkA==
X-Google-Smtp-Source: ABdhPJyCtlfzR2rC9kXs+fGBgTqDue4+EiuDKug5gt4hXQEKvfGD0OnQHoXxzitH8fJwP3nniCmIJE38LMrwN4p7E0k=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr686599ejb.56.1616102938260; 
 Thu, 18 Mar 2021 14:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-5-peter.maydell@linaro.org>
 <176ca6cf-f917-eb5d-a5ce-d8a98db8fce4@linaro.org>
 <CAFEAcA-mZMP0LPmGKvMuUq8C_V6cG9AVpaAQ4SoWvihObO_VXA@mail.gmail.com>
 <ec96b321-80d4-948d-b482-dfad61eff67f@linaro.org>
In-Reply-To: <ec96b321-80d4-948d-b482-dfad61eff67f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 21:28:33 +0000
Message-ID: <CAFEAcA9i21sTkYoMfMt8sgN+18B3uHSqzG3No7k-+XJkzREi9A@mail.gmail.com>
Subject: Re: [PATCH for-6.0 v2 4/5] hw/core/loader: Add new function
 rom_ptr_for_as()
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 21:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/18/21 1:02 PM, Peter Maydell wrote:
> >>> +     * Note that we do not check @as against the 'as' member in the
> >>> +     * 'struct Rom' returned by rom_ptr(). The Rom::as is the
> >>> +     * AddressSpace which the rom blob should be written to...
> ...
> >> Should you really have this special case?  Nowhere is this going to verify that
> >> @addr is in @as.
> >
> > It's the "happens almost all the time" case. Nothing verifies
> > that @addr is in @as anyway -- see the "Note that" part of the
> > comment above.
>
> The comment explains why we don't examine Rom::as.
> But we do check @addr vs @as via @as -> @fv -> flatview_translate.

All we do is look for "every other address in the AS that
maps to the same MR as the address we started with".
Are you asking about the !cbdata.mr exit ? That's for the
implausible corner case that the caller asked us about an
address with no RAM. In that case the early "check rom_ptr()
directly against @address" gets us the "did the user load
an image at that address", and we can skip the "check for
other aliases, because by there aren't going to be any
aliases to no MR at all.

thanks
-- PMM

