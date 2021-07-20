Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0183CFAA7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:35:02 +0200 (CEST)
Received: from localhost ([::1]:59016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ptl-0005k5-Sp
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5psu-0004xD-T3
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:34:09 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5pst-00027c-II
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:34:08 -0400
Received: by mail-ed1-x530.google.com with SMTP id l26so28447915eda.10
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 06:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EAh+MEDeWR0KwiceLcGIW+5mfFA9U6vjw6tAtE/68F4=;
 b=kf2V6BltQK2I/8TmqgiL9NTREDV7YJrPc9o2HXhqrx3KnNk83zXCmkRo7q173aTtov
 c3IAtw0d+baCcGz+bHRvfORdQQbPbyoR7A2Fro0odsu91EA5QH2EfVh3AEkKGVZ1lRcR
 K3ogFCTR3D6xq4zbefY3K4NaKc4+nQSz19TmwvYVzkjDz9/CjSdHWFpDxLkUiTB/+rOD
 Ba1XMDhoz9XZc8wuzcLp+faZe6inrmR+VUXcTWa3z1dsLi11/SJZTePPTjc6TVfeuQnW
 bqX7evgID1R7MaMTEP6gcDjd7uNqzidUxIFJjPAlruvodY76PhF3erhNy1rU5Q467ENS
 cLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EAh+MEDeWR0KwiceLcGIW+5mfFA9U6vjw6tAtE/68F4=;
 b=p1N4GMc06YMk5UjN9NaVqx4BCTEQjU/sCC2drd9OPv4ebZTZ7IBW0CUoJWCpWeLeMN
 abLVaU59PDd97t8+EuM8xWA9sGOrBoSi/ST0Q7UN6B9hzyX28Ws3Nm1gJRFsq9I5A/TL
 VxfiynlARlKgnE+PJIYq0KI+YjHKR11K2v0fje0Ux3YvHNazUkry7dVGyGiBys8hGqZM
 b9wl8Yg5eh+Ur38Bq165aeA36Rmin5TncsRLfOY6mFoiueM5FkbRVa3UEu3vgiYVQyEI
 TNHkotPT3CcVJ0YXncPU1Rmy/A1yVMVwG5csexN0Y86VqGyGKgerERWcbReDF0WpsqYN
 OQjA==
X-Gm-Message-State: AOAM530XDR8EikNkHHen11OAbDKercsxpMHv/J51Tmnde2zw5hp3mg90
 bnSeoJjtWmbwANmNH/kMLgztCCHO/jVbWj/vFW3ePA==
X-Google-Smtp-Source: ABdhPJxPouXBVzNe+hZv1jML8NDKojisRnIMf3LjErHsOB9FccWjw5Sya4aiu0IOo9GaO4M4I9IufLY7B4lNR5Mro+o=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr40223847eds.204.1626788042275; 
 Tue, 20 Jul 2021 06:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210719224647.68559-1-its@irrelevant.dk>
 <20210719224647.68559-5-its@irrelevant.dk>
 <ccc55fb4-2488-83e1-589c-53b3f31b6719@redhat.com>
In-Reply-To: <ccc55fb4-2488-83e1-589c-53b3f31b6719@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 14:33:21 +0100
Message-ID: <CAFEAcA-yM3H43KBc4je-PhyXKgSpr4Vu=56P3T22tTLY90OUqg@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] hw/nvme: fix mmio read
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Jul 2021 at 13:58, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 7/20/21 12:46 AM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >
> > The new PMR test unearthed a long-standing issue with MMIO reads on
> > big-endian hosts.
> >
> > Fix this by unconditionally storing all controller registers in little
> > endian.

> My brain overflowed at this point, too many changes to track :/
>
> Would it make sense to split it? (per big function body maybe?)

I did review of (a previous version of) the patch by:
 (1) check that after the patch is applied there aren't any
     direct accesses to n->bar.anything which don't go via a
     ld*/st* (ie it didn't miss anything)
 (2) check that the accesses which use ldq/stq are consistently
     doing so for those fields and that they are uint64_t
 (3) read through the patch and check all the changes are ok
     (either using inline calls to the accessors, or fishing
     the value out at the start of the function)

It is a big patch, but I'm not sure splitting it apart helps much.

thanks
-- PMM

