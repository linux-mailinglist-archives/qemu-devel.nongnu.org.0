Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7994369A441
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 04:22:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSrJI-0007ng-EX; Thu, 16 Feb 2023 22:21:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ssinprem@celestica.com>)
 id 1pSrJG-0007kf-Bh
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 22:21:18 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ssinprem@celestica.com>)
 id 1pSrJE-0006LD-EK
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 22:21:17 -0500
Received: by mail-pl1-x62a.google.com with SMTP id l9so1680386plk.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 19:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=celestica.com; s=google-201810;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ArA0yzn9T/K0ktsahgHG1b2O+YxddgAWZ1PYJkxRj9o=;
 b=RXftt0npEbrFc3djodl4BrqeaUnAWfW47FIHD97ALpS/QN4y3Vl1PMTQ1JF7BxWUM3
 8VD4yWxjnksn8WvL5leEkSak1vZXNq4r/JwWfstEvI/QLkx4Zi35RCb81gm8YnTvbGmF
 L6MapJ8c4SrCx0bTlh94cYnZZsgkzfDU8uUqJNFffdrRDYJh53gGirXryDKawQxftMPB
 u2HInkuiSG5As5MjbhJPZcqN+G3zvsLnWQWVQ3ySwkIwPZ2P50Uzt2pDa6gQsaI+bYKF
 q3mo9rDC7kX0JDIInZfY7gGaZZTznePI5YxSRvldAEwfkJQNpeCvD+s4PZvxg+QPVY9D
 EITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ArA0yzn9T/K0ktsahgHG1b2O+YxddgAWZ1PYJkxRj9o=;
 b=QTjzYq2BgQv2A97zLJ7RWytjkTBsB7m64C4nIFwbb2bj/cUJNzzYqNJCxWrM6cBwey
 YCWjfPI3r8Nj88HebKV68JDfRVXlTjXihPcc5Mzf4vQFFBz3b5iN7G6gVe2la+PCPsgc
 W7q8n0K0bhk/mwIejAHzbzpaBTLM81wMHBadSZQC4ioiUUw20xwEN8uchxyguFU9wT6o
 uAhoOwK3xLHzuh5P8sVDhV5MsWiylnPJAeR76g32luI8AHFab/o7IvT72ZMMjtuNz2//
 dCD1paaiT4nppRi992EjgU2b+T4mSu6mw5aY0hX/0i6DcM0N45Uxmdq2c2r4p/iaju0e
 dZig==
X-Gm-Message-State: AO0yUKWnlZarrUyemAJ+thIG4yMpZYfcozKjpvQJy6fICWG89kKuuVfa
 w7fFhvRN7DCMrSavBIseCzlqASbUekRbtf6y4hukc4fYfXRvxJEnHNYhHlm+DHLzhBzSi90mnC6
 j+4zumBAe7N05rOC6E6EX+r5lnz9L53eu2MIhrHfFBkWnEWrvOkZyxWbdNbn1Opa+kiD+xL8ZcY
 8K4WqWFBhaHeXtKhMMyjqALx8mBhlHZ3m69w==
X-Google-Smtp-Source: AK7set+gPi3Jr7QjUvX/ycifC7OsTj2cttGGIHY/cOAWk9VXUzInaBE0QXcmKQYLh56SYrusS6u29Q1k2AH4GJmJPhM=
X-Received: by 2002:a17:903:1ce:b0:19a:e90d:b102 with SMTP id
 e14-20020a17090301ce00b0019ae90db102mr841801plh.0.1676604074796; Thu, 16 Feb
 2023 19:21:14 -0800 (PST)
MIME-Version: 1.0
References: <167660357595.26523.10278976309538219635-0@git.sr.ht>
In-Reply-To: <167660357595.26523.10278976309538219635-0@git.sr.ht>
From: Sittisak Sinprem <ssinprem@celestica.com>
Date: Fri, 17 Feb 2023 10:20:48 +0700
Message-ID: <CAE+aGtUnhdKUQUtg8MTgjfDCL2OqtTcNeRJNupeFnu2SNUnXoA@mail.gmail.com>
Subject: Re: [PATCH qemu v2 1/2] hw/at24c : modify at24c to support 1 byte
 address mode
