Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B72B3F198D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 14:36:08 +0200 (CEST)
Received: from localhost ([::1]:34704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGhHD-00041M-JO
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 08:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhFs-0002jn-8l
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 08:34:44 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:34564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhFp-0004Hp-Ks
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 08:34:43 -0400
Received: by mail-ed1-x529.google.com with SMTP id i6so8677974edu.1
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 05:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w6uWuTe21Pd+yKj6AggHkpp/7e3n8TixpL4K3rLYqhY=;
 b=iFtJV5bwey6BnyWCv5vFA6v2gWBDNIAnK+1hbSDFlznU7rSVNXos/7LaFRsEwK8J7E
 6Hz/L+jrt1pPc12LaRFeshrUc1/acio28RNLRBNtL0qUoKByyKCv3KwICMGrffbOhc0+
 6X4U4OtqTDOEVj69fzIqiIuJBbZWNSQg8cVjVZjmLbrgY2dEk7gSuu2Oq1dclM2NU+mB
 UjX0KrJCp5ro59RPTWqxzTjsQryMBG37T9gKI2/7PZmCk8FpqElJ7Zh7JmD/+eL5z/+7
 oOvN2O5+K7rqOUKyuu+tfLOV3mRhdJeGY6mHw3QGwdTPJ9eC2ZrE2QafbSKHefOkIqcV
 ecig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w6uWuTe21Pd+yKj6AggHkpp/7e3n8TixpL4K3rLYqhY=;
 b=Dv/eUQrgSqk58pQ2YlQR4MxIoAaURdU0EKdtDB715UCM+OQopKiisNV0sGK9YhvRN+
 amdl+Sqlos/0prX93Z4XRZOk/5HmRV3srM54NmDQ9blaDpSR69yMSzMrEjMN8R6hNUQO
 9GqNBvjcjbebwKcLtmMcf4LZ54EnnK2j1cGfeh7lPR3SQ2yo85F+o68wE6BRMldvuSS4
 yfCTQ68jOignCMBBnkWLeSMauY6+xJGvISE78WnH0IEXEcqtjy871g8L6S4uKl9M9R+O
 I3XrlHp2ZnL1k3Ra7QGmfR888QwQSgFKlirw5p1pk39Djwjgex7B6ZJat/DI5xrgqisD
 QK5Q==
X-Gm-Message-State: AOAM533pB+fmZD7+hJL/2PSu3kC5Aw/cvRYtIAnXCY7KQtaVmINpfn/5
 UZSRtagwKGjg1CMbZb+MFefpXAJgMo0RkZ2VawKFEQ==
X-Google-Smtp-Source: ABdhPJxNWA8nf8uLGnEPG+BLAdNTPPIKSnsBBHAzwWyUDjCtbjrEONjTS7NakcFOMZNmj9v1ViwE3F1056aaU+kY+as=
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr12791531edw.44.1629376480250; 
 Thu, 19 Aug 2021 05:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210818110656.1993090-1-matheus.ferst@eldorado.org.br>
 <20210818110656.1993090-2-matheus.ferst@eldorado.org.br>
In-Reply-To: <20210818110656.1993090-2-matheus.ferst@eldorado.org.br>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 13:33:54 +0100
Message-ID: <CAFEAcA-KYhXPSJviHGC-HVkFKPaT4QGJ-MY2xbvxOsmWbEw+Vg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 v2 1/2] include/qemu/int128.h: introduce bswap128s
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 12:11, <matheus.ferst@eldorado.org.br> wrote:
>
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>
> Changes the current bswap128 implementation to use __builtin_bswap128
> when available, adds a bswap128 implementation for !CONFIG_INT128
> builds, and introduces bswap128s based on bswap128.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

