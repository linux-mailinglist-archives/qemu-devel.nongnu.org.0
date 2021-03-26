Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DA234A62D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 12:13:27 +0100 (CET)
Received: from localhost ([::1]:45876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPkP7-0002iW-Rx
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 07:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPkNh-0002CY-Ts
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 07:11:57 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:33598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPkNg-0004ls-27
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 07:11:57 -0400
Received: by mail-ej1-x635.google.com with SMTP id k10so7871478ejg.0
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 04:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GOUk3GnseeQJhSnamSlavjU29reDc0ENB5hzvG5GaQg=;
 b=txH0cIKLzDSouvhIsuUK1IX24EOwoTRWy8r9uZISjRF8YGAWLsU8y644kM/WSmwuTZ
 dZlDzStsoGZJVc4oh2k57BhETfxlzQlAWtbdaDgEeBUnSTa865PDyT5T1WTaEdSVVLzI
 A+ot/hJsFO2mQQL/vPyc8a6A/dNOYRmpjKEUiLeLAZE7UiiM6viWeCHjI7X/wwEFtWmb
 stnRy9DWHwLCriKzoU3lytSYIUxTe2uY4nYzp7Q4eawgitjahqN7F6Kw7FXUSwryzPGa
 9zVGjbb9NAX9Fg6qs4J3HZEB4gS6hdnZNLp/ZdU9rbUCIy4/JaP7GanA7jj9aRcj36cF
 RwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GOUk3GnseeQJhSnamSlavjU29reDc0ENB5hzvG5GaQg=;
 b=paWgRJVznjbgY9+isKdMQ6ifq1wuebHagEvjeewuNPdj0TYO6Ul3KK2wbCpFFArpJg
 edaEB6xA51hnGQNnwCoV5XoVX8qcJSlzurIFw0yDfuHxksYrgtXFUrBtHLJTvAHV4/Ji
 HGEf1OETvWcm4Dz6v3QbLCqaWY5s07s7xDH1UMAQjhvnP/bvm5c83Bh1P9w/DdpRqUvr
 ilU8ss71A1Mqv6ftYqsTmuO/1pQF+JoXLNfXaRl4LpKuqFaTmrQ8HBHg7/jgcdJL28+p
 Z2zsZItG/k9vLszKOl0XMaEom8mvSl7/1CZTfG+GAhArqUXyyNwGQBvut10m/Y+nRnPK
 wC4A==
X-Gm-Message-State: AOAM533oYeXRvP1vcANpKI1RoKtfhh3BhCurf9yp+4tQ3279X6IdAA7A
 S3CyK7dJLKc8r7AgxVmE5P3ulQKgULToKtke05eUrw==
X-Google-Smtp-Source: ABdhPJxEq8dZUXZWbAbrLVwTqj4G0REhDUUZgSIfWwPKyTXGS19gAJ6WffQ1MpewH6WO9wi70CNANjp0OR6USdEtW9k=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr14874868ejd.85.1616757114568; 
 Fri, 26 Mar 2021 04:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210325094150.28918-1-dylan@andestech.com>
 <CAKmqyKMGROe+k8=f=_Vw8eLwo-PF-ENQeoD+WSte_G8dRHmatg@mail.gmail.com>
 <20210326101833.GA21700@andestech.com>
In-Reply-To: <20210326101833.GA21700@andestech.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 11:11:26 +0000
Message-ID: <CAFEAcA_FeHarfkO31=OS-gdBFKgQq4U7pPj1HBeuVLPkeMZj=g@mail.gmail.com>
Subject: Re: [PATCH V3] target/riscv: Align the data type of reset vector
 address
To: Dylan Jhong <dylan@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 =?UTF-8?B?QWxhbiBRdWV5LUxpYW5nIEthbyjpq5jprYHoia8p?= <alankao@andestech.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "x5710999x@gmail.com" <x5710999x@gmail.com>,
 =?UTF-8?B?UnVpbmxhbmQgQ2h1YW4tVHp1IFRzYSjolKHlgrPos4cp?=
 <ruinland@andestech.com>, Alistair Francis <alistair23@gmail.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Mar 2021 at 10:21, Dylan Jhong <dylan@andestech.com> wrote:
> Currently, there is no structure like "qdev_prop_target_ulong".
> So, we still need to use an if-else condition to determine the attributes of the 5th parameter.
> Something like this:
>     #if defined(TARGET_RISCV32)
>         DEFINE_PROP_UNSIGNED("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC, qdev_prop_uint32 target_ulong),
>     #elif defined(TARGET_RISCV64)
>         DEFINE_PROP_UNSIGNED("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC, qdev_prop_uint64 target_ulong),
>     #endif
> I think this is not be what you meant.
>
> The other architectures seem to ignore this, they just choose one of the attributes(qdev_prop_uint32/64) as their parameter.
>
> So now we have 2 options:
> 1. Use "qdev_prop_uint64" as the 5th parameter
>     DEFINE_PROP_UNSIGNED("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC, qdev_prop_uint64 target_ulong),
>
> 2. Use if-else condition
>     [patch v3]
>
> Or if you have other opinions, please bring them up and discuss them together.

I would recommend that you just use DEFINE_PROP_UINT64 for this property
(and store the value in a uint64_t cfg.resetvec) regardless of whether the
guest CPU happens to be 32 or 64 bit. In the case where it's 32 bits you
can just ignore the top 32 bits (or if you're feeling enthusiastic, report
an error if they're non-zero). This is simpler to code, avoids ifdefs,
and tends to mean that most code doesn't need to care about the 32-vs-64
difference.

thanks
-- PMM

