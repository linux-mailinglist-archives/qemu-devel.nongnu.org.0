Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC133537A3D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 13:57:24 +0200 (CEST)
Received: from localhost ([::1]:41620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nve1T-0003V5-V2
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 07:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvdh5-0006ZO-TE
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:36:19 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:38513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvdh2-0002ti-QZ
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:36:18 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2ff7b90e635so106827677b3.5
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pkdHI4NJNJSXNWzDlACMC9GVsPurwUFSLWfoGEV/dJQ=;
 b=gCEjQOz+G9O+UzkXnxAouBzkoW61yy4mYyMaEQ7mw+zqejzyQvBh0hQajduZIumWQv
 R4Ujo+/jdeuCQFb4QLgsvHCfKS3grM1MqZAF6gmo/SoBfC5PtexjCMg6FmHw5JxYpGM+
 xOUueGDuz21jlq4cXdEzI9tyofZESs0D9UWVVMIEPm/CXwrIteCG6uosQENbzJ8A3IDY
 gzR7ukp2q0VFwdQFMVVhVnmI0XETyp0lz6n+NPODtVjK+cWq2yxSyN2paaiFLF1LEFDr
 my7WlcKOqaBJtBV2RjjdLmfUWVEvrrYkISeZ3vqNA4k2y29tF5Pwczb1UdqcbyLCTnMd
 3taA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pkdHI4NJNJSXNWzDlACMC9GVsPurwUFSLWfoGEV/dJQ=;
 b=wacT/YJ0Fdxy3bYB8CyT5pXzkQJvubOt6Qfdlm1RsZUm/jJPOWBWPZuRjTkAi3RvW+
 sGdpl+wHSx4uquuaqUeL2HLdqj/Io1gKxFjq1NisfNKLzAlvLW2IgGingwzWSz30aP/i
 YU2WBYOsgb2lrcDfxTwMAyBLK1GZ1BfsUbhCXhMylmPVA63Mf/5AeiuAzKbd24NhMX1q
 FSmu+iMoPEX3vFDOMx4OA+Cqs2hIqILZ8teOlb845wRteRSNJYDi2GrpPzb//nbIqQsb
 7QIR+JfPVI1TpCxO4RZ2Vi5bBfsbMhd/gCWdD6eTdMSpdD0ywuA7QRg1JukB/FxS0c8A
 h8iA==
X-Gm-Message-State: AOAM533a0WlZ85VbOH/zdvenjWRvuKGNDoD6KIev8SK8B5V3cbTo6tMR
 XswNtmgJRu5p1bG/Pdpxe1FLeSSQFJzXHekQnQzX+g==
X-Google-Smtp-Source: ABdhPJwpE0LDECB6SZicTisT3OOxR+/rRtTEVuiOGLIqN6O0LHmmx269mDp0D0yc1XR/1j3smV4CtdKlU4ycB/tDMF4=
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr1050240ywa.455.1653910575291; Mon, 30
 May 2022 04:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220520124200.2112699-1-uwu@icenowy.me>
 <CAFEAcA-5CxTPdzbwubjRvw-KwOAnW1vPP3O+acvURPD0kwXfMg@mail.gmail.com>
 <a7bdef698925136964b2215b94bcd53e1f153048.camel@icenowy.me>
In-Reply-To: <a7bdef698925136964b2215b94bcd53e1f153048.camel@icenowy.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 May 2022 12:36:04 +0100
Message-ID: <CAFEAcA-sNz-ajuAC6=Qbu0nW-zau3csK+33PJ6EyH5+=D2g29w@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/allwinner-sdhost: report FIFO water level as 1 when
 data ready
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Mon, 23 May 2022 at 17:40, Icenowy Zheng <uwu@icenowy.me> wrote:
>
> =E5=9C=A8 2022-05-23=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 15:14 +0100=EF=
=BC=8CPeter Maydell=E5=86=99=E9=81=93=EF=BC=9A
> > On Fri, 20 May 2022 at 13:42, Icenowy Zheng <uwu@icenowy.me> wrote:
> > >
> > > U-Boot queries the FIFO water level to reduce checking status
> > > register
> > > when doing PIO SD card operation.
> > >
> > > Report a FIFO water level of 1 when data is ready, to prevent the
> > > code
> > > from trying to read 0 words from the FIFO each time.
> > >
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > ---
> > >  hw/sd/allwinner-sdhost.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
> > > index 041e45c680..b66fd9bce7 100644
> > > --- a/hw/sd/allwinner-sdhost.c
> > > +++ b/hw/sd/allwinner-sdhost.c
> > > @@ -114,7 +114,9 @@ enum {
> > >  };
> > >
> > >  enum {
> > > +    SD_STAR_FIFO_EMPTY      =3D (1 << 2),
> > >      SD_STAR_CARD_PRESENT    =3D (1 << 8),
> > > +    SD_STAR_FIFO_LEVEL_1    =3D (1 << 17),
> > >  };
> >
> > Is there documentation on this hardware available somewhere?
> > The Linux kernel driver for it doesn't seem to have a #define
> > for this bit 17.
>
> For the specific version on H3,
> https://linux-sunxi.org/File:Allwinner_H3_Datasheet_V1.2.pdf .

Thanks. Since this patch fixes u-boot and is a reasonable
approximation to correct device behaviour assuming we don't
want to bother emulating the FIFO properly, I've applied
it to my target-arm.next tree.

-- PMM

