Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104E764DCA2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:59:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5okU-0006Sh-JQ; Thu, 15 Dec 2022 08:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5okP-0006RY-RY
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:58:08 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5okO-0007RV-22
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:58:05 -0500
Received: by mail-pl1-x636.google.com with SMTP id g10so6915426plo.11
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 05:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s7EkIF0DlPtyxHjFIZbSynkly5F8MyYoYfI3Ks+hgcM=;
 b=iuJARf6eIlDb8EaS9Yauwlhj5l3bgzKVllyWuvnQkyq28XlXVB/dDyzFCsZ/4V1Ku6
 F+VJr3IpR76eysm5V3fOukn7NIKVYpr2c9mJyfQGY1/oN7/r9cVu7abuKt+nCC08fb2R
 EZwefe/H9G+Ug7VE9RCjA2XZlzcYx2fo2E8te2b6n9jnjDhTh0PZsIYDHe4ApmptrOQe
 bG6WumPry+Ey0PhkrzF2FVdmY7+Jb09NVn45wIMduHQmnK1L/aZNFKxI54mY5s8EXucd
 7kGfrh4FUKP354VuzP2ooXf05fwxt/7AXOKyjbuG/ib0/0LD+80767brlAi4/nHJfe9a
 43oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s7EkIF0DlPtyxHjFIZbSynkly5F8MyYoYfI3Ks+hgcM=;
 b=iRMC6/zLDoj5rZTJbLslvb+/NKh5mgEFycX3az93lVpEf/EAJW5svD1oTyGwVPI3or
 uJ4RMcpMPVo9WBlUGA5r7Jq7h+B+uQ8iHsC+CRivfhuETmpbLIaYuJng+98LYy6FPkgI
 Y2beop2ok0GWPl68MpR7T9v94+1F/GDUXkFOq+siVA5A05YJupaUmyTZXtiLsbLc4MCd
 SZesemNMJE6zEkoTL/Dv4dEGnt6talWw9L7wTsa7LfyL/tfVdcn+xM8Btd5/Ijq0HBsn
 NH4XaPv5NLNPyCV95jzvPfNUjATXdnIYBB5zSh1Y92a544E+YkAcOwOdF6e5XoBTqQ7D
 4URw==
X-Gm-Message-State: AFqh2kpwlQN8kYjEzaM0Q0O9gLBbZrZfii0f7MWvo6wMhj1HhrCjE5Er
 zaF29dDDDO9JKE2KekznBypBhaM6TZMxVOXND4jRQQ==
X-Google-Smtp-Source: AMrXdXv3o+8WaNgnJ+4OVVnYUXmntqUC0AGjnh/pvMQu9vCtR444eAfS6xo8Wt1sqSlMusJ5ykplS5yZQ+HvjjUlvc0=
X-Received: by 2002:a17:90b:354c:b0:219:e2f1:81ad with SMTP id
 lt12-20020a17090b354c00b00219e2f181admr715431pjb.19.1671112682297; Thu, 15
 Dec 2022 05:58:02 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QVVQLueQDzOb-GAhORetK38EzgBhem=UjChJ3oaxRaFmg@mail.gmail.com>
In-Reply-To: <CAJSP0QVVQLueQDzOb-GAhORetK38EzgBhem=UjChJ3oaxRaFmg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Dec 2022 13:57:50 +0000
Message-ID: <CAFEAcA-1wrO9g+7LiKsZs+xX4Fb+sS4niT49SsXX_Q=Xmf0Rxw@mail.gmail.com>
Subject: Re: QEMU PPC VLE support
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ralf-Philipp Weinmann <ralf@comsecuris.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 15 Dec 2022 at 13:38, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> Hi,
> I came across this post where Ralf-Philipp is looking for a freelancer
> to implement PPC VLE support in QEMU:
> https://chaos.social/@rpw/109516326028642262
>
> It mentions upstreaming the code and I've included QEMU PPC
> maintainers in this email so they can discuss the project with
> Ralf-Philipp. That way the chances of a mergable result will be
> maximized.
>
> The Rust aspect is interesting, but QEMU does not have any existing
> targets implemented in Rust. It might be a major effort to create the
> necessary C<->Rust interfacing, so I'm not sure whether that's
> realistic given the timeframe for the project.

Yes, "in Rust" is at this point a good way to ensure it will *not*
get upstream. Not because we have an antipathy to Rust
(indeed I think it's a good long-term goal to have)
but because as Stefan suggests we would need to start by
figuring out what a transition plan would look like, where
would be a good place to start looking at Rust-like APIs
for things, whether the community as a whole has enough
Rust enthusiasts to push the project forward, etc. What we
don't want is "QEMU is 99% C except the PPC target has this
one weird corner that's in Rust and doesn't fit well with
everything else". I look at how much effort the
Rust-in-Linux-kernel folks have had to put in to get to the
point where they are now, and while I hope we won't need to
do that much work, their general approach to it seems worth
paying attention to.

thanks
-- PMM

