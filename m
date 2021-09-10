Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE445406C53
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 14:42:26 +0200 (CEST)
Received: from localhost ([::1]:36880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOfrN-0000Va-T7
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 08:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOfow-0007Fu-Ot
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:39:55 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:42864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOfov-00023k-39
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:39:54 -0400
Received: by mail-qt1-x82d.google.com with SMTP id w17so1231896qta.9
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 05:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P6vZyNxT5qkhOOGie6O4GL7wCfzPNieUuDbc1dSxijw=;
 b=n9QDG4Q4SnXg09IvL9dd2roFsg6lYXZxmwFA4kWzDyKsIJiOIGWYXnaVh2iE8UZHtD
 oHD51n8MSWLCpCewrezLUgfBSBhOu6HyQy3ZX8g1RWk3PY0yxIqy1PZtN+ROsC9aGo30
 jwrgyHbU6ft9NTjTKkUahM12JxwyxnX88uSuRCAsHPHqTi9hiCe31n9JLnJpobixplQ0
 zqWFj55FlQs0JwU4m4dnWq4lcj2/Jr93nb6x+Bp1rqn5+Q2t0ZYHKyHbHfKyPHWZFMMx
 OSEWblTKj/A9dtLykIo4JynhUcNShHNirPbZj/o4Kk+mtXAL/mFvRkhB3woovVWRMCJx
 vSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P6vZyNxT5qkhOOGie6O4GL7wCfzPNieUuDbc1dSxijw=;
 b=dYvBrcWrxhXYHw8ekFto+tvllSkR9nu6X0gFN3yCzAiChSj7GZPk4f7IMMoZ6fK7zQ
 sS8v602pLBB4/5Qt/17bjB4hu/FBvSo44Jyi6u8w2RMMFK5s0rrb1ujN8/ZZxpBMS4Fd
 ZrOv3z88rtwyId5uRlpc68G6o2a1pjmGhrECt/NfuCO/vlp9msWtIToKC46P/yVtD8PM
 EcbazxFb7VucQq/IENPB1qG7HhCjUZcIEkL20ulPd/Q1EbXm6A+gse13xukNaAhvEiq1
 ihcNalTIOEmAi08yAc3sqOGQQjNf4UUEXqgC14trDPSOj3Y7VWKdTIpGOjCLlnUWc0+T
 GXjg==
X-Gm-Message-State: AOAM531Ib6R00dNb4GyL9bpoC4f4jbFhwxGR3VkQDAWmRNcrJX0E+I5i
 T97qMAn9lwaNN5OFEPqoMkW6nw==
X-Google-Smtp-Source: ABdhPJy3YZM/H+xBAUV8DZow2YFzQiaxDz8JugftOFFaMVyNB2g/z+N/boMxrPJyn9RA6hKkIS2jKA==
X-Received: by 2002:ac8:7d0d:: with SMTP id g13mr7574945qtb.367.1631277591612; 
 Fri, 10 Sep 2021 05:39:51 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id x10sm2985824qto.41.2021.09.10.05.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 05:39:51 -0700 (PDT)
Message-ID: <909bcf70ba8d88d485ec0b36371633e54edef81c.camel@linaro.org>
Subject: Re: SMMU Stage 2 translation in QEMU
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Sep 2021 08:39:50 -0400
In-Reply-To: <CAFEAcA-k8=M5KQWoJ=yurAZuHt9=F9mb002Z=7T_EC6x5EP95w@mail.gmail.com>
References: <bac0b38fc7c5f7a5a1c91784eb7236de39b6f18a.camel@linaro.org>
 <CAFEAcA-k8=M5KQWoJ=yurAZuHt9=F9mb002Z=7T_EC6x5EP95w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x82d.google.com
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
Cc: Eric Auger <eric.auger@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I am referring to the latter,"purely emulated QEMU with an emulated
SMMU that handles accesses to emulated devices"

Thanks
Shashi

On Fri, 2021-09-10 at 10:25 +0100, Peter Maydell wrote:
> On Thu, 9 Sept 2021 at 21:18, <shashi.mallela@linaro.org> wrote:
> > I am trying to understand the approach required for an emulated
> > SMMU to
> > convert IPAs(from each qemu guest) to PAs(respective host
> > addresses)
> > using stage 2 tables.
> > 
> > The questions i have are:-
> > 
> > 1) Since SMMU stage 2 tables are expected to be created and managed
> > by
> > a hypervisor,if there is no kvm support,who is responsible to
> > create
> > the stage 2 tables in host memory? is it even a valid use case to
> > consider smmu stage 2 support with no hypervisor present?
> 
> So what exactly is the use case you're talking about here?
> Do you mean "purely emulated QEMU, but using a host hardware
> IOMMU to do device passthrough of host devices to the guest"?
> Or do you mean "purely emulated QEMU with an emulated SMMU
> that handles accesses to emulated devices" ?
> 
> thanks
> -- PMM


