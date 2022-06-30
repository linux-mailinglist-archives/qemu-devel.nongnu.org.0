Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F8D5622FA
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 21:20:24 +0200 (CEST)
Received: from localhost ([::1]:33398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6ziB-0003Ab-2M
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 15:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6zew-00019U-St
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 15:17:03 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6zei-0008My-Bg
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 15:16:51 -0400
Received: by mail-ed1-x52e.google.com with SMTP id e2so160319edv.3
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 12:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FQSEROxB1ZEETv/NwPSkNBfTJLiVZOHdBv6PNc25cnk=;
 b=eqJhThCrevIeeeUvsSqEtYmF2GvFvXArgqxjnA083YSc2QnDVlXi7z/jHvgjuS/YAq
 N3xd+YQ35fk/vZBXfDQSSM2vm9ZIlcUZTn4fu5ZJ6M/s8fRP9vTSk3wdsmDNGpaK7FXV
 1B6H9PXaGIFlveTEQgW4yK49EnArsFL+M11ZDY4W4Ae8NeL+06koicEPZnsrLeLJo8K1
 eKIzCxddx+kux11rJ4llB7MCD/Xxtjd/yIevAnTevsaxJpc8y48mLuDRoaNygcOfFkH2
 7nVzytdW+LXwXgFUtvqh+TkAI38ZEUnSKgwdlVTEEUb4ym1goEoy37Zb6aR2mu028z+N
 ACcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FQSEROxB1ZEETv/NwPSkNBfTJLiVZOHdBv6PNc25cnk=;
 b=DmlgGpWUKCBMRY2Xle7808kIBrR8+05ovt0lbLXbZu5/nD2LrX7cPx58q0YagJmVZ8
 z/WthWfaiW9U8CPFjv9igNaYMrqMtkp+L1SrI/z7VDQKIHr/JJHETV22Lq6LV4X+6gyS
 asaBU8big6sf0QZBzhZXXO6zi9lEPf0YI0xHYZd/aSKzA23C5w8EhBtxXG8ri8TePL2q
 IgZwKpWRQ5VIHLJdEeC7IFXlD7H4WAykz5EfkVh3ol1n+NsEqo/Ieqji956x+DtMcfzA
 bGkUnUT5f4j2N4mmxSiFP9AAbI8ezlb3bHaYM4v/9D1kG42RZEV2dxd6nOyub3S3NIvG
 fuDw==
X-Gm-Message-State: AJIora+3IT0fwpnk+LCcVLpfIAbXxjJ5qIPT+Az7t1n3fpizGD/o6F7N
 xCu6BmfIVboarGkd2H5Ri9Wbcuws5kDdHcOwP3ZN+g==
X-Google-Smtp-Source: AGRyM1s+HZn2znaIbf0xw3SJSCjQ1tKQti3C0PRNcyqdXkILJBH6gciJh8+CxPXBmOcIHwvGuUfi9l3ib8Mi3r0VoFM=
X-Received: by 2002:aa7:dcc1:0:b0:435:5db1:c749 with SMTP id
 w1-20020aa7dcc1000000b004355db1c749mr13530384edu.124.1656616605126; Thu, 30
 Jun 2022 12:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-11-me@pjd.dev>
 <293da11c-dde2-e646-c754-820720c410de@kaod.org>
In-Reply-To: <293da11c-dde2-e646-c754-820720c410de@kaod.org>
From: Titus Rwantare <titusr@google.com>
Date: Thu, 30 Jun 2022 12:16:08 -0700
Message-ID: <CAMvPwGpZZgAd2RHXmvmxfgyTyVGd6Rx+avj=E24NWc0masdc=A@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] hw/sensor: Add Renesas ISL69259 device model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Peter Delevoryas <me@pjd.dev>, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, 
 cminyard@mvista.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 zhdaniel@fb.com, pdel@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=titusr@google.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 Jun 2022 at 23:30, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 6/30/22 06:51, Peter Delevoryas wrote:
> > From: Peter Delevoryas <pdel@fb.com>
> >
> > This adds the ISL69259, using all the same functionality as the existin=
g
> > ISL69260 but overriding the IC_DEVICE_ID.
> >
> > Signed-off-by: Peter Delevoryas <pdel@fb.com>
> > ---
> >   hw/sensor/isl_pmbus_vr.c | 28 ++++++++++++++++++++++++++++
> >   1 file changed, 28 insertions(+)
> >
> > diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
> > index 799ea9d89e..853d70536f 100644
> > --- a/hw/sensor/isl_pmbus_vr.c
> > +++ b/hw/sensor/isl_pmbus_vr.c
> > @@ -119,6 +119,18 @@ static void raa228000_exit_reset(Object *obj)
> >       pmdev->pages[0].read_temperature_3 =3D 0;
> >   }
> >
> > +static void isl69259_exit_reset(Object *obj)
> > +{
> > +    ISLState *s =3D ISL69260(obj);
> > +    static const uint8_t ic_device_id[] =3D {0x04, 0x00, 0x81, 0xD2, 0=
x49, 0x3c};
>
> This looks like an ISLClass attribute to me. In which case, you wouldn't =
need the
> reset handler nor the 'ic_device_id_len' field.
>
> Thanks,
>
> C.

I asked for this because, so far, I've been doing all the register
defaults in reset handlers, including read-only registers.
I don't mind either way, but it seemed preferable to have the devices
consistent.

Titus

