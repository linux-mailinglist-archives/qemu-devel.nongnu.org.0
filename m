Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F193316CE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:56:43 +0100 (CET)
Received: from localhost ([::1]:49716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJL3Z-0002fk-Vz
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJL1G-0001Hr-6H
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 13:54:18 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJL1D-0007mu-Ad
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 13:54:17 -0500
Received: by mail-ej1-x62a.google.com with SMTP id r17so22440809ejy.13
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 10:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s68YxjxghOLXRdJ5cBdo9TaspjWGSCJZKR5arDr7N7Q=;
 b=EDzteovQ5hIjdRvhQZT3Gy70cqpNPkOoiMUozTHHephb7wU7QojdZ5uW0J4vhriA4m
 u1aKcYqmJEViqhyZUuKXDlKCM//NbDECVoqj0BHzkD7uXwGl4RGxPTL++seE8JpmVQzl
 7fR4i2fhNm+BFNyXOcbWFrHYbxODATmYVCwBKYfYe+NtrbJlVfeaT3oYG3Uwn2fqbPcC
 sUUR7o9Ub29LJTbdcCcsTQXeL8b9kbCFfj7ofXsj0ACCEfdd3lriSrKtdRZTx20Q9Jrh
 np5BizOwPGL/99kb1TET4DaaLkv0SnJvczccP2mQa1mCvARmsVlE4846Aey2kmt6Npio
 l9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s68YxjxghOLXRdJ5cBdo9TaspjWGSCJZKR5arDr7N7Q=;
 b=hPK5XE0IAOXOrgiS5y7hx8WM1XH5v3OfQ8jJqewi/Nx17AEmF/HiYANcoBl5+6VLJ+
 qW5xe4lpeO88Bwf1lDH4NuFa1Q2ygwv3b7dQnE+dHGD6c1Qk4Xe9fxWWtyT1SPVZFie5
 065FigLQik7noRBmsIJrQ+K9vhy3hKDYUbtEChtLewT8O9IYyeTH2tY5aojhs4ARgIcG
 idg1MCOCMf8bKtpLbXCHblRdgtCR6udXq9N2h2/H0/hqDCtLnTEaRUB+9AooDVW7AYoS
 d82UF7YuQCln576+2Od8zF5gorAjlH4Gj7RJDHwBC/rVgrQaQ69S+B1Hqf2EmVDjEf//
 z+bg==
X-Gm-Message-State: AOAM532EeTr3u/5bBrtpzZIFgvpORA/y4BpUCn2TrwROch0tzD2SKJKr
 Z5seeLgwxvtYoWPFCRfzwUw5IWjOmRQSqL2+1VfLkw==
X-Google-Smtp-Source: ABdhPJy9tLzAt6I+6k764vmQ760BMTJq8iDBUHRKonuRJRJJe9zDwABgJNntJDRkW3+c4KZrmfYT9Ya+DluEpRFO3Lw=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr16786767ejc.250.1615229650389; 
 Mon, 08 Mar 2021 10:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20210308122313.286938-1-its@irrelevant.dk>
 <20210308122313.286938-2-its@irrelevant.dk>
 <48178d72-444c-91fd-c1ef-0ae28b8a674e@redhat.com>
 <YEZw/cDu+1zouiHT@apples.localdomain>
In-Reply-To: <YEZw/cDu+1zouiHT@apples.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 18:53:53 +0000
Message-ID: <CAFEAcA9Jf9JPyzZEagNKwd3pRwyY5OZJUV9U-=3LGwcCbF695w@mail.gmail.com>
Subject: Re: [PULL 01/38] hw/block/nvme: introduce nvme-subsys device
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Mar 2021 at 18:46, Klaus Jensen <its@irrelevant.dk> wrote:
>
> On Mar  8 19:32, Paolo Bonzini wrote:
> > On 08/03/21 13:22, Klaus Jensen wrote:
> > >
> > > This patch introduced a simple nvme-subsys device model.  The subsystem
> > > will be prepared with subsystem NQN with <subsys_id> provided in
> > > nvme-subsys device:
> > >
> > >    ex) -device nvme-subsys,id=subsys0: nqn.2019-08.org.qemu:subsys0
> >
> > Hi Klaus, sorry for not spotting this before.  In the SCSI subsystem we
> > moved away from using id as guest-visible data.  Keeping it as a default is
> > fine I guess, but would it be possible to add an nqn property to nvme-subsys
> > and use it if it is present instead of the id?
> >
> > Thanks,
> >
> > Paolo
> >
>
> Hi Paolo,
>
> Thanks for pointing this out! Absolutely - we have no specific reason to
> use 'id', so we can just change it completely to use 'nqn'.
>
> Peter, you want this in a v2 or did you already start integration of
> this PR?

I haven't yet started working on this PR so if the change is trivial
feel free to roll a v2.

-- PMM

