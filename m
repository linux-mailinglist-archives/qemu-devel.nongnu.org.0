Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AF2592998
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 08:29:29 +0200 (CEST)
Received: from localhost ([::1]:57866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNTbL-0000d4-NS
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 02:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oNTWO-0007FN-Oj
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 02:24:20 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oNTWM-0007kd-VZ
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 02:24:20 -0400
Received: by mail-pg1-x533.google.com with SMTP id s206so5804215pgs.3
 for <qemu-devel@nongnu.org>; Sun, 14 Aug 2022 23:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=o2xWr1+n7Kt42+dlH3e2BIes24KNG/pmkB6btjXvSkk=;
 b=PXrQlceKjUFu1FvIuox2GrH9nDHKLBMqFYZagtZzgHDZgPelqRhMzRPNknTyO/fwcF
 lBXzKQMy+054Q3P3jhOcx4gSL2s9BgCyjvBVbRRPMT3EYc3IDu+BG3/nrmPKkMrJUQdJ
 QSMrfXdLM9/xS48Ayy6yWxYkMyzsL3A5uHKO+qqSNUCsUKY1eNuG87++HQ2IHlQZPngx
 EEBqZxKHeeBf0C/BEPx900b/baeSNB4JgJ1wN3So8WaozIO3SOo4Kp2LDJBd99ur23FJ
 a79WGHpa8FPN01zYxpaCYNLz6346aOb6Ib24iJdmJPYFU+mA+bkNmZyykBwcHY7SBxhl
 0fCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=o2xWr1+n7Kt42+dlH3e2BIes24KNG/pmkB6btjXvSkk=;
 b=InO91bBbSr6YN+TiHwi6gAIwrf+clcLuDHBMumUMN2XyFWWsugqN5j2yaAY0l5g1s+
 wM+1PotSX96vL79xGLigyxHEaUzPjzkiuUNtwh8O26wU2wXbTGvQQh90/ODRfl5okNDL
 qB2FSqH4jOOLw2ucnZEHnJZtdYDMCBRe81QMBy7Ign3bX7GTWO6Xq1RGbUd3YVkREBu7
 j+rGKIdezNorSJBlG5Avz35mnUc2Xy9+ituU7/1u4YLkBahSzhh65fLjCKJrZmnhiwlu
 0LVDVwjgS0ZNkMGbbRoFzcTiFSikdUlYKHxxN7oKVJbv8TIh1N4KW9y9UhP9uKy+MT4/
 VU/Q==
X-Gm-Message-State: ACgBeo2cQyUb9zeJGZDSrrHNdYNLN5yrCFURyz0kWtdhFtFNZfW92xUr
 JpddY76K0DVAUvNVdRn7o+P4R8qnBKUhctslem2LCw==
X-Google-Smtp-Source: AA6agR5TCi02SDuhcX7XAA8xi23yU7njS4ds1jDODTaRGzJ2xvMIQHOObRHDdbq8VA470ExHLlSTN/PZIiMCnBFZmsg=
X-Received: by 2002:a05:6a00:b82:b0:52f:518f:fe6c with SMTP id
 g2-20020a056a000b8200b0052f518ffe6cmr15141447pfj.80.1660544656924; Sun, 14
 Aug 2022 23:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
 <37244ef8-d2f1-038a-8a51-01d9f62fbe2c@linaro.org>
 <f977101c-bdc0-3b24-5fad-a75b07b5dac7@linaro.org>
 <CA+tJHD4MC9xjVkDAg6QZ3Yq2L-cKDQkofQyGjX67cD_qxbCf1g@mail.gmail.com>
 <804cd7cd-e83c-2b89-f2ba-cc2ca5c7f835@linaro.org>
 <CA+tJHD6gNrtcrZ9bkDet8NuiR8mcSQfeN-Rk3dtm3LmeakKnvQ@mail.gmail.com>
 <CAFEAcA--QMVgw0ZH6S3=jHsazM-AJQX45Hm+aJ+EhDhDrzNubA@mail.gmail.com>
 <CAKmqyKPcr=umn4zUpxNFwBJ8MuuRkdwH5KpDgDiHHn8YMiaj4g@mail.gmail.com>
In-Reply-To: <CAKmqyKPcr=umn4zUpxNFwBJ8MuuRkdwH5KpDgDiHHn8YMiaj4g@mail.gmail.com>
From: Furquan Shaikh <furquan@rivosinc.com>
Date: Sun, 14 Aug 2022 23:24:05 -0700
Message-ID: <CA+tJHD4wsGD_EYrR9Lvpjh8dwFAx1eskxv9JS2mhxiLfFedFiA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=furquan@rivosinc.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sun, Aug 14, 2022 at 3:04 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Aug 13, 2022 at 8:20 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Sat, 13 Aug 2022 at 01:53, Furquan Shaikh <furquan@rivosinc.com> wrote:
> > > I ran into a problem when I was testing a project (with a microkernel
> > > in M-mode and tasks in U-mode) that uses semihosting for debugging.
> > > The semihosting worked fine for M-mode but not in U-mode. As I started
> > > digging into this, I realized that this is because qemu restricts
> > > semihosting to only M and S modes.
> >
> > Right. We should fix this by having a generic works-for-all-architectures
> > semihosting config knob, because this is not a riscv specific problem,
> > and we already have issues with different target architectures
> > developing their own solutions to things.
>
> I agree with Peter here. I don't see a strong use case for a RISC-V
> specific fine grained control. A user can either enable/disable
> semihosting for privilege or usermodes (with Peter's patchset). That
> seems like enough configuration options, it is unlikely that someone
> will need semihosting only available to S-mode for example.

Sounds good. Thanks for the feedback. I can continue with the changes
that Peter has.

>
> Alistair
>
> >
> > I'll see if I can dig out the half-done patchset I had for this.

Let me know if you want to collaborate on this to get this to
completion. Thanks!

> >
> > thanks
> > -- PMM
> >

