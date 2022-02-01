Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6437C4A5531
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 03:16:47 +0100 (CET)
Received: from localhost ([::1]:56190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEiir-0004fK-TB
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 21:16:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEif9-0003CD-2Q
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 21:12:55 -0500
Received: from [2607:f8b0:4864:20::d31] (port=42788
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEif6-0006JF-JM
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 21:12:54 -0500
Received: by mail-io1-xd31.google.com with SMTP id r144so19372395iod.9
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 18:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WYZTXjYAfp4en9c9b3IxmkxPaE39JxwEYQLTIGGZemM=;
 b=JWtg0tX1ngCA7PccHnE4wN4ck8WgG71Q1hHEeJzODwKyCBOkKRRJl5GYokrUK52F42
 mZTxg0bADETofEMWolbstfzw1CBili6uosvud5z7mipf4/WMFdDj668m/JZlLRT38khA
 Y5cq93QpbA3hSx1m93R5yw/gI6kOQIWl5GoFzJPKd0mx6EvRm15zX9sSTPBZc33CXm36
 39geDMmzBGYkuzF5Z7fx8PtLvYLwbhSt5BRgE5IiQexNJJ3m4X3b37f3fn4vjX8vdsxI
 N06/bd2nLPoGi6qjlP3Y8G0jyoslIpkg4E7McQ+lCwtB85+PI4z87nMUuYjMJItPtIQ6
 4oIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WYZTXjYAfp4en9c9b3IxmkxPaE39JxwEYQLTIGGZemM=;
 b=aikc6Ol0AhkT6B61D32VUXlwSiUeWE5+i9g6PEIgX31023WM5iKp3bSiKBW+zvAXFs
 syRMl6oDPB8g6rmEZoA+vtRfExjs3ybCPCntA3Zi+54g1QCGeaj0eIH6oZcqgQeXYPte
 0bA07GcJPm93ydyIXSVNyaCakPLmYkne7M/0qMExN7r4hr1k/YlmwjRt6xmra2XxJ4UR
 DMTFB5fTYg53rs48UjM7ScIWEEcLUtVgNKB8oQxrc69qskorp4x7sHPQj3UQ+TkJH8YE
 yEeOmrceLfPKGdrDqwp0hr5dhcbv+qYl8ZLfWl3SWmE7KyYB5CwrQybEUZ9vPS7JHYOw
 rjIw==
X-Gm-Message-State: AOAM530txATvL/PW+mzdqUjts6GYenHgZmlwbxkbx8JtgmNOVNGRNQoj
 +xHjEwQiKukxHagJWk98uuNXCDTvmp2W9QrUbdM=
X-Google-Smtp-Source: ABdhPJzJmqKgDpSX6u34e78fTv2Q23Ekrqp5djawYsVoe+7LWPgxNNrx4Ziz49LfOZElWw1B0N4qGD+VAMot+/to6oA=
X-Received: by 2002:a05:6638:ccb:: with SMTP id
 e11mr12637394jak.206.1643681569595; 
 Mon, 31 Jan 2022 18:12:49 -0800 (PST)
MIME-Version: 1.0
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
 <20220121055830.3164408-54-alistair.francis@opensource.wdc.com>
 <CAFEAcA_V_L7_bD=_U9eKf_we2Q79tb_sJ2XAcGSzWgL-ooqg+Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_V_L7_bD=_U9eKf_we2Q79tb_sJ2XAcGSzWgL-ooqg+Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Feb 2022 12:12:23 +1000
Message-ID: <CAKmqyKO9wVmvNJDc1T1pnVcyf7XEYsrLUxxqAOQ15=TbcLkdhw@mail.gmail.com>
Subject: Re: [PULL 53/61] target/riscv: Split out the vill from vtype
To: Peter Maydell <peter.maydell@linaro.org>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 29, 2022 at 2:10 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 21 Jan 2022 at 09:42, Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: LIU Zhiwei <zhiwei_liu@c-sky.com>
> >
> > We need not specially process vtype when XLEN changes.
> >
> > Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Message-id: 20220120122050.41546-16-zhiwei_liu@c-sky.com
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> Odd thing I noticed looking at this code: as far as I can see we
> may set env->vill to 1 in the vsetvl helper, but there is nowhere
> that we set it to 0, so once it transitions to 1 it's stuck there
> until the system is reset. Is this really right?

This is really confusing. It implies that you can't set vill from
software, but that just seems to be confusing wording.

Reading https://lists.riscv.org/g/tech-vector-ext/topic/reliably_set_vtype_vill/86745728
it seems that this is a QEMU bug and the guest should be able to set
the bit as part of vsetvl

@LIU Zhiwei are you able to fix this up?


Alistair

