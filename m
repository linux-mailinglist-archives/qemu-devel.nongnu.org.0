Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142D6380243
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 05:06:25 +0200 (CEST)
Received: from localhost ([::1]:41954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhO9g-0003uE-7J
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 23:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhO7S-0002Nr-EW; Thu, 13 May 2021 23:04:08 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:46795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhO7M-0004Xs-Qm; Thu, 13 May 2021 23:04:06 -0400
Received: by mail-yb1-xb32.google.com with SMTP id y2so37150387ybq.13;
 Thu, 13 May 2021 20:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VtbJlsDIUaKGhzGeeLa8k9/LzavYFrK5Lwp6srFO9TQ=;
 b=dplKSavmPQPYkuXqdjVop+Ed5DUxPilfXO8RmHdcRmXXxMN3yzQDf5dLPRroNVO1Fy
 BwdOWcdhFAtAa4EB0IG9JZzaPqcQ/idG0DMY7QqT+nGW6K0Zrsq+79RDg/Xf280wjxjB
 dGlnHI8UXnLTJbzlPShMyOq73CIr/CBYVU4uWCSuDwG+Yo60XzK5F5nA79iTyM9vdrnz
 pkMXVFAyW44yrlF89u8oq1M+VJbEIj+K1sjLP+PeiPwM4b0bvqMnYDSDKgRN55PmJAOZ
 V8TMOrjmSe5gtY5OA+2o/h9JyVE4d8/gU/35JoFX8cd766tOZmtQ6ybThV9HIu7eDQQA
 ViEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VtbJlsDIUaKGhzGeeLa8k9/LzavYFrK5Lwp6srFO9TQ=;
 b=NI8FjAaefdBs4eB39BX1Pt6KS+sM0aQ9mXKFS/kuQKXj6+4mqjqn0KVLM7xoIpYwrP
 4/VWViJdAmRq5p4CDpZKThv4m/ShVP0GjNQWYmBdprdM/CFeP5rV+ooS5+o1bViKWtih
 9DB4Q1m2ROV3poLS3f8NcDFGPMjmep5kiP8jwGVsGUErDBhmYYgc2cL4lHIgN7A/YHrQ
 9APuyC+Z9m9MWpAZstxglwkDNfpeZ7RAdHAmeyEFX+/DD0u6BjjuOr1x4wjiI2aO1zPa
 VI7DKR0ngQiEbOuZr3/hujJvLQPtKST9OpCHN/wZnCH+tunbsCljDM/sDxCsevmdehud
 O4wg==
X-Gm-Message-State: AOAM531/0WAJrlUUYmQ6kBhQ0+hpIcpjqjUnR96LqBuQTKEBX07oTTgR
 uKqVqFVOuSMcDbpRJPXHwq4w5vhqrhlv0Gg7NEE=
X-Google-Smtp-Source: ABdhPJx8SGQkRRRNbCJumL9cL3R0HOLAujAR1bs1Oov4pEFlQDWuDVKK+0I1YjxZPYP8jRmoxMNECHZa5phw1SPkJ2Y=
X-Received: by 2002:a25:aae1:: with SMTP id t88mr59346115ybi.122.1620961439356; 
 Thu, 13 May 2021 20:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-3-philmd@redhat.com>
In-Reply-To: <20210513163858.3928976-3-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 May 2021 11:03:47 +0800
Message-ID: <CAEUhbmXtRJO7TVtYA22OAJ1iOObBt2Fn+FyEJfBLw=n2JXkgxg@mail.gmail.com>
Subject: Re: [PATCH 02/10] hw/ide/Kconfig: Add missing dependency PCI -> QDEV
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:IDE" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 12:56 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The pci_ide_create_devs() function is declared i hw/ide/qdev.c:
>
>  $ git grep ide_create_drive
>  hw/ide/pci.c:491:            ide_create_drive(d->bus + bus[i], unit[i], =
hd_table[i]);
>  hw/ide/qdev.c:127:IDEDevice *ide_create_drive(IDEBus *bus, int unit, Dri=
veInfo *drive)
>  include/hw/ide/internal.h:653:IDEDevice *ide_create_drive(IDEBus *bus, i=
nt unit, DriveInfo *drive);
>
> Fix the correct symbol dependency to avoid build failure when
> deselecting some machines:
>
>   /usr/bin/ld: libcommon.fa.p/hw_ide_pci.c.o: in function `pci_ide_create=
_devs':
>   hw/ide/pci.c:491: undefined reference to `ide_create_drive'
>
> Fixes: 8f01b41e109 ("ide: express dependencies with Kconfig")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/ide/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