To: "~ssinprem" <ssinprem@celestica.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org, 
 ssumet@celestica.com, srikanth@celestica.com, kgengan@celestica.com, 
 clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Content-Type: text/plain; charset="UTF-8"
X-CLS-Gapps: True
X-CLOUD-SEC-AV-Sent: true
X-CLOUD-SEC-AV-Info: celesticainc,google_mail,monitor
X-Gm-Spam: 0
X-Gm-Phishy: 0
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=ssinprem@celestica.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

the rebase auto merge failure, I will resend patches again.

On Fri, Feb 17, 2023 at 10:12 AM ~ssinprem <ssinprem@git.sr.ht> wrote:
>
> From: Sittisak Sinprem <ssinprem@celestica.com>
>
> Signed-off-by: Sittisak Sinprem <ssinprem@celestica.com>
> ---
>  hw/nvram/eeprom_at24c.c | 46 +++++++++++++++++++++++++++++------------
>  1 file changed, 33 insertions(+), 13 deletions(-)
>
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index 3328c32814..0cb650d635 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -41,6 +41,12 @@ struct EEPROMState {
>      uint16_t cur;
>      /* total size in bytes */
>      uint32_t rsize;
> +    /* address byte number
> +     *  for  24c01, 24c02 size <= 256 byte, use only 1 byte
> +     *  otherwise size > 256, use 2 byte
> +     */
> +    uint8_t asize;
> +
>      bool writable;
>      /* cells changed since last START? */
>      bool changed;
> @@ -91,7 +97,7 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
>      EEPROMState *ee = AT24C_EE(s);
>      uint8_t ret;
>
> -    if (ee->haveaddr == 1) {
> +    if (ee->haveaddr > 0 && ee->haveaddr < ee->asize) {
>          return 0xff;
>      }
>
> @@ -108,11 +114,11 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
>  {
>      EEPROMState *ee = AT24C_EE(s);
>
> -    if (ee->haveaddr < 2) {
> +    if (ee->haveaddr < ee->asize) {
>          ee->cur <<= 8;
>          ee->cur |= data;
>          ee->haveaddr++;
> -        if (ee->haveaddr == 2) {
> +        if (ee->haveaddr == ee->asize) {
>              ee->cur %= ee->rsize;
>              DPRINTK("Set pointer %04x\n", ee->cur);
>          }
> @@ -184,6 +190,29 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
>      }
>
>      ee->mem = g_malloc0(ee->rsize);
> +
> +    /*
> +     * If address size didn't define with property set
> +     *  setting it from Rom size
> +     */
> +    if (ee->asize == 0) {
> +        if (ee->rsize <= 256) {
> +            ee->asize = 1;
> +        } else {
> +            ee->asize = 2;
> +        }
> +    }
> +}
> +
> +static
> +void at24c_eeprom_reset(DeviceState *state)
> +{
> +    EEPROMState *ee = AT24C_EE(state);
> +
> +    ee->changed = false;
> +    ee->cur = 0;
> +    ee->haveaddr = 0;
> +
>      memset(ee->mem, 0, ee->rsize);
>
>      if (ee->init_rom) {
> @@ -201,18 +230,9 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
>      }
>  }
>
> -static
> -void at24c_eeprom_reset(DeviceState *state)
> -{
> -    EEPROMState *ee = AT24C_EE(state);
> -
> -    ee->changed = false;
> -    ee->cur = 0;
> -    ee->haveaddr = 0;
> -}
> -
>  static Property at24c_eeprom_props[] = {
>      DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
> +    DEFINE_PROP_UINT8("address-size", EEPROMState, asize, 0),
>      DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
>      DEFINE_PROP_DRIVE("drive", EEPROMState, blk),
>      DEFINE_PROP_END_OF_LIST()
> --
> 2.34.6
>

