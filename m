Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A993B3FAF
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:46:19 +0200 (CEST)
Received: from localhost ([::1]:59398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhTd-0000Zm-UG
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwhS7-0008Bf-VF
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:44:43 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwhS6-0004ta-FD
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:44:43 -0400
Received: by mail-wr1-x429.google.com with SMTP id d11so9755495wrm.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ty2aP0taTEvYxbZjapL0tmp1FAYkf3YC49STZaYremQ=;
 b=N83vLDOZzig3YQ39LM3wdC72EcG4uLaX03C0/oXB6SW+4nr4ZO2C+MfkzAT76EzKyo
 hePefmLYvfyd34Biwr6qNb6RCIWdckjEcVMSlYFFCyKjEb4x4VsjSi1DwO4ZgoIbhWXL
 NY3bs9yUvC7/nU5YQBM1Ogdhk4sFfAGAo9BLmc7hZqJWmftrvO4HC/y04ExxftzzIq5j
 rmAjqNhOnmCyX1jOMKA5ui9lct7m5RhY/r6o3sxld3EgcwSG9NsVkrtBZdCiRKlA1ViR
 T/FxwOSZuyaMzCjBSOBLz2sUVKvE2QQTbfqZObykqRwb6Kh7fqhBtOoejTl8UB0+Jiaz
 /aPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ty2aP0taTEvYxbZjapL0tmp1FAYkf3YC49STZaYremQ=;
 b=tw7FMT0pyTGVsCvseHyLDG1a/R7+KnQpCR5DupjBpbZPA+DvIb3jNK8W7J0qu2dYCP
 4loT0ZhUvJIa7ZMT+2WlNTK1E+YnEaBOJWcjnSpHDfDkscd8tFpcoZJAnjWvFnTIk+v0
 SZw9YBMZsII/dsMCIS6TGH2dJxC1Wi9pNOdd3BnwTmHuqfXgyV5VfNtWj3UEcP/NXoqW
 vsZ8s1VXnmdpKSkmk15oBFUQrQVb3HMMftoyztVil8Ffxt0sDg4YXBQn4JgSfN3JSDXW
 aeB0xLEuJH8nAaR88ig9qNtrFbeK4aD8dHbHdp+nAeGvg6ugj5DBWzcuB89Au0Lm/7Ov
 HVQw==
X-Gm-Message-State: AOAM5338Nde9MxmkiMPHJAo2M68RsuY6SjCGb+HuWKKdQ5MHJoIw26rf
 XPeD3mBehygP5oG8CIeubsY=
X-Google-Smtp-Source: ABdhPJzo2tvMqtRnzbjbVaaR/fd74TdeM8mL/zmUsvQU1rmDfZWHQOvEEAodTmL1S8i8dtrRk6xLUg==
X-Received: by 2002:a5d:6882:: with SMTP id h2mr9704233wru.243.1624610680488; 
 Fri, 25 Jun 2021 01:44:40 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q19sm1021681wmq.38.2021.06.25.01.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:44:39 -0700 (PDT)
Subject: Re: [PATCH 2/2] g364fb: add VMStateDescription for G364SysBusState
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 hpoussin@reactos.org, fthain@telegraphics.com.au
References: <20210625073844.1229-1-mark.cave-ayland@ilande.co.uk>
 <20210625073844.1229-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <12f2d9ec-938f-1c7f-6e4f-2b1956bab7d2@amsat.org>
Date: Fri, 25 Jun 2021 10:44:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625073844.1229-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 9:38 AM, Mark Cave-Ayland wrote:
> Currently when QEMU attempts to migrate the MIPS magnum machine it crashes due
> to a mistake in the g364fb VMStateDescription configuration which expects a
> G364SysBusState and not a G364State.
> 
> Resolve the issue by adding a new VMStateDescription for G364SysBusState and
> embedding the existing vmstate_g364fb VMStateDescription inside it using
> VMSTATE_STRUCT.

Broken since 97a3f6ffbba ("g364fb: convert to qdev")?

> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/g364fb.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
> index 163d7f5391..990ef3afdd 100644
> --- a/hw/display/g364fb.c
> +++ b/hw/display/g364fb.c
> @@ -518,6 +518,16 @@ static Property g364fb_sysbus_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +static const VMStateDescription vmstate_g364fb_sysbus = {
> +    .name = "g364fb-sysbus",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_STRUCT(g364, G364SysBusState, 1, vmstate_g364fb, G364State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static void g364fb_sysbus_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -526,7 +536,7 @@ static void g364fb_sysbus_class_init(ObjectClass *klass, void *data)
>      set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
>      dc->desc = "G364 framebuffer";
>      dc->reset = g364fb_sysbus_reset;
> -    dc->vmsd = &vmstate_g364fb;
> +    dc->vmsd = &vmstate_g364fb_sysbus;
>      device_class_set_props(dc, g364fb_sysbus_properties);
>  }
>  
> 

