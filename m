Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F49E5608BC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 20:10:58 +0200 (CEST)
Received: from localhost ([::1]:59594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6c9Q-0006rM-Uo
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 14:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6c41-00042z-62
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 14:05:21 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6c3y-0003VB-Ut
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 14:05:20 -0400
Received: by mail-ej1-x62f.google.com with SMTP id u12so34118779eja.8
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 11:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+R8M0154sNEv9TGtb4HMBK2bwYjnHt1Fh49zIt19pLI=;
 b=TSnKvl6dFsttkMt0Ui6Po/r2Jh+MZ0NBRapzz+gL2z+VKnnKdJf7cXwKqEvl2urvmD
 tITLgVWgdngd6sAISAemU7mYBnq6znhL8fI85YRClenuTYW4vilxHR5SOzUkh1UtbQ7n
 M3nWNhVvNQmbKpWs2EayCdMTvQ5FjVdZV/7HKejmmJFCo7DhZ2KZswH8TI97ywGXzrmx
 1IKzeNq9N5wye6arreO1TeuHnvwPLf4Sky949SaPdAzFBH9TwpiwSdjewuuNFMYvMldi
 X7XlUkl6sDwH3XJbVwhmqYMbccg87f7ZUP7f02qytW7FgLeP5WGrx+FPdMLcDerWFi4L
 lxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+R8M0154sNEv9TGtb4HMBK2bwYjnHt1Fh49zIt19pLI=;
 b=pZGDIHziEEjuelfx/BiHr1s0JU+ea0OOmwTyZW4T8iBrogtxSMFSfbSUslXJfhVeUR
 dq/c8Cm0Mv0AO2wnIfBeEiOXaVySxVgZJ4cBMp2qnQSJOiMPUO3hWS63+4oclnbuzt0p
 qDhJPrCDDWm20g1UGxmpj4LvsLfxOKr+v0eItJHu++VBb4At97OCL2QsOGfB4g9VbJDl
 a2bO4GGI/41kSnYYbzQrK926qUihCR3HcKhZ/ZZZIG2sFy1HGqeTV0FsikMIb46PpGpQ
 NL6M3iZ9I0f31Z1tWfKDnHIZRFIOEHoaMBPzMOb+eGiYp45rRzZhfBhZpMCF0kiqZUey
 1cPw==
X-Gm-Message-State: AJIora//L1ik748Um/gqYSQr1Zse97WB1/GBlt//iLs2TK8WUZsSnf5P
 9AQMRVcZ2RwzanPAaxBYemCvo/t/BZLqRSG12/budg==
X-Google-Smtp-Source: AGRyM1s5P/5OHksac4zLNILq6QUdtZvHv4/XiEzYxDUIQMpzx6xNfgOj+cUmjbOKNE3DQMHJoNR5kK3Eatb3zzivAlI=
X-Received: by 2002:a17:906:830c:b0:726:a68b:d1bc with SMTP id
 j12-20020a170906830c00b00726a68bd1bcmr4671569ejx.305.1656525915962; Wed, 29
 Jun 2022 11:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220629033634.3850922-1-pdel@fb.com>
 <20220629033634.3850922-10-pdel@fb.com>
In-Reply-To: <20220629033634.3850922-10-pdel@fb.com>
From: Titus Rwantare <titusr@google.com>
Date: Wed, 29 Jun 2022 11:04:39 -0700
Message-ID: <CAMvPwGqmU+bsDb1fHraiTzdg14An5QiKUazSweyzVvbwHeCM=g@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] hw/i2c/pmbus: Add read-only IC_DEVICE_ID support
To: Peter Delevoryas <peterdelevoryas@gmail.com>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au, 
 cminyard@mvista.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 zhdaniel@fb.com, pdel@fb.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=titusr@google.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

On Tue, 28 Jun 2022 at 20:36, Peter Delevoryas
<peterdelevoryas@gmail.com> wrote:
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---

> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -984,6 +984,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>          }
>          break;
>
> +    case PMBUS_IC_DEVICE_ID:
> +        pmbus_send(pmdev, pmdev->pages[index].ic_device_id,
> +                   sizeof(pmdev->pages[index].ic_device_id));
> +        break;
> +

I don't think it's a good idea to add this here because this sends 16
bytes for all PMBus devices. I have at least one device that formats
IC_DEVICE_ID differently that I've not got permission to upstream.
The spec leaves the size and format up to the manufacturer, so this is
best done in isl_pmbus_vr.c in isl_pmbus_vr_read_byte().
Look at the adm1272_read_byte() which is more interesting than
isl_pmbus_vr one as an example.


>      case PMBUS_CLEAR_FAULTS:              /* Send Byte */
>      case PMBUS_PAGE_PLUS_WRITE:           /* Block Write-only */
>      case PMBUS_STORE_DEFAULT_ALL:         /* Send Byte */
> diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
> index e11e028884..b12c46ab6d 100644
> --- a/hw/sensor/isl_pmbus_vr.c
> +++ b/hw/sensor/isl_pmbus_vr.c
> @@ -218,6 +218,28 @@ static void isl_pmbus_vr_class_init(ObjectClass *klass, void *data,
>      k->device_num_pages = pages;
>  }
>
> +static void isl69259_init(Object *obj)
> +{
> +    static const uint8_t ic_device_id[] = {0x04, 0x00, 0x81, 0xD2, 0x49};
> +    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
> +    int i;
> +
> +    raa22xx_init(obj);
> +    for (i = 0; i < pmdev->num_pages; i++) {
> +        memcpy(pmdev->pages[i].ic_device_id, ic_device_id,
> +               sizeof(ic_device_id));
> +    }
> +}
> +

We tend to set default register values in exit_reset() calls. You can
do something like in raa228000_exit_reset()


> diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
> index 0f4d6b3fad..aed7809841 100644
> --- a/include/hw/i2c/pmbus_device.h
> +++ b/include/hw/i2c/pmbus_device.h
> @@ -407,6 +407,7 @@ typedef struct PMBusPage {
>      uint16_t mfr_max_temp_1;           /* R/W word */
>      uint16_t mfr_max_temp_2;           /* R/W word */
>      uint16_t mfr_max_temp_3;           /* R/W word */
> +    uint8_t ic_device_id[16];          /* Read-Only block-read */

You wouldn't be able to do this here either, since the size could be
anything for other devices.

Thanks for the new device. It helps me see where to expand on PMBus.


Titus

