Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45D54466A9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:04:05 +0100 (CET)
Received: from localhost ([::1]:35652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1hE-0004Ii-AK
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj1aI-0005XJ-Hq
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:56:54 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:41491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj1aH-0006uF-18
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:56:54 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso6778069wmf.0
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 08:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hxJ7sMzA+VsIqkYZGTRPT5JKRGNvQaiJEE6N7jhAtOE=;
 b=vRnbIsDsjSMBIz0Uoc3cKv4M7M/eINpXoKfDONtLrJMugF6hqXDB3Obx1WtlalKW29
 xsMKsKH7ICl7sdpICSxnbM5IS7Xs3Cl3kKK4NcxmkEw3kBOe5ZM7bcpgjRkc4eD2rClx
 xxSeFETovy1jrWdpcmlU7jrqiEg8EdVIKuMZgB+sDKTBmU44xx0roWUEAiOne62OFGzb
 CHeF2JGDbwEceaYrxS2dGw+OygbfTZ+bMo80C43i0HQ75aIYkESB775SAkUfAMtqjZbQ
 AcFz4eTWMgTd9xnmJFXxQ0iTGVzMKxmHfuzbuiQZAd1nsXCnteXUK0krRYWhP/JvoY1T
 4ynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hxJ7sMzA+VsIqkYZGTRPT5JKRGNvQaiJEE6N7jhAtOE=;
 b=bztNXeyxepe/ynfRMIsxeHFHQSiY0s/XXmuVC4dn2ial4XHOpp6glGUr8/BMpbAGu0
 niwb+GDjpd5Qf01pwax0Ci8zvtEAvEPivEfstfNeiHooeUn/C49rv2GaXSWcxV/cXx1z
 raT/fm42xiYAqzjUKfTH+M+b6oJIEse+2dJ0ZON+g/z4X4JTv9gvl1/ixVdJXspk7I4f
 zpX+8ArXAPhUGJPFlvRCtSToVKrQro+ecjBofMwECjlUOvLlFSeVczIaUCqXnTrot7nc
 d0cvy+bWvMSAqi9HCaNXLChUhnwE2WFKAq9JjbgqrRtvZnc+cQiCQkA8epDFSWbsVXWV
 UYvQ==
X-Gm-Message-State: AOAM531tUmGKK+m76/8LPZ4hvqvnYPhtOLWz8HR/AEYmg47S3CY7lRLT
 JLeC+vsShgGndCwypQLalifmPTjidVODd+J1dgtr8w==
X-Google-Smtp-Source: ABdhPJy+7C9yhgbc1j1D4gSoYu/BqNf+5msRYjnxPW8g2W9ut5wU+NE2jxy1zH90QVuIe/QbVS19LZa4FjP5ZvOmR0U=
X-Received: by 2002:a1c:f712:: with SMTP id v18mr31665631wmh.37.1636127811364; 
 Fri, 05 Nov 2021 08:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211008114518.757615-1-laurent@vivier.eu>
 <20211008114518.757615-10-laurent@vivier.eu>
In-Reply-To: <20211008114518.757615-10-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 15:56:40 +0000
Message-ID: <CAFEAcA_nLL5Op2wDanPr=8j2SyVBQQkV=Ke93uzybs76GDRCmw@mail.gmail.com>
Subject: Re: [PULL 09/13] macfb: add common monitor modes supported by the
 MacOS toolbox ROM
To: Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Oct 2021 at 12:57, Laurent Vivier <laurent@vivier.eu> wrote:
>
> From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>
> The monitor modes table is found by experimenting with the Monitors Control
> Panel in MacOS and analysing the reads/writes. From this it can be found that
> the mode is controlled by writes to the DAFB_MODE_CTRL1 and DAFB_MODE_CTRL2
> registers.

Hi; Coverity points out a memory leak here (CID 1465231):

> +static gchar *macfb_mode_list(void)
> +{
> +    gchar *list = NULL;
> +    gchar *mode;
> +    MacFbMode *macfb_mode;
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
> +        macfb_mode = &macfb_mode_table[i];
> +
> +        mode = g_strdup_printf("    %dx%dx%d\n", macfb_mode->width,
> +                               macfb_mode->height, macfb_mode->depth);
> +        list = g_strconcat(mode, list, NULL);
> +        g_free(mode);

We pass the old value of 'list' to g_strconcat(), which allocates
new memory and returns it; the 'list = ' overwrites the old 'list'
value. So the old string is leaked, because g_strconcat() won't
free it for you.

Coverity also complains that we pass NULL as argument 2 to
g_strconcat() the first time through the loop and this is bad;
I'm not sure whether it's wrong or not.

This function might be better written to use GString and
g_string_append_printf() to add each line to the GString.

> +    }
> +
> +    return list;
> +}

thanks
-- PMM

