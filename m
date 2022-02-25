Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1524C426E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:37:36 +0100 (CET)
Received: from localhost ([::1]:55876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNXyh-0003kt-AD
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:37:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNXuS-00023t-Aa
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 05:33:12 -0500
Received: from [2607:f8b0:4864:20::b31] (port=38800
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNXuO-0007ys-3v
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 05:33:09 -0500
Received: by mail-yb1-xb31.google.com with SMTP id u3so4938089ybh.5
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 02:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8herOfVKtBtPhTsBTysdihp5QCceqjnQTgQe9hlXIF8=;
 b=Bx15dkHIXlvji8f2rgMP/p9TW5zupzGIWtmINUHqd4ZqlJjoxTqzT0pl+5btL2oUvc
 JOEz8IPZCoFYrHxvtklZdS60zlxBe4WM4LLxaCew9sg8a3j9KZQz8FoJXCwHKEg0CAoe
 NycFPFRlBTMcuoM5N75F4hS4bU9rcNck5z0qhlLNwgCLO2tMrwzmDuOyVfoqU1+6AADu
 76uneU4Br4Gsn8rGaf53zfbnnz9hbaEKqT8ogYwX6D6e8AvKGRwNF+e2xnkqTetrV2Xs
 eTxoggyAD5AoIXZEcGGjLcHsSZT2uw0LJ4N02VCKgTi+1mFj0PLGHf4PWdrsxXmZ5UXh
 IhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8herOfVKtBtPhTsBTysdihp5QCceqjnQTgQe9hlXIF8=;
 b=fKnpXWb1FzjdUz8MINbOo1d3ewcdRyiZBtGufC148pTqkfjeDl3F1kwyaTrkaHbzuo
 KPt6W5EwsH5/OkL+H9yqCi1U2lH/R89NH+MA2KxUXBzoq1MrLpW3M6D7YWZEunoTWyRz
 dTe3vx8ofB2h+hTA8lxrtwSpw7XHzujnVXLRxJVzJr5MKMUQE+Lg0tuan48444WioZ6k
 9kO+7uUcuzDe1bW2tKT55uHiG06jeOA/w1EFwVXMb4tG92xctsTCJozUu+OLt4+brLwM
 cnw4cvPfg0fFC33QZqt+tTSP3ULpWXv0elNWBEKXF2ge9behFZQjSZU6Jw8aiupKWHIo
 t0vw==
X-Gm-Message-State: AOAM532bPijlaxgYsfsSXkQHzZv4lXOt6kHdVu/OfN8NTyjJKs6Q4Hc+
 LUP9mtwq03bbsjbB6i+YR+uBqal48lxsXiNttmZS4Q==
X-Google-Smtp-Source: ABdhPJxC8vgHKHUq6qYQHBsblqKq2rhXwWTHs9pD7uuJrDSWvkZwlaWh04jhTHrCGhW5GYYF+h4mgAhZGGYEpRNsvhQ=
X-Received: by 2002:a25:8084:0:b0:5fe:cadd:2532 with SMTP id
 n4-20020a258084000000b005fecadd2532mr6538033ybk.193.1645785186907; Fri, 25
 Feb 2022 02:33:06 -0800 (PST)
MIME-Version: 1.0
References: <20220213035753.34577-1-akihiko.odaki@gmail.com>
 <CAFEAcA9eXpxC7R_qcDsBh4C9Aur5417kTzAhs4c7p2YRCFQUKQ@mail.gmail.com>
 <9223d640-3f50-1258-1bdb-e3ca5d635981@gmail.com>
In-Reply-To: <9223d640-3f50-1258-1bdb-e3ca5d635981@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 10:32:55 +0000
Message-ID: <CAFEAcA9D6T5kb03_THBVyUuCM7e88Xp-QzscQHyseSXj=SAGUQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Support PSCI 1.1 and SMCCC 1.0
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Feb 2022 at 03:36, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> On 2022/02/24 21:53, Peter Maydell wrote:
> > On Sun, 13 Feb 2022 at 03:58, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> >>
> >> Support the latest PSCI on TCG and HVF. A 64-bit function called from
> >> AArch32 now returns NOT_SUPPORTED, which is necessary to adhere to SMC
> >> Calling Convention 1.0. It is still not compliant with SMCCC 1.3 since
> >> they do not implement mandatory functions.
> >>
> >> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> >> ---
> >
> > Applied, thanks.
> >
> > Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
> > for any user-visible changes.
> >
> > (I noticed while reviewing this that we report KVM's PSCI via
> > the DTB as only 0.2 even if KVM's actually implementing better
> > than that; I'll write a patch to clean that up.)

> I don't have an account on https://wiki.qemu.org/ so can you create one?
> I'll update the changelog once I get access to the account.

Oops, I accidentally used my canned-email-reply for "applied a
pull request" when I meant to use "applied a patch to target-arm.next".
You don't need to update the changelog -- I'll do that when I
next send a pull request for the arm tree and it gets merged.

Sorry for the confusion.

-- PMM

