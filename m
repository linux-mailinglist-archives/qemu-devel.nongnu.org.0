Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705A83CF7A5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 12:15:57 +0200 (CEST)
Received: from localhost ([::1]:43988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5mn6-0004Mw-0V
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 06:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5mlv-0003TK-Fs
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 06:14:45 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:41775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5mlr-0003wm-LW
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 06:14:42 -0400
Received: by mail-ej1-x62c.google.com with SMTP id go30so33522714ejc.8
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 03:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mW686d8CzXXo6vR09hsa2ZRksOH50HGdZbESPDq1rzc=;
 b=NMrlUyPQq8UyBom/mvDJylsNMPgF9LqA5UaKnumhN4ZfdQyZU5LmfjbU1v6DdG1l5B
 G4HBc3DbkucVdh+nZhNecwYX8j1ZYEtwPVrq5ZjSPkHoiBpp1dTPwzecUQaQcRCjlEwX
 gcW3m4bIEpXE9lI9qLFFZBFeSwna2lPR6/E+xORUQI7Gr1qBSGRRrNHJn8oHi4OKS55i
 O/q5wLIgv0Fly0x2ZGPrP+/KiIEwNOAqS088vFh0esRux7pWKTsExo+KHAY2ZrqSIjAe
 tFcZA03afv16TrCb6LZaAhHe5c5qvlXJzvMubK+rOrZQ52AKm1ilmFOY/nSucpr5DBsB
 EsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mW686d8CzXXo6vR09hsa2ZRksOH50HGdZbESPDq1rzc=;
 b=lUl2qTdkDU3jjCWA04qEawr75gpgXKaV7dDu0CNEYcSsdq2wlCrpuM0qc4XDW0/Imr
 D/UPVlyUUf01oMVskvavLdZ3C6IZuNThM+x4pChS4JePum2TN8RB8lzHmkY2yii0GQ+u
 3Q75nWGlk+dBCazjx7gQiOq9lnwxWJfAVn+XM0eAs7EyRI2XsB3TQJmn7lZNYLfChNdI
 uUmZuHDstkU4Oe8J8W1uqTJCFf8JfUwZ1ouPNv2nBVh5/Ac8YzkxCn2Vwt6ZK92ExLH1
 NuhMTqKltdot9JftBzeY10z7IIx+YZg8qO28TzhEzMkbcDf/9chFp9isBd5Uv17TKu3K
 XcfQ==
X-Gm-Message-State: AOAM5319FWwvGsDQrAUAsxQk9fFQMMiBiENf5bQXhav53kxHYpVoUqIy
 510sl6t4vEm/lhIOcPRoobJ0JZrf/FdXo3s//keQvA==
X-Google-Smtp-Source: ABdhPJynobXhSzEbpcxo3O6H5wvnc0IOUebQp0qBcGRt4lF5I533bG0WdEKrQ8pwM+wK0+ohfnhSTf381LemGzlt5V0=
X-Received: by 2002:a17:906:a2d7:: with SMTP id
 by23mr31325754ejb.382.1626776076769; 
 Tue, 20 Jul 2021 03:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-18-peter.maydell@linaro.org>
 <e3f557f7-c65d-428e-a0b5-68d1ffc01df4@linaro.org>
 <CAFEAcA-o=rC1Zm6JyFECZ_uXndbRurrZdYVWTn9aq=dHXsWJSw@mail.gmail.com>
 <6e31e5da-b4c8-4555-7a70-7d9b4a6e55b1@linaro.org>
In-Reply-To: <6e31e5da-b4c8-4555-7a70-7d9b4a6e55b1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 11:13:55 +0100
Message-ID: <CAFEAcA_o3dkXrMTMOsuxcC5RYTTi+8yOQcqTWrBQqPZU=WN7kg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 17/34] target/arm: Implement MVE VMLAS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Sat, 17 Jul 2021 at 21:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/17/21 3:06 AM, Peter Maydell wrote:
> > On Fri, 16 Jul 2021 at 23:12, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 7/13/21 6:37 AM, Peter Maydell wrote:
> >>> Implement the MVE VMLAS insn, which multiplies a vector by a vector
> >>> and adds a scalar.
> >>>
> >>> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> >>> ---
> >>>    target/arm/helper-mve.h    |  8 ++++++++
> >>>    target/arm/mve.decode      |  3 +++
> >>>    target/arm/mve_helper.c    | 31 +++++++++++++++++++++++++++++++
> >>>    target/arm/translate-mve.c |  2 ++
> >>>    4 files changed, 44 insertions(+)
> >> ...
> >>
> >>> +/* Vector by vector plus scalar */
> >>> +#define DO_VMLAS(D, N, M) ((N) * (D) + (M))
> >>> +
> >>> +DO_2OP_ACC_SCALAR_S(vmlass, DO_VMLAS)
> >>> +DO_2OP_ACC_SCALAR_U(vmlasu, DO_VMLAS)
> >>
> >> This is confusing.  The ARM says
> >>
> >> # Operations that do not perform
> >> # widening are always unsigned (encoded with U=1),
> >
> > I have noticed that that text often appears for insns where it doesn't
> > really apply. I mostly ignore the text in favour of looking at
> > the pseudocode for working out what is supposed to be done.

NB that in the latest version of the v8M Arm ARM (B.p) the
"operations that do not perform widening..." text has been removed.

> Yes, but in this case there's nothing about the pseudocode that suggests that sign matters
> at all.  Neither the multiply nor the addition are widening.  So is there really a signed
> VMLAS instruction?

There really is a U bit, but it doesn't affect the result :-)
I will remove the unnecessary extra set of helpers (similarly
for VMLA vector-by-scalar-plus-vector)...

thanks
-- PMM

