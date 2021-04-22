Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653493686DF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 21:00:26 +0200 (CEST)
Received: from localhost ([::1]:56578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZeYr-0000oS-3F
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 15:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZeXr-00008z-Ek
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 14:59:23 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZeXn-0007IX-Ay
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 14:59:23 -0400
Received: by mail-ej1-x62d.google.com with SMTP id n2so70320324ejy.7
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 11:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WdV2Pi3Jy08sJe9p7ZcxagLyUsCk2b6w5BsPAK8FkYE=;
 b=qw1yKgm7+C67II+wbsGKjw8uc22zftIhohGC0mTIR5ci+2u+zV82Kk3X0Hm7L+8flS
 9cc1Ds1kpi7hwOknRZm1KeWOS/l4E6wYh5DuVebjwBLJArK4zfESzwFyUqxsCn3brPPf
 WBkigdAPjjyr0cQiptI9Mw94qVmiA9C/yKRWLTY2SkmdDDmxdfselfbTFjD91LqzHSm4
 R6gLxHvOCy9uj4+VWdC2odPRuElhO4iOiAiebfjzadV7C4J2RurDwHF8Fzowj+27Tc85
 497uMj0TxeY1GSRL5lHUz7MSNOhu2znUWVV1VWhPaCHnL1Mb0b0N2XNjcNGcRmbTxI1f
 T6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WdV2Pi3Jy08sJe9p7ZcxagLyUsCk2b6w5BsPAK8FkYE=;
 b=hZLDQzUmz/OVSQTWXgHsLXfl9WsUkd4wjHOKAQXtFLCRWL/3jHT0tGA6O1JT97QXzv
 z2hn3ZQ0q7UWo/pAaax7M3V5IJFPWW1H8n77dRSzT3sW/c5nGGfeiZ49C0+svnCRceAw
 3V+R9Q3+lUINauCnf/rx9I0RP9pTdVP/cypeKRnGjIWEkM3YU9tSHpsxJQVqUXO/dJW4
 syLxVLVa3rRlKRUnQ7yN6KyF9FHoYkdZ7skXQG4se5KgNYT4Yl3WSLkEyZNRvuLB1TXp
 fiue1OnZKbS/N90FJUmLEAEUm2VmmjTA/mvrSoeQndkpodQQJdygGjEvMUZczTAvjBB0
 B7rw==
X-Gm-Message-State: AOAM530vIjlJzG23NNnQgjQ+f3CkbhcrZyCltWFje9oNkd4JRpdFBA/f
 TjaS7tFVarLPaBvMXFfurho8l4zaB16FvpEqXwKbog==
X-Google-Smtp-Source: ABdhPJxFR/Iu9zepfi9YPWFYQ8hR99DduJ14NiIPKTxXZJDzkbqtZK37WLc/z1PoOwUiEIxN0/X6spq9+CBd1u5JQZQ=
X-Received: by 2002:a17:906:29ca:: with SMTP id
 y10mr134963eje.250.1619117956155; 
 Thu, 22 Apr 2021 11:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210422135834.406688-1-its@irrelevant.dk>
 <YIGDG5qKcZwVj88t@apples.localdomain>
In-Reply-To: <YIGDG5qKcZwVj88t@apples.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Apr 2021 19:58:21 +0100
Message-ID: <CAFEAcA8LZXVgOLYAVvqMFvO6Hi8618eYtT5_c=vJjAcsN9vCCw@mail.gmail.com>
Subject: Re: [PATCH for-6.0? 0/1] hw/block/nvme: fix msix uninit
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Apr 2021 at 15:07, Klaus Jensen <its@irrelevant.dk> wrote:
>
> On Apr 22 15:58, Klaus Jensen wrote:
> >From: Klaus Jensen <k.jensen@samsung.com>
> >
> >Hi Peter,
> >
> >The commit message on the patch describes the issue. This is a QEMU
> >crashing bug in -rc4 that I introduced early in the cycle and never
> >found in time. Lack of testing device hotplugging is the cause for that.
> >
> >I'm not sure what to say other than I'm terribly sorry for introducing
> >this and if this means an -rc5 needs to be rolled, then I'm even more
> >sorry.
> >
> >I think an acceptance test could have caught this, and I am already
> >working on an acceptance test suite for the nvme device, so I'll add
> >something that test this as well. But, well, it doesn't help now.

> As far as I can tell, to cause this crash, monitor access is required,
> so I am not sure if we can get away with a note on this in the release
> notes and fix this in a potential stable release or next.

Is this a regression since 5.2 ?

thanks
-- PMM

