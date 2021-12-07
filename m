Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880D646BCC6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 14:42:28 +0100 (CET)
Received: from localhost ([::1]:42410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muajj-0002aV-II
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 08:42:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1muaab-0002FS-FP
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 08:33:02 -0500
Received: from [2a00:1450:4864:20::433] (port=42750
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1muaaZ-0008Qe-Re
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 08:33:01 -0500
Received: by mail-wr1-x433.google.com with SMTP id c4so29464551wrd.9
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 05:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MB9U9JPpTmeSHHfjfxPgMmDln8X50d6NlS0Btl6ZfG4=;
 b=VtMfmlt1Qj2HCk/B7pWi5LAenEJoo2XBAeVckmtMqXODbsTHs5Ax2SBsc9rNVXC6BA
 fZQm1rcqIPxkKtBQb8dF4VDqYkWY0OCqUdRqs7KV19e3uH6I6upFPD+sV3skekThBccc
 y3pb7lD4SkXd/F8kb6fB8hMIPgltrB+W3dc2whVgsOk2+1nxLUhCIB4/HePiJme+7jUA
 i16M21PwHabBAlLjzrPpRLLQ6eyoFxBpGI6iiEitmDJC6AgVYHhuBiC54g11YfcwEVC1
 PPg7p7rVpjLf/187djsioSjkx2XZjugUEjOED3noSWExNah97J/gYyQ8uuA9sDMs1hVx
 1MgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MB9U9JPpTmeSHHfjfxPgMmDln8X50d6NlS0Btl6ZfG4=;
 b=0rjOc7usco/rl5L9ITDjMzngYy9FnryWB1J4Qk2bPywjHDNij233bkhzLQIAi0OXWA
 n6RQu9X9hlrSCmhf89wVcdKpWS//B/P+gofTBkomID8X+bsnlNc2G9hEqx29QExp51fa
 f+Wa3ll7AQMxii2KOhbHpiwOcVwIbKnKRJIrUOAreViZfHRYY1pQQZHIEL6Rt98+Z9lt
 kHVd72u4bBwfwlB+Ve3LGhCrXrvSnABj4Y+ELqr3SuRUDjpFqzfY3RYN/3lNGgw+h3Ot
 e2DREcYFIxAWu+/MnC5xXi2qQCupu4ZtPX1UozJ/wUY3/jwbUm/GeSCUjvwG3QbqJva6
 yOQQ==
X-Gm-Message-State: AOAM533cCcexoLCusOs6mYGW7B2KAd4ln0zM/zFqQlR366c1sjxX1m92
 FtVc1PEXosg6+xj2mzAnphN68FG1Z8O932HVZBvgjA==
X-Google-Smtp-Source: ABdhPJxOTP90BIY8drpnPuMbQH196ce6l08BHkOJT9rbR2CskSLI9FtMRQ5fzpXpJQPqxCCJnaIM0wEl9Sl4pMSiAy4=
X-Received: by 2002:adf:ef42:: with SMTP id c2mr49449216wrp.528.1638883978082; 
 Tue, 07 Dec 2021 05:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20211207094427.3473-1-damien.hedde@greensocs.com>
 <e0419fd9-ce18-a4f6-7c8a-36e36dce2ae4@redhat.com>
 <d77f21c7-2b92-2c45-aabd-36148f7fd822@greensocs.com>
In-Reply-To: <d77f21c7-2b92-2c45-aabd-36148f7fd822@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Dec 2021 13:32:46 +0000
Message-ID: <CAFEAcA_snfwV8gBoo1ZHwqSimJEoW7+TVsa=BhQikxJ5sqP8Kg@mail.gmail.com>
Subject: Re: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, shashi.mallela@linaro.org,
 qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Dec 2021 at 13:05, Damien Hedde <damien.hedde@greensocs.com> wrot=
e:
> On 12/7/21 13:45, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 12/7/21 10:44, Damien Hedde wrote:
> >> According to the "Arm Generic Interrupt Controller Architecture
> >> Specification GIC architecture version 3 and 4" (version G: page 345
> >> for aarch64 or 509 for aarch32):
> >> LRENP bit of ICH_MISR is set when ICH_HCR.LRENPIE=3D=3D1 and
> >> ICH_HCR.EOIcount is non-zero.
> >>
> >> When only LRENPIE was set (and EOI count was zero), the LRENP bit was
> >> wrongly set and MISR value was wrong.
> >>
> >> As an additional consequence, if an hypervisor set ICH_HCR.LRENPIE,
> >> the maintenance interrupt was constantly fired. It happens since patch
> >> 9cee1efe92 ("hw/intc: Set GIC maintenance interrupt level to only 0 or=
 1")
> >> which fixed another bug about maintenance interrupt (most significant
> >> bits of misr, including this one, were ignored in the interrupt trigge=
r).
> >>
> >> Fixes: 83f036fe3d ("hw/intc/arm_gicv3: Add accessors for ICH_ system r=
egisters")
> >
> > This commit predates 6.1 release, so technically this is not
> > a regression for 6.2.
>
> Do you mean "Fixes:" is meant only for regression or simply that this
> patch should not go for 6.2 ?

Fixes: is fine in all situations where the commit is fixing
a bug that was introduced in the commit hash it mentions.

Separately, given where we are in the release cycle, a patch has
to hit a very high bar to go into 6.2: at least "this breaks
a real world use case that worked fine in 6.1", and probably also
"a use case that we expect a fair number of users to be using".

-- PMM

