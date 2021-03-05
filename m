Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8561632E63C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 11:25:01 +0100 (CET)
Received: from localhost ([::1]:58070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI7dk-0005Py-IH
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 05:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI7c5-0003zn-Is
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 05:23:17 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI7c4-0002xd-3k
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 05:23:17 -0500
Received: by mail-ed1-x52b.google.com with SMTP id h10so1837592edl.6
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 02:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6VCuuBtbuc8EStm0rgjyCLYmu6kKh/SbbcBZq5BmvOI=;
 b=y+BEdgaCBzdC+JZSkiSPqTwo5LYtWRXgqNaWCN6ZdgtoUyf0fZhoghWlnY1xjAuxsH
 jPEeGNt1ps/Z/FrhQtqCc3gs4OaXqdQ22Covk9quVYsMhy7ltDox/trBFY1rWERFvR8L
 BSPPJfUY8M/3gxPnO2JsXl/9YpO953TqQtZOX4b8zGUPOc9RG3jasRo7itkF3kuT5mFh
 tA1lFxeBpad3WE0dahG5mDk6BZJgPfuhBgbLPv1AjvFgCHvnn2mlqihf+oh9t0Hzux9O
 +h6ppIWu5tRIjZ0f74zEGy5wV1LUX830tJNjD19cZKMXKbQNoYl66X66Y0dzQWo1pFbQ
 9LLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6VCuuBtbuc8EStm0rgjyCLYmu6kKh/SbbcBZq5BmvOI=;
 b=W8mnfIVMFKLKnoo4B8RZJan0MK4StH3bnw4y/kUGL7WkEcH51Gr5w3K5Ucj8wtdJkC
 i6Aac9YLMzCzalk0gqvxVOWMYN1AAfAJcn1NPmmugYPBglWeEw10kxldFcAcabzc0vn9
 VBYOaAoAfNnbm/SWOyIvN18scZMZgJT4TiaFRO2pJHxCwj/uDGoBKKZqa2NA1FDDZUK9
 HbUcXducIN0xhraY/IcWvTNgkHhQbp40OUBz9hfBAh4CCEikWYEIXc1hwP2CN7gE6uXU
 CpJXbWtCWsYMZLmC5UQ659ycuFcPghqgp+B6X77tmjdpCsnWpw9hV1PNiF2hmLkZCkC7
 0Geg==
X-Gm-Message-State: AOAM53045dUCd4K1xZNcI2GGJFofhpG13KTC2+P/TUDY/QzRoWZkOh8v
 nn9VEyR4OO8ENcOLeZgfVypvMIqUO7+qiP9h56c/R9JkP1tXSg==
X-Google-Smtp-Source: ABdhPJwDE1uTKZNemTqPV1rS8OXGhiQD0qjFjItEviGk+EqWbNKiONjbLdq8jKKcRhbmslcb7t5oZJ5i8aOB+sXcSh8=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr8290734edt.251.1614939794628; 
 Fri, 05 Mar 2021 02:23:14 -0800 (PST)
MIME-Version: 1.0
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-44-peter.maydell@linaro.org>
 <5283165e-f8f8-fd5b-843c-2010d212785b@linaro.org>
In-Reply-To: <5283165e-f8f8-fd5b-843c-2010d212785b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 10:22:59 +0000
Message-ID: <CAFEAcA8kLV_gxbD+Gt+c4ShTxcPKEUHYvF26gmtDA_-iAuWdTQ@mail.gmail.com>
Subject: Re: [PATCH 43/44] docs/system/arm/mps2.rst: Document the new
 mps3-an547 board
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Mar 2021 at 01:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/19/21 6:46 AM, Peter Maydell wrote:
> > @@ -1,5 +1,5 @@
> > -Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``)
> > -=========================================================================================================================================
> > +Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``, ``mps3-an547``)'
> I think you should drop the list here, as it has gotten *way* too long.
>
> > @@ -27,6 +27,8 @@ QEMU models the following FPGA images:
> >     Dual Cortex-M33 as documented in Arm Application Note AN521
> >   ``mps3-an524``
> >     Dual Cortex-M33 on an MPS3, as documented in Arm Application Note AN524
> > +``mps3-an547``
> > +  Cortex-M55 on an MPS3, as documented in Arm Application Note AN547
>
> The list is down here, anyway.

The title is what generates the text for the table of contents in the
next page up:

https://qemu-project.gitlab.io/qemu/system/target-arm.html#board-specific-documentation

I like having every board model listed explicitly in that ToC. (Though we
have broken this rule for the Aspeed boards with "*-bmc"...)

-- PMM

