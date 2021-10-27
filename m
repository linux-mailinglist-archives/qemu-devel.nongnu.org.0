Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A421C43C126
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 06:08:05 +0200 (CEST)
Received: from localhost ([::1]:57326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfaEO-0000zH-8h
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 00:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mfaCd-0007rP-Es
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:06:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mfaCa-0007oq-Le
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:06:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635307570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hPVPMeYCGobsOS3z8AYVluVI2eA/CM2Nwvqnjf39dAk=;
 b=Dx5l8P/SsaQm/Yc5jGCkUgIrNnOhcBcbrtPzdwO/LatdkxxH2mZN1W2Pd/T7bp5ZIiuYsp
 1Zynqrf99M3340udYMVh8mfvyhnQTD1z4QvhbAf6WoYeNOHbYQczfqjghpLZOJuL8DZzHk
 wuhcOxvWiSJEkjf5pac5FhHk2cf54dQ=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-aQOv_gWLMxO2P5w2pwzqng-1; Wed, 27 Oct 2021 00:06:09 -0400
X-MC-Unique: aQOv_gWLMxO2P5w2pwzqng-1
Received: by mail-lj1-f197.google.com with SMTP id
 v11-20020a2e990b000000b0021174a28c48so232155lji.13
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 21:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hPVPMeYCGobsOS3z8AYVluVI2eA/CM2Nwvqnjf39dAk=;
 b=eGM4rwW0aFvcjxvCglER4V3KAjF2eBlN93bBuh8WFJuywvwQjoqoDkAQQH4S7N+gj0
 RR2H8lmoSFEEekTQezOOFWeelFLicN2BWRd0tUv0PmnU89DiXzHx0/0a6s3T68Ik0NTE
 Y0Xcrl2Dbvhfyfg4iZ8lCBQdwtFopz8H3pVpTY2WHDwyRIglhl3CnVPiF42DogrPzU47
 TDkM+hr8BOyaHyPtbC2nnBBa9Na8dpu6jGXmYYx04hYbk+lnIUi9u5Sy4knMxHy70oXb
 qd9C3gUfo+NgFzYOdIW0jI20961CfzKkVn//j+2SEqnlxWQzNTLZu3IEPf2Mt9ccFVYh
 CwEg==
X-Gm-Message-State: AOAM5334sYiBGJDxl9SzszCXq5iYmFBM3UqZySlTQSX4HmChYhhTmLCR
 81MRi9NOnZeUDiQXrSInMd3kWhHU2TRKsKSc7Uu6eCrtx8wubd1RBlOuSG9SEK52igCXWKSvM0b
 UZz1tX8GdtURnUaf5GdNnDJ1DCbvKqrc=
X-Received: by 2002:a05:6512:3b26:: with SMTP id
 f38mr11640959lfv.629.1635307567048; 
 Tue, 26 Oct 2021 21:06:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwufWvKDJsjnfqhdmMOzVCO53U0VYeU246EpyiqC7ebuoglDA654o0ww1vcdfWmtMmPNqX5XiKZOZc2J+1bsWc=
X-Received: by 2002:a05:6512:3b26:: with SMTP id
 f38mr11640935lfv.629.1635307566787; 
 Tue, 26 Oct 2021 21:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <163524428177.1917083.7115508068018047923.stgit@pasha-ThinkPad-X280>
In-Reply-To: <163524428177.1917083.7115508068018047923.stgit@pasha-ThinkPad-X280>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 27 Oct 2021 12:05:56 +0800
Message-ID: <CACGkMEuwW6miZ0GAqFC7WFK+1oOAYoz7x-zC-+Z-u0A_n3x0aA@mail.gmail.com>
Subject: Re: [PATCH] hw/net: store timers for e1000 in vmstate
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 6:36 PM Pavel Dovgalyuk
<pavel.dovgalyuk@ispras.ru> wrote:
>
> Setting timers randomly when vmstate is loaded breaks
> execution determinism.
> Therefore this patch allows saving mit and autoneg timers
> for e1000. It makes execution deterministic and allows
> snapshotting and reverse debugging in icount mode.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  hw/net/e1000.c |   61 ++++++++++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 50 insertions(+), 11 deletions(-)
>
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index a30546c5d5..2f706f7298 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -37,6 +37,7 @@
>  #include "qemu/iov.h"
>  #include "qemu/module.h"
>  #include "qemu/range.h"
> +#include "sysemu/replay.h"
>
>  #include "e1000x_common.h"
>  #include "trace.h"
> @@ -1407,7 +1408,7 @@ static int e1000_pre_save(void *opaque)
>       * complete auto-negotiation immediately. This allows us to look
>       * at MII_SR_AUTONEG_COMPLETE to infer link status on load.
>       */
> -    if (nc->link_down && have_autoneg(s)) {
> +    if (replay_mode == REPLAY_MODE_NONE && nc->link_down && have_autoneg(s)) {
>          s->phy_reg[PHY_STATUS] |= MII_SR_AUTONEG_COMPLETE;
>      }
>
> @@ -1438,22 +1439,12 @@ static int e1000_post_load(void *opaque, int version_id)
>              s->mac_reg[TADV] = 0;
>          s->mit_irq_level = false;
>      }
> -    s->mit_ide = 0;
> -    s->mit_timer_on = true;
> -    timer_mod(s->mit_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 1);
>
>      /* nc.link_down can't be migrated, so infer link_down according
>       * to link status bit in mac_reg[STATUS].
>       * Alternatively, restart link negotiation if it was in progress. */
>      nc->link_down = (s->mac_reg[STATUS] & E1000_STATUS_LU) == 0;
>
> -    if (have_autoneg(s) &&
> -        !(s->phy_reg[PHY_STATUS] & MII_SR_AUTONEG_COMPLETE)) {
> -        nc->link_down = false;
> -        timer_mod(s->autoneg_timer,
> -                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 500);
> -    }

So we won't get those timers armed after migration unconditionally. Is
this intended?

Thanks

> -
>      s->tx.props = s->mig_props;
>      if (!s->received_tx_tso) {
>          /* We received only one set of offload data (tx.props)
> @@ -1472,6 +1463,13 @@ static int e1000_tx_tso_post_load(void *opaque, int version_id)
>      return 0;
>  }
>
> +static int e1000_mit_timer_post_load(void *opaque, int version_id)
> +{
> +    E1000State *s = opaque;
> +    s->mit_timer_on = true;
> +    return 0;
> +}
> +
>  static bool e1000_mit_state_needed(void *opaque)
>  {
>      E1000State *s = opaque;
> @@ -1493,6 +1491,21 @@ static bool e1000_tso_state_needed(void *opaque)
>      return chkflag(TSO);
>  }
>
> +static bool e1000_mit_timer_needed(void *opaque)
> +{
> +    E1000State *s = opaque;
> +
> +    return s->mit_timer_on;
> +}
> +
> +static bool e1000_autoneg_timer_needed(void *opaque)
> +{
> +    E1000State *s = opaque;
> +
> +    return have_autoneg(s)
> +           && !(s->phy_reg[PHY_STATUS] & MII_SR_AUTONEG_COMPLETE);
> +}
> +
>  static const VMStateDescription vmstate_e1000_mit_state = {
>      .name = "e1000/mit_state",
>      .version_id = 1,
> @@ -1541,6 +1554,30 @@ static const VMStateDescription vmstate_e1000_tx_tso_state = {
>      }
>  };
>
> +static const VMStateDescription vmstate_e1000_mit_timer = {
> +    .name = "e1000/mit_timer",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = e1000_mit_timer_needed,
> +    .post_load = e1000_mit_timer_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_TIMER_PTR(mit_timer, E1000State),
> +        VMSTATE_UINT32(mit_ide, E1000State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_e1000_autoneg_timer = {
> +    .name = "e1000/autoneg_timer",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = e1000_autoneg_timer_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_TIMER_PTR(autoneg_timer, E1000State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_e1000 = {
>      .name = "e1000",
>      .version_id = 2,
> @@ -1622,6 +1659,8 @@ static const VMStateDescription vmstate_e1000 = {
>          &vmstate_e1000_mit_state,
>          &vmstate_e1000_full_mac_state,
>          &vmstate_e1000_tx_tso_state,
> +        &vmstate_e1000_mit_timer,
> +        &vmstate_e1000_autoneg_timer,
>          NULL
>      }
>  };
>


