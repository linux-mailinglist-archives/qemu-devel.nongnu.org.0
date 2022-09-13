Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602685B6D73
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 14:42:49 +0200 (CEST)
Received: from localhost ([::1]:34620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY5FY-0007bm-Cx
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 08:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oY5Aw-0004E4-Ip
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 08:38:03 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:43802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oY5At-0004ED-Dj
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 08:38:02 -0400
Received: by mail-lf1-x129.google.com with SMTP id o2so17693217lfc.10
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 05:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=JcFUhOoutwqhEG3fEf/nU7w0zN5bCuTtxaopYvsB6kg=;
 b=vfG3e8jEuFl26LBEddO3TZz3Jfe1tH2efsJ22Qb48n+n51H0VM0pf8wm/xLIpstUVh
 zqmUSwYsALPstMcoiR0suBgMldXR6VTi3vt+j7k8QvGEnbgoMuSC7Fb5MctZbQ9FXh6s
 oi2K+KKtM8o3fp7NoAQHMEeIY/vfOSdeATl4imQJug1k56kAn25WYq+BanmimlkyxiMx
 p6GdcpVX4So/gR/oPHAlYuG8eRkZSleOuNCIN7bd/S4uZtzkh8rLgTmmGjS+oUFpv1c5
 uROYWw93Kn4OgLervcjYfLqBjFvdOCujR+gRb4EtrWfxCl/Bx91wMX4z3xjI6HPUNntK
 +yXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JcFUhOoutwqhEG3fEf/nU7w0zN5bCuTtxaopYvsB6kg=;
 b=Q+8PEyZK3G8YY/2TSwfbK88Wp4ZHO24ufzCHyOAxzbBfcDQTogRtMrI5IPxXCJnyXN
 HHF7EyUGi7qj9yH72s0oO9vCBqkQ8l/4X3JSTeiQjcUzRVRAZB40KPE+sqgP3guFO2GP
 +LhADIbkt5HBG8gP2a0wiecTwWt0e+5Bm2Mi9BwqVN4x4ucn/lUpz/rhsYAgZmWVSElA
 95lDVwLu2KWBY9PnU/W43chp4BWJ+CeFVP0wYuSMYkogtb0dbQXkA7D1Rk2XNRks+Sd0
 r82ssz7jIXd6vzKaxmOmSL3wd0LQanWwLXxh6/MOS+HlZwCt4qtUUEdZHNHr/Tj4AoI0
 0hpw==
X-Gm-Message-State: ACgBeo32kUqUsF+hTvflisgeJEirMhJ4jou2SXIFwCK+As8/NsmdmjiG
 9JdwfLEYDd+MHZsKrnTWWr+y2ygGqJfmYj6goEWwxQ==
X-Google-Smtp-Source: AA6agR4rHZAkzWRDOnju7HeNNzPLrgOgZCUT90vI5oQEl0g0nOsjoa9vnioMnsZvWX5W1+LufPiYW7A8iJK02rxTESA=
X-Received: by 2002:a05:6512:ac2:b0:49a:2fec:aa4a with SMTP id
 n2-20020a0565120ac200b0049a2fecaa4amr3870141lfu.348.1663072676330; Tue, 13
 Sep 2022 05:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ307Ej5stZr6fPsLROFBkmtg=uzkG50yVVY6=Ru6LTLQzae5A@mail.gmail.com>
In-Reply-To: <CAJ307Ej5stZr6fPsLROFBkmtg=uzkG50yVVY6=Ru6LTLQzae5A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Sep 2022 13:37:44 +0100
Message-ID: <CAFEAcA9v4Mk7oVgL+Z571e-F9AqEAdn6GrgFcgXK7122qfRxnA@mail.gmail.com>
Subject: Re: Question about loading bare metal firmware
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
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

On Tue, 13 Sept 2022 at 10:44, Cl=C3=A9ment Chigot <chigot@adacore.com> wro=
te:
> I'm wondering if there is an official way to load bare metal software
> within qemu emulations.
> I've seen a lot of people (including us) using -kernel. However, the
> doc seems to imply that the generic loader would be a better approach
> (cf [1]). I know that the compatibility with older Qemus is one of the
> reasons why -kernel is still highly used. I've also seen that the
> reset vector can be initialized automatically by -kernel unlike with
> the generic loader (this is the case with RiscV AFAICT).
> But is there any kind of official recommendation on that topic ?

I dunno if it's officially written down, but "-kernel" is the
"do what I mean" option, which is mostly intended to be "I am
a Linux kernel, load me accordingly", plus some odds and ends of
"do something sensible" for other formats.

For bare metal code you are almost always better off using something
else. There are two options:
(1) if the machine type supports -bios or -pflash type options,
you can use those for "load this binary blob into the flash/ROM"
(which is presumably where the CPU will start executing from on
reset). This is generally good for "here is a firmware image"
type use cases.

(2) the "generic loader"
https://www.qemu.org/docs/master/system/generic-loader.html
This will load the specified file (which can be an ELF file)
anywhere you like. It's probably what you want for "random
bare-metal test case code that expects to be loaded into RAM",
for instance.

> I'm asking that because a recent change in RiscV Polarfire Soc is
> forcing -dtb to be passed along -kernel. But in case of bare board
> software, -dtb isn't needed (at least in our use case).
> I've a patch that allows "-dtb" to be missing with "-kernel" only if
> "-bios none" is provided. But I'm not sure if this is the right way to
> say "it's a bare board software".

I would say that you should probably not be using -kernel for this.
On the other hand, most other board models don't insist on the -dtb
being passed in even if you are booting a Linux kernel.

-- PMM

