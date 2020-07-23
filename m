Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFF522B540
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 19:52:29 +0200 (CEST)
Received: from localhost ([::1]:60676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyfOO-0005Gl-Fp
	for lists+qemu-devel@lfdr.de; Thu, 23 Jul 2020 13:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jyfNa-0004kT-Rs
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 13:51:38 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:37039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jyfNZ-0004m4-4f
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 13:51:38 -0400
Received: by mail-ot1-x329.google.com with SMTP id w17so5012265otl.4
 for <qemu-devel@nongnu.org>; Thu, 23 Jul 2020 10:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BVlfn3AAWZV6nx0aW54CtW2+CNLKwOI+01JMPEXaALQ=;
 b=yv5oCa716FANd1fmC+gHKeIl7puJ2hSyAFdn3rAhkUh3tvOy7+STu9NtupvDD8Uiqm
 CEAPJhyCRHg/4iwvGYk/NnvDcKxiU+T6jjW+0n4T1g1UqseXes9A0NjZoszXT+vQsTOB
 GY6HYibqTV0PKdGyoc8M/9mc905rjNt+7Lj7Ly2xGQkl68jWAqgSeWwxk8X61g+JwA4w
 Ovnv8oVwLzDFjdILBh+aG9niaF75WFmG+Tue7eXUNDjN0Lgy/C2aTOQ7RfvETcB2Sw9S
 pzL4V5At+eEvKDHkbizdlV3sTz3bVbdbLWae3FhDfd4w5s5Kvp7gvooYAF7KD0VHYew8
 jtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BVlfn3AAWZV6nx0aW54CtW2+CNLKwOI+01JMPEXaALQ=;
 b=i38ALRNqzcNnRSpttyNWr6h3iEWpSw+SWv77YutgBN+vCA90x+jfeVXQx47Ig8T4fK
 lCf2PZ0VykyJdQ1ebCqCFo5mLHiYxxQH2uDPwiX1nYpyQZgIsFb4vzJCgDQXa5tqdabd
 5NR5nQSZ6ej4aSWWvHe0p/HwzizrwtTSqmRyq4ah8UfPgixst7fg1S4UqmDRRISD2LZn
 1+UHkoMc56Zxt4613vy2YkhHv8F3q7EFryA3fqhgQ85ACVR6WDD2z88W5+LNCnCPxaKQ
 qu6wNwNALlnOA2zlO7P6Ln4g/ZCh94X2XIWxpwxEZmRI0jETKaM1rJY6bIu8/XfnCVLx
 A0oQ==
X-Gm-Message-State: AOAM53038CU1zHzH6xLZsTYCRwDd3T6AyXZlMsnHMt724RzVijyfwlnz
 iJWrGN/rIT7FtoqJ2e7SdxWeuNYZY8m6Ph43irCFAQ==
X-Google-Smtp-Source: ABdhPJxV3mUlGt9jXaWM7+iTmLXVo3XW1zDIVPjQYQDaJaHDHOOdPm98iyPyyVMMcQA2O/2Eg7qY0SRvpi1+lROt1No=
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr5342049oto.135.1595526695944; 
 Thu, 23 Jul 2020 10:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <1592486508-6135-1-git-send-email-jasowang@redhat.com>
 <1592486508-6135-30-git-send-email-jasowang@redhat.com>
 <CAFEAcA-1K_zVHPFz31W9Tx7CmAXo=4-qQNJxrZnYT0Heg5_1NA@mail.gmail.com>
 <20200703181031.4ed6fcde@luklap>
In-Reply-To: <20200703181031.4ed6fcde@luklap>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jul 2020 18:51:25 +0100
Message-ID: <CAFEAcA_5xBd8YhD72gGQgXroVoGi7RZkNet6_Zk_b-NALuHQ-g@mail.gmail.com>
Subject: Re: [PULL V2 29/33] net/colo-compare.c: Correct ordering in complete
 and finalize
To: Lukas Straub <lukasstraub2@web.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x329.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Jul 2020 at 17:10, Lukas Straub <lukasstraub2@web.de> wrote:
>
> On Thu, 25 Jun 2020 10:30:24 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Thu, 18 Jun 2020 at 14:23, Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > From: Lukas Straub <lukasstraub2@web.de>
> > >
> > > In colo_compare_complete, insert CompareState into net_compares
> > > only after everything has been initialized.
> > > In colo_compare_finalize, remove CompareState from net_compares
> > > before anything is deinitialized.
> >
> > Hi; this code-motion seems to have prompted Coverity to
> > discover a possible deref-of-NULL-pointer (cID 1429969):

> > Either we need to avoid calling this if s->iothread is NULL,
> > or if it can't ever be NULL then the earlier NULL check was
> > pointless and can be removed.
>
> I'll look into it.

Did you send a fix for this? I couldn't find one in a quick
search of my mail archive...

thanks
-- PMM

