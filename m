Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2A631F329
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:41:27 +0100 (CET)
Received: from localhost ([::1]:52058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsvG-0002U2-7m
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:41:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lCsnj-0004Sk-6W; Thu, 18 Feb 2021 18:33:39 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:36284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lCsnh-0005XL-1A; Thu, 18 Feb 2021 18:33:38 -0500
Received: by mail-yb1-xb36.google.com with SMTP id b10so3873552ybn.3;
 Thu, 18 Feb 2021 15:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+4GL1vKyom1JoYisPX2lGrNQ2VGcS4hYCQomOXykUeU=;
 b=k02teAmgPt4vH47iHI9hc4yYst8PsC1wePi2+McCp6nM42dcCCBFxzePxNfynyfQA+
 R/o0j4xsgwy0N20GFOt1yhuYvWj07xtkoIYvrqFMqQdQVnpOfMSbLB9sPnGthKFmZjHk
 S3S8HGDBc4EdbbOkksxkdjwSed0DVxoADb/NL/GzV0iDLza5HLhUUcBg4XuMRq+wIyoR
 ebEXXQB5bDErxXzlskMDNT5jvwzPbIGJMh3TN3OEJKwUTZVf0+hRvawLwTQ/0X+40mJR
 Eo8XSFL48RMilpn5DZQ+QJMg+4ag6hZbRm6FEV5FBDgykoZ28XOmJWwLDzNaK5c0dR70
 KMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+4GL1vKyom1JoYisPX2lGrNQ2VGcS4hYCQomOXykUeU=;
 b=fAbUTtk3vkn5WwV/WD6+gd7lKHwU0xEu98JMpA/YxN4hz7HW/qlpOuQeixfIP894g/
 GGRgIx1cf9puLJz4WSXZAZKQdlEJlrajOf27/oCJFUbR3M46QJiN+/yCKI2BB6jpWNDY
 3/LKU2mXLhNWfiAGtatwQfZeimLnr3hKi7Rt+iNW88gxBIRyzAjmSPyGP3GTNF+/gzzh
 E849K5Ex4BxyDcOcZQW2GuYz5Ui2sMpbAv//451h01NO4iMwWRsvqhRzBA64GNkvZjhs
 VEDNzBd+XLVa2ibMdi5WNW9kWadu+PoQChwYgi/Ax6DClJVCli9YovF6PJn0YLniiEGw
 3Bpg==
X-Gm-Message-State: AOAM533MlUCsROdxJC9uM+WmRXIjhS+gMzFxfChmdo67KQo4Hq+M13Y/
 h2kygfnkiMgptD+s72wjtzxSCTob5hY4DsPbTMg=
X-Google-Smtp-Source: ABdhPJwMKdjjgVAWNPftApt20MBM0OsgKJlTQ2ERUxS9ymR8E3A80QpHzrmCToBGpzkDGOV8Z0VbwlzFbxF2CrsWBw0=
X-Received: by 2002:a25:3387:: with SMTP id
 z129mr10718936ybz.239.1613691215079; 
 Thu, 18 Feb 2021 15:33:35 -0800 (PST)
MIME-Version: 1.0
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
 <1613447214-81951-2-git-send-email-bmeng.cn@gmail.com>
 <4312d31e-d533-74e8-c4d4-107faf785dee@amsat.org>
In-Reply-To: <4312d31e-d533-74e8-c4d4-107faf785dee@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 19 Feb 2021 07:33:23 +0800
Message-ID: <CAEUhbmXPnAR7HgeQhXZneKOxiWHM4fZ3pFOAkR5V-_rg=9MC_Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] hw/sd: sdhci: Don't transfer any data when command
 time out
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-stable@nongnu.org,
 Li Qiang <liq3ea@163.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Fri, Feb 19, 2021 at 12:25 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On 2/16/21 4:46 AM, Bin Meng wrote:
> > At the end of sdhci_send_command(), it starts a data transfer if the
> > command register indicates data is associated. But the data transfer
> > should only be initiated when the command execution has succeeded.
> >
> > With this fix, the following reproducer:
> >
> > outl 0xcf8 0x80001810
> > outl 0xcfc 0xe1068000
> > outl 0xcf8 0x80001804
> > outw 0xcfc 0x7
> > write 0xe106802c 0x1 0x0f
> > write 0xe1068004 0xc 0x2801d10101fffffbff28a384
> > write 0xe106800c 0x1f 0x9dacbbcad9e8f7061524334251606f7e8d9cabbac9d8e7f=
60514233241505f
> > write 0xe1068003 0x28 0x80d000251480d000252280d000253080d000253e80d0002=
54c80d000255a80d000256880d0002576
> > write 0xe1068003 0x1 0xfe
> >
> > cannot be reproduced with the following QEMU command line:
> >
> > $ qemu-system-x86_64 -nographic -M pc-q35-5.0 \
> >       -device sdhci-pci,sd-spec-version=3D3 \
> >       -drive if=3Dsd,index=3D0,file=3Dnull-co://,format=3Draw,id=3Dmydr=
ive \
> >       -device sd-card,drive=3Dmydrive \
> >       -monitor none -serial none -qtest stdio
>
> Can you directly add the reproducer in tests/qtest/fuzz-sdhci-test.c
> instead, similarly to tests/qtest/fuzz-test.c?
>
> > Cc: qemu-stable@nongnu.org
> > Fixes: CVE-2020-17380
> > Fixes: CVE-2020-25085
> > Fixes: CVE-2021-3409
> > Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
> > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> > Reported-by: Cornelius Aschermann (Ruhr-University Bochum)
> > Reported-by: Muhammad Ramdhan
> > Reported-by: Sergej Schumilo (Ruhr-University Bochum)
> > Reported-by: Simon Wrner (Ruhr-University Bochum)
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1928146
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > Tested-by: Alexander Bulekov <alxndr@bu.edu>
> > Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >
> > (no changes since v1)
> >
> >  hw/sd/sdhci.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> > index 8ffa539..1c5ab26 100644
> > --- a/hw/sd/sdhci.c
> > +++ b/hw/sd/sdhci.c
> > @@ -326,6 +326,7 @@ static void sdhci_send_command(SDHCIState *s)
> >      SDRequest request;
> >      uint8_t response[16];
> >      int rlen;
> > +    bool timeout =3D false;
> >
> >      s->errintsts =3D 0;
> >      s->acmd12errsts =3D 0;
> > @@ -349,6 +350,7 @@ static void sdhci_send_command(SDHCIState *s)
> >              trace_sdhci_response16(s->rspreg[3], s->rspreg[2],
> >                                     s->rspreg[1], s->rspreg[0]);
> >          } else {
> > +            timeout =3D true;
> >              trace_sdhci_error("timeout waiting for command response");
> >              if (s->errintstsen & SDHC_EISEN_CMDTIMEOUT) {
> >                  s->errintsts |=3D SDHC_EIS_CMDTIMEOUT;
> > @@ -369,7 +371,7 @@ static void sdhci_send_command(SDHCIState *s)
> >
> >      sdhci_update_irq(s);
> >
> > -    if (s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
> > +    if (!timeout && s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT))=
 {
>
> No need to add 'timeout':

But s->errintsts only gets updated if (s->errintstsen & SDHC_EISEN_CMDTIMEO=
UT).

>
>        if ((s->errintsts & SDHC_EIS_CMDTIMEOUT)
>                && s->blksize
>                && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
>
> >          s->data_count =3D 0;
> >          sdhci_data_transfer(s);
> >      }

Regards,
Bin

