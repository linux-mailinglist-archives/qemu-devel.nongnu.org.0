Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B31A4755F1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:12:57 +0100 (CET)
Received: from localhost ([::1]:38024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRHK-0004Gs-VY
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:12:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRFL-0003UG-OL
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:10:51 -0500
Received: from [2a00:1450:4864:20::436] (port=39573
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRFJ-0007WV-Fc
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:10:50 -0500
Received: by mail-wr1-x436.google.com with SMTP id a18so37240345wrn.6
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wco+lNARS+NDpotCMQQ1jKQnw0sqN5DIUTmDFOeZoU0=;
 b=HzY6sYR/dfk8YN6UAOPOO2yP2eTNpmg3713/SkvDqM3+G7R14yDAZfdu8J1VHF7xJn
 vw5yDrwKVnyJwrzD/juOfvQycdw8KEwOe8POBSnxXSIIQ4SDRWTmsafrdQGQKJuETy1j
 +M3yvQYlGGHOglh+lxkZ99W2gsEHEJUakpMHvaH4/lmXR9CxYavStjQF+52DL1p0rblB
 V6SH8uWkT3ShupX8DER2B7diq4/wSfACbcbzk5KHVA39V6pr5jfniS8WVZpwkWFtrJzE
 fI9Ldoeugh/7YByZGJEXuqOz80GClfeB/VWsrN3xD4JK3v95wKgSZG7m+llTfakgCCHp
 58dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wco+lNARS+NDpotCMQQ1jKQnw0sqN5DIUTmDFOeZoU0=;
 b=zBzsKMybUaF34uWIxyR8tZ3ingyko9NI+ox5oGghJXkcc1/Cx+L63qguOI12mnDGwQ
 c1JhscV2BNOmobRKsMXgynnA4bV+vK0SGSq1ppxvOIcfL5HEyKVDCM6NPaOq9xjEtE7B
 7aCq1XyVdUhKFnEH2pebkjVEfuzbbX8ma5ft0jy7MiuVNS2bFmKYjamhnTHBLfWlHb0P
 eNvcOVO2RD+GollfKzHOxE6qkroQ21q13Ve/cT2qkhCkKV8Vdqtr7Yx4vr+vxyVPZl+M
 DaR57GIp2FXpCuD3XN4jqxK9OCFGcbVuQ7w79kBbo2OwxO4Nfr5xLvum5N3Rd9rN4MfQ
 SgWA==
X-Gm-Message-State: AOAM531mldEBgI1dRw097JCnCxQE1RCvCA4Wm6tQ76GExCU7D7jw3UUK
 9yemG0yJoZ0IEy3gT6Zi/aKKsJxI0gapHk2kYf+MTA==
X-Google-Smtp-Source: ABdhPJyO+j7MuDa2d7ezVPg7WWa6cUUBAw0uvqwEYCrFhxQtcpF3hwVbuBss7b1B0rM42y42T9ejZq7LUgfL7rY2ipg=
X-Received: by 2002:a5d:6707:: with SMTP id o7mr3818356wru.172.1639563046819; 
 Wed, 15 Dec 2021 02:10:46 -0800 (PST)
MIME-Version: 1.0
References: <PA4PR09MB4880FF47C3A6E249E55B80E2EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
In-Reply-To: <PA4PR09MB4880FF47C3A6E249E55B80E2EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Dec 2021 10:10:35 +0000
Message-ID: <CAFEAcA8m0M2+=ZuBAXcRmyGMzjHdjCYWM+_KzFK_eoPdwX-vpA@mail.gmail.com>
Subject: Re: Building QEMU as a shared library
To: Amir Gonnen <amir.gonnen@neuroblade.ai>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Dec 2021 at 08:18, Amir Gonnen <amir.gonnen@neuroblade.ai> wrote:
> My goal is to simulate a mixed architecture system.
>
> Today QEMU strongly assumes that the simulated system is a *single architecture*.
> Changing this assumption and supporting mixed architecture in QEMU proved to be
> non-trivial and may require significant development effort. Common code such as
> TCG and others explicitly include architecture specific header files, for example.

Yeah. This is definitely something we'd like to fix some day. It's
the approach I would prefer for getting multi-architecture machines.

> Instead, I would like to suggest a new approach we use at Neuroblade to achieve this:
> Build QEMU as a shared library that can be loaded and used directly in a larger simulation.
> Today we build qemu-system-nios2 shared library and load it from qemu-system-x86_64 in order
> to simulate an x86_64 system that also consists of multiple nios2 cores.
> In our simulation, two independent "main" functions are running on different threads, and
> simulation synchronization is reduced to synchronizing threads.

I agree with Stefan that you should go ahead and send the code as
an RFC patchset, but I feel like there is a lot of work required
to really get the codebase into a state where it is a clean
shared library...

-- PMM

