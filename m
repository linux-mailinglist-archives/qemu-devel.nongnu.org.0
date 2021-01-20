Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683902FD162
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 14:46:35 +0100 (CET)
Received: from localhost ([::1]:55300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Dog-0003R1-Ev
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 08:46:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2Dmt-0002Yj-QN
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:44:43 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:43210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2Dms-0000vU-4B
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:44:43 -0500
Received: by mail-ed1-x52b.google.com with SMTP id n6so10722134edt.10
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 05:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jiZceZfrxcX3XBf5xW4hPXkGF7vUpDHKO4dxpnUhtQg=;
 b=oE2AYM3G+H06r10jQ9y25TWAPxqkJGtoYX54uRdDBkZZpreochJhNd2dmByI710N03
 f6ReZz0VgWWdbX47ryvgI0wgawUUTIJn9v0xrwRcMskPVPhbaMiEOLadFblspcdJRhtO
 3mBxOxMw6tZ+qJLUngi+wyJ+TWlYU94fL8LJUsCO8e+vo8lMGDmgzj3njwr+F2qCDd0c
 ks8bU6QVwHB99PyI6s+8VuzACEsXWpWER4148aEcCAEFoMk5lUKio5h+YY/Y/cbN5RZh
 0n7xVIhOj6CnYLMAsFsEjaRJkQNbjcU4TNO/ropmoUEaJ3GUeScOd4uAvw++P+mfsa8v
 vC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jiZceZfrxcX3XBf5xW4hPXkGF7vUpDHKO4dxpnUhtQg=;
 b=TwvwRRd0QXJarfSI/24sl7RxyFZmD7WmGcTCU9CEU3AFAwsfVb48PuJYLSsOznGXge
 oDmFmddRl+J98ErZCedqb+jfMmjbJq+piVbbCwTux2GKbPQAK3FQeXrtM4YSlxynjNin
 PvMpeJRc9rvYn07SWKyTh87y5lN0KV3GkfrTurkho+JqvDrGF78xrLjoDgyrwPRb0oh0
 r6SmDlGQuYGOzM2rNu+eVdjSpV5r9p4ljszBqBOY0YM33AOlSdRS8cTXuT48/ibjrpdl
 FWaBLzQoeyAqSs+SI2RKyLRceN0TGbZjNqhwHcJFHgWFWoxmJIzG3S5dXsWjD8NRV3cK
 Einw==
X-Gm-Message-State: AOAM531IEz/E+tbQ/1xDEtX1AjRdEBuL1GZx2FBgIF8ruSGMD1u5uzE7
 s9JBnOZ3YzAMh4JDUpvAIRfSXXMeHBEsfHUTBsY2qg==
X-Google-Smtp-Source: ABdhPJzXgG2uI0TWno8BtIaXwyQa5WvMq/ZQ/89/kKO142JaJlVo4YcdTBZajmP/3C0Cj2JeFpLJp514XuQ3R5Tk0Us=
X-Received: by 2002:a05:6402:1701:: with SMTP id
 y1mr7235882edu.251.1611150279870; 
 Wed, 20 Jan 2021 05:44:39 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-14-richard.henderson@linaro.org>
 <CAFEAcA8MsWyA7Aam3VzfV=r_scaD0J3zEBR0bNE-Re7OdL+ezg@mail.gmail.com>
 <6b0cea60-a675-1c62-0f2c-4d616a6c1b58@linaro.org>
In-Reply-To: <6b0cea60-a675-1c62-0f2c-4d616a6c1b58@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jan 2021 13:44:28 +0000
Message-ID: <CAFEAcA88HHHe4HLcP=nbJrdfC0Omg0MugEBVgaO7-8HQPu2jJw@mail.gmail.com>
Subject: Re: [PATCH v2 13/22] tcg/i386: Split out constraint sets to
 tcg-target-con-set.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021 at 23:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/19/21 5:27 AM, Peter Maydell wrote:
> > On Fri, 15 Jan 2021 at 21:20, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> This exports the constraint sets from tcg_target_op_def to
> >> a place we will be able to manipulate more in future.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>  tcg/i386/tcg-target-con-set.h |  54 ++++++++++
> >>  tcg/i386/tcg-target.h         |   1 +
> >>  tcg/tcg.c                     | 122 +++++++++++++++++++++
> >>  tcg/i386/tcg-target.c.inc     | 194 ++++++++++++----------------------
> >>  4 files changed, 244 insertions(+), 127 deletions(-)
> >>  create mode 100644 tcg/i386/tcg-target-con-set.h
> >
> >> +#define C_O2_I1(O1, O2, I1)             C_PFX3(c_o2_i1_, O1, O2, I1),
> >> +#define C_O2_I2(O1, O2, I1, I2)         C_PFX4(c_o2_i2_, O1, O2, I1, I2),
> >> +#define C_O2_I3(O1, O2, I1, I2, I3)     C_PFX5(c_o2_i3_, O1, O2, I1, I2, I3),
> >> +#define C_O2_I4(O1, O2, I1, I2, I3, I4) \
> >> +    C_PFX6(c_o2_i4_, O1, O2, I1, I2, I3, I4),
> >
> > Personally this is the kind of code where I would follow
> > CODING_STYLE.rst's suggestion of "If wrapping the line at 80
> > columns is obviously less readable and more awkward, prefer not
> > to wrap it; better to have an 85 character line than one which
> > is awkwardly wrapped.". The parallelism between the lines
> > is much easier to see without the linebreak.
>
> The maximum within this section is column 92.
> Still ok with that?

Yes.

-- PMM

