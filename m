Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFA823A718
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Aug 2020 15:00:44 +0200 (CEST)
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2a55-0004ni-Co
	for lists+qemu-devel@lfdr.de; Mon, 03 Aug 2020 09:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2a46-0004GB-Ed
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 08:59:42 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2a43-0000VX-Vc
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 08:59:42 -0400
Received: by mail-oi1-x243.google.com with SMTP id z22so2544495oid.1
 for <qemu-devel@nongnu.org>; Mon, 03 Aug 2020 05:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WMkPv524TMCtOkvZkDg1hPuO82j6khrPl0gMImT+GBM=;
 b=Pcz8fYhmh6KwiAichv+SYbRPjOknz9dIuqJ2+le9ZXc7ncdT0eIYu0chLaDgCyiIEB
 /thVcpzlyGBRG3hbGVICC48RnWMcGKuuVMOaLzxwa4iQyoLJ5gfm/3yDzjXIcYZZZs5I
 j12fwBniMlZn/PMybt0Q3lM5WKSwy0k4QX4Lfve0aEjjbP5Gs1Vka8udlKGy1UjcgKpk
 rsdYnCHX6kUZoxef67zpiND310cCw4Qfbgi3Fm6H6JBVvl7D/ZI/WmvnkVzxdWYLGOca
 klWHO3uR0KdQy3pqrxqfPVUr1EMmykT39yttOfn54j8vi7LKkXjNm/kbus3uktAVqTPK
 EPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WMkPv524TMCtOkvZkDg1hPuO82j6khrPl0gMImT+GBM=;
 b=rzuw2gcCzk6KhHI0Ew0UA99DDtXZHhNLcP8YyoGDvsJcMUcWIvk2BJVdg0CRrl6h0q
 1J5ftp46Z1Sw7KTMDy/Gie4vlly6kvlLmHOSGhhiOPwP6BuiWbf/ayVq5fxGjZIZuhP+
 QA4Yh01fP6Dqg+j4GJO4br9FhpzgGqfCcSYpcQDsgMpy4CG+pcmyIkP2ZzYP9TfGKwNU
 o0n4eZwrWcEWuz8RCiZR5mENk/oW3CTbsYmhG36ClX24JkDrbkGOJQvvAIhXHopT897V
 EsTQApcoKmSG6OUiuIcb5GX8TvF7MZM72JbdHjtokjJEpucN37Fg2k/gPTQYa1qRr8li
 6X2w==
X-Gm-Message-State: AOAM532rK4PKskRiup3AfZV5Do5UlvPXiLMiazWtRrBTuQAoP9EiXb/L
 JdW25PUOdHQw+3A91Obc3ldwAufUOHFe3ea8z9ujhw==
X-Google-Smtp-Source: ABdhPJyB4gsm10oNC4/1J//GtTfCjeTCf1UIssP8JbFwrYzgX/1+3x2NXvBAQPgz+6ioDpxne3QnFdt5k6d/hN7uJNA=
X-Received: by 2002:aca:4a96:: with SMTP id
 x144mr12463571oia.163.1596459578358; 
 Mon, 03 Aug 2020 05:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200729125756.224846-1-danielhb413@gmail.com>
 <20200730005852.GN84173@umbus.fritz.box> <20200803134917.48c5e7a5@bahia.lan>
 <8985209a-427b-1ec5-7d90-6a760e58f1cd@gmail.com>
In-Reply-To: <8985209a-427b-1ec5-7d90-6a760e58f1cd@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Aug 2020 13:59:25 +0100
Message-ID: <CAFEAcA9hV4+kKO1gggzNjNjMHxt3WiDac2KivjZzLAGExdN7Kw@mail.gmail.com>
Subject: Re: [PATCH 1/1] docs: adding NUMA documentation for pseries
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 Aug 2020 at 13:15, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
> On 8/3/20 8:49 AM, Greg Kurz wrote:
> > I'm now hitting this:
> >
> > Warning, treated as error:
> > docs/specs/ppc-spapr-numa.rst:document isn't included in any toctree
>
> How are you hitting this? I can't reproduce this error. Tried running
> ./autogen.sh and 'make' and didn't see it.

We don't have an autogen.sh...

Anyway, 'make' will build the documentation, but only if you have
the necessary tools installed. If you pass '--enable-docs' to configure
then it will error out if you're missing something rather than
its default of quietly not building the docs.

thanks
-- PMM

