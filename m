Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58741346F4C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 03:15:21 +0100 (CET)
Received: from localhost ([::1]:60746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOt3H-0005wQ-Tj
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 22:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wzssyqa@gmail.com>) id 1lOt0P-0005KO-P0
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 22:12:21 -0400
Received: from mail-qt1-f169.google.com ([209.85.160.169]:44005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wzssyqa@gmail.com>) id 1lOt0N-0001ds-RU
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 22:12:21 -0400
Received: by mail-qt1-f169.google.com with SMTP id s2so16540102qtx.10
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 19:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r1ikSccTD60sRnV/AdmISo/VbNun/QvCsZUFGJ30T+8=;
 b=b7LxZ/enWbZR1wJj6FxL2Nb2WFGtnX8vE6FchmoewNoyT560cprAKeQB8/zg3LvPO4
 nIsui/6bmiSJJnrapgctbd3nT02czXwRiHUqCuiO7BYbeguJ4NxUcUsm+iYlq+xb6fM9
 1a0JfbmykeMzsrHZVpsZzbiWlouuyGFIolfOG9+zJv/8kujlQqlP14ipWCuoecj9pHdM
 CVVqrhrl3Q8E+ouKkR12XsWHaX4z6qbEh/7cxlIqM11klsJdww9Bp/rjptSgn8gTbMHK
 VDW9kPiG0H7zXGz+6U+kiLReFoikapVMM2TgJgg3PJKRCNRmikkHFS3v6gtb1nQ0ODPT
 Mr1A==
X-Gm-Message-State: AOAM532kjexf93XH/U/IIfOsoJv+nUKmhRCcX11dM+Fys9bKppWfg6FN
 oxgyYxPtPvuKBcrSbdm6Yu30Rh+qyIjiVDHbG0k=
X-Google-Smtp-Source: ABdhPJyfNZoJirHCeiSeW1gza0K4WFBfeqBuHYbFKHg4bkV+6D6eCveEue+bk3WFQ0YcwbWZIPWaYZMpIKB8MnzGTDs=
X-Received: by 2002:ac8:4510:: with SMTP id q16mr1097215qtn.241.1616551938316; 
 Tue, 23 Mar 2021 19:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <1602059975-10115-1-git-send-email-chenhc@lemote.com>
 <1602059975-10115-3-git-send-email-chenhc@lemote.com>
 <0dfbe14a-9ddb-0069-9d86-62861c059d12@amsat.org>
 <CAAhV-H63zhXyUizwOxUtXdQQOR=r82493tgH8NfLmgXF0g8row@mail.gmail.com>
 <9fc6161e-cf27-b636-97c0-9aca77d0f9cd@amsat.org>
 <CAAhV-H5wPZQ+TGdZL=mPV4YQcjHarJFoEH-nobr10PdesR-ySg@mail.gmail.com>
 <62b12fe2-01db-76c0-b2fd-f730b4157285@amsat.org>
 <16018289-0b28-4412-854b-0d30519588ca@www.fastmail.com>
In-Reply-To: <16018289-0b28-4412-854b-0d30519588ca@www.fastmail.com>
From: YunQiang Su <syq@debian.org>
Date: Wed, 24 Mar 2021 10:12:08 +0800
Message-ID: <CAKcpw6Ud2chjGLGmhr03pLd276d9A3eu-2pC0FLLfYcmg3UNqA@mail.gmail.com>
Subject: Re: [PATCH V13 2/9] meson.build: Re-enable KVM support for MIPS
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.160.169; envelope-from=wzssyqa@gmail.com;
 helo=mail-qt1-f169.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <zltjiangshi@gmail.com>, Thomas Huth <thuth@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen <chenhuacai@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan via <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jiaxun Yang <jiaxun.yang@flygoat.com> =E4=BA=8E2021=E5=B9=B43=E6=9C=8824=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=889:29=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On Tue, Mar 23, 2021, at 9:56 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi Huacai,
> >
> > We are going to tag QEMU v6.0-rc0 today.
> >
> > I only have access to a 64-bit MIPS in little-endian to
> > test KVM.
> >
> > Can you test the other configurations please?
> > - 32-bit BE
> > - 32-bit LE
> > - 64-bit BE
>

How to run the test? just run a VM with KVM support on these kernel?

> +syq
> As Loongson doesn't have Big-Endian processor and Loongson 3A won't run 3=
2bit kernel.
>
> Probably wecan test on boston or malta board?
>
> Thanks.
>
>
> >
> > Thanks!
> >
> > Phil.
> >
> >
> [...]
>
> --
> - Jiaxun

