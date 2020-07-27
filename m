Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DF122F33F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 17:01:06 +0200 (CEST)
Received: from localhost ([::1]:56742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k04ci-0001Gf-Eh
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 11:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k04bd-0000oF-1r
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 10:59:57 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k04bX-0005ZZ-QI
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 10:59:56 -0400
Received: by mail-oi1-x244.google.com with SMTP id y22so14553026oie.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2XIpqRGhi+O5hLelJclDOmrHBgxnuI8vkCTrLgIkPOw=;
 b=QVt9SxCxttszuNPePknOROEUaIyJNlvy+B6QfzKYd7EdCcF2IVFFNw+Tjv946aAcjp
 Bnf1qTycjaFLH+Htif+wTb01OSe6H0wmn7uNrF6iTVOZl/+jmbijaDvTZjLYsEMe/3t9
 Kn/WpOI4ZzIJE8HygoDydpnJxqZ9a34SS75u+005LJQjwQKB8t02CWF/dXWXxM8ehkjH
 Xd2JYQB7ifmNWXhBHKKoEUj94jFgx9GXW/f6wDzimvxwi2kyz4x+/rtaZfinOczZ0A2p
 I+805oxrJXynmH8gUT5sADPXHBKC6/XVz+uqrFeGHTSDdX19fabav6y/u1nJlDh2VtL6
 brPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2XIpqRGhi+O5hLelJclDOmrHBgxnuI8vkCTrLgIkPOw=;
 b=gYle6Z9unfxSrWMsiezjGkd0/62tymtr+BaAhbPCanmQeiUtCusqHG+Pokbu69ASUQ
 Nq/rthjVz49OUK2xi7SBF6lDsyGUqkxerX5zhXrd2GDq7iAAqt2jAFJORLfJMP7IRPw8
 6wSiA569ZXxA6AiTbl35EuETiYaPXTL33kdMWVLU8wbWslkI8o5qwIeAvqAc6Ja3FF3O
 ysklQVjdJ+AiU9odvjt9XHilSuSROdVoPOIan9D/WXgY4jbHCYvlU6qWGNpNX4raeu6u
 hNqZRvN8Bm2+ar0/4McjIahIVOibn+CeGG4sxk1SxCBwXbggfr48jNfIC6XWGv4T9gVP
 qGUw==
X-Gm-Message-State: AOAM533Wmc4lb3Zqz+I2phL1uCiUeuImGt6H5xSRkR+z08CeefxJF/8g
 7VDJfoU1Hch2UZTety8EKDYBeDRlVI4eg/8lf1x5Kw==
X-Google-Smtp-Source: ABdhPJzBTcS9j1MPyaHkyLoSX7mAqSqLHDccjGIKmKtT7jVMlEf6DDMUb5w1BOGNKWI2ywm2anaPEkYpYnVwSTnEhUY=
X-Received: by 2002:aca:2819:: with SMTP id 25mr17270730oix.48.1595861990286; 
 Mon, 27 Jul 2020 07:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200724163853.504655-1-richard.henderson@linaro.org>
In-Reply-To: <20200724163853.504655-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jul 2020 15:59:39 +0100
Message-ID: <CAFEAcA9AzZ3RiGDoHCdo09=+EMcMrVG=0_ePBcxcZ6zdfOPWfg@mail.gmail.com>
Subject: Re: [PATCH for-5.1 0/3] target/arm: mte+pauth fixes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: vincenzo.frascino@arm.com, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Jul 2020 at 17:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> A couple of last minute fixes for MTE:
>
>  (1) Peter pointed out that EL3's SCR.ATA needs to be set when
>      we're booting a kernel directly.  Similarly for API & APK.
>
>  (2) Vincenzo pointed out that with RRND=1, we can't rely on
>      RGSR having being initialized.
>
>      I suppose the only follow-on question here is whether it is
>      better to minimize the number of calls to qemu_guest_getrandom,
>      or instead to name that our IMPDEF algorithm and use it for
>      every call to IRG.  We already have other user-space available
>      RNG instructions that can drain the entropy pool, so this is
>      not really different.
>



Applied to target-arm.next, thanks.

-- PMM

