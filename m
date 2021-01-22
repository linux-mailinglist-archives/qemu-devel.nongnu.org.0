Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D39300A89
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:02:14 +0100 (CET)
Received: from localhost ([::1]:44188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l30lB-0007TB-FP
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l30he-000625-Vk
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:58:34 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:34842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l30hd-00085K-Dd
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:58:34 -0500
Received: by mail-ej1-x632.google.com with SMTP id ox12so8943838ejb.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 09:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5GGsPsLOhvmz5nznoRWwEIu2+280EfFMPxEY5H/dxaE=;
 b=PmXbZn67p4Fb60vacR9aqsM+7Wazqob5Xf26Vt3kjmhCvs1MV3EBXmJIoJTjz8yNUw
 5HSjDsu+RsERJ3AWZ5FqGm8aTMYBlfGSUh07gZ2cOrNNnfju5Lm6EPoC3/UqqMswySAS
 V4yux781EiuAI6QywiFIwqj+jqwSEi5zuNHH6zNXELsahPy6HqyJ2ZKhj1Tlj6wNIv9D
 YaogvwyODVH4dj6sf1dIysG8EXkvGNrgGSwFpg/p2/h+kQdgYNDN1cDeg7WHcmrv7Ajh
 pU+6zY2d+aZ4QNdVNtIaDV/po3gQIj1LIVh/fSBVh0BE2PMrRwI7Mm/fhgG7qcdI8dfx
 e1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5GGsPsLOhvmz5nznoRWwEIu2+280EfFMPxEY5H/dxaE=;
 b=EeGOuBsx64AizDGl4gMxX4QU7EXZj7/Tfa+eHx7YyJl7VI1twX7FcSCIgBthmOXY2v
 q/95+gfvOixXKQ8u9cZy5Qk66Q/FuWYZ7obODu2Na3u3BZVUQAolkBajyPgWZR6GCeZ+
 RZDYDa/gDGAYKdmEFRjL8atau+SN5TNsZ/b+L+Xyo8yMU9xrXv9T2VZ3IFWeJ20Rplvc
 uZB9Sfq4l5uyitt+Qpoc+8Z9jmX45Ns3nm5W8+p0IniKun/Qo79HIZZTfLJcxDz8hjwt
 KPX3Sspyry/OLNux6LfRDUlt7N0m0djFZxnygo1FRBlNGOmUu0YrJ2tMvN1k4Khatyku
 MMmQ==
X-Gm-Message-State: AOAM532GjaEV+z5I/22wbSWu8t6wv1LZAQVrAuIVPZu6KT8F+eWfHDcO
 TcMOUtycMADxe4P13oK08wXOXO0RbGg=
X-Google-Smtp-Source: ABdhPJyGy3SnGHIPBKOc/EnwShKItNtQWKfSIw8PgOY37gjL8+D2HjoWxjKK2HlbE6MVpIcML02X1g==
X-Received: by 2002:a17:906:25c4:: with SMTP id
 n4mr3774759ejb.359.1611338311970; 
 Fri, 22 Jan 2021 09:58:31 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m24sm4955171ejo.52.2021.01.22.09.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 09:58:30 -0800 (PST)
Subject: Re: [PATCH v7 14/35] Hexagon (target/hexagon) instruction printing
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-15-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4d5081d9-3b7b-4a9c-5007-04f0b5da3f73@amsat.org>
Date: Fri, 22 Jan 2021 18:58:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1611113349-24906-15-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.221,
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org,
 laurent@vivier.eu, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 4:28 AM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org

Missing trailing '>' ;)

> ---
>  target/hexagon/printinsn.h |  28 +++++++++
>  target/hexagon/printinsn.c | 146 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 174 insertions(+)
>  create mode 100644 target/hexagon/printinsn.h
>  create mode 100644 target/hexagon/printinsn.c
> 
> diff --git a/target/hexagon/printinsn.h b/target/hexagon/printinsn.h
> new file mode 100644
> index 0000000..d6331e0
> --- /dev/null
> +++ b/target/hexagon/printinsn.h
> @@ -0,0 +1,28 @@
> +/*
> + *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HEXAGON_PRINTINSN_H
> +#define HEXAGON_PRINTINSN_H
> +
> +#include "qemu/osdep.h"
> +#include "insn.h"
> +
> +extern void snprint_a_pkt_disas(GString *buf, Packet *pkt, uint32_t *words,
> +                                target_ulong pc);
> +extern void snprint_a_pkt_debug(GString *buf, Packet *pkt);

No need to declare prototypes in header with 'extern'...
(also noticed in other patches).

I'm surprise checkpatch.pl doesn't warn about this.

> +
> +#endif

