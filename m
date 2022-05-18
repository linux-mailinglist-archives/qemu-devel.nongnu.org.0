Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6478952B7BB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 12:34:17 +0200 (CEST)
Received: from localhost ([::1]:49480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrH0R-00044D-Vc
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 06:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrGxA-0002YK-DP
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:30:52 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:37762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrGx8-0001Ag-QK
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:30:52 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id v71so2898378ybi.4
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 03:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6VYjo6D60ICm1Bsii96igdB78MhM+JPiWL5ypQJWn0I=;
 b=kg6uMKZ8PYSzzl/jtgWmPF1BstnjO3j4CwHCu0yKtJQy8oJCXs/O3+J2/Y5R3snvNi
 xJloCqV5gstk2dp8T//JI31ii1cOBlHI7+m/xH/KiRw7jLMWXxlik3Rtspt/NO91yc4y
 FX2U5KKqvzOJ7Stp5QzTs59nQci/u0LjCEsosgRsTG+hacBUzftXpDYrmQ0UfHvbqkNF
 Okj5DsgzvN8gTuAYS0vrlACH6H45ByxEnpAhI4YC51LTKq5F/wDfLYkxvqpRMTqXcfgk
 kPf8s1dSzUQjCM4DbDpgOn1oqQAfEVbEJvrBQ9QzQcw9ND/ukuCi48bcIr5w56Xs0mWW
 y/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6VYjo6D60ICm1Bsii96igdB78MhM+JPiWL5ypQJWn0I=;
 b=4jVHjltXGI5hGqto+u81NMWvt7dUSCmM8AWQxGHAkL70iWagcG3+Mm2u3O83YTcHQ8
 brNoBFce6o4+NgN3ePQg14qa+iSbk5S0aR6gaxIJn43SfaNHMuSn8kwDWMS+6SUYBxjg
 LuuflmjV+cg3jhYWVeZmh160N7FviiUQ9aqSsVb54eNRzspdPDx5HLxnJUKH6g8flSek
 EfrIix/yhwQzndFYQ82DL1TZ1TKJW2Gu1aDDV13SnAPOaHqQSqrivioEjlXzUhua1Rkd
 TU96W3PY8kPuLCOl+gYWB0GO4Ccw6v2uTtS4yQzICDieUTeh7G7MaqRmjo5moxYbTEaz
 W/3w==
X-Gm-Message-State: AOAM5327fS6JQ9xmE2sMT9T4b/X8EyAdyWqbq4hfxXltisSnBLXr0aAG
 XtmJ4vB2Ege3qVg9XP6/d584tqcaEyoreVle3Y/BhA==
X-Google-Smtp-Source: ABdhPJwo1r9S0IGK+pJQaPGkfyAuLx6mIZvjrk5TsYPoAj5DWpq7XkSIqGnM4jNpZZf4gxZD+bfA96zlOobty4SApmE=
X-Received: by 2002:a05:6902:1543:b0:649:3124:b114 with SMTP id
 r3-20020a056902154300b006493124b114mr26435231ybu.39.1652869849850; Wed, 18
 May 2022 03:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220513122852.4063586-1-peter.maydell@linaro.org>
 <TYCPR01MB61604A48D4D67447A373F70CE9CE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB61604A48D4D67447A373F70CE9CE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 May 2022 11:30:38 +0100
Message-ID: <CAFEAcA9FvZZjHcSWVVwDE_XxGvFs-rJZgpdkcB7UuSPZj__jUQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Make number of counters in PMCR follow the CPU
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Itaru Kitayama <itaru.kitayama@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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

On Wed, 18 May 2022 at 00:24, ishii.shuuichir@fujitsu.com
<ishii.shuuichir@fujitsu.com> wrote:
>
> Hi, Peter.
>
> > Shuuichirou, Itaru: this is another patch where we need to know
> > an A64FX register value...
>
> Sorry for the late reply.
>
> The initial value of the pmcr_el0 register in A64FX is 0x46014040.
>
> After applying this Peter's patch, should we submit a new patch as a64fx patch from us?
> or do you want to fix your own modifications to the patch that peter has posted?
> Which is the best procedure?

Thanks for looking up the a64fx register value. You don't need to
do anything more -- I'll fix up the TODO comment and put the right
value into this patch, either when I post a v2 of it or else when
I apply it to target-arm.next.

-- PMM

