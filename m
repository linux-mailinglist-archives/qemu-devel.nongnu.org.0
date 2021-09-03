Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9E83FFB0D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 09:28:02 +0200 (CEST)
Received: from localhost ([::1]:34082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM3cG-0002Pa-SJ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 03:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM3af-0001Lo-KE
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 03:26:21 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM3aY-0006Pm-Gl
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 03:26:21 -0400
Received: by mail-wr1-x42d.google.com with SMTP id q11so6802209wrr.9
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+02VQQ0alDHjiHVIOWBVvOPIvILJXREZBa9dwDD6RI0=;
 b=KOhdQT9uSsUdmqICh5xI2RZQ3a4iN1zLBdUUQRtXC/42PjpP/j82/e4YzMyABVj4/f
 6aMNa2s5Bb7h1NzsvGhKivdqhVu3wPhUkrdq6XSKDsodP0yKps9ywpEqYhGk4xjV7K3N
 XLE6WHJO1CSdB+ivBRNVEY1Egs5PKgZp9L04yJH4HeqHrTcf6Ulf1n+p9/7grkoDQ5c+
 f9ua17uxy2GU9QdZIMx0MZoPeuw67yv3Wc8C0TDqTcpAtlItxTEWhNX20jnwonUPGDga
 77Ujs9adzT/bBiz+xdC+nuExWDLHHdNKoWN4+WWy2YfGKuVXnY7y6TnSSC3U1O1w+xiF
 0Kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+02VQQ0alDHjiHVIOWBVvOPIvILJXREZBa9dwDD6RI0=;
 b=RFv0JDbuzUiFJfM5oP9cLLs+Id00iQfLIgynK54yPIxAC6WEnEObjg7l33vVWdU8lD
 EJi1lKa4HuysxJySNDTBw74VNSWdWD9juFExLBeEzxNwAHSAF4Z2rfvetiVBAd2QGvdh
 ZPhOyDa3eccs6oV4UxBD7v2AD8iqXs9UsC3h6U4i9Qv9udvDwOimkBNbnPgl0ewrfShq
 M/3Pea/clvt6D3zKh2zY5fBNZ1a9d2hMhEaSu6aciPqN1xy2x+bPtTRXz9scXO2/CZed
 T9NjDsM0ZavRHd9QO8Cxf4aPqnMlf1wLfiwkEL+ZY6E8VpFZz/8E1j/aJT90ViJfqdIz
 2YKA==
X-Gm-Message-State: AOAM533DM5CinksxYq0VXzg4xvdr8/d/neKTAIj4P4zLzrxk9grwgohO
 tHD5jcq0LPf2HYK+tyyBtry6lRts50fdQxmDPe31Xg==
X-Google-Smtp-Source: ABdhPJyMo4PaGC52mwSia7sRF3AKDKZt03h/JOB2OYs+ct2wIRVHZTKcB++1+hCu0tMSztotTxQpMQbvEYSxBCDd/ls=
X-Received: by 2002:adf:b748:: with SMTP id n8mr2311230wre.133.1630653972914; 
 Fri, 03 Sep 2021 00:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210824122016.144364-1-wangyanan55@huawei.com>
 <CAFEAcA99urPQ4ZnmZrOG4JvL-sO-=kTGXF5Fuz-FoVHV6+J=pg@mail.gmail.com>
 <77ee3e41-e985-74f8-8510-1c47903689a8@huawei.com>
In-Reply-To: <77ee3e41-e985-74f8-8510-1c47903689a8@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Sep 2021 08:25:24 +0100
Message-ID: <CAFEAcA9n10wZY5vO1ZpwO-P3u=dV2G4J8j3xtSjzfA5YX0oouQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] hw/arm/virt: Introduce cpu topology support
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Salil Mehta <salil.mehta@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Sept 2021 at 08:05, wangyanan (Y) <wangyanan55@huawei.com> wrote:
>
>
> On 2021/9/2 23:56, Peter Maydell wrote:
> > On Tue, 24 Aug 2021 at 13:20, Yanan Wang <wangyanan55@huawei.com> wrote:
> >> This new version is based on patch series [1] which introduces some
> >> fix and improvement for smp parsing.
> >>
> >> Description:
> >> Once the view of an accurate virtual cpu topology is provided to guest,
> >> with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
> >> e.g., the scheduling performance improvement. See Dario Faggioli's
> >> research and the related performance tests in [2] for reference.
> >>
> >> This patch series introduces cpu topology support for ARM platform.
> >> Both cpu-map in DT and ACPI PPTT table are introduced to store the
> >> topology information. And we only describe the topology information
> >> to 6.2 and newer virt machines, considering compatibility.
> >>
> >> patches not yet reviewed: #1 and #3.
> >>
> >> [1] https://lore.kernel.org/qemu-devel/20210823122804.7692-1-wangyanan55@huawei.com/
> >> [2] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines
> >> -friend-or-foe-dario-faggioli-suse
> >
> > Hi; this series doesn't apply to current head-of-git. Is it
> > intended to be based on some other series ?
> >
> Yes, it was based on the -smp parsing changes in [1] which hasn't been
> picked yet. Given that [1] somehow affects the topology parsing results
> which we will describe to guest, I think it may be better that [1] can be
> merged first and then this series follows.

OK. I'll ignore this for now; please resend once that other series
has been accepted.

thanks
-- PMM

