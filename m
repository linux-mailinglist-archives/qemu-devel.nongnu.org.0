Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE2F4DD8E3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 12:27:48 +0100 (CET)
Received: from localhost ([::1]:42426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVAln-0002Ug-BB
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 07:27:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVAkR-0001bT-3T
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 07:26:23 -0400
Received: from [2607:f8b0:4864:20::b2e] (port=44862
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVAkM-0006TT-UQ
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 07:26:20 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id y142so15229487ybe.11
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 04:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8wFCzW44COlRBNziDYqwj+dmwdnGpxjJ9XP06hmDe0U=;
 b=gLoHgaXwgXPCjrsmUFAxoBoDJm0qZOPCoWcuoHMg7Levg/KHNXkN2bZIyZ8TXas2/v
 de/pBJX+/Y/L7aoi7k1/UFECklGwgObOXGw27oeQZcfemt3BPHk/UrJumpg76CNduXxN
 twHXR5P9Yhuur5z7PDubwI0ZEdY5tEqdA0h+MoEp+d5thU56XY/vqwhCLbWw22l46LN2
 9X7xXwu+TaGd01vnxTVJbnVPvJuLdIpBMKRd9+LpAQzSiTaOq+aeN/RdtiCAbP54o+LI
 v7lC3bSd1oOZplDwQp4NAlCw3uCnPJWGMk9T82i45sAchCAXAAFImSxNA8vaF4o/hiJa
 NPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8wFCzW44COlRBNziDYqwj+dmwdnGpxjJ9XP06hmDe0U=;
 b=s1X/B44dnbAfM2KcAYGPxycfMcNogP46lugJ65ebI3f1pDFPK9puBuAFEWLAf20hue
 tL/ygl57I9BNy2CUZtECU4rXIXAB2YW08wcd+G7kR+KTBj75OuF2WrhnPijA7f3dbDGM
 vXkaE7syo2ObB9Kq7CHpHasWKLtD1X9Au4mGwVKxFrZeK3bvZuoaFfcm80exfCO9xbNb
 8L6ZviFErNKgP2jK805DjQ/9HRc9k50wZ3Hy99tu2+WhUyb4N4UB2yWg4U6aEP5s4kPJ
 eCgOLAEkf0XCalo+AntfyEpJgiu6SKrZ7QyoAJFT7eczi9pvE0HnqkCtNVCsh8a//rir
 T52g==
X-Gm-Message-State: AOAM531C+xmXsKVNJiSF5qakpCSDnv8O1+GleGj5tVpiQFNYplZBqEBO
 2h2eWRIi31N3niSNV5iJoonLzW4fwRmQ+ayFJjXIeA==
X-Google-Smtp-Source: ABdhPJxz8NmSPQ1pPKJ2Xw78+8Z25NaGa9aJ3V/X2CFd5kO3jJIQmzNeaVbAI8WrP9ajYdXbYB6O7vioERqQ3kFrqyM=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr9483580ybq.479.1647602777169; Fri, 18
 Mar 2022 04:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220316035227.3702-1-adeason@sinenomine.net>
 <20220316035227.3702-2-adeason@sinenomine.net>
In-Reply-To: <20220316035227.3702-2-adeason@sinenomine.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Mar 2022 11:26:05 +0000
Message-ID: <CAFEAcA-FAA0vXSmKRi7-xTjVD-vn7PLKUSN46-TnaST2BSeU7A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] util/osdep: Avoid madvise proto on modern Solaris
To: Andrew Deason <adeason@sinenomine.net>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Mar 2022 at 03:53, Andrew Deason <adeason@sinenomine.net> wrote:
>
> On older Solaris releases (before Solaris 11), we didn't get a
> prototype for madvise, and so util/osdep.c provides its own prototype.
> Some time between the public Solaris 11.4 release and Solaris 11.4.42
> CBE, we started getting an madvise prototype that looks like this:
>
>     extern int madvise(void *, size_t, int);
>
> which conflicts with the prototype in util/osdeps.c. Instead of always
> declaring this prototype, check if we're missing the madvise()
> prototype, and only declare it ourselves if the prototype is missing.
> Move the prototype to include/qemu/osdep.h, the normal place to handle
> platform-specific header quirks.
>
> The 'missing_madvise_proto' meson check contains an obviously wrong
> prototype for madvise. So if that code compiles and links, we must be
> missing the actual prototype for madvise.
>
> Signed-off-by: Andrew Deason <adeason@sinenomine.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

