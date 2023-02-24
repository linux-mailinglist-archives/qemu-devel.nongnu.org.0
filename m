Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979F16A201E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 17:57:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVbMZ-00057o-R1; Fri, 24 Feb 2023 11:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pVbMU-00057I-9a; Fri, 24 Feb 2023 11:55:58 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pVbMS-00025p-I2; Fri, 24 Feb 2023 11:55:57 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1723ab0375eso155192fac.1; 
 Fri, 24 Feb 2023 08:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9R2c8XXiOKv6nhVCWSA5hXlgxFdKthi4ysDSYkhaRDk=;
 b=ia8rfxHLsE3vL0O5bDbQuc6buDE74Lr1mebg0FYMOZZ95UhCxaI5GT5rj4GVFihtMI
 +gzvs/IOQAo0AC2t4hR4a1DS+QjGUQ+8PN5CjhIQNjRlmv+/BnwF7RgqqXJ+ck99dgre
 vsQerJTXdvfa1O/3XQ15KuI3EGdz0tbdn676+QVL83syjGbRQtfoSsVhA4BJJX4S2zI+
 MxQaeU1UZuB+bFDo/r7d3HIFVd6CUbhX5VJDHYmjCaMkOj/i2UE9Il+TGCLXOxZdG3h1
 gaxA4wU1sgBD3gq8Ie1C6MDsHk0Ul4IeWG6m0uq1gvRS/FBh45ZZGEldsIebj0vsmaOE
 +Srw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9R2c8XXiOKv6nhVCWSA5hXlgxFdKthi4ysDSYkhaRDk=;
 b=bGflpomlLcie6mbP9WxQguWeWH6GorAY6G34FzKyp2WfmLrWKdFwABdAnojpqKudUi
 NElolf5s3dYXJ7KqVtY4b7EfIDzLLYf54tyFMSLbLkieDTxYetIcOhgDKwVDLyEQZ0rZ
 aih7FwpuiQVZ+Ec4ym3EWMVYIi5BmrHsevT04MSAuQ/9hm2m4cewmOhJMlJquPV8rqyv
 /bdoLSQxgiVYeD5AJBa0zhNwdN1SxU8t8y0W7eKUq3kh2VLvavuKDmTdIlObPOhRfgUP
 W+2re/4A97Ge8ClKlYDwEGaTzW3XRYoPj05UP9DmJiJIh6KfQnlOocMNx+jDX0x2DQVU
 6NlA==
X-Gm-Message-State: AO0yUKWlxERfZUVAkJ6mv8IHHKI/gxSeGSSXu9qAGu8xoLXoMsh1+hLE
 aUFchRiftdR90Eu76Fo+O/U=
X-Google-Smtp-Source: AK7set+Hu92nBj++VCP33SJOuImjRWugD/vJjJGJwVJgXdu0LGgfJ+IifWWzrs2H6JQnqOvjQjYr6g==
X-Received: by 2002:a05:6870:40c9:b0:15f:d9a0:a1b3 with SMTP id
 l9-20020a05687040c900b0015fd9a0a1b3mr15657315oal.1.1677257753145; 
 Fri, 24 Feb 2023 08:55:53 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 ef5-20020a0568701a8500b00152c52608dbsm7388664oab.34.2023.02.24.08.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 08:55:52 -0800 (PST)
Message-ID: <39f2089d-c102-4ecc-47f7-811e1dbb9d2b@gmail.com>
Date: Fri, 24 Feb 2023 13:55:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/display/sm501: Implement more 2D raster operations
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Sebastian Bauer <mail@sebastianbauer.info>
References: <20230216144043.D632874634B@zero.eik.bme.hu>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230216144043.D632874634B@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.094,
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



On 2/16/23 11:40, BALATON Zoltan wrote:
> Add simple implementation for two raster operations that are used by
> AmigaOS which fixes graphics problems in some progtams using these.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


And queued in ppc-next. Thanks,


Daniel

> For definitions of these see:
> https://learn.microsoft.com/en-us/windows/win32/gdi/ternary-raster-operations
> 
>   hw/display/sm501.c | 30 +++++++++++++++++++++++++++++-
>   1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index e1d0591d36..58bc9701ee 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -753,7 +753,7 @@ static void sm501_2d_operation(SM501State *s)
>           }
>   
>           if ((rop_mode && rop == 0x5) || (!rop_mode && rop == 0x55)) {
> -            /* Invert dest, is there a way to do this with pixman? */
> +            /* DSTINVERT, is there a way to do this with pixman? */
>               unsigned int x, y, i;
>               uint8_t *d = s->local_mem + dst_base;
>   
> @@ -763,6 +763,34 @@ static void sm501_2d_operation(SM501State *s)
>                       stn_he_p(&d[i], bypp, ~ldn_he_p(&d[i], bypp));
>                   }
>               }
> +        } else if (!rop_mode && rop == 0x99) {
> +            /* DSxn, is there a way to do this with pixman? */
> +            unsigned int x, y, i, j;
> +            uint8_t *sp = s->local_mem + src_base;
> +            uint8_t *d = s->local_mem + dst_base;
> +
> +            for (y = 0; y < height; y++) {
> +                i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
> +                j = (src_x + (src_y + y) * src_pitch) * bypp;
> +                for (x = 0; x < width; x++, i += bypp, j += bypp) {
> +                    stn_he_p(&d[i], bypp,
> +                             ~(ldn_he_p(&sp[j], bypp) ^ ldn_he_p(&d[i], bypp)));
> +                }
> +            }
> +        } else if (!rop_mode && rop == 0xee) {
> +            /* SRCPAINT, is there a way to do this with pixman? */
> +            unsigned int x, y, i, j;
> +            uint8_t *sp = s->local_mem + src_base;
> +            uint8_t *d = s->local_mem + dst_base;
> +
> +            for (y = 0; y < height; y++) {
> +                i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
> +                j = (src_x + (src_y + y) * src_pitch) * bypp;
> +                for (x = 0; x < width; x++, i += bypp, j += bypp) {
> +                    stn_he_p(&d[i], bypp,
> +                             ldn_he_p(&sp[j], bypp) | ldn_he_p(&d[i], bypp));
> +                }
> +            }
>           } else {
>               /* Do copy src for unimplemented ops, better than unpainted area */
>               if ((rop_mode && (rop != 0xc || rop2_source_is_pattern)) ||

