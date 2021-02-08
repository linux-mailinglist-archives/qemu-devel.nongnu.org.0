Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4636A313EF3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:29:50 +0100 (CET)
Received: from localhost ([::1]:54098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CEH-0007Yn-C0
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l97mN-0005jD-6a; Mon, 08 Feb 2021 09:44:44 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:45743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l97m4-0005b9-Sw; Mon, 08 Feb 2021 09:44:35 -0500
Received: by mail-yb1-xb34.google.com with SMTP id l8so2431397ybe.12;
 Mon, 08 Feb 2021 06:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QVlUzTVJ0xus0/TNtS6WozhwM9vjor3uGVdIWEky56Q=;
 b=aexZffFmI4xYHe6Znio/Th+Jgpx0yHa0ZjvBJdgX9GyhdJu/6c1nG67fUz26AdIrM1
 klpUHllln8FgXZ5+dX+9QecBCtDd04xcWQHtBeEx9Sz3G5SNH5ioozfbdqS2xiMr3r5y
 AHSMuwIKoiSGJ5FL774DhqUEohUzoGUnNWJdS5E6r+GY+JVfg2SDx/wK+YbWA3Hahnm1
 FAFc20KTs0vQKK1/uT6W9/ffEZQ01gMKmbqHrmvZyIupXx12WnLBm8XVO627dhn+wadF
 UES9jt4eE2DM8Opc0EZRR7OyRkvjyZqqDpuI+bVopLLi7ahkPpSH++PYvcuMPj27xhlo
 L/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QVlUzTVJ0xus0/TNtS6WozhwM9vjor3uGVdIWEky56Q=;
 b=ADSo5+5U7dvltvHPQHyzSPShDnPONKwWgsRnrj/adXElOY/nD8wHkT/Y2IgzJqa4V6
 1CNXMfJ+grNlGWCJ3vSrGXwrp8724AgRU4He96u3E2dOsc8/rpR1MG2Fldbqs4CSdm8k
 D48B8khpmAuQDCTH6MEaB7n0CUNP4Xgh4NxBtV+NEwdeT7h5F5F4S7jbdNrW+HpvQPNz
 ChiReeR/DQj9My4gPn/0/Vlr6c3+WwWBPl/vzQqrGvAv9g9saDjc/FrS4NCsMW2kUPQZ
 oBkm4ywoChXq6AbDlbxMeFnHDyXUis23oKIgiWSL2OzgkcEsSdME44Igd6+Y4jXEqFTW
 Fd4A==
X-Gm-Message-State: AOAM531FAFd61NB8GufQ9m5o2mb/VZ23CrEpAeLocb9WLHE5A93pXxWG
 JOYUS79Mh2WZJBGFy0QyX9HjVMW0yFyFQPdtG+A=
X-Google-Smtp-Source: ABdhPJx/+VLWJyWxhGUqKq318GaHX94Ko20zyIeUWSF0U2CfYaF4Q08BS3M4l7DHS6G6C03Atx5du/JfcduUOxUaQd8=
X-Received: by 2002:a25:cc3:: with SMTP id 186mr25794680ybm.306.1612795463437; 
 Mon, 08 Feb 2021 06:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
 <20210128063035.15674-10-bmeng.cn@gmail.com>
 <16fb545a-d793-6447-d52f-f504aecc988f@amsat.org>
 <CAEUhbmW3vU2wkNL70QF__Sh3n-ZXdbuwb=fA-fUT+Ai-ptz1sQ@mail.gmail.com>
 <CAAdtpL4WKEQ--D0DqJ_tMo8DxiBW-8F_6+w+PfiWtsxhi_O_5A@mail.gmail.com>
In-Reply-To: <CAAdtpL4WKEQ--D0DqJ_tMo8DxiBW-8F_6+w+PfiWtsxhi_O_5A@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 8 Feb 2021 22:44:11 +0800
Message-ID: <CAEUhbmWFT9RFSiTyGLh2EVxavuf1x5QySZsThJDUa4hrtpMkeA@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] hw/sd: ssi-sd: Handle the rest commands with R1b
 response type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

HI Philippe,

On Mon, Feb 8, 2021 at 10:27 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On Mon, Feb 8, 2021 at 3:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Philippe,
> >
> > On Mon, Feb 8, 2021 at 10:08 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> > >
> > > On 1/28/21 7:30 AM, Bin Meng wrote:
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > Besides CMD12, the following command's reponse type is R1b:
> > > >
> > > > - SET_WRITE_PROT (CMD28)
> > > > - CLR_WRITE_PROT (CMD29)
> > > > - ERASE (CMD38)
> > > >
> > > > Reuse the same s->stopping to indicate a R1b reponse is needed.
> > > >
> > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > ---
> > > >
> > > > Changes in v4:
> > > > - new patch: handle the rest commands with R1b response type
> > > >
> > > >  hw/sd/ssi-sd.c | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> > > > index 907d681d19..97ee58e20c 100644
> > > > --- a/hw/sd/ssi-sd.c
> > > > +++ b/hw/sd/ssi-sd.c
> > > > @@ -194,6 +194,12 @@ static uint32_t ssi_sd_transfer(SSIPeripheral =
*dev, uint32_t val)
> > > >                  /* CMD13 returns a 2-byte statuse work. Other comm=
ands
> > > >                     only return the first byte.  */
> > > >                  s->arglen =3D (s->cmd =3D=3D 13) ? 2 : 1;
> > > > +
> > > > +                /* handle R1b */
> > > > +                if (s->cmd =3D=3D 28 || s->cmd =3D=3D 29 || s->cmd=
 =3D=3D 38) {
> > >
> > > Why not also check CMD13 for completeness?
> > >
> >
> > I am not sure I got your point. CMD13 does not respond with R1b but R2.
>
> Forget what I wrote, you are correct =3D)
>
> BTW since you have a deep understanding of SD cards, would you like to
> be listed as designated reviewer in the SD/MMC section?

I would be honored to have a try. Thanks!

Regards,
Bin

