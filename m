Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A8C2C83E8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:13:02 +0100 (CET)
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kji3B-0004L5-F5
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1kji21-0003uV-Tz
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:11:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1kji1z-0006Bx-7p
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606738304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aaOjJcfZiFgK/NUOwzTZi3ALbNqpLighO1RYqWVzJZs=;
 b=Dohq+2UaHQS2jBMMKT8hiJNaHlxqjYoOqSbTmculcqF9v4g7IQ/YbHElJ1de7TbiopL0Uq
 aeUv47fZXmQRjqHwBOgO+wB0zOkWRYqEjHTUoFNYrS5D1D2ThEG1yxZxonpBEaANBXfoz7
 CIsTlthDl9RdbgmIcfPqrQflBd+cDCc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-a5X4PBVAORWL2bm9rGsQaQ-1; Mon, 30 Nov 2020 07:11:40 -0500
X-MC-Unique: a5X4PBVAORWL2bm9rGsQaQ-1
Received: by mail-ej1-f69.google.com with SMTP id u10so3606263ejy.18
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 04:11:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aaOjJcfZiFgK/NUOwzTZi3ALbNqpLighO1RYqWVzJZs=;
 b=QO14EJpA8EWnjHbn2xgzyEbPeJftlkBMYAVBvHH2RJXPcalN6r1UXS+yDBWdBrps52
 llBV/br9pLrLpgL4vQwHbHLan/7PvNWu0vh1u7ylgqFWfKvrklfw6K4hsJuSa3FK1q+r
 63ocC4HbotF7qglxPxLVC48mJUY1kVk9T6f3u6Cl3Ytf7DUDuhCK+e84FzAPotrfzhOS
 bsnSEw+ZmmGNKnQBB1gf11gT/VzXudNS+rF1/kQiWfD9xYhTaXJMNLoE6/nJhLCiW30z
 XeU9Xv46f9kA4ZeoOeiKf4jwcC8DTwhs2uh44aZKd/8hx53JDlxVgVze4gA5xk9hwLti
 SmTg==
X-Gm-Message-State: AOAM531TjyONr14rhs+8YJ7HF8Yu3O0Upv7Ksc2neACyHqAfPg6w5rNY
 ILPZsVIX2dq+roJiWtePPxyzlk/BDOQCG44WFDubMu8ch9kToZA+iXDR6cx1pslR48A+IJGl+JE
 nC3ZSMO4N8Czam+R7OIFyrlMT+/CLRGY=
X-Received: by 2002:a17:906:b7cc:: with SMTP id
 fy12mr6289491ejb.44.1606738299087; 
 Mon, 30 Nov 2020 04:11:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHACiUIEfj+eyg085kzzEInUEN6uTz3Xm/0olAV0dnzofRw60IYw3671VibMr8r8LE6I9kX1b+DtlN71VNsxo=
X-Received: by 2002:a17:906:b7cc:: with SMTP id
 fy12mr6289470ejb.44.1606738298820; 
 Mon, 30 Nov 2020 04:11:38 -0800 (PST)
MIME-Version: 1.0
References: <20201124092445.658647-1-mcascell@redhat.com>
 <48d8ae85-3292-921a-f249-3b88a1141cc9@amsat.org>
In-Reply-To: <48d8ae85-3292-921a-f249-3b88a1141cc9@amsat.org>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Mon, 30 Nov 2020 13:11:28 +0100
Message-ID: <CAA8xKjXJq00HtKNJc0HVAhXXftFHEGLj_KXaiy7M9_2WvgNRrQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net/dp8393x: fix integer underflow in
 dp8393x_do_transmit_packets()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, pgn@zju.edu.cn,
 QEMU Developers <qemu-devel@nongnu.org>,
 Finn Thain <fthain@telegraphics.com.au>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 30, 2020 at 11:44 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> +Laurent/Finn
>
> On 11/24/20 10:24 AM, Mauro Matteo Cascella wrote:
> > An integer underflow could occur during packet transmission due to 'tx_=
len' not
> > being updated if SONIC_TFC register is set to zero. Check for negative =
'tx_len'
> > when removing existing FCS.
> >
> > RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D1899722
> > Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> > Reported-by: Gaoning Pan <pgn@zju.edu.cn>
> > ---
> >  hw/net/dp8393x.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> > index 674b04b354..205c0decc5 100644
> > --- a/hw/net/dp8393x.c
> > +++ b/hw/net/dp8393x.c
> > @@ -495,6 +495,10 @@ static void dp8393x_do_transmit_packets(dp8393xSta=
te *s)
> >          } else {
> >              /* Remove existing FCS */
> >              tx_len -=3D 4;
> > +            if (tx_len < 0) {
> > +                SONIC_ERROR("tx_len is %d\n", tx_len);
> > +                break;
> > +            }
> >          }
> >
> >          if (s->regs[SONIC_RCR] & (SONIC_RCR_LB1 | SONIC_RCR_LB0)) {
> >
>
> Doesn't it make more sense to check 'tx_len >=3D 4'
> and skip tx/rx when 'tx_len =3D=3D 0'?
>

Yes, it makes sense. I thought that skipping tx/rx in case of null
'tx_len' could lead to potential inconsistencies when writing the
status or reading the footer of the packet. but I'm not really sure. I
can send a new version of the patch if needed, otherwise feel free to
apply your changes. Thank you.

> -- >8 --
> @@ -488,25 +488,29 @@ static void
> dp8393x_do_transmit_packets(dp8393xState *s)
>              }
>          }
>
> -        /* Handle Ethernet checksum */
> -        if (!(s->regs[SONIC_TCR] & SONIC_TCR_CRCI)) {
> -            /* Don't append FCS there, to look like slirp packets
> -             * which don't have one */
> -        } else {
> -            /* Remove existing FCS */
> -            tx_len -=3D 4;
> +        if (tx_len >=3D 4) {
> +            /* Handle Ethernet checksum */
> +            if (!(s->regs[SONIC_TCR] & SONIC_TCR_CRCI)) {
> +                /* Don't append FCS there, to look like slirp packets
> +                 * which don't have one */
> +            } else {
> +                /* Remove existing FCS */
> +                tx_len -=3D 4;
> +            }
>          }
>
> -        if (s->regs[SONIC_RCR] & (SONIC_RCR_LB1 | SONIC_RCR_LB0)) {
> -            /* Loopback */
> -            s->regs[SONIC_TCR] |=3D SONIC_TCR_CRSL;
> -            if (nc->info->can_receive(nc)) {
> -                s->loopback_packet =3D 1;
> -                nc->info->receive(nc, s->tx_buffer, tx_len);
> +        if (tx_len > 0) {
> +            if (s->regs[SONIC_RCR] & (SONIC_RCR_LB1 | SONIC_RCR_LB0)) {
> +                /* Loopback */
> +                s->regs[SONIC_TCR] |=3D SONIC_TCR_CRSL;
> +                if (nc->info->can_receive(nc)) {
> +                    s->loopback_packet =3D 1;
> +                    nc->info->receive(nc, s->tx_buffer, tx_len);
> +                }
> +            } else {
> +                /* Transmit packet */
> +                qemu_send_packet(nc, s->tx_buffer, tx_len);
>              }
> -        } else {
> -            /* Transmit packet */
> -            qemu_send_packet(nc, s->tx_buffer, tx_len);
>          }
>          s->regs[SONIC_TCR] |=3D SONIC_TCR_PTX;
>
> ---
>

Regards,
--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


