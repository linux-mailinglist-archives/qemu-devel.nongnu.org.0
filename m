Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C480DB993
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 00:13:54 +0200 (CEST)
Received: from localhost ([::1]:33050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLE1p-00045i-AJ
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 18:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34173)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iLDtj-0002Kx-K8
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 18:05:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iLDti-0006nP-CT
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 18:05:31 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:39085)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iLDti-0006k0-5F; Thu, 17 Oct 2019 18:05:30 -0400
Received: by mail-lj1-x244.google.com with SMTP id y3so4139131ljj.6;
 Thu, 17 Oct 2019 15:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fXhMR+KY7Gl4gPZbUDX1MnG1q3fxMVAulACdibgLvQY=;
 b=fZ2d9c4MGEVeAOmZ3S4OMdWO8lP5RTJAZ372Z9EhYQFLlCNSSvr+3p938LWZ7ivuVm
 6zHzgld1e2PEVmC+XUPr31MLqBGHJwp+r+9HSyFKS4smpO2mo/QuiN9TOv6QTV6VLLVl
 +J578HUrWChVCcia1py+3I4Z3RWWsgGmUcEco0a6vNGPch+YEKPJFGJvVmyK/odFJPBY
 JPj5m2C9+jo4hnKLSB+hzImq1j/UBK6+tY4tNPb7OPOO2W4idEd41waPZ/1xGJ+yfnlJ
 E3JAXLTqEEhYFXCegeVL6YaGk/LJNkDldRemaEuB9LQEc6JHArgoeRPHHFo3FDepnDpc
 Sikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fXhMR+KY7Gl4gPZbUDX1MnG1q3fxMVAulACdibgLvQY=;
 b=uORAg5L1vJAL0NdL7bJ/Mb9G2kQ864VoT8CVOJx+Gvq5w28PhCPK8QaZ3bfIV1xgaE
 p9AhmsTyZ6hU3Kkv5uZmvPXaqKFmikVJrbJImrS6y17dNAFgqs4h3xM9fq3FhAVCapT/
 f3JZLTiKcBKQq1VEEAHYjmBtLN2ofFOecoUZGqjWVTTPzigRQ/OtFC4VmwlBtNztEWyz
 pt9anclGB/ZSkmPSI5SZ09s+HYfl18TkaJIgzpkbLfoZoNy4lM8e7APCXb06AbgwqJQT
 eDTT4iU1UFPC/y953qlNkSf/Q0CJ3SHLudChdvER3S3g2KWLxA7sLb2YiLbwhdW46sbq
 3fsQ==
X-Gm-Message-State: APjAAAW+HY9oILIK5OEv/J7Y87qQSRQUh7Wyyd+4ncMVtcJQj2bwI+uP
 QvWQzfdmjhqiv1ChRZYHN8a+t6bHkDgn5jcqrnQ=
X-Google-Smtp-Source: APXvYqwvulMrqcFJ4ht6pmNyZ/OAA4okon3zcjPwq/ki0utQatdd/53z0pw8ChMgNFcYLKpFAxNGQY2vTgL+f7WCZiM=
X-Received: by 2002:a2e:894b:: with SMTP id b11mr3922885ljk.152.1571349926910; 
 Thu, 17 Oct 2019 15:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191017132122.4402-1-peter.maydell@linaro.org>
 <20191017132122.4402-2-peter.maydell@linaro.org>
In-Reply-To: <20191017132122.4402-2-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 17 Oct 2019 15:00:17 -0700
Message-ID: <CAKmqyKPSnBYbP2ZP=KMopZfCESeWE3hzKw=4quKCwMYxZ016vw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/net/fsl_etsec/etsec.c: Switch to transaction-based
 ptimer API
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, "open list:New World" <qemu-ppc@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 17, 2019 at 6:42 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Switch the fsl_etsec code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/net/fsl_etsec/etsec.h | 1 -
>  hw/net/fsl_etsec/etsec.c | 9 +++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/net/fsl_etsec/etsec.h b/hw/net/fsl_etsec/etsec.h
> index 09d05c21338..7951c3ad65f 100644
> --- a/hw/net/fsl_etsec/etsec.h
> +++ b/hw/net/fsl_etsec/etsec.h
> @@ -141,7 +141,6 @@ typedef struct eTSEC {
>      uint16_t phy_control;
>
>      /* Polling */
> -    QEMUBH *bh;
>      struct ptimer_state *ptimer;
>
>      /* Whether we should flush the rx queue when buffer becomes available. */
> diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
> index d9b3e8c691e..717de76569a 100644
> --- a/hw/net/fsl_etsec/etsec.c
> +++ b/hw/net/fsl_etsec/etsec.c
> @@ -34,7 +34,6 @@
>  #include "etsec.h"
>  #include "registers.h"
>  #include "qemu/log.h"
> -#include "qemu/main-loop.h"
>  #include "qemu/module.h"
>
>  /* #define HEX_DUMP */
> @@ -195,9 +194,11 @@ static void write_dmactrl(eTSEC          *etsec,
>
>      if (!(value & DMACTRL_WOP)) {
>          /* Start polling */
> +        ptimer_transaction_begin(etsec->ptimer);
>          ptimer_stop(etsec->ptimer);
>          ptimer_set_count(etsec->ptimer, 1);
>          ptimer_run(etsec->ptimer, 1);
> +        ptimer_transaction_commit(etsec->ptimer);
>      }
>  }
>
> @@ -391,10 +392,10 @@ static void etsec_realize(DeviceState *dev, Error **errp)
>                                object_get_typename(OBJECT(dev)), dev->id, etsec);
>      qemu_format_nic_info_str(qemu_get_queue(etsec->nic), etsec->conf.macaddr.a);
>
> -
> -    etsec->bh     = qemu_bh_new(etsec_timer_hit, etsec);
> -    etsec->ptimer = ptimer_init_with_bh(etsec->bh, PTIMER_POLICY_DEFAULT);
> +    etsec->ptimer = ptimer_init(etsec_timer_hit, etsec, PTIMER_POLICY_DEFAULT);
> +    ptimer_transaction_begin(etsec->ptimer);
>      ptimer_set_freq(etsec->ptimer, 100);
> +    ptimer_transaction_commit(etsec->ptimer);
>  }
>
>  static void etsec_instance_init(Object *obj)
> --
> 2.20.1
>
>

