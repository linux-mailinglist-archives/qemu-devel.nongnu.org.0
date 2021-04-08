Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA28357E76
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 10:53:08 +0200 (CEST)
Received: from localhost ([::1]:45914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQPT-0005Xt-Gv
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 04:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUQNk-0004EO-R9
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:51:20 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:37733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUQNi-0002Ke-Pi
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:51:20 -0400
Received: by mail-ed1-x532.google.com with SMTP id s15so1439781edd.4
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 01:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U+318EFWwHmx9RNFegnCSZS7fLEHu0A0/MzU83yeLu0=;
 b=rRkf50TVAWdC9iNmF3R4atOh+g4F/j6AGW/RS9Xz8+XubQNZZpD8bcb0PGh1lWjQjy
 LpsU2Jmcuv3GxHxHD5TQRETCvIoslhsj40zBhRcgA9/7VMZNzZcVzq2SbJrXW0MQvnj3
 Uoe9eWAgSYU2vY0gK+B2ZKXNIFddewmo+ich50Yz+Zj6rKD2pJ/5Rhp6U1YudOc4+uEh
 B979b3gOXUlzsZv5Mk4meGPgZYffnmXnCX9SfY3VbUFVgpZlMvZosCGc1ORulhSK/T4a
 e2pKexAXcwV7Zn6Bvs+QW2uFv5TO5VsSGIZq5ZZHCTdvWXi4q4bgvct2Uwi+F17TQCXz
 zqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U+318EFWwHmx9RNFegnCSZS7fLEHu0A0/MzU83yeLu0=;
 b=mmX7yVIRL94h+Rjhjrq4JOaG3IDCNqldaiayImmgcjI5/GOYh9cAnJZNaQ+wsJjftW
 QoTv4dYkPD4bnCooYr2qDHr92jcYCvc+7T678ZE7iLg+CkZ22Tf1uB74NZOViQdG4Hdh
 SI1+1ABO2tH9UBCUmrprUDGoElO+6bu98+4QeBY4VOQZGWbpKvCUpH8VeFz09tsFPBUb
 dqpW+Pr9p8JEpr5A+g7VVhebHN6+k1Hx72rM3GOVoL5q70ZVcZUiMQYktY2UC4lTHLsU
 oXujrPs8SjoT/R9Kd3LUmyjt9b3x2bvGAA2qsZ1WbBebtDZIqgghhaakgdILXkDm6cS1
 ffBA==
X-Gm-Message-State: AOAM533R16tXjFHo+LvrwPbdjtFCMMUl1QyIrCwuOL8O8s+RNwe1RMwb
 D3dZ4T/LFO8OGPXl+l7Nxqi9u0zJoB/6K3keV3HAaA==
X-Google-Smtp-Source: ABdhPJxEGNZikarl8tpW3Kni/wXUPEZhuJWsNtLT/aHZhlmQexuyWoNwMhK1lvvc+0j7PMStODivln3ooW+j3evxFBI=
X-Received: by 2002:aa7:d843:: with SMTP id f3mr4313620eds.52.1617871876821;
 Thu, 08 Apr 2021 01:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-4-richard.henderson@linaro.org>
 <877dleuds3.fsf@linaro.org>
In-Reply-To: <877dleuds3.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Apr 2021 08:50:36 +0000
Message-ID: <CAFEAcA9Vc=w9d-3DkwuyY8Vzrj4d=f2zHn4OXauQRc-Vr=oQzQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/12] target/arm: Fix mte_checkN
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: 1921948@bugs.launchpad.net, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 19:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
> > We were incorrectly assuming that only the first byte of an MTE access
> > is checked against the tags.  But per the ARM, unaligned accesses are
> > pre-decomposed into single-byte accesses.  So by the time we reach the
> > actual MTE check in the ARM pseudocode, all accesses are aligned.
> >
> > Therefore, the first failure is always either the first byte of the
> > access, or the first byte of the granule.
> >
> > In addition, some of the arithmetic is off for last-first -> count.
> > This does not become directly visible until a later patch that passes
> > single bytes into this function, so ptr =3D=3D ptr_last.
> >
> > Buglink: https://bugs.launchpad.net/bugs/1921948
>
> Minor note: you can Cc: Bug 1921948 <1921948@bugs.launchpad.net> to
> automatically copy patches to the appropriate bugs which is useful if
> you don't have the Cc for the reporter.

I'm not sure cc'ing bugs on patches is very useful, though (and especially
not for big series). I usually prefer to just add a note to the bug with
the URL of the series in patchew afterwards.

-- PMM

