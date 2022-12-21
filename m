Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2E26535B1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:58:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83MC-0006aW-U5; Wed, 21 Dec 2022 12:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slongfield@google.com>)
 id 1p83MA-0006a6-UX
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 12:58:18 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <slongfield@google.com>)
 id 1p83M9-0003aS-Fg
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 12:58:18 -0500
Received: by mail-vs1-xe29.google.com with SMTP id q128so15431455vsa.13
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 09:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cIB7bOqRoV+jCCK+MjlbRhBtB8ep4WaqUIq92CXaplY=;
 b=DmPM7GwXuOQXzj2OP7hHEvqsiL+muOptG+jl9/1Wkq2icM6phYzvX4WOCI56O0A8Lf
 M06blPrsosxktclr25S166NcyM/jx+sVw/SiDfLEoaDWd6bWOKFzUGermjaeR3d+Dk8x
 nVYqkppsZI6RqsxIBpZd9aH8nFAuxcXQ8+OqjvL++3ZBu7cikgVYStt/PZZfxHv04ULN
 z9i0lSxd+2eVSPmorzDsf8PKwxoXPJTBBd3EQyKI0oqftv9xyLH9QAs4crDSaKaksDZS
 Unv46jVI3JL5C3eo8tchDdO0liOsHJH7Zb3No2oSkmgaHyiEoszs7TCBbfPLSZMIItOd
 gIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cIB7bOqRoV+jCCK+MjlbRhBtB8ep4WaqUIq92CXaplY=;
 b=aPf/izmRAXGSDog7y5+/SWQeh3uqYMuBIaUXLmBLthO5joBBk8RXe2wba3+UYtNY3r
 e6fR5ZZPu23+sVsZA8VjfcZyksQ5ltfhzYz6n1J8I3TyajuyaFemwNYzhkHbSuWblw6C
 52AFYjlTCeo5qM2Ff8RIBHlWlkMigSGvQNS0swCiGymw8ZM3aQ72CqnQiRSHqZnUfGIW
 4nkL9FMdz7uA+PE8byx24AfEelHBerAUJ2BQ28KMlRYS4z/RtzVMyCeXs/qUsJCcNx54
 DkbUs7RWZjVU4ExQuLIWhNy3vWr2IK7dNR9z21crx5NmX4qeSR/Xre/olUVINg/wKHQ5
 rsrA==
X-Gm-Message-State: AFqh2kpisaEiVIQVUJ+2BAGRaOIvpLfgT5c88pJxNnOLL6cHaIwsJOl4
 rNvdfe7W4g3VbPOp2XcnUdc/MAaP0Gx9s0qFVDbTAg==
X-Google-Smtp-Source: AMrXdXtlUlF/PYN0WxcywvGQPJyzFFyEudHujhSLajeRJ9om4AmDMsy4+KMza8+Ltq7Cr+9b+hCgyBDmTwl8RwoWGII=
X-Received: by 2002:a05:6102:7a2:b0:3b2:e40d:1d9b with SMTP id
 x2-20020a05610207a200b003b2e40d1d9bmr323660vsg.51.1671645495712; Wed, 21 Dec
 2022 09:58:15 -0800 (PST)
MIME-Version: 1.0
References: <20221220221437.3303721-1-slongfield@google.com>
 <587d650e-fba3-ba44-793e-919dd6f75a90@kaod.org>
In-Reply-To: <587d650e-fba3-ba44-793e-919dd6f75a90@kaod.org>
From: Stephen Longfield <slongfield@google.com>
Date: Wed, 21 Dec 2022 09:58:04 -0800
Message-ID: <CAK_0=FLEiWQMWqzkM_EZ4VCzwRYeTbN9djuFgDR1EwVAZ1oALA@mail.gmail.com>
Subject: Re: [PATCH] hw/net: Fix read of uninitialized memory in ftgmac100
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 andrew@aj.id.au, joel@jms.id.au, venture@google.com, wuhaotsh@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=slongfield@google.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Tue, Dec 20, 2022 at 11:30 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>
> On 12/20/22 23:14, Stephen Longfield wrote:
> > With the `size +=3D 4` before the call to `crc32`, the CRC calculation
> > would overrun the buffer. Size is used in the while loop starting on
> > line 1009 to determine how much data to write back, with the last
> > four bytes coming from `crc_ptr`, so do need to increase it, but should
> > do this after the computation.
> >
> > I'm unsure why this use of uninitialized memory in the CRC doesn't
> > result in CRC errors, but it seems clear to me that it should not be
> > included in the calculation.
> >
> > Signed-off-by: Stephen Longfield <slongfield@google.com>
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> I think imx_fec.c is impacted also.
>
> Thanks,
>
> C.
>

Thanks for pointing that out, looks to be exactly the same. I'll send
out a separate patch that fixes the issue in that file.

Best,

--Stephen

>
> > ---
> >   hw/net/ftgmac100.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> > index 83ef0a783e..d3bf14be53 100644
> > --- a/hw/net/ftgmac100.c
> > +++ b/hw/net/ftgmac100.c
> > @@ -980,9 +980,9 @@ static ssize_t ftgmac100_receive(NetClientState *nc=
, const uint8_t *buf,
> >           return size;
> >       }
> >
> > -    /* 4 bytes for the CRC.  */
> > -    size +=3D 4;
> >       crc =3D cpu_to_be32(crc32(~0, buf, size));
> > +    /* Increase size by 4, loop below reads the last 4 bytes from crc_=
ptr. */
> > +    size +=3D 4;
> >       crc_ptr =3D (uint8_t *) &crc;
> >
> >       /* Huge frames are truncated.  */
> > --
> > 2.39.0.314.g84b9a713c41-goog
> >
>

