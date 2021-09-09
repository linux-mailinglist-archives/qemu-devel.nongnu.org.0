Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7EC4059FD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 17:02:47 +0200 (CEST)
Received: from localhost ([::1]:44282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOLZe-00080Y-Ei
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 11:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOLXL-0006Ml-Pi
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:00:24 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOLXG-0000hW-GC
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:00:23 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so1302684wmh.1
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AEpF1WtL+UUEDZfPfUFV0CtuBK622rGS4TWqap/PRig=;
 b=d3vYoqfN3te22l7xqBNc1chLxzd4OEE0MA9QYVTjX7Xvsus0imC9dlDGr/CV7E/cOq
 LCDQLsv9HB9y6XHwNvyD3kXMqwjiNIdN0yeQIrY0wcaskcAlXpSbN11s9ZGa4TFdF+32
 apU6lNp4ZVqlId+DFwy0U5CgqKAzz5nS5cTChgSbAH9+R8fwXSLh0ZbCp1WbxR5upSWC
 minsLaWpEnMk7e00UDjzKNwaoQM2MyUO8squMFz/tn5R2r1uUryYgq2efesD2uqqPA91
 UAaTQHW0YSWU9PUHOxCLgaxscXVihaQqdrlUNyFaTysk1DPuwxm7xEC83M1Mb8tI54Ja
 8VpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AEpF1WtL+UUEDZfPfUFV0CtuBK622rGS4TWqap/PRig=;
 b=uRBP1nKPXgv2QGkzAvzNuyYjDMs1wwopjo3hJUmfMcZTUDqQyHDZeGBNy7vZV0KWCT
 JnxqBk/lOXSgfrGGSPb/i4duvkgKBDtEGHp7CJx9A7t39APzkFAbKA4YQce2fG91AwgE
 8EFCSB+dY0CfVnfTZGXfkZEcKUJW9lDsLpBvQhedVEC6qQSdVNU4cLMVP51VWLzTMgN9
 uU8vvbh/fRGa3zhLq1BPT0+U/gWXyglSoVky1QCHnEWz05KC0ra7Ks8mRPvJiWv7EuEu
 MFvALHgcIcXg/FmDpfdv4vFnwle0b07dH7FrzDQL+g6sOUQp63eltSswPARCtcLXYJ1k
 EYYg==
X-Gm-Message-State: AOAM53167avbSVqTsrJ2tn4BKJIhLGpWDvIvcS1eXXjSMKxayNexTb74
 WnTo/Hj6JqftO9UZLCwzmg9z82ttOuRcGcjorz0kPA==
X-Google-Smtp-Source: ABdhPJyfbTdYe0/j5g+0/EIY0/Bk3QLhYCiB03rpvc22r5YG4j1Dda4sAJkgNc9rJ5h+PPj0JunhSWjc05B93Opo2gQ=
X-Received: by 2002:a05:600c:4f46:: with SMTP id
 m6mr3455984wmq.133.1631199615026; 
 Thu, 09 Sep 2021 08:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210909103346.1990-1-quintela@redhat.com>
 <CAFEAcA-LSVj3B-xgPFMTz49D=KoRx1W7_HKjFf1bHEYdBGVgPA@mail.gmail.com>
 <f02237fb-852d-8449-e90d-97a59bcf51e8@cn.fujitsu.com>
In-Reply-To: <f02237fb-852d-8449-e90d-97a59bcf51e8@cn.fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Sep 2021 15:59:25 +0100
Message-ID: <CAFEAcA-ee9pr5U16eZPcOjnmtTC+WnQB=aUCT3Ta0Kk--8euQw@mail.gmail.com>
Subject: Re: [PULL 0/7] Migration.next patches
To: "Li, Zhijian" <lizhijian@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 Sept 2021 at 15:49, Li, Zhijian <lizhijian@cn.fujitsu.com> wrote:
>
> on 2021/9/9 21:42, Peter Maydell wrote:
> > On Thu, 9 Sept 2021 at 11:36, Juan Quintela <quintela@redhat.com> wrote:
> > Fails to build, FreeBSD:
> >
> > ../src/migration/rdma.c:1146:23: error: use of undeclared identifier
> > 'IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE'
> >      int advice = wr ? IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE :
> >                        ^
> > ../src/migration/rdma.c:1147:18: error: use of undeclared identifier
> > 'IBV_ADVISE_MR_ADVICE_PREFETCH'
> >                   IBV_ADVISE_MR_ADVICE_PREFETCH;
> >                   ^
> > ../src/migration/rdma.c:1150:11: warning: implicit declaration of
> > function 'ibv_advise_mr' is invalid in C99
> > [-Wimplicit-function-declaration]
> >      ret = ibv_advise_mr(pd, advice,
> >            ^
> > ../src/migration/rdma.c:1151:25: error: use of undeclared identifier
> > 'IBV_ADVISE_MR_FLAG_FLUSH'
> >                          IBV_ADVISE_MR_FLAG_FLUSH, &sg_list, 1);
> >                          ^
> >
> it's introduced by [PULL 4/7] migration/rdma: advise prefetch write for ODP region
> where it calls a ibv_advise_mr(). i have checked the latest FreeBSD, it didn't ship with this API
> May i know if just FressBSD reports this failure? if so, i just need filtering out FreeBSD only

It is only FreeBSD, but usually looking at the OS is the wrong thing.
Is this some new API that's only present in some versions of rdma?
If so, a check on "does the library have this feature" somehow is probably
what you want.

thanks
-- PMM

