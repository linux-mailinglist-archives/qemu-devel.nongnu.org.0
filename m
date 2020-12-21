Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5F72DF785
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 02:46:23 +0100 (CET)
Received: from localhost ([::1]:58940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krAHA-0000PN-Vk
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 20:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krAEH-0007u7-8t
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 20:43:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:42950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krAEF-0005Mb-Im
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 20:43:16 -0500
X-Gm-Message-State: AOAM531k1LOaH6qlTZO4kB/wgfwgoUBKO9dSI/QVuVK17tWp7vK85xJH
 ZaYlUl37zPCeYInU4xeuWFHkBhxWpPzoNIzyjFE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608514991;
 bh=nmdMhO9Y90fn0xiuLG5ynq+mKgSlKPfhINADwI5qOqg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Fv8swC6/qdHxsnjyH8yaRPI3k9Eb/zBRwkSIXUEO+UxD3GQ3sMK1PbpOiRXeRc3Wp
 TlKa0oxxwmOdp92IM1D8oCTWtHVN/gZO5b9lQuR0pWYtCwqgZcZVzx0ADToCON7Ir6
 0BhBIbHR8COusGiYKBCq9cyJEBQnkMaMXVrySCAH94G7BlKArdG24HV0c8oKnahN8H
 scS14yMA2jConDgd2WY6RR5qM5ewhHeRx9fxWI0YcVBFDYeQlCptUnJR2Vl4BMl1Nq
 8VWVFvTe/E9GIaLfYgmmkGDh5V8MoJdWXb5A8PnmGugUT0rDdB6+5WDMLYh2ynccM1
 oogqOEyhhW7pg==
X-Google-Smtp-Source: ABdhPJz8Q2Lnx3KKxWQyiGD1CZQe3zlWyq/DLiu98IS4jQN1m7kwOwxLSz8GwEkZCg1JtXLEWxFWoJhPJ8vxzeQOTOs=
X-Received: by 2002:a5d:8a1a:: with SMTP id w26mr12538369iod.112.1608514990795; 
 Sun, 20 Dec 2020 17:43:10 -0800 (PST)
MIME-Version: 1.0
References: <20201215125716.477023-1-chenhuacai@kernel.org>
 <20201215125716.477023-4-chenhuacai@kernel.org>
 <47ebfcd8-cfa9-f45a-dc66-f936681fc5e5@amsat.org>
In-Reply-To: <47ebfcd8-cfa9-f45a-dc66-f936681fc5e5@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 21 Dec 2020 09:42:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5U2KsVe497cEJua4BxzOsGC7EdT6xMD8jro+isTKLHfQ@mail.gmail.com>
Message-ID: <CAAhV-H5U2KsVe497cEJua4BxzOsGC7EdT6xMD8jro+isTKLHfQ@mail.gmail.com>
Subject: Re: [PATCH V18 3/5] hw/mips: Add Loongson-3 boot parameter helpers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yes, that's fine.

On Thu, Dec 17, 2020 at 2:11 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Huacai,
>
> On 12/15/20 1:57 PM, Huacai Chen wrote:
> > Preparing to add Loongson-3 machine support, add Loongson-3's LEFI (a
> > UEFI-like interface for BIOS-Kernel boot parameters) helpers first.
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> > Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  hw/mips/loongson3_bootp.c | 151 ++++++++++++++++++++++++
> >  hw/mips/loongson3_bootp.h | 241 ++++++++++++++++++++++++++++++++++++++
>
> I plan to add these to "Loongson-3 virtual platforms"
> in MAINTAINERS, is that OK with you?
>
> >  hw/mips/meson.build       |   1 +
> >  3 files changed, 393 insertions(+)
> >  create mode 100644 hw/mips/loongson3_bootp.c
> >  create mode 100644 hw/mips/loongson3_bootp.h

