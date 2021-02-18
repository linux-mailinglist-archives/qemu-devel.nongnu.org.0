Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B847D31EAE3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 15:24:05 +0100 (CET)
Received: from localhost ([::1]:43520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCkDs-0003LG-Qo
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 09:24:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCkCH-0001tq-8x
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:22:25 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:38353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCkCF-0001kj-Ca
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:22:24 -0500
Received: by mail-ej1-x62e.google.com with SMTP id bl23so5871553ejb.5
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 06:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IpyF3SJBHsTItgY7d3EK8qKgXKGGVRXn2lXATYZskX8=;
 b=Uqd3dqTsnRexufHaGUmmyn68UloelKX9PjFQekwQ8aioYax1SnHYwVrNOp2pds4VHg
 AhyiQK/7i2iHckYa88W/ISsQznBjPf/eIsGQiQ13xPcXK6wSsebBUVIVKCzzXj7no+PW
 uX+ZIJsRS4UIABfug/ZUlk3XGT7neYFPlXgxFo63VFiZpCcnFQ1V5GW+y0RLxjdQ+FQY
 PtB1Zkfzg6UHfIiRIyLxwGXUSJlIqfBNFNNCESV+D9KNIkV4OJpSrK7sUhg8Qz1nhPmT
 tWMJgfsGxW/sVDsdszsr4D3t0hoK5joC7r99WX3MXD+LwMunOUgApzPTiKsiPS8a2o35
 /d0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IpyF3SJBHsTItgY7d3EK8qKgXKGGVRXn2lXATYZskX8=;
 b=ddXaYBGqx9x+/u4C4HW53kX9QKOw/FyV3UNitxcSwIxBPoqK9q3SFCR5e3e1iPeXTt
 v0Va4rUfIBVNI4B7OKSCcAonhqSpR2FeHwGbAyTsGt0pStah5be/sqrBeooIBE7IRpM4
 YmZcKhNrglyryj7UWck9CVN8ZLeTPlgkmvdvwKlsJpw0+OV1fOU77S5mlzCWUh7hkll/
 z9rJoBMUUdbodnnmGGT4sIWS5ziJs3Y2GlaWKiwCNDoWDahpCSvMPc9qW6DFgFiykvXa
 6yPiUf2+O2E/fE4S3dmq8eG095GR4NYkv6LJujWEwLaTZ2+pw4C9c88P2eswiKQWx/RQ
 7NDQ==
X-Gm-Message-State: AOAM533sldVzyO1W+rzif4220R6AN1nJxisUDLCKicp7hTW0usop/BrT
 RwgUUKLITB4Q1n/nSSoCzbWrJhTWrjYc5JVyQseWvg==
X-Google-Smtp-Source: ABdhPJzWeH+RFB6+XJI0S7ktqg5NPsqZWLHaTkiIFSKK3BaIHFQcB5W+2SvYaCR8iEvbR92eQ28XalO56tzImJbbvv8=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr4389535ejd.250.1613658141510; 
 Thu, 18 Feb 2021 06:22:21 -0800 (PST)
MIME-Version: 1.0
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
 <CAFEAcA_aEtpfMScS3uzrpbBqAgqGWsWjeisUXCSpqdJJ7=uCYw@mail.gmail.com>
 <CAEUhbmXeYDkKiNnkffRoE8dZc_=-vByoQfr6gdSSUNubkCaB8Q@mail.gmail.com>
In-Reply-To: <CAEUhbmXeYDkKiNnkffRoE8dZc_=-vByoQfr6gdSSUNubkCaB8Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Feb 2021 14:22:10 +0000
Message-ID: <CAFEAcA8BwTO7OT91B=d1tZrk9+PMiSLTmKtiv_Yd2BNdb1syRQ@mail.gmail.com>
Subject: Re: [PULL 00/19] riscv-to-apply queue
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Feb 2021 at 14:07, Bin Meng <bmeng.cn@gmail.com> wrote:
> On Thu, Feb 18, 2021 at 9:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > Fails to compile, 32 bit hosts:
> >
> > ../../hw/riscv/virt.c: In function 'virt_machine_init':
> > ../../hw/riscv/virt.c:621:43: error: comparison is always false due to
> > limited range of data type [-Werror=type-limits]
> >          if ((uint64_t)(machine->ram_size) > 10 * GiB) {
> >                                            ^
> > ../../hw/riscv/virt.c:623:33: error: large integer implicitly
> > truncated to unsigned type [-Werror=overflow]
> >              machine->ram_size = 10 * GiB;
> >                                  ^~
>
> This kind of error is tricky. I wonder whether we should deprecate
> 32-bit host support though.

32-bit host is still not uncommon outside the x86 world...

The thing that makes this particular check awkward is that
machine->ram_size is a ram_addr_t, whose size is 64 bits if
either (a) the host is 64 bits or (b) CONFIG_XEN_BACKEND is
enabled, so it's effectively only 32-bits on 32-bit-not-x86.

It might be a good idea if we decided that we would just make
ram_addr_t 64-bits everywhere, to avoid this kind of "we
have an unusual config only on some more-obscure hosts" issue.
(We did that for hwaddr back in commit 4be403c8158e1 in 2012,
when it was still called target_phys_addr_t.) This change
would probably be a performance hit for 32-bit-non-x86 hosts;
it would be interesting to see whether it was measurably
significant.

-- PMM

