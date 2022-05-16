Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDC75287D9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:02:35 +0200 (CEST)
Received: from localhost ([::1]:37832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcF0-000300-3P
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqbzX-0004Ra-59
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:46:35 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:40625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqbpM-0005qE-Q2
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:36:22 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2fedd26615cso42783057b3.7
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 07:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WMcjIgElQDVcaYvGyWsgGoL90MTN8Yg8FxN68fhVkSQ=;
 b=epEAkGNTrucXFX9mUmqzEF0ZHx+UwBx8tShMXRGQYBza7bG5O5tjrJOrMiSRz5/UsR
 Rfjpsm3unUdjf2pABkSkIwrxQgZEdxJQvN/HnPcG1D0uaA3sq5yqhvvSMoFTo1P2JQC1
 90kjUPqWbnRZwV9dUy169YXnavDcnbUkUwBUELZez44OwdPZUF4+qGqbvxAck83nyqYi
 1n1zs1455NF4HX0EGVBWufz3/5d+xi1uAvcKdS83Jihp/zO+PJI11tcXp9byVojVSVUg
 6+36z8N/3ZqL6PIRoUTZOWma232Oco86mNDt9n/Brhni3RYU3VLtt7OT5Swx9Zx7e3WY
 oelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WMcjIgElQDVcaYvGyWsgGoL90MTN8Yg8FxN68fhVkSQ=;
 b=0NE+RX+LPAiWJs60YcyVtzUoVL7DYmTC4ocR6OwiRgfbo6LuA17zkVUnOGRKIidhsc
 FrSV+ZBE04/0UtqQIleA1I34dQm75Jo/Wt6SVf5lm7rnvnXsD2u7AjVB3fbl+/QDIRAN
 lWQ+U1TYfArt3lL2o3fyiFuw5l/bdMeTrXm8OAxJSWZFrw4kW7npD9YrsnVMm5BJjhyh
 wWno1DiqW1RJSXhmp3UA9b4FvYSb+9Nc6K+HGF2ux6I+nKMEm/cYhxgpSC4d4s+n0Pec
 /FCUTYXf9HL20Zp2eRcqvl5INcwcAlmXG5Pkgmsn4peQwc3r2G29nMfQuEpRNXXmYSCP
 7kmg==
X-Gm-Message-State: AOAM533cAoqEu+aM+vC/igPSVrePFh8lk8yC/woRcR2iml4vq1e7Mx/G
 IHKrVwy8sPvYxELsGxZ55bial4m4aupjjtLp/qsYxw==
X-Google-Smtp-Source: ABdhPJwJZB3gM8czSWJt0Bc4U2ER39LOlNTG28dZLLrBNsHO1D9qx2PmUr9WcELR7LvpxQGqqeYdj2iWlPJd5yveXow=
X-Received: by 2002:a81:3685:0:b0:2fb:947b:5247 with SMTP id
 d127-20020a813685000000b002fb947b5247mr19562933ywa.64.1652711736626; Mon, 16
 May 2022 07:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_SSJ9BBryV0iuXi1G30e6HoMeuNbSpKDh4_+y2oxTLJw@mail.gmail.com>
 <5132a3d1-de12-a306-c64e-56cfd2c40a42@redhat.com>
In-Reply-To: <5132a3d1-de12-a306-c64e-56cfd2c40a42@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 15:35:25 +0100
Message-ID: <CAFEAcA_5ouMzMx=1da0VFHXWvMsOoYJ_zZCA6Q_LjwNNO4WwOQ@mail.gmail.com>
Subject: Re: Getting rid of the last bits of QEMU's 'ad-hoc CI' for merges
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Mon, 16 May 2022 at 15:30, Thomas Huth <thuth@redhat.com> wrote:
>
> On 16/05/2022 14.43, Peter Maydell wrote:
> > For the BSDs, the ad-hoc CI is just running the tests/vm
> > "make vm-build-netbsd" etc. Is there some way we can get
> > coverage of this into the gitlab CI setup? (I think we
> > have FreeBSD via Cirrus CI, so I have not listed that one.)
>
> A simple setup is already there, running NetBSD and OpenBSD via KVM on the
> Cirrus-CI, see e.g.:
>
>   https://gitlab.com/thuth/qemu/-/jobs/2411943817#L1973
>
> Caveats:
> - The jobs are currently marked as "manual only" since the double
>    indirect setup (via cirrus-run and KVM) is not that reliable.
>    Also we can not run that many cirrus-ci jobs in parallel, so
>    we likely don't want to enable these by default.
> - Compilation is not very fast, the jobs often run longer than
>    1h, though the --target-list is very short already.
>
> Anyway, this should show that running NetBSD and OpenBSD is very well
> possible in our CI - we just need a more powerful x86 host with KVM enabled
> for this.

Yes, if we have an x86 machine we can use as a private CI runner
for these jobs that would work.

-- PMM

