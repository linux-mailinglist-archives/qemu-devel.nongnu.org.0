Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBE4442061
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:57:34 +0100 (CET)
Received: from localhost ([::1]:57976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcUv-0000Z5-Hh
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbBh-0005ez-IQ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:33:38 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:56044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbBe-0002dU-DB
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:33:37 -0400
Received: by mail-wm1-x330.google.com with SMTP id v127so13794765wme.5
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BRWPFWQB86a++wO4lPOeT5dVG9T6xAvfTAnsIottoe4=;
 b=IZh5XdzyK2IQZTww5loz4KMI2eDCAw7qr0rN7gQXnbXwwMKiZd05xxzVZNz3M7wRAD
 7AeuRAorZRn2w6HcNYz+gdIe3rMXqdMOAHUvdt+VoliGyphITzfy+0Z+JqiMErQaMGle
 DfBwQ3eLKHjEh19TaRWMs8rtE4nM5vnO98PtHyVdPV7Da/Ynyj+Ms9c6swbsSmiWMbj6
 0pyoWMRrh2OOdIiTQqsK/cdr7F9sCrIvQd1O1Nu82bkn1zh5ieFOjhg2TLRlbNoREY2u
 AyHbQl7wx8WdtVfyiKsrqXvPymqcdhezctKouo5jYLUYzzTXbYshmoXSNOr/PGfz2uWb
 0crA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BRWPFWQB86a++wO4lPOeT5dVG9T6xAvfTAnsIottoe4=;
 b=NCOTcLXp7/CLo91aqU/lSorLf3DCPEQB9py3pYk9nnvpm0foNDNp59bLL2AqFZGa7Z
 LhrxGcT+J6axkTWw2S5dFCYu9eGFXkz9p64zzZ4DjRgu15XfATJ1wBJmzL6ahShZK0c3
 tfjs/9XNcEdyUn6QnEyAwgPDZ5CGtKx3eaXCaMqShN891n8FSYNrHXUw3n3CZsJ0f4Qq
 NOJo/av5TBTcJKTHHlpPUa1nwWSarETLtSrBWJ8UctGKekuJN8a/9EGjDW5l80YErFnU
 Y5WKnwpfUZIENfJzyyFmcjf95zGW0yOLnP2FEbP6gfYt5d2iAl4uwpdi3otI8WiHta19
 oY8A==
X-Gm-Message-State: AOAM5321pIOyzhrZoDhqz6Sj43STy7nNJY3fn2YKADkPtmOccgPaoc7O
 6WmKZ5tOEhG8WfYnQDxokMejJmdFgDVDIOQumR7ZLg==
X-Google-Smtp-Source: ABdhPJwzZVucUQOAVfyIM4UJ1eacxooTYxp4BpzVoe8gmmv37xi0/yvb6w/8Ii7JSv+7BtS8rX3hEcSKwwcM2z0WDY0=
X-Received: by 2002:a1c:a344:: with SMTP id m65mr354031wme.32.1635788012633;
 Mon, 01 Nov 2021 10:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-8-wuhaotsh@google.com>
In-Reply-To: <20211021183956.920822-8-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 17:33:21 +0000
Message-ID: <CAFEAcA8B9uKOyVycq7+kbOSVSfXD9-xsAuBaNowy56CvZKpTUQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] hw/arm: Add ID for NPCM7XX SMBus
To: Hao Wu <wuhaotsh@google.com>
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
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Oct 2021 at 19:40, Hao Wu <wuhaotsh@google.com> wrote:
>
> The ID can be used to indicate SMBus modules when adding
> dynamic devices to them.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> index 2ab0080e0b..72953d65ef 100644
> --- a/hw/arm/npcm7xx.c
> +++ b/hw/arm/npcm7xx.c
> @@ -421,6 +421,7 @@ static void npcm7xx_init(Object *obj)
>      for (i = 0; i < ARRAY_SIZE(s->smbus); i++) {
>          object_initialize_child(obj, "smbus[*]", &s->smbus[i],
>                                  TYPE_NPCM7XX_SMBUS);
> +        DEVICE(&s->smbus[i])->id = g_strdup_printf("smbus[%d]", i);
>      }

This one looks weird to me -- I'm pretty sure we shouldn't be messing
about with the DeviceState id string like that. It's supposed to be
internal to the QOM/qdev code.

-- PMM

