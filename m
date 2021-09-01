Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366633FD4E8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 10:09:21 +0200 (CEST)
Received: from localhost ([::1]:52368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLLJA-0005uv-8N
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 04:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLLHU-0004Mg-3k
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 04:07:36 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLLHR-0004Og-QB
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 04:07:35 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m9so3160882wrb.1
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 01:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IMfv3X9fTvOJ+DdcPjRTJXNNnrQ9FFsKswFqE756ecE=;
 b=Dx/ZQ0KQDf3GWB9exru0DnXGrrEWDxRzU9qOXuDPD0lc1cNvanYRPuphbu0RcvM35e
 +aDUGq14spg47ksJrSSv6Z4/yrxk/yemYi+i4hkgH/Zvoi0mR08vpz+98DSg6LSdDdmV
 rum4fjbdSNlUMmGIy0dJ/bQGCYNqVSil+iwi8w4YHsHJfeLK3lRSmg4uuL0z37yV2nJb
 KkcSbnTTJMWIoBovyYPlDj5PW5J5pPBdDA5UYzyPAH0MT5pOeW0SpQ1RCg88Z5cbIY3Z
 Bb3yto/qjDjfI1buvgQCcfzSaB3HDpQoOLNWVZ6NL45rd9SBimp8Vhsa0awGiAiTpBFW
 pIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IMfv3X9fTvOJ+DdcPjRTJXNNnrQ9FFsKswFqE756ecE=;
 b=Wl5Xur1fJNqXNCiS1YFluwx7q3UfHJGLeov6Y7f5mYFrCeJsGviNhWQIt6sM2t4Fty
 YeL3HCwnXamyGbxQU6WySGniEfiiWOwIkaTqikTOhqiT84MFuNXiBillXqwWr5oGwN1i
 Nm8uwXkAojTzutsGIGStO7mEpAhVmH3y8UQLorJNsJzopmyB27vC3wsueE/7k0NDonDR
 oWxHOQ99OS5l8+J0jwdkAZ5oqjUofA2zPjme950G3yFNHh6gMSWlc4hhZxsNtR46yT6s
 PDvnd6B3RtSw6pKivHwXECGH/csrokGczHiVfaYuGncWCOilaOXa7MeR4/qyvA0UO0ER
 mPOw==
X-Gm-Message-State: AOAM530OmiUA4sHUEoqo0n34Ihd18uxuJ1j5Llc2FVYACXLGm8oVPDqU
 dZqgvtus4VYkDPDFiCS0h52hctqlkr/vd5hJiZrIbg==
X-Google-Smtp-Source: ABdhPJyDoYFI3HAM3d3dJVLaEus+QHBWFY2szRd4i+MPfBdCx0L85GeRPt4y4AQjNYmtYcG7LjB4nNb0AsP+m0ZSwTc=
X-Received: by 2002:adf:f50a:: with SMTP id q10mr35841128wro.271.1630483650151; 
 Wed, 01 Sep 2021 01:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-11-shashi.mallela@linaro.org>
 <20210901100324.3ce458f6@redhat.com>
In-Reply-To: <20210901100324.3ce458f6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 09:06:41 +0100
Message-ID: <CAFEAcA_XGk6vh_gZ9wn1Jgu6rf7Ka8TrHnd0WsbDAWgW=67JbQ@mail.gmail.com>
Subject: Re: [PATCH v7 10/10] tests/data/acpi/virt: Update IORT files for ITS
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Sept 2021 at 09:03, Igor Mammedov <imammedo@redhat.com> wrote:
>
> not directly related to the patch but while I was testing IORT testcase
> (https://github.com/imammedo/qemu acpi-tests)
> after rebase to 6.1, I get test failure due to change in MADT table vs
> expected blobs made in 6.0 time and it does look like ABI change
> (what is bad, it also happens to virt-6.0 machine type).
> Can ARM folks check if we didn't break something?

>  [02Ch 0044   1]                Subtable Type : 0C [Generic Interrupt Distributor]
>  [02Dh 0045   1]                       Length : 18
>  [02Eh 0046   2]                     Reserved : 0000
>  [030h 0048   4]        Local GIC Hardware ID : 00000000
>  [034h 0052   8]                 Base Address : 0000000008000000
>  [03Ch 0060   4]               Interrupt Base : 00000000
> -[040h 0064   1]                      Version : 02
> +[040h 0064   1]                      Version : 03

This says the GIC changed from GICv2 to v3. What QEMU command line are
you using here ?

-- PMM

