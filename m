Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732933145AA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 02:34:21 +0100 (CET)
Received: from localhost ([::1]:42960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Hv2-0006dQ-IL
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 20:34:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1l9Htw-0006BI-PL
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 20:33:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:36764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1l9Hth-0003xx-3T
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 20:33:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 359CD64EB6
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 01:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612834373;
 bh=lYqM7/lEWVHAKYtC3FaKyuSyTQEiG+A88HRLRq2L/eY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZBQ6ukWtHuipcG3zvrgoT6W4JhM+d6BXfLBdOcB7uPi3OJWrDO8tqXSZ+6hCrvlfW
 kMGwvRMBjFmnfwOqkS4NR+hlgwtkUb+7nY7PiC/Wr0teXmbh2ZoZ63DhqEOR2rvNwP
 erzQOKDSqoIjrCnNiaat4IIG1v+0uOxBoxBGh5tPiYIYjFd22TakELSQEelUr8skmT
 kf46yE/KdtgqcYesUo2c1RidCZbRbEkvAc12afBtuzekGylXPXfCtzvvi7fQ+CSPUn
 AOmnfTATRufNEIb7kWy3HUAx8raHTowzGKRDVWvm306I1Ms29Hp8CxcUXQ+gE+WPX7
 rPQQ5C4ZEJ1ew==
Received: by mail-il1-f170.google.com with SMTP id o7so10163308ils.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 17:32:53 -0800 (PST)
X-Gm-Message-State: AOAM5309QoJWmHny3Cd6m+3D5fgTM2qyARUTJJQ5r8t3KGyWER4OkSue
 YxD1dpnNJ2zAvTtbzwVQtBNyfueOFVSd51dquY0=
X-Google-Smtp-Source: ABdhPJwsXfKFk8CbiylVGFHiRMWVw3cJyeC9NSfIWn2FvOnYn7fRHjTkyF40vscRMrbwzWdqsuWk/u83ImQBGqzQLa4=
X-Received: by 2002:a92:1e12:: with SMTP id e18mr17946547ile.270.1612834372505; 
 Mon, 08 Feb 2021 17:32:52 -0800 (PST)
MIME-Version: 1.0
References: <20210203123425.GA9574@alpha.franken.de>
 <a2a2cfe3-5618-43b1-a6a4-cc768fc1b9fb@www.fastmail.com>
 <20210207193952.GA21929@alpha.franken.de>
 <59a9a55c-2866-413f-89e3-b11e274c2d34@www.fastmail.com>
In-Reply-To: <59a9a55c-2866-413f-89e3-b11e274c2d34@www.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 9 Feb 2021 09:32:40 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6jkQBmr7+_GzUSAUhN035kCzNxoS30H_PdOpKzJO1JWA@mail.gmail.com>
Message-ID: <CAAhV-H6jkQBmr7+_GzUSAUhN035kCzNxoS30H_PdOpKzJO1JWA@mail.gmail.com>
Subject: Re: KVM Guest
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-mips@vger.kernel.org,
 " <linux-mips@vger.kernel.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think it can be removed.

Huacai

On Tue, Feb 9, 2021 at 12:40 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>
>
> On Mon, Feb 8, 2021, at 3:39 AM, Thomas Bogendoerfer wrote:
> > On Wed, Feb 03, 2021 at 08:52:34PM +0800, Jiaxun Yang wrote:
> > >
> > >
> > > On Wed, Feb 3, 2021, at 8:34 PM, Thomas Bogendoerfer wrote:
> > > > Hi,
> > > >
> > > > Does kvm guest kernel still work ? I'm playing with current mips-next
> > > > and starting a kvm guest kernel inside an emulated malta system also
> > > > running a mips-next kernel. The kvm guest kernel starts, but hangs
> > > > in calibrate_delay (at least that's what info registers in qemu monitor
> > > > suggests). Ayn ideas ?
> > >
> > > The current KVM guest kernel is actually a Trap-and-emul guest kernel.
> > > VZ based KVM uses the same binary with the host one, so does TCG.
> > >
> > > TE KVM is current unmaintained. I'll try to get a malta and do some test.
> >
> > hmm, so it looks broken, is unmaintained, how about removing it ?
>
> Probably. I got remote access of a CoreLV malta but no luck to boot kernel as well.
>
> + Huacai as KVM/MIPS Maintainer.
> + Philippe as QEMU/MIPS Maintainer.
> + qemu-devel for wider audience.
>
> If nobody intended to maintain it probably it's time to remove it.
>
> >
> > Thomas.
> >
> > --
> > Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> > good idea.                                                [ RFC1925, 2.3 ]
> >
>
> --
> - Jiaxun

