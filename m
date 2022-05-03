Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B599518A80
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:53:02 +0200 (CEST)
Received: from localhost ([::1]:56406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlvll-0005gu-3r
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvjF-0003LY-63
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:50:25 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:35644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvjD-0005ya-HR
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:50:24 -0400
Received: by mail-yb1-xb34.google.com with SMTP id w187so32100478ybe.2
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fcnhCr/E96zXHTPF83KUB0kJu3XBEfU5kspnumlccpw=;
 b=MumZue3ctR6gj7uyJgT8BbTQhFDHmzc3Gej869wdjzK+lQFzAWhYPWbdB2wLAZRSLi
 27OWvYco67LBdkUYkQchVh7+LkCWtWQ9nFRsmex1Bym+7x6esCnZxrk5eOx03LfoelUH
 g6msrnLvmQA/hyVtqGV8E0Jv8vWMG0A1hHq9WF31zI8ZDYVZfm6n5UfHc0UsmcB4XnQG
 lzq90LhJ2FRvUh5dmGOUu4K9Grfl70ff2AahIYUu74gJ8bCVcP2kOjRCbUJMldeToNWn
 V1m9XdnhLJ8ZYVSN0I3WZYGZlUhs3Tg3/0yvNd/vc5wpmUZkGBaxBNoElU5aU5jKtVW0
 N2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fcnhCr/E96zXHTPF83KUB0kJu3XBEfU5kspnumlccpw=;
 b=vAgKkHNOBFC+CvX9Psj48lyzhmjuyl6w5S+sc1gmkMqwtL4q7RX0gwXLVCmQelo4hv
 jetePB3BbUrO/6TW9MWfgpTneXey3MSZhvOc+rn675T6osulXpGlG7VdKIzRowi+8D5b
 LT9pbW8imrQBE2PfvYfb/ldD7RdhzEsRXX2JtUUSWN5/tXBvYJTFQF8TDx5gDknVkthm
 yndz3jdgp0copgsy9Loa6UXPvGP+oJf2en7c7Zo5oG2P2bT45IBw9ukw3zcxAdpJE7bz
 t8UVAyr/U/UO3aJfzK02FEp8FjYP/vO1NtMq4Jw+0Zzc11m7jqFHG+Ey7zAqiIfvD9HZ
 a9Rw==
X-Gm-Message-State: AOAM531pigdd5W8eHdBD1CxrLEEmgm8zdvGoVAZcVFGDbJKJhi1NfYV2
 TKnXPa3YsmtrJCFs/pBGi36p4Xm/dRZAO6mB/d5TUA==
X-Google-Smtp-Source: ABdhPJxVMgpLvtAL4nhUVPR8OEFJFXY2x5up0pOr/Y++0NHd0t0cM+nOzkXHXZmaqAMjnfHOU3ghMpjsQH8bgTtBuiY=
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr14192082yba.193.1651596622384; Tue, 03
 May 2022 09:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-21-richard.henderson@linaro.org>
 <CAFEAcA_i_+MrxapQ821zWBwO7QKs2k=06xQRs9s6ojRB2CyxsA@mail.gmail.com>
 <731de8d2-2a39-862a-39fa-d208d9836364@linaro.org>
In-Reply-To: <731de8d2-2a39-862a-39fa-d208d9836364@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:50:11 +0100
Message-ID: <CAFEAcA_-ts5cRCyk03T4JEMS-5kRf2iJcOEOpgkZoerjVjR1fw@mail.gmail.com>
Subject: Re: [PATCH v4 20/45] target/arm: Handle cpreg registration for
 missing EL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

On Tue, 3 May 2022 at 17:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/3/22 09:34, Peter Maydell wrote:
> > "set CONST on the cpreg" is what the code does, but it's not
> > what the architecture wants. In particular, if the EL2 cpreg defines
> > a non-zero resetvalue then the EL3-no-EL2 CPU will get a
> > "reads as constant that value" rather than "reads as zero".
> > CNTHCTL_EL2 and MDCR_EL2 are examples of this.
>
> Ah, I'd missed those.  I guess I need a third bit to indicate keeping the resetvalue, for
> e.g. VPIDR_EL2, which is why the code is written the way it is.

Or you could just treat VPIDR_EL2 as a special case and keep
the cpreginfo we have for it for the el3-no-el2 case.

thanks
-- PMM

