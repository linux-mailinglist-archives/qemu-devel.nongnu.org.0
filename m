Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725A031A754
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 23:10:50 +0100 (CET)
Received: from localhost ([::1]:40458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAgeH-0007Fw-AS
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 17:10:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgao-0005bA-Qg; Fri, 12 Feb 2021 17:07:14 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:46135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgan-0000AV-7O; Fri, 12 Feb 2021 17:07:14 -0500
Received: by mail-io1-xd34.google.com with SMTP id u8so697502ior.13;
 Fri, 12 Feb 2021 14:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xfJNpVLYBv8pAvg64kGWUeuhtx1A+yyOshH3rRl8sqg=;
 b=pVXTDJEEOxheGikIhUMj/Wctrer25gp2rAJg7qCkNPvqutEI9aIziUTvZyu6bQUu7N
 R4kQR7kGX03weihAkbea/doqa7wiqH0ptSp5aXv6m5N5/9Dhya0nHHJasYA4UfDBjoPM
 2+MOE0yb2MV1eugX5IgDSugiW4Nc3DGEZAzlo/HsRTYFbJRB5b0alj+u6rB8O/iD3Yb6
 dS0Wm11V3cUCR0quiMtfo7idCdx+jbpeVBdm2sQSSxyNrAQ1fgH31tk+i6mpaQnlHlv3
 P+yPojoGKz7JGKAPcKs8fu0Vp7R5amNEjVJlo7SdCa8llrkUnz3QuPqi8fMokcx7V+eP
 eMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xfJNpVLYBv8pAvg64kGWUeuhtx1A+yyOshH3rRl8sqg=;
 b=EYmf19wyyF0TRerXu87BU/68fMddYw3fJapznZI6LoL98CY2PoWIAybT+xz/v6N+K3
 FmvbsZ4iEf+du6CIsE43NUkHU6YmZ3hVZ2At8HV2pegqNzqoHU0KjBzX29MQQuuuCU5w
 fKG7sd+Snh36JTKgPXPI70+pv2ZAQ+OCi71Eqyluf7tdTOW9PVkjCuiqJl194/LFmLQr
 S9gDtBk4iBFEtT2J+HNhAA7TplAMSNP7DkRthpOAkbukenRq/nrNd5WY5DQhSCd0zkaz
 rA21NGdyqwWgJm6MyFBUGVCSg9V8UtYwe3umiM4bzYiKf18S0g2FrOYKeiXg67MS5Rdo
 4MEQ==
X-Gm-Message-State: AOAM532m5wIy6VpSDBG6aHP9fqinRyDBj33vURDwcvmN5HHm+qSDywaq
 HTU0dUf5EY7AqldQ8P+h94LssW0la7MFUHtAMqM=
X-Google-Smtp-Source: ABdhPJwAxW6IbJ0+Nc8orou4hUJt2WM6y6d9M14F09iDpkwelHJDNK+SGqY/fkQ2ok6k3RBDaqMrZjANq8CWhEjdOhg=
X-Received: by 2002:a6b:d207:: with SMTP id q7mr3825304iob.42.1613167631702;
 Fri, 12 Feb 2021 14:07:11 -0800 (PST)
MIME-Version: 1.0
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613031446-22154-5-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1613031446-22154-5-git-send-email-sai.pavan.boddu@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 14:06:31 -0800
Message-ID: <CAKmqyKPGk2VXNwUkiE2gJ8jvG2_4sCGu2H-CMEKgaJXR=5e4oQ@mail.gmail.com>
Subject: Re: [RFC PATCH 04/15] sd: emmc: Update CMD1 definition for eMMC
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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

On Thu, Feb 11, 2021 at 12:17 AM Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> Add support to Power up the card and send response r3 in case of eMMC.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/sd/sd.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 57fff89..e3738b2 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1033,8 +1033,16 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          break;
>
>      case 1:    /* CMD1:   SEND_OP_CMD */
> -        if (!sd->spi)
> +        /* MMC: Powerup & send r3
> +         * SD: send r1 in spi mode
> +         */
> +        if (sd->emmc) {
> +            sd_ocr_powerup(sd);
> +            return sd->state == sd_idle_state ?
> +                   sd_r3 : sd_r0;
> +        } else if (!sd->spi) {
>              goto bad_cmd;
> +        }
>
>          sd->state = sd_transfer_state;
>          return sd_r1;
> --
> 2.7.4
>
>

