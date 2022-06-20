Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D2A551646
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 12:54:00 +0200 (CEST)
Received: from localhost ([::1]:35244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3F2Y-0006Df-Nf
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 06:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3Ezq-0005RL-6e
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:51:06 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:45906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3Ezo-00054S-As
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:51:05 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3177e60d980so74420567b3.12
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 03:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MOACMW4ukJBnur3BDZJyqOknHkjiDshYNnDC81Q+PTk=;
 b=pPvDpjP6FJ2Z08NleCSmpEEqe6Hw6vZR+H9rlBk1DO4fO3O3/Gq5d+LVXPMaaWeThJ
 hv17mtrUPiiCBArtMeqKOXeUJpTFpSf5eSW9DKROdJMHP+ZUMKT6yy9pJJk+/zLzkQ1U
 VJj2PO9PCsPzoJAbqc4nMt+xDBttYf/bimFnlihP+vQU1icyo+gGe+UeqrZceRE5j90t
 cQsNTu+tyXybXEwCng7p828mbARmlUot/PqfKoqciqrO73L0fHu9Gy8t2X4HvnDZ2M7t
 RFoNWudB1j5g6z/CRpgh7wmFC3oNWjfKaxS8JQk69cTQrNoN2BDI1D464+HhHdLOva6v
 RbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MOACMW4ukJBnur3BDZJyqOknHkjiDshYNnDC81Q+PTk=;
 b=m6tZKeUSNvs+p2//r7i7/yQ36BSZ3lKfpvnEPtDW7PUYYyiAxyoyWPlme8fT+Rp6hz
 zKoUfrfVZf9aBQVKyfvn13BGek0Lvg1o/j+5OYiWZncOuYrR8+lkDJZueeP0NOmfTKSi
 X4cwqjbJyneDEUwWAVSiEbOQ6EyVKggvJLrOKAeEGF+JsRVf8CFTBXc62F1kSl73xLog
 +hBP2z/qV9aPz6jMqFrxsLz8rcAUFkpA+JntbUJLmB+JP/SBqGzZLQDFyYa0CbX9nBB3
 BQddAZ7Mwq8JLV++kap+tbTvYyLbTETPZC/8LYsyHtR9BwN14J7o5BfY2rSlDCqR8Hvj
 u+iw==
X-Gm-Message-State: AJIora8mM3SXx8+43bOyic8gvfaImA73f41rK1sz3P0FBjF5cvDWRi5Y
 JzGc/rzEqChrPWh85odcUgPC70aiMQL0ZbgWuW1z1w==
X-Google-Smtp-Source: AGRyM1tfp5Z42kpqyWhz6iAu/RskdksOug5iAeoxw+sfUtKnRV7xGovxLj95aEfNOqWmDuezVFvCaqVAcDFxFp87LSM=
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr10993993ywd.64.1655722263034; Mon, 20
 Jun 2022 03:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA80ABJ+RXFeoH4mo5yJk5oNh4Zc5QTBN35vVOL4eg0cNQ@mail.gmail.com>
 <a8f5f61a-c976-e48f-48e1-e87fecd61901@linaro.org>
In-Reply-To: <a8f5f61a-c976-e48f-48e1-e87fecd61901@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2022 11:50:52 +0100
Message-ID: <CAFEAcA_LzYqxSe=Pa7KJg-GuR8_E=Qfjj0s1by9LMasRiUR9sA@mail.gmail.com>
Subject: Re: proposed 7.1 release schedule
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 May 2022 at 16:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/23/22 02:53, Peter Maydell wrote:
> > I just put some proposed dates into the 7.1 schedule page:
> > https://wiki.qemu.org/Planning/7.1#Release_Schedule
> >
> > * 2022-07-12  Softfreeze
> > * 2022-07-19  Hardfreeze. Tag rc0
> > * 2022-07-26  Tag rc1
> > * 2022-08-02  Tag rc2
> > * 2022-08-09  Tag rc3
> > * 2022-08-16  Release; or tag rc4 if needed
> > * 2022-08-23  Release if we needed an rc4
> >
> > Does this work for people? I just worked backwards
> > from a final release date about 4 months after 7.0; easy
> > enough to shift it forward or back by a week or so if
> > that works better for some reason.
>
> Shifting later a week or so would be better. I'm on holiday from 13-22 July -- unless
> someone would like to manage merges in that period?

I've updated the wiki page to move the dates all one week
later, and removed the "tentative" label.

Ping me when we get closer to your holiday to remind
me that I agreed to do merges then :-)

-- PMM

