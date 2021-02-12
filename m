Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C25031A75A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 23:16:01 +0100 (CET)
Received: from localhost ([::1]:47494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAgjI-0002Mv-Bl
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 17:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgen-0000Dh-Sy; Fri, 12 Feb 2021 17:11:22 -0500
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:45849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgej-0001wY-Lx; Fri, 12 Feb 2021 17:11:21 -0500
Received: by mail-il1-x12f.google.com with SMTP id w1so554592ilm.12;
 Fri, 12 Feb 2021 14:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=plnOZBiWq6v6ObAMnijcQaUzJO+GXgJNWA7z10CoiVU=;
 b=FsbgBhmZ/iAQUTg1m3ehzi2S1BxT/OOncyi4tsUnbv7Td1ooqVHY6ebjRAGdg5NG1t
 dNzJyayqc7NQo9jnGJKZi7QMh2WAvsc75jnZxYMZj7H+xztI5wj5heNo04KNagrlhJGr
 veA2oWptv7ZGefUdNhNaqLcpS5s2H2JRXaawthSljnnJm1yJDrKXvh6mPw1iOW1KUCeW
 dHr/UFwrv/w7Odt/cBI8lyaWmrzvIIywHku7pD41Y5TdqItJduESpS66GOOvEFNx0j7v
 hDDCGxmw0aEUYx3Qyt0ZIAG601rLEydDZ3rNkf/KaMenfh9AZbLTJPD5ftI5x9mKnY9H
 dd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=plnOZBiWq6v6ObAMnijcQaUzJO+GXgJNWA7z10CoiVU=;
 b=pQSN3hH3iQ0stIEC1y6JWkJ3ObZyWu4kyTv7UrxnKU+BsnggAp4DlAsPI+1fMm7QH/
 Zdgg5BbUwflgREaDMP/wgGBwY8OrdM9lMxujSqHFKT9xY091Ws+97ANocT1lf/J6qmf9
 infk4I21ezNDERo4INJLpqa0aVFFXqWm6etdg9PX+tBTWVnDBY0x0Li0XBepEAF7/uaL
 bcE5O6JNGEURJsBlrY6S8aKXpNY8RkWsRHmnCgTsgWSwKo51NWYe10/NOX48PdUI0mPK
 fpWLQvJLvhwgMnX3S7cdPdZu74Q/Xh085klk3iLYXyG0LW/WkDBb2rCJ2PTEe5REKHUA
 6pjQ==
X-Gm-Message-State: AOAM530jCd2IpiD9ZP9usadhc0Y59svSMS+UJlE6oy5jcnLSaUMZE/bp
 th1p+sH0v/xOZaVnNbal7QHRQGaSWvbFWO0431w=
X-Google-Smtp-Source: ABdhPJyQ/SwxEBny0gEEtcJaITaq5MgFPfbcmHI5wUqjolOLlB+G3lx7SiLIXy3lA5KkPhM4Y4QX8UDT9XBSEj95MGY=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr4027131ild.267.1613167874337; 
 Fri, 12 Feb 2021 14:11:14 -0800 (PST)
MIME-Version: 1.0
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613031446-22154-11-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1613031446-22154-11-git-send-email-sai.pavan.boddu@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 14:10:33 -0800
Message-ID: <CAKmqyKOcADG6Dd=BQ3GwixNmEAKMUg7bR7Nhx4wc33iLrcZbvQ@mail.gmail.com>
Subject: Re: [RFC PATCH 10/15] sd: emmc: Update CID structure for eMMC
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Sai Pavan Boddu <saipava@xilinx.com>, Luc Michel <luc.michel@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 12:30 AM Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> CID structure is little different for eMMC, w.r.t to product name and
> manufacturing date.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/sd/sd.c | 52 +++++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 35 insertions(+), 17 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 7aab647..45311fa 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -345,23 +345,41 @@ static void sd_set_scr(SDState *sd)
>
>  static void sd_set_cid(SDState *sd)
>  {
> -    sd->cid[0] = MID;          /* Fake card manufacturer ID (MID) */
> -    sd->cid[1] = OID[0];       /* OEM/Application ID (OID) */
> -    sd->cid[2] = OID[1];
> -    sd->cid[3] = PNM[0];       /* Fake product name (PNM) */
> -    sd->cid[4] = PNM[1];
> -    sd->cid[5] = PNM[2];
> -    sd->cid[6] = PNM[3];
> -    sd->cid[7] = PNM[4];
> -    sd->cid[8] = PRV;          /* Fake product revision (PRV) */
> -    sd->cid[9] = 0xde;         /* Fake serial number (PSN) */
> -    sd->cid[10] = 0xad;
> -    sd->cid[11] = 0xbe;
> -    sd->cid[12] = 0xef;
> -    sd->cid[13] = 0x00 |       /* Manufacture date (MDT) */
> -        ((MDT_YR - 2000) / 10);
> -    sd->cid[14] = ((MDT_YR % 10) << 4) | MDT_MON;
> -    sd->cid[15] = (sd_crc7(sd->cid, 15) << 1) | 1;
> +    if (sd->emmc) {
> +        sd->cid[0] = MID;
> +        sd->cid[1] = 0x1;       /* CBX */
> +        sd->cid[2] = OID[0];    /* OEM/Application ID (OID) */
> +        sd->cid[3] = PNM[0];    /* Fake product name (PNM) 48bit */
> +        sd->cid[4] = PNM[1];
> +        sd->cid[5] = PNM[2];
> +        sd->cid[6] = PNM[3];
> +        sd->cid[7] = PNM[4];

Aren't the majority of these the same between the two cases? It's
probably cleaner to split them out then.

Alistair

> +        sd->cid[8] = 0x0;
> +        sd->cid[9] = PRV;        /* Fake product revision (PRV) */
> +        sd->cid[10] = 0xde;      /* Fake serial number (PSN) */
> +        sd->cid[11] = 0xad;
> +        sd->cid[12] = 0xbe;
> +        sd->cid[13] = 0xef;
> +        sd->cid[14] = ((MDT_YR - 1997) % 0x10); /* MDT */
> +    } else {
> +        sd->cid[0] = MID;       /* Fake card manufacturer ID (MID) */
> +        sd->cid[1] = OID[0];    /* OEM/Application ID (OID) */
> +        sd->cid[2] = OID[1];
> +        sd->cid[3] = PNM[0];    /* Fake product name (PNM) 40bit */
> +        sd->cid[4] = PNM[1];
> +        sd->cid[5] = PNM[2];
> +        sd->cid[6] = PNM[3];
> +        sd->cid[7] = PNM[4];
> +        sd->cid[8] = PRV;       /* Fake product revision (PRV) */
> +        sd->cid[9] = 0xde;      /* Fake serial number (PSN) */
> +        sd->cid[10] = 0xad;
> +        sd->cid[11] = 0xbe;
> +        sd->cid[12] = 0xef;
> +        sd->cid[13] = 0x00 |    /* Manufacture date (MDT) */
> +            ((MDT_YR - 2000) / 10);
> +        sd->cid[14] = ((MDT_YR % 10) << 4) | MDT_MON;
> +   }
> +   sd->cid[15] = (sd_crc7(sd->cid, 15) << 1) | 1;
>  }
>
>  #define HWBLOCK_SHIFT  9                       /* 512 bytes */
> --
> 2.7.4
>
>

