Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B277B590C0C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 08:41:30 +0200 (CEST)
Received: from localhost ([::1]:59926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMOMK-0004cf-GI
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 02:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1oMOJQ-0002oU-LJ
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 02:38:28 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:44958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1oMOJO-0005F3-7i
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 02:38:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DD966174D
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 06:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2781C433C1
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 06:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660286300;
 bh=c8PhfD1wPpme22OBy4FgJEA0qjZBmu48R3PhaBEHTrQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T3WzfHRXqSM1jMMjqkVQ+/wpL+3P8L28/QNk+q028i3OBIPDVbg/AVntH0hpeX24O
 X7WpZI2X01y30Ow8vkuXKtDfaMEvrFp7YgcEMJ7YnOUgFP5olR05anPRzNiDmqQzT6
 UPx1wX7IzeNX8ss5WVHjbjBKs64vr9GUCeNDODW6hiRqJxXxfsEcPdKzsBthBHh1Ya
 7cUYzZxnVMOPcqU08q6ob4hsds1z+ctoNYJFNzTaZ7EmYVMSan99xoS+PUE+M8X2WT
 2zYB2cjtZI9TO0ZXlGXV8BHO7hMA//ylhK1zHJ32o86ZzoNzRhbPpdYC3/JPLbg76a
 SqLEdhE9/ZzCQ==
Received: by mail-ua1-f51.google.com with SMTP id c19so2247uat.6
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 23:38:20 -0700 (PDT)
X-Gm-Message-State: ACgBeo03pqOtTfFTGRRtnwllFNEbwT0i+b3TgVbG9t7hPSPSk8MmI/VS
 hpjU/wuZGH+dDopzuZOmAQI/wun07gj4Jtsv8bc=
X-Google-Smtp-Source: AA6agR431l/7ExRtcNXrW46a7DAJcM9BKUx5uj/RSXLEGBNyXJl+BKUIueGd6/AGGwj6FVEpS4JP/a2OhWLeCz2I3ro=
X-Received: by 2002:ab0:1393:0:b0:383:26e8:7bf3 with SMTP id
 m19-20020ab01393000000b0038326e87bf3mr1257229uae.22.1660286299599; Thu, 11
 Aug 2022 23:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <YvUDHecm0tYqb3bI@waldemar-brodkorb.de>
 <fce3be91-fa93-931e-fba4-e0513b005e1e@loongson.cn>
In-Reply-To: <fce3be91-fa93-931e-fba4-e0513b005e1e@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 12 Aug 2022 14:38:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6EEHoGBNmgaWdg7E+cHhrY0ESdkGAJoz9wLrSQ-o59jw@mail.gmail.com>
Message-ID: <CAAhV-H6EEHoGBNmgaWdg7E+cHhrY0ESdkGAJoz9wLrSQ-o59jw@mail.gmail.com>
Subject: Re: problem with qemu-system-loongarch64
To: gaosong <gaosong@loongson.cn>
Cc: Waldemar Brodkorb <wbx@openadk.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=chenhuacai@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi, all,

On Fri, Aug 12, 2022 at 10:26 AM gaosong <gaosong@loongson.cn> wrote:
>
> CC: Huacai Chen <chenhuacai@kernel.org>
>
> On 2022/8/11 =E4=B8=8B=E5=8D=889:24, Waldemar Brodkorb wrote:
> > Hi Qemu developers,
> >
> > I am trying to bootup a loongarch64 Linux kernel in Qemu 7.1.0-rc2.
> > The problem is I get no output when using following command:
> > qemu-system-loongarch64 -M virt -nographic -kernel vmlinux
> >
> > You can find my vmlinux initramfs here:
> > https://debug.openadk.org/vmlinux
> >
> > It is cross-compiled with binutils 2.39, gcc 12.1, glibc 2.36 and
> > Linux 5.19. I use the provided defconfig loongson3_defconfig for the
> > kernel build.
> >
> > Any hint what I can do to get a bootable Linux image?
The official v5.19 still lacks boot support now, please use this one:
https://github.com/loongson/linux/commits/loongarch-next

Huacai
> >
> > best regards
> >   Waldemar
>

