Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C1B613854
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:47:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opV73-0006rI-Mm; Mon, 31 Oct 2022 09:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opV6q-0006kh-Hp
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:45:53 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opV6o-0006lx-Tj
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:45:48 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so15963649pjc.3
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5HKlZCPJ+4quX3pOUMtlg1UfdbqJD7UqP/2NGZN//rI=;
 b=VudfAZ0/EnSyiRmV1SMtTK0Be/osLsv2MK9EVzlo2V7JLDnUJ+qlMMDT+Gb0J5HJ23
 3tiy4tiJ2lWH5pVmG2w3knGP42nuTjbfvNXhgZQ/umwcvOIjQiGUdmMBYw01Pv8b6doS
 LRxqiBtU3U9IhmvHvLo9PHZDTB7xTJFgYp828k190+KnhqxHAoO4cNJ6fjqYNp8//eu/
 Hj9GHdiEjW/GgSYuJN4wRP4BpZ7pcfPTHR4gljikNCXWQNIdksNxezSnOI6tFrNEPp39
 wxbprFSJDiAw9aO1/SwOsPR+URGHYqk8ojOdO85oUxM6sqmup9aSIms5UanV+ZyxCofu
 CRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5HKlZCPJ+4quX3pOUMtlg1UfdbqJD7UqP/2NGZN//rI=;
 b=b3iWlKE5EeUSOhtBk4dhb/H91dEv9McWj/wZVaAfSLDuqqYtlWPTvWk20eoyj93yGD
 ftfwQUnQ/4cKNnFWj7OSCqnYbhlvGLBq9ITz5Ljsl+r3nquZwg7z3J/seSYFBSv3fFb0
 VTs+T3HAy5wCN7N0LTNyw9XHSH0nnv6hUCk+YZMx2U1wmm5rhdnbbz3mMGNYUNloo8Ge
 3rDK9A8BK+qiQr702ssnXsXz4HMTM9KcLzmeMSoVKZhHM6irTyDMNG+o6MrOI9fUDm22
 HmLDU7pklWUaWyMxhJgZyD4Rlu2vb2IT6pdarGcqTvlBnLTXFRZZ6T8mbyP37/tZmwKJ
 S2VQ==
X-Gm-Message-State: ACrzQf3zJyhW5bWiOnUO9MrD8hRLLMlzr1rKtcOkMfHPcl59rQ5JaTXM
 uNPRFyXknJm6cwl2paokInlHmT1FlgfW/shq6aQYNKpvw8U=
X-Google-Smtp-Source: AMsMyM734zOmsmcohonN5HlJ6Ejo97Ruvun2eiS7KWE/0mNFaD35jNjw0+Uhrb/gSae5xXK3KpVFUdFZdTaWD6ejshc=
X-Received: by 2002:a17:90a:164f:b0:213:bda6:2873 with SMTP id
 x15-20020a17090a164f00b00213bda62873mr10856942pje.215.1667223945598; Mon, 31
 Oct 2022 06:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221027112619.2205229-1-tkutergin@gmail.com>
 <CAFEAcA-xm1PmZc-cNeJWkBvSFRMmRJ6n2S8CS7hr9w+8HL0QGQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-xm1PmZc-cNeJWkBvSFRMmRJ6n2S8CS7hr9w+8HL0QGQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Oct 2022 13:45:34 +0000
Message-ID: <CAFEAcA9rDMjKi_diMRUeDgv90YdJxEaWzYB1OpZ6=q8o34bJCg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fixed Privileged Access Never (PAN) for
 aarch32
To: Timofey Kutergin <tkutergin@gmail.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 28 Oct 2022 at 19:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 27 Oct 2022 at 12:26, Timofey Kutergin <tkutergin@gmail.com> wrote:
> >
> >     - Use CPSR.PAN to check for PAN state in aarch32 mode
> >     - throw permission fault during address translation when PAN is
> >       enabled and kernel tries to access user acessible page
> >     - ignore SCTLR_XP bit for armv7 and armv8 (conflicts with SCTLR_SPAN).
> >
> > Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>
> > ---
> >  target/arm/helper.c | 13 +++++++++++--
> >  target/arm/ptw.c    | 35 ++++++++++++++++++++++++++++++-----
> >  2 files changed, 41 insertions(+), 7 deletions(-)
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> Not sure if I'll be able to get this in before softfreeze,
> but since it's a bug fix it'll be in 7.2.



Applied to target-arm.next, thanks.

-- PMM

