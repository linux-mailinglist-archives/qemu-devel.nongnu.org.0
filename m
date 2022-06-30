Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8184B56230B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 21:23:17 +0200 (CEST)
Received: from localhost ([::1]:39974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6zky-0007m2-LO
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 15:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6ziV-0005Mi-Oa
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 15:20:51 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:40713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6ziS-0000aO-Ua
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 15:20:42 -0400
Received: by mail-ed1-x531.google.com with SMTP id ej4so146997edb.7
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 12:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a1w7+0wxsNclvx4djImB6Wc1PSYF5nBBybU6HIHm2Qs=;
 b=Asf3Xxba0qe6L0mN2wKCtrUDvoqBp9aJJlmzOm/ndmr7WKtJYmysDDI2i/M/Ryr33z
 TKRGLBFWoTxstdAdOEDGaTKSrthP0Ptl8UOarjP/7zq4Bjhr6QCdCk7qoihUoUP1hKwU
 X60yOYvACstADANfuKvThnkymyP1AXcxR8WtJtbCBIbzcYDQeC5g50S5T0Fw6UfIHbyf
 0/wALobmIoiw3CwHxHxsXvUJn69Kh6ijV1eMMVORY9WBftdqL8yjgyMikjYo7fi8L8V1
 cdwm09xZT/sCSDIbspHy/aWNoy69237jIKRg6jEGWBgZDBuYwoC1m5IudRnEaARy+u67
 5a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a1w7+0wxsNclvx4djImB6Wc1PSYF5nBBybU6HIHm2Qs=;
 b=yrSfeA8d1ktZlDw26ud+lVOGtRv2RAINB4xyGjb83zTDZnxrzT6puxib4qpBGi8on0
 j/VsycH849EVdc2jgCi1StkBvzWjiLAn6XFMtfvsSQqmNHUv6/7512v5KbkOPBLzb4Rs
 vtQm1uKuAoiOwEiJQwe06482lAgC54pqeGuzsMdiIyKvTN7DijEK1v2gjyhMtwNVLEii
 IXWmWtSm45Kp3+ZrT8hoW1OawE/WC8uPL2AOsPGWH10bFiJ/e9SIGvmeX3C+b88sSx2y
 8Vkv3MIASm10qtZ8qFNh7zASpZOnHJo+VcjOlmql497yKrJsnjco5tqgQ/yjIMl8Ng+E
 TS3A==
X-Gm-Message-State: AJIora852Wv9cHW3ili8A31YTdOm2BD0qqToMqM4CT/pi+crTeX1tJFR
 jJNt/s+ImMfexosSVdDasCQ56jXpUADC69T5AJT9yA==
X-Google-Smtp-Source: AGRyM1sUOl8lgIdl4mozgOb3/5P2o+GJOHYrPxYODK10MDrzjmoUesm9dMyPQ+YBaSleBCO8T0PYpJqdT0NC2qSDowY=
X-Received: by 2002:a05:6402:1d51:b0:41f:cf6c:35a5 with SMTP id
 dz17-20020a0564021d5100b0041fcf6c35a5mr13996111edb.25.1656616839516; Thu, 30
 Jun 2022 12:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-10-me@pjd.dev>
In-Reply-To: <20220630045133.32251-10-me@pjd.dev>
From: Titus Rwantare <titusr@google.com>
Date: Thu, 30 Jun 2022 12:20:03 -0700
Message-ID: <CAMvPwGogaMiSdS5dbrqLRSqUvGmtic1nxKqHBedVNhnW4ja50g@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] hw/sensor: Add IC_DEVICE_ID to ISL voltage
 regulators
To: me@pjd.dev
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au, 
 cminyard@mvista.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 zhdaniel@fb.com, pdel@fb.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=titusr@google.com; helo=mail-ed1-x531.google.com
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

On Wed, 29 Jun 2022 at 21:52, Peter Delevoryas <me@pjd.dev> wrote:
>
> From: Peter Delevoryas <pdel@fb.com>
>
> This commit adds a passthrough for PMBUS_IC_DEVICE_ID to allow Renesas
> voltage regulators to return the integrated circuit device ID if they
> would like to.
>
> The behavior is very device specific, so it hasn't been added to the
> general PMBUS model. Additionally, if the device ID hasn't been set,
> then the voltage regulator will respond with the error byte value.  The
> guest error message will change slightly for IC_DEVICE_ID with this
> commit.
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/sensor/isl_pmbus_vr.c         | 12 ++++++++++++
>  include/hw/sensor/isl_pmbus_vr.h |  5 +++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
> index e11e028884..799ea9d89e 100644
> --- a/hw/sensor/isl_pmbus_vr.c
> +++ b/hw/sensor/isl_pmbus_vr.c
> @@ -15,6 +15,18 @@
>
>  static uint8_t isl_pmbus_vr_read_byte(PMBusDevice *pmdev)
>  {
> +    ISLState *s = ISL69260(pmdev);
> +
> +    switch (pmdev->code) {
> +    case PMBUS_IC_DEVICE_ID:
> +        if (!s->ic_device_id_len) {
> +            break;
> +        }
> +        pmbus_send(pmdev, s->ic_device_id, s->ic_device_id_len);
> +        pmbus_idle(pmdev);
> +        return 0;
> +    }
> +
>      qemu_log_mask(LOG_GUEST_ERROR,
>                    "%s: reading from unsupported register: 0x%02x\n",
>                    __func__, pmdev->code);
> diff --git a/include/hw/sensor/isl_pmbus_vr.h b/include/hw/sensor/isl_pmbus_vr.h
> index 3e47ff7e48..aa2c2767df 100644
> --- a/include/hw/sensor/isl_pmbus_vr.h
> +++ b/include/hw/sensor/isl_pmbus_vr.h
> @@ -12,12 +12,17 @@
>  #include "hw/i2c/pmbus_device.h"
>  #include "qom/object.h"
>
> +#define TYPE_ISL69259   "isl69259"
>  #define TYPE_ISL69260   "isl69260"
>  #define TYPE_RAA228000  "raa228000"
>  #define TYPE_RAA229004  "raa229004"
> +#define ISL_MAX_IC_DEVICE_ID_LEN 16
>
>  struct ISLState {
>      PMBusDevice parent;
> +
> +    uint8_t ic_device_id[ISL_MAX_IC_DEVICE_ID_LEN];
> +    uint8_t ic_device_id_len;
>  };
>
>  OBJECT_DECLARE_SIMPLE_TYPE(ISLState, ISL69260)
> --
> 2.37.0
>
Reviewed-by: Titus Rwantare <titusr@google.com>

