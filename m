Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FCC4ADFEB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:55:12 +0100 (CET)
Received: from localhost ([::1]:43294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUhq-0005VO-TU
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:55:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nHUGU-0002W2-3b
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:26:54 -0500
Received: from [2607:f8b0:4864:20::b33] (port=40812
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nHUGS-0004TQ-7v
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:26:53 -0500
Received: by mail-yb1-xb33.google.com with SMTP id y129so15601134ybe.7
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 09:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rLeov+aqmZ3pxQfMSYVx4y5Uoc8yxI3qyUIODwIni30=;
 b=px5A7tFuRVykbeBA+j+67TMIJu3zmvvTgq9ZHtoyrpJedWkqGXFCqe4STF2nhEtGep
 2jKImKnLwleV9qdYbaqfe4oHhyeCw9JpfRViUb3ffc7iTGH2uoyUFxm8K/8Ip46ro/vL
 au8d+i/aGbHHSeKPal2VAllEXN8wfKbYXNpFrjh0R+nTf6DJQJR0fQnC4YDGpMZsvfFW
 qFsWRkS5uysYexob4ZnxyVs2W3jriR5b2fF/iqDQyuohvoBzXo2bfeZAFq1nZHCczXUR
 VM8teb90GePs53FMo3cKAbUvCvix2Eye2pT/8Omdhtrf9PGWmoP0DA9NO+GxywKVWikq
 K+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rLeov+aqmZ3pxQfMSYVx4y5Uoc8yxI3qyUIODwIni30=;
 b=rsZTJWzwMmE+pVGMjTWCSsQTphzvvSWrqX5owYSat8wBKIiZD/bgo1e8qqdT9LeaNd
 ZXCOVM5JX8Hz5zX7FCWSb7Tq7iXBaMU47VwvYDXrojyZD/rbmXWZWdDSF17eAazf+Ez1
 Zxg89L3rAniqWDF4j+77O3iF/flC1vTVvjUQVstxHXWfya4pT+j2/tw+NrSvd8ysDu+X
 FDrQiCGETcYA/hUDAW77Iwj7eULMBK7zEpQZOb9tTYLLiI9fMOo2t0QCutW5/PU/gKIJ
 TtX79YqEfmF/ajsAiC1+/roIQ5hYPd7vBwlqe9uRJtrCmS/NmwvuC/c5m14t5xst8dbZ
 JrDg==
X-Gm-Message-State: AOAM532LqmIuys6yCyrsH4HZ52ZLcaAkZZGqM2etFb4P3psJ/9BjcUng
 T4J/ERq8zkKP52+o5r/pGnwsyZ9XWljjOF/f7Ok=
X-Google-Smtp-Source: ABdhPJwMD3fzPapGvg21laKfIJ3NhFuQssBvJ7PTni8vboCsz3DSvGUNc1K/NuGEI1Ur9kPWlKxDZWSsknywzK2xskM=
X-Received: by 2002:a25:9d82:: with SMTP id v2mr6038645ybp.63.1644341210683;
 Tue, 08 Feb 2022 09:26:50 -0800 (PST)
MIME-Version: 1.0
References: <CAAQ-SiOU5vkcVODOvBEf=PXzRDQbhzJC6ZU3wLpnRzhD58cuGg@mail.gmail.com>
 <CAAQ-SiMpZZ3yVCRjapCuResP38HFmtykFuLvpwH_23kEPg6v_w@mail.gmail.com>
 <20210215143934.sz6tdtoaaffkvla7@sirius.home.kraxel.org>
 <CAAQ-SiO_cTe3bQKDQ-tyeUU-DqTSf=1kRUcc+a=tktZb0ZhVog@mail.gmail.com>
 <20210416113252.km4w72vnruv6s2oi@sirius.home.kraxel.org>
 <CAAQ-SiOSw9u=yFrakjjjTvozpAW3nxhC+QeW7wswMSzSeZ_AVg@mail.gmail.com>
 <20210419131050.bltknubbkd4du6ti@sirius.home.kraxel.org>
 <CAAQ-SiMf=BV-HUudRayZkRPJjmkYWuiBuKqYHHLzYjcFnPOgLQ@mail.gmail.com>
 <20210419135627.dlerwnswhfxt6ciz@sirius.home.kraxel.org>
 <CAAQ-SiM6uWUgHTS5PQ-hSkuXNOoKC7fw6Y1ZHhJ0MCUE3oaBqg@mail.gmail.com>
 <20210420071304.gmndase3r6mwp5yt@sirius.home.kraxel.org>
 <CAAQ-SiPPNK0xqnPPSjNZgwQCs+Vj0_A5koq5xK8HzhZKDgqVJw@mail.gmail.com>
 <CAAQ-SiO6-Ay9415XsLe2Xd-KXog7i2Xvh0kX0h1uBgtj-L+=Ag@mail.gmail.com>
 <64abb96f-6c84-8dfb-f645-93d450d0909e@vivier.eu>
 <CAAQ-SiP9VmykC1vaHzur2ERo8U8GpUVGT8AoguK_68qxhCgnRQ@mail.gmail.com>
In-Reply-To: <CAAQ-SiP9VmykC1vaHzur2ERo8U8GpUVGT8AoguK_68qxhCgnRQ@mail.gmail.com>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Tue, 8 Feb 2022 22:56:39 +0530
Message-ID: <CAAQ-SiNrJCYkO3drq1RYYqPdqFMJjofp4dx5wVpz5ML3je2Mew@mail.gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 at 09:36, Shreyansh Chouhan
<chouhan.shreyansh2702@gmail.com> wrote:
>
> On Thu, 20 Jan 2022 at 16:09, Laurent Vivier <laurent@vivier.eu> wrote:
> >
> >
> > Hi,
> >
> > I'm trying to test your RFC series but I have a core dump (using alsa-utils speaker-test), do you
> > have an updated branch I could pull?
>
> Yes, I will send the updated RFC by tomorrow (Tuesday).
>

Sorry I won't be able to send it in today. I have the sound card ready
but I have yet to fix some things
from the comments on the previous RFC. I joined at a new position
today and was expecting to be able
to work on this after work ended. I still haven't been able to
complete the patches. I will send the updated
patch series latest by Friday.

Thanks,
Shreyansh Chouhan

> Thanks,
> Shreyansh Chouhan
>
> >
> >
> > Thanks,
> > Laurent

