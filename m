Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8507931A6F8
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 22:37:33 +0100 (CET)
Received: from localhost ([::1]:58890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAg84-0006XZ-5U
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 16:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAg60-0005va-IO; Fri, 12 Feb 2021 16:35:27 -0500
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:40208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAg5u-00043q-Mk; Fri, 12 Feb 2021 16:35:24 -0500
Received: by mail-il1-x12b.google.com with SMTP id e7so510179ile.7;
 Fri, 12 Feb 2021 13:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OXTkF8AuHLlIcGIgjz1lGhBGF2z21hAgGEilNB7USdY=;
 b=CH7ISPrfA0SAVwucQS4dIGDyzTIO9WE+RTjf285+5oxgx0W5TI8N+g1un0dcn5bdhf
 QYNoCUnGFGhvZqVEzTSSbXHtTWOUh/ZepmAPu5crdJVPpz9TmUm9eFleG4wL6LiyWsnP
 hjsIoUev+qhp3Ni0CKMYxGlskndkpnbz2HULYKaguv9aUWDnMfbLh/01XkteSPoHRFNq
 6Mes94eMKGxFvYRQA2ZZw/NPEwkVFU8whkwXY02NNDtwFp+zAZU8/Pz6EYK1bJwwJfFG
 aEeaoKt/O3ro7ATSNXWoXLfh29+oW24h8OWbmSSucfQMdmoCMYQ36Jyi13ZpnWuiCHfX
 MzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OXTkF8AuHLlIcGIgjz1lGhBGF2z21hAgGEilNB7USdY=;
 b=Cemx+OWKtZ2SE4aUps281lnpvFlRFPtRL+xpuG+lc/eu/ecEG9ep9t/XHffNdYJwea
 flxXY6twxbyrdBbmGyJR6ibrqQxgYjZ0BMfOB2jYSUsuGdSFL1ifYluhxUcgC5hRPGuJ
 Hy6A8OEXd/XbgfesYl218SasZePsBuFi9JrQszjYAxNgtxdP2gSTqq8II1XrfxoQri0a
 +tKPQFf6AXaCUsx++tLOiTqHT3QJp+SfFJx/PM067lQBKlOApZX/nX385+TJGwGgyqJM
 78SbxWLNqWjrqj78D6mLX+1R9I1W6Id8IODebH818Jl8bI/SfnD9G6E+r5clyvIUZbCu
 H2+w==
X-Gm-Message-State: AOAM530iBawU/mvcIFYi2L23iGKUgdMXFLA31augM+1U4rArbMMXAKvh
 glCCutvmbwqCSIkc8X0gkOVYFIC9TlvrfCRR4G4=
X-Google-Smtp-Source: ABdhPJxPcVAlCc2AiH4MZMYvoh2k4yEf72LIpXaMPFsKwEHUVnQo/KYxabt8P8+nh9LRK/DOwP+NDvUjLcdELuwXKz4=
X-Received: by 2002:a05:6e02:218f:: with SMTP id
 j15mr3908449ila.40.1613165717196; 
 Fri, 12 Feb 2021 13:35:17 -0800 (PST)
MIME-Version: 1.0
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613031446-22154-4-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1613031446-22154-4-git-send-email-sai.pavan.boddu@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 13:34:36 -0800
Message-ID: <CAKmqyKNeyKr_Y8PLt1s_n1DCht=1ZBmwnX7j+mViBXUyOiNeaw@mail.gmail.com>
Subject: Re: [RFC PATCH 03/15] sd: emmc: Dont not update CARD_CAPACITY for
 eMMC cards
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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

On Thu, Feb 11, 2021 at 12:22 AM Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> OCR.CARD_CAPACITY field is only valid for sd cards, So skip it for eMMC.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/sd/sd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index a75fa1c..57fff89 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -308,7 +308,8 @@ static void sd_ocr_powerup(void *opaque)
>      /* card power-up OK */
>      sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_POWER_UP, 1);
>
> -    if (sd->size > SDSC_MAX_CAPACITY) {
> +    /* eMMC supports only Byte mode */
> +    if (!sd->emmc && sd->size > SDSC_MAX_CAPACITY) {
>          sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_CAPACITY, 1);
>      }
>  }
> --
> 2.7.4
>
>

