Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B284D458D15
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:12:36 +0100 (CET)
Received: from localhost ([::1]:53044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7FT-0001xh-R5
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:12:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp6tA-0005Yh-Mc
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:49:32 -0500
Received: from [2a00:1450:4864:20::434] (port=34556
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp6t9-0008Pi-83
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:49:32 -0500
Received: by mail-wr1-x434.google.com with SMTP id d5so31886474wrc.1
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 02:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JVajJ0TDzfG2+VIWfPsFwIhrDu/OlZKLmKn5D/S/flU=;
 b=moHtstDrrTCHhaJasJXchUm1vEhCQqOY1ov/n0dWxYzUIlBsXIRwcN4KfdKxJO0jYZ
 DzhmpL1L/C+7Nd3Y7E5583CCib5DK7OAxrLI9y1bwmoqDErSvtGw0PW+Amsi3kws2NjD
 9jFa2OVdQC9r8Eug9+MfzPe6xAdheE/wfT1xZNsXwnZNKvIs6vFN2HwVkz7REGcU9uHm
 GdGHlaWhZe0RElAAK/GuaBVJh2ZDDN1yrSNIJEZPFgk5NmphzszvFwyWFaV3SqZjIyCi
 Zd9ibeMrcz15xXHADMp1aHbMWlAlle/uQm+VTnqSHCkP62EMHbuVrZskzcK3G2SW2yHE
 ggOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JVajJ0TDzfG2+VIWfPsFwIhrDu/OlZKLmKn5D/S/flU=;
 b=S0oQ7+AoGYiZWUZ+oRvVNVjZkdluiMhBRYc1dZgRf8RdF+u1dlymjGG+5pILKk9wnM
 /Fk8YKUeb9z0nnOtalPk1Iq+nGNjNOuvrVeGtegLEnNgiDUaWVOdbEnZETC3Iysc8Ssv
 FuhyZElkaPzuXjLgnml7mS8Ie4FS46IhYWtJQxdIQlcoRtyMMsHN6DwZZWMwRXFe7jLM
 GKvFE5FbiL9r0ESGh0YoJPuIad7v+UdpjFLyL6rJOdVL8/ExoO129yuKl9E9VBFmD1qf
 i5ggvF9y0dd1k9G7+tX3FNswtd4ARWFr0KArPRWMMKityQ7Rb4MNPOx0+muj66Lx4IUx
 FFZA==
X-Gm-Message-State: AOAM532HVC41Nq/T8QnY9y7HWjOh+EkKTsneMdGqNRwa68DA+4/xQrGY
 tfADzlDKgu5OkIjdOtOteJJGK2C/r0RJ7xfNjviakw==
X-Google-Smtp-Source: ABdhPJymBfKa14dn47WBBV959Q+2eflW+SjyJzhjCw3L7XcTVrgvHaK0omVn50VLCKktUH1+jPcdcCnDwc7XUOAbT/s=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr37379627wrt.275.1637578169752; 
 Mon, 22 Nov 2021 02:49:29 -0800 (PST)
MIME-Version: 1.0
References: <20211122104744.1051554-1-f4bug@amsat.org>
In-Reply-To: <20211122104744.1051554-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Nov 2021 10:49:18 +0000
Message-ID: <CAFEAcA87Zxv3QZCq+W0gtyo+9_ng94U49rTdwxfWiX=za2hPOQ@mail.gmail.com>
Subject: Re: [PATCH] hw/scsi: Fix scsi_bus_init_named() docstring
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Nov 2021 at 10:47, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Commit 739e95f5741 ("scsi: Replace scsi_bus_new() with
> scsi_bus_init(), scsi_bus_init_named()") forgot to rename
> scsi_bus_init() in the function documentation string.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/scsi/scsi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
> index a567a5ed86b..2ef80af6dca 100644
> --- a/include/hw/scsi/scsi.h
> +++ b/include/hw/scsi/scsi.h
> @@ -158,7 +158,7 @@ struct SCSIBus {
>   * provided by the caller. It is the caller's responsibility to make
>   * sure that name does not clash with the name of any other bus in the
>   * system. Unless you need the new bus to have a specific name, you
> - * should use scsi_bus_new() instead.
> + * should use scsi_bus_init() instead.
>   */
>  void scsi_bus_init_named(SCSIBus *bus, size_t bus_size, DeviceState *hos=
t,
>                           const SCSIBusInfo *info, const char *bus_name);
> --
> 2.31.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

