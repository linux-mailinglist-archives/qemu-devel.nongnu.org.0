Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3FF467175
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 06:23:50 +0100 (CET)
Received: from localhost ([::1]:58006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt12z-00023d-KF
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 00:23:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1mt11h-0001GQ-LJ
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 00:22:29 -0500
Received: from [2607:f8b0:4864:20::d29] (port=41477
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1mt11Q-0002JI-J1
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 00:22:28 -0500
Received: by mail-io1-xd29.google.com with SMTP id y16so2335382ioc.8
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 21:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sK6+IUHKECnagMWmHHLsPx+swwwlBUbpQ5fGyoSzNTI=;
 b=Hoqe7c2OgE9IZuKeXSJ5y1YZbumMhX9GhyFV8oOsQ05rpaguLHA5Twn4km2lYulTi6
 dfKZN2Aaw1qpQtaEqrGIJZMhvlsOEa0TxqyzlYsLNO6CMkM3wnEcI8Li/zQEWdHF4Vsq
 oBiC818M6dxY3b5Wg2OjNbuWfMHdeyj0AUjdl4nJCTB8nQpebwb7IvjXjfo6QotVZqb1
 l3osU4XmMC+W8S2tT2Lg8L2/NxlLJtcQmJwE3ka2/XtymIgwqXnVr843GJnGqN8RYzEO
 VczdUv69gm/sJtuhg0gweRn7bZ2IMh58FUWzCavaioxE1OiC9V8KskPSrRRKN/KKPL71
 Qp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sK6+IUHKECnagMWmHHLsPx+swwwlBUbpQ5fGyoSzNTI=;
 b=MTuFa+Jver3+fvtKOxb2nKGNo4I7EAvaxTN782s//QO4AJL4y8ShUJD3idhRbPJmx7
 X9fgwNu+8LA2pxV+rFuugRkqGmYmp1Ha0gLexT1JVKQetA+CruFlKbwkWh4lUNZ0++vB
 Q2MsD3NCIC0e+R4m0PIbMOMZx77Eb3HctTAZ/RBkbDqjYIEcKmGFU7cRaDEX0FcAyJxn
 uTLXjvGFMFh+AUnX468twiEeBjejbHnKrEQCClTXQCcwRq82GS//gmLcfh6ZGR+yxTXy
 aOK/KLPcQdvczEycx8wJvZAUQBwQXu4eZdGYgE4m5a1HiWhmsyRfPoIKOXJdIyHxHNgr
 0xxQ==
X-Gm-Message-State: AOAM530BOGy/zOlO9OLQZ2y1BPgQ6oDVCEgW73D+R25BCCwq4mlDxTzF
 +xwQdNb/Tm+zMb4xpV4Eb1r3dJFxE3apLPUFqb1geA==
X-Google-Smtp-Source: ABdhPJyoB+n1KntqFFxQ/d7g0KsP+wVkB6a+2B8DiQpAv65LJXlsPdIL+Dm5HQRGb+kpS2UK7Z7+xAOEtoOPClpP37A=
X-Received: by 2002:a6b:d904:: with SMTP id r4mr18379827ioc.52.1638508929680; 
 Thu, 02 Dec 2021 21:22:09 -0800 (PST)
MIME-Version: 1.0
References: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>
In-Reply-To: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>
From: Emilio Cota <cota@braap.org>
Date: Fri, 3 Dec 2021 00:21:57 -0500
Message-ID: <CAJY1Aq7-J+nnf1k_HdbUnc3mJvua0VHYPNMokCKeitG1ZbH91g@mail.gmail.com>
Subject: Re: Suggestions for TCG performance improvements
To: Vasilev Oleg <vasilev.oleg@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: softfail client-ip=2607:f8b0:4864:20::d29;
 envelope-from=cota@braap.org; helo=mail-io1-xd29.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Konobeev Vladimir <konobeev.vladimir@huawei.com>, "Chengen \(William,
 FixNet\)" <chengen@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andrey Shinkevich <andrey.shinkevich@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Plotnik Nikolay <plotnik.nikolay@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 2, 2021 at 4:47 AM Vasilev Oleg <vasilev.oleg@huawei.com> wrote:
> The mentioned paper[4] also describes other possible improvements.
> Some of those are already implemented (such as victim TLB and dynamic
> size for TLB), but others are not (e.g. TLB lookup uninlining and
> set-associative TLB layer). Do you think those improvements
> worth trying?

I cannot find the emails, but I do remember that Richard wrote tcg-i386 patches
for uninlining TLB lookups. Unfortunately they resulted in a slowdown on
modern machines.

        Emilio

