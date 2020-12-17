Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1701D2DD9BB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 21:18:29 +0100 (CET)
Received: from localhost ([::1]:36474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpzjI-000646-2t
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 15:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpzgo-0004ij-Ro
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:15:56 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpzgm-0004dM-2Q
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:15:53 -0500
Received: by mail-ej1-x632.google.com with SMTP id w1so35085957ejf.11
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 12:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=794vehw3NGEjXWHBmqvDsD65TmFZjP4ODHwS4MJVZB0=;
 b=KL8ToosI6q7zz+Nbx8VHfANGgpaaTdCpP+lqz2Rj5PXEBJA6OjKCD5YphS9Fqr8S9G
 VaBEoGsyEh7Rh0BnQCcU4h1NJNAe/asn+yj+wTy7yz0aZCQD+NrnE08xGSSgiKlj2ttz
 dfOJySXY9iBUNW60xJqbO6vI+Nkt2yqVUjKITCnQ+pSLiG+jGkIbh8ymKhdB2mvzAJHg
 UwiAOM4uCZ45IEv+wevrrUtyyapO9GEwMBiR46Fv+ZxqrLwOtOQZPswBVHHUp4t9VsZb
 eefK1KARvb8QOX3GaNPVd7qpWawv8uwLVTpVeLslm5yyzFN7w1GCAZFxw98VCmRQk6uO
 +yTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=794vehw3NGEjXWHBmqvDsD65TmFZjP4ODHwS4MJVZB0=;
 b=ko/ePZow1tH1+utJUJy4Sk8eW2PFRBp+Yg0eGH1xrfzNdCjYSN0oulU3pQYOYfzd1+
 T3yKTtcEXYjyDA3FcEaI3aKwYGmQakKu4nGh22qFlrG39f1FGMJ+a9MZZ6lXQzqi7Su2
 N9aZUF8UZKWjjWe+e9WKluF6jpAngMeO8aGY9BpDcC1q351btbwdDlh4bAQwnWxHS4U3
 EGHdH7lu2gZxYGoq9xkWY0P3xQZ5MfMkVLnks7H1E7Dy8fNGJKpLzzyL3abn6NuUcGfm
 Lqfb7Md+Fl6bLLiBwdxsEPN8sXUf0hV3JvTolS5GWvaaC/mYPE+jkA0hcd3oVPw2/ZI1
 dMuA==
X-Gm-Message-State: AOAM532GZCCZZKitfuFdXp3O7fy1lr33ViDTCGRaSM7dNwQJcoSrdYKu
 fEoXczYun49Ul3S9PAOBqCDCMVRhXItn9xW7NJlHAA==
X-Google-Smtp-Source: ABdhPJwIzg+91OqWwQYvl3AB3D8R1/DvjbTTiIx22dhzwdma6pE2pB8ozQrn39Xca2AwNTPZ49wsPruRGnOWbPrVkYU=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr762723eja.250.1608236149966; 
 Thu, 17 Dec 2020 12:15:49 -0800 (PST)
MIME-Version: 1.0
References: <20201211100908.19696-1-cfontana@suse.de>
 <20201211100908.19696-8-cfontana@suse.de>
 <e47ef5e5-2053-d98d-9cd5-f6d96c423c82@suse.de>
In-Reply-To: <e47ef5e5-2053-d98d-9cd5-f6d96c423c82@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2020 20:15:38 +0000
Message-ID: <CAFEAcA8FL23_bZaOM_u8CdSQoCrrQ2SxnuOoU0H9kPFeANyT0A@mail.gmail.com>
Subject: Re: dangers of current NEED_CPU_H, CONFIG_SOFTMMU, CONFIG_USER_ONLY
 (was: [PATCH v11 7/7] cpu: introduce cpu_accel_instance_init)
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alex Bennee <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 at 19:46, Claudio Fontana <cfontana@suse.de> wrote:
>
> Hi,
>
> I would like to highlight the current dangerous state of NEED_CPU_H / CONFIG_SOFTMMU / CONFIG_USER_ONLY.

> So our struct TcgCpuOperations in include/hw/core/cpu.h,
> which contains after this series:
>
> #ifndef CONFIG_USER_ONLY
>     /**
>      * @do_transaction_failed: Callback for handling failed memory transactions
>      * (ie bus faults or external aborts; not MMU faults)
>      */
>     void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
>                                   unsigned size, MMUAccessType access_type,
>                                   int mmu_idx, MemTxAttrs attrs,
>                                   MemTxResult response, uintptr_t retaddr);
>     /**
>      * @do_unaligned_access: Callback for unaligned access handling
>      */
>     void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
>                                 MMUAccessType access_type,
>                                 int mmu_idx, uintptr_t retaddr);
> #endif /* !CONFIG_USER_ONLY */

Yeah, don't try to ifdef out struct fields in common-compiled code...

> Note that include/hw/core/cpu.h already uses CONFIG_USER_ONLY in other parts of the header file, and we might have hidden problems as a result we (or at least I) don't know about,
> because code is being compiled in for linux-user which explicitly should not be compiled there.

The other CONFIG_USER_ONLY checks in that file are only
ifdeffing out prototypes for functions that exist only in
the softmmu build, or providing do-nothing stubs for functions
that are softmmu only. I think they're safe.

> There are multiple workarounds / fixes possible for my short term problem,
> but would it not be a good idea to fix this problem at its root once and for all?

What's your proposal for fixing things ?

Incidentally, this should not be a problem for CONFIG_SOFTMMU,
because that is listed in include/exec/poison.h so trying to
use it in a common (not compiled-per-target) file will give you
a compile error. (So in theory we could make CONFIG_USER_ONLY
a poisoned identifier but that will require some work to
adjust places where we currently use it in "safe" ways...)

thanks
-- PMM

