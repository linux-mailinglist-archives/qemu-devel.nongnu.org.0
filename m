Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6272B662DA8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:51:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEwIi-0003O4-RO; Mon, 09 Jan 2023 12:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slongfield@google.com>)
 id 1pEwIf-0003Lh-MF
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:51:10 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <slongfield@google.com>)
 id 1pEwIZ-0004DZ-BR
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:51:09 -0500
Received: by mail-vs1-xe35.google.com with SMTP id k6so573020vsk.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 09:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RCQ+8sasHoTSrDqcnIZeWK5ekBDCwtf3ebUZLQD9pSc=;
 b=qvgfjPlBzuPBOiAn5tUW7+vhs2CNSbMkm5FIq3TJF6/UPzbijub8SLyOAFsdeIcsNQ
 lQTHGUP2BR/CUC+5/prKpqZ8MZumrCWD7Evo+9cjK3jc6R6fKnS2UYnWbqMcKAt/vWVM
 V2Ax/KuFlZnR9e3i1Ik9158ieRWTLh9/c+/WwLeeG0vD1osD5jhqcS/75EBQd6PhhJxZ
 mlqvCNnuRA/yIIR3VvlTCd3yzA2TpHQf+fqJWsSMBJnRPYMbf6Xxiwt7XotFKzZmydo6
 Ddpra5dX0GX2jgP8VsQB2CkIgTZqiS1xo4VXmWukYDtCcDdRDdDt8DAKjd26494PEvdG
 iVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RCQ+8sasHoTSrDqcnIZeWK5ekBDCwtf3ebUZLQD9pSc=;
 b=IZN4bjU8XPb1KwQUxvtMSdHa7bwNQ893UwS/wcLeZouMRu94YM50YgI6ElgRn5tCCw
 itl0ocDN9jACP1E3scJDaITwiiIiKkqckrEGzDyK6duqOXPGKRoexZRU0l/qRZOy6tim
 2C4LzZguQS2BTO9XlZbxos3roQtMFsWEsz7zLY+NllWw1yQT0AvJOMmm/Dj6+afaAVcf
 HNoqVKWI6KP1EhYc7IIpKeEVeYHjmhw7rknzHqWXtstRsoZ+4fb+Ka/Li4jzsw/J8fvw
 cQODq5EBTfyB99ss/qgBuWWokFBJrOGMn44OQRilRLwNWnXMOJxoEMywBTCFS+JUw+dL
 cqzw==
X-Gm-Message-State: AFqh2koJrPVDHj0tXKHGV6TOFLh3Rej9He56vjDh3C2AIuoL6gsYHWVv
 G/GbTa2vCZATTdEMYahO24mbWsNePjTjS8cxOfxZ3A==
X-Google-Smtp-Source: AMrXdXtvWHTWpuFVMHC0g4ZwlcVLd6SrlZqRqVKim87nFU72IymttUFAlFOxN6zkonGZClOmjAdzml9ukwsVuhUhlvU=
X-Received: by 2002:a05:6102:5616:b0:3d0:a51c:58cc with SMTP id
 de22-20020a056102561600b003d0a51c58ccmr548211vsb.51.1673286661675; Mon, 09
 Jan 2023 09:51:01 -0800 (PST)
MIME-Version: 1.0
References: <20221220221437.3303721-1-slongfield@google.com>
 <587d650e-fba3-ba44-793e-919dd6f75a90@kaod.org>
 <CAK_0=FLEiWQMWqzkM_EZ4VCzwRYeTbN9djuFgDR1EwVAZ1oALA@mail.gmail.com>
In-Reply-To: <CAK_0=FLEiWQMWqzkM_EZ4VCzwRYeTbN9djuFgDR1EwVAZ1oALA@mail.gmail.com>
From: Stephen Longfield <slongfield@google.com>
Date: Mon, 9 Jan 2023 09:50:50 -0800
Message-ID: <CAK_0=FKBx8DxTCJ1QzW7SC8QenNmvm13aJyO9P882V3gKhWxLg@mail.gmail.com>
Subject: Re: [PATCH] hw/net: Fix read of uninitialized memory in ftgmac100
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 andrew@aj.id.au, joel@jms.id.au, venture@google.com, wuhaotsh@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=slongfield@google.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Does anything more need to happen with this patch before it can be
applied? Not sure if it had gotten lost over the holidays.

Best,

--Stephen


On Wed, Dec 21, 2022 at 9:58 AM Stephen Longfield <slongfield@google.com> w=
rote:
>
> On Tue, Dec 20, 2022 at 11:30 PM C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
> >
> > On 12/20/22 23:14, Stephen Longfield wrote:
> > > With the `size +=3D 4` before the call to `crc32`, the CRC calculatio=
n
> > > would overrun the buffer. Size is used in the while loop starting on
> > > line 1009 to determine how much data to write back, with the last
> > > four bytes coming from `crc_ptr`, so do need to increase it, but shou=
ld
> > > do this after the computation.
> > >
> > > I'm unsure why this use of uninitialized memory in the CRC doesn't
> > > result in CRC errors, but it seems clear to me that it should not be
> > > included in the calculation.
> > >
> > > Signed-off-by: Stephen Longfield <slongfield@google.com>
> > > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> >
> >
> > Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >
> > I think imx_fec.c is impacted also.
> >
> > Thanks,
> >
> > C.
> >
>
> Thanks for pointing that out, looks to be exactly the same. I'll send
> out a separate patch that fixes the issue in that file.
>
> Best,
>
> --Stephen
>
> >
> > > ---
> > >   hw/net/ftgmac100.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> > > index 83ef0a783e..d3bf14be53 100644
> > > --- a/hw/net/ftgmac100.c
> > > +++ b/hw/net/ftgmac100.c
> > > @@ -980,9 +980,9 @@ static ssize_t ftgmac100_receive(NetClientState *=
nc, const uint8_t *buf,
> > >           return size;
> > >       }
> > >
> > > -    /* 4 bytes for the CRC.  */
> > > -    size +=3D 4;
> > >       crc =3D cpu_to_be32(crc32(~0, buf, size));
> > > +    /* Increase size by 4, loop below reads the last 4 bytes from cr=
c_ptr. */
> > > +    size +=3D 4;
> > >       crc_ptr =3D (uint8_t *) &crc;
> > >
> > >       /* Huge frames are truncated.  */
> > > --
> > > 2.39.0.314.g84b9a713c41-goog
> > >
> >

