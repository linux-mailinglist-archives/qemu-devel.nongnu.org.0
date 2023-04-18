Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199CA6E6036
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 13:46:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pojmB-0005aL-GA; Tue, 18 Apr 2023 07:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pojm9-0005a0-My
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:45:33 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pojm4-00032Z-OH
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:45:30 -0400
Received: by mail-ej1-x62d.google.com with SMTP id sz19so15322100ejc.2
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 04:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681818327; x=1684410327;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o0Wilez8/cw835muYLMtmz8ZfTD8qyciv1AzCOhh7Tc=;
 b=yZQ1bSDlREHW1Ygi2yMBhUfduLgCj5y+V9/2dhYfDP9ZsH53CUktieSyvf81RGTavR
 juAl2Z0LFn9/THaKJt4+mQyzvO7oCsMBaaw81LIyWX037qHSqPbL8IVkzZi4i/tgv2lU
 AktZdaoXgJtdGJjS728Cr/ELr9vAF/HfJqnSEaaecBiUnGxmTpCIlo50kIWKFWxlJeRe
 jBVSa+cLFw2X1A7oICIUjeV2dG0OJ5PdCdHvqb56FM7OqSwrgL81Row27VwEJDcSStZX
 Uy18A3ukS1/m8cZqvPsyXa7F33VEgZIy9dMIYHahu9YNK8Wb2a6CHDmXz79yVwJhGBpr
 v2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681818327; x=1684410327;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o0Wilez8/cw835muYLMtmz8ZfTD8qyciv1AzCOhh7Tc=;
 b=S/JOlSKPluDjD9YbztVh4cRYfFpoU22guUSG8Vpw/i84E12w/1N4qH33b6TW0BQDiN
 /EJiK6BgNICRaA2YcFl6A5zVwvGWS6vosoCwTp7dZr3cwQD5QtxF7Cr9ysmszyaXeLZU
 j+YgmTyy1vzcUzsqwqWx+gugDu+XOBxsayJ4zHGoyzfauUyJ4KNFvMEFwR0a4uHnyM9X
 bTYbGnn5DvwsxxwdhDUAUlPr6k0KVdzc5QYCzAcuxFqKtHGBUACCobBsSgnabBSDJxIg
 jN9UTfQRoJ+PkyYBuCixKh68ACt+KbXtrTlYU6E/O5QbCjWKWoPQY1k99sz+0REkjywL
 UJEQ==
X-Gm-Message-State: AAQBX9cR56kgSOtIZVFmfeIsG8lVJt6eNiNjEyYu3Oxkd/hPKVD6zC9k
 VUxtCoy9HKJUYnePhVESe78VrYIxmrXgj/OL+pozQQ==
X-Google-Smtp-Source: AKy350YTPDAAj9stcY84rT8Y59XT5QGMiQqvryXzBx458Kq6cruE1ZyhzbIkUJQH6mH3OjnO12XBM7BGlWBmQJW/RaE=
X-Received: by 2002:a17:907:989c:b0:94e:aa09:7618 with SMTP id
 ja28-20020a170907989c00b0094eaa097618mr5317638ejc.2.1681818327004; Tue, 18
 Apr 2023 04:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230414160413.549801-1-peter.maydell@linaro.org>
 <20230414160413.549801-4-peter.maydell@linaro.org>
In-Reply-To: <20230414160413.549801-4-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Apr 2023 12:45:16 +0100
Message-ID: <CAFEAcA_oKZ1OCj6kuRdA6=XyXZDwuRKzPQXRu4Sx3zF4AxE7tw@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/arm: handle ipa_secure vs s2walk_secure
 correctly
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 14 Apr 2023 at 17:04, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In get_phys_addr_twostage() when we set up the stage 2 translation,
> we currently incorrectly set all of in_mmu_idx, in_ptw_idx and
> in_secure based on s2walk_secure.
>
> Here s2walk_secure is true if we should be doing this stage 2
> walk to physical memory. ipa_secure is true if the intermediate
> physical address we got from stage 1 is secure. The VSTCR_EL2.SW
> and VTCR_EL2.NSW bits allow the guest to configure secure EL2
> so that these two things are different, eg:
>  * a stage 2 walk for an NS IPA done to secure physical memory
>    (where the translation table base address and other parameters
>    for the walk come from the NS control registers VTTBR_EL2
>    and VTCR_EL2)
>  * a stage 2 walk for an S IPA done to non-secure physical memory
>    (where the parameters from the walk come from the S control
>    registers VSTTBR_EL2 and VSTCR_EL2)
>
> To tell get_phys_addr_lpae() to do this, we need to pass in an
> in_mmu_idx based on ipa_secure, and an in_ptw_idx based on
> s2walk_secure.  The in_secure parameter follows in_mmu_idx, as usual.

Looking again at this patchset, I think these changes are right,
but we might still be missing one -- in get_phys_addr_with_struct()
when we set up the ptw struct for the stage 1 walk, don't we need
to look at NSW there also to correctly set the ptw->in_ptw_idx ?
At the moment we do that based only on is_secure. Otherwise the
S2 page table walks we do for the S1 page table walks won't
honour NSW/SW correctly, I think. (At the moment we sort of
do something with that in S1_ptw_translate(), but it looks like
only by saying "once we've done the s2 walk coerce the result
into the right address space", so we won't actually do the s2
walk itself in the right address space.)

-- PMM

