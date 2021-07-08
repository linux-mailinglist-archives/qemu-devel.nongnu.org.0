Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5360A3BF732
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:01:54 +0200 (CEST)
Received: from localhost ([::1]:38780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Puq-0000Dc-A7
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1PsK-0007EN-7b
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 04:59:18 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1PsH-0004ir-LY
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 04:59:15 -0400
Received: by mail-ed1-x52a.google.com with SMTP id m17so7425358edc.9
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 01:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qJiTRel2g9FSJfD58/K+OnH4ORnkdSBhAj6Uybqc2+o=;
 b=v/+gO9RUvkUGHo4KFGzqP6FMV9EXCLRMMa+YPcqmCDOCzG2mVX3OwDPogxEwbtORCd
 rhmyqtdFiLUpW1VWgVHoVpsFT3z+RImStU+mLeD/MXLBuyx5fN4kOiyrq1ZS/cQcr4BI
 VMdwBcFhZjsPPruj5PFvt8BPMm8IJ+udKXV4UYUHUAfW1d9T8tcdcgsqf8SiZd9MsePh
 CgEWgGUse+jo8qz6HBktvUuC+nNRmZ/AZhje1eW/jh9Tc4SWH2JQcHNMY6UHJYzgdbgP
 T9JskQZkUksndp3x1n063LL/MaPNUH5M9hT33QYFwSTpcaHUFTG80oAc6V9H2K/+nDMC
 twQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qJiTRel2g9FSJfD58/K+OnH4ORnkdSBhAj6Uybqc2+o=;
 b=O/Z2s7WjAuXSWp8GnxQe2DAgsGxCqih9Df8/kefPcrQYrMfqZHKWLiYhadvCn8Fr7R
 hRbbStIGWHupg1wtTpyL+j/duNr47yORwpZOdRBGcNbvwEQMFOyqUoSz4Hld+t+BozI/
 JpZMFpOXN5nd+TbVNoDGJbajY8AROs4IImLoIpiD2sDQSpo4RamImx9Q+OHUCl3u32/H
 u+6xHm4OBboKg7Oh/zLQuo8CYvXD6deJ8xKk8/8aaDUiGWMVNvpaw97n7c30QbvXOJ1s
 gZWkUtN9A0YYVqrzsRclDnq/IB/4gvjAN4u7VXxXAPLXqKahgk9cLMy0g/+U754/fVwW
 JUcg==
X-Gm-Message-State: AOAM532S5NN71GY5jwgIXmP4+Kwh3HGh5pGL/tDr8iUG5XxkNmIezpsM
 Hjk7jOWxs2h5DIe7ZL21zecxmM/Dc0RD3sFhBZW9Yg==
X-Google-Smtp-Source: ABdhPJxmAJmSbWwCufTgQA+D7kYo5w/5DsYKoBBJsUFkGT9hqLFxtzYQAo5VHBNduwJLZuQ1g0U2Dceop5Cm5U3PFXg=
X-Received: by 2002:a05:6402:1591:: with SMTP id
 c17mr11312650edv.146.1625734752016; 
 Thu, 08 Jul 2021 01:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <797ADA26-0366-447F-85F0-5E27DC534479@gmail.com>
 <CAMVc7JXgn5ttSEjPB_=rS9CsYiQOFS48hcAbr3NQnom-qk75VA@mail.gmail.com>
In-Reply-To: <CAMVc7JXgn5ttSEjPB_=rS9CsYiQOFS48hcAbr3NQnom-qk75VA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 09:58:33 +0100
Message-ID: <CAFEAcA-KxyVeKaRPV+A9RkTQGQBoT_LsgyoRH6mON96dTz7uag@mail.gmail.com>
Subject: Re: Picture missing in About dialog on cocoa ui
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Programmingkid <programmingkidx@gmail.com>,
 QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021 at 06:38, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Hi,
>
> My installation correctly shows the picture. Please make sure you
> install it and run the installed binary (not the binary located in the
> build directory). The new code should work reliably once you install
> it while the old code may or may not work depending on how you execute
> the binary.

The correct behaviour would be for it to find the icon both
as an installed binary and when run from the build directory.
(This is true for various kinds of loaded file including guest
bios images.)

thanks
-- PMM

