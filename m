Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A454E2C2BF2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 16:53:03 +0100 (CET)
Received: from localhost ([::1]:36888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khaco-00072O-Mm
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 10:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khabZ-0006KJ-BV
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:51:45 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khabW-000500-Lh
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:51:44 -0500
Received: by mail-ej1-x62c.google.com with SMTP id oq3so29177577ejb.7
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 07:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WuZcsSWq1l1UAN5pf7/sFEYC+7fp354hz7TwvCwyxpM=;
 b=YQsBG2iHfBXOCIDap1CCUoPp4e50GA8deO48AjGWxrbZ4k/O6/+fWdBBf7AD0AwW2E
 y/KGT68nj24Fjw/D8cCNW5H1bfsUvV+7JS/IOHlUpLLExGALEhUQLUv2T31gqK6CrcSV
 mWaYQUozQuMYEft2eyBGR9QYBWHMIAmwgiRuEgFkK1rbV8yIOAeTtWLMtK5hs2c9AEqt
 laU/z36j0cemDGgnR+Y6DIiN9Lx8QhC0/VWR5yxHokx3NQ2kciI0/D3l72cxppJ4cNXn
 7RXXVVyufhMowg51U8YNfYtjS9pG6Ho5/474zJAUTNzS/x+rmPhnmV4t/M4NYqtYbGTV
 oCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WuZcsSWq1l1UAN5pf7/sFEYC+7fp354hz7TwvCwyxpM=;
 b=X0RnxwrXzMitgK4zg380CjaimMrkQkojIE3AdDOq4Gfvopw5Ptc1Ys0MCAUujmII1q
 b7SO1lCpDHMRulw90ycV4fYSjfDyD6Uv6Mmk5hrQLBRZhRF1GnWtYHBr5LqHUB8xUR4r
 kyYMAZ646Uw9tDBRr4nPSGSgThKDO569USRFW7TkiQ8RVAnKfU9UP4sqq9SwyzJS8n0l
 j5kEEqhWnl8ZajsD+V02O3N6tX8JYXHqSturFK6rcvgWpapCzlDfDSs9/5Z3Uhd3tvE+
 9X3Xq+p1xEQwKv3GUYZ2El+CXGs0K9J2s5j5PAp/ZrJlCySAilfM31rY3ogJWO8bi/AK
 ggoQ==
X-Gm-Message-State: AOAM532MF/7GNR8EigOXrIpuP/8k3EtHnGwDlFstXR/p3gUrN4S19DHA
 5Ogs1PQWjlaZHyQgq8lM6NYUMrGhPeX/SU3I0PZ9iQ==
X-Google-Smtp-Source: ABdhPJxK8evZzjoWJZGP7VM6a9UkHlgen/ucGNfCJasJp6l65rDukn6ftVP/7P+4MUFg1KB8Yg/zN6Ox7++wVbMbBuM=
X-Received: by 2002:a17:906:b53:: with SMTP id
 v19mr4580747ejg.250.1606233099213; 
 Tue, 24 Nov 2020 07:51:39 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR11MB3963BA87438B343A71230675F4FC0@DM6PR11MB3963.namprd11.prod.outlook.com>
 <CAFEAcA-_ZM7DKk0a0Lkp1boZwUHi-OxD62w1-=NqnYzGKJc9ZA@mail.gmail.com>
 <DM6PR11MB396369EA01CEFEDF6801AA28F4FB0@DM6PR11MB3963.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB396369EA01CEFEDF6801AA28F4FB0@DM6PR11MB3963.namprd11.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2020 15:51:28 +0000
Message-ID: <CAFEAcA8q-xPGLTrXcdYhderBVfRRPjNXh61Yo=_qR9bknoXPjg@mail.gmail.com>
Subject: Re: QEMU build dependencies for new board
To: "Ancuta, Cristian" <cristian.ancuta@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Nov 2020 at 15:47, Ancuta, Cristian
<cristian.ancuta@intel.com> wrote:
> I was indeed quite a few commits behind master, I'll give it a try now with the latest.
>
> Since I see the RISCV stuff is quite new, would the associated  boards be a good starting point?

Possibly. Or look at a new arm board like sbsa-ref,
or raspi.

thanks
-- PMM

