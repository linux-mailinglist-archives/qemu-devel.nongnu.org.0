Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75985485AE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 16:23:57 +0200 (CEST)
Received: from localhost ([::1]:55564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0kyy-0001Xn-KS
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 10:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o0kup-0005hE-Tu
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 10:19:39 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:40754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o0kuo-0005Mv-4H
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 10:19:39 -0400
Received: by mail-ed1-x530.google.com with SMTP id w27so7360444edl.7
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 07:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FTl7ltWXP1ZFbD2z+UI+9zp6eVSgti3ouAanlsaHlR4=;
 b=B0cNat/BDIfR6XJ/Xt9dVGOA/RxMOnGnK5g+diKomxKFmqri0yKBxqJ3pRZ5vbXMvg
 IrlEABttH6vLhMzttM3Tva+5jWIjP9094NoC8vx8QnNNWZkthrIxQEby1eHRZaWdkWvl
 JnslMhBiTmNUCJoyMiVOUjC3a/rqjSgvv4Tvov++JNg6MrzlESIDrDMSVgXJpD1zYROb
 t8kDHjIvaqnmYmCy7lCDYWD4088rr2Ulsh3Yqj8mgybi376YG3cqfBr5aJSAmdleaE9a
 se1l2swR1vlznkSBj6G7X5X6syysNRq3euhqCwhBy9CKIV5eoFc/gzOgBUuf2bAdPyp/
 j6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FTl7ltWXP1ZFbD2z+UI+9zp6eVSgti3ouAanlsaHlR4=;
 b=4aLIsBUrTyLudpTd/1gugaptNb2jEtWHo5kpZ30wBd2qutG9/40LCZ6t0I9cHDHbiW
 5yLnoXuGIVQlplKaKXnTK6IwpsNh/1gawNwFrbhovsqYBbz+OB+f9QVHlIIviNvH7IX2
 MdxdRV3k4MZQkvQr95MJXCZcLTHvuznMiXN/M6gBoIUUUEw+MQv95nQ/MkMl+ly4699G
 ltDPDAE8sViddzoUo0c/N44wABQhCQBTD0zeFQuMH5wIHExED1lYNwqXsC0qlOdMkt35
 fhI0E/e71TeoQEQjmPH8hTMRpehseVCil9sWLHKyvzj1UBfiQ+/W33e1oLdoMNm4oInV
 2E0g==
X-Gm-Message-State: AOAM532rLQ/BYoYyuAq5Y7ypxbC/BE8lLXjHzZBhvXz+m6xph7kkcbxz
 OseOXF0cG98Bub4kp6Ax0Z0=
X-Google-Smtp-Source: ABdhPJytnAVe7M+3A4a6kG9fJdzKjBsaPU9Ky2tsLv+T0oQTLkl0PU4wfkfBBeol70IRRHklPSojhQ==
X-Received: by 2002:a05:6402:51d3:b0:431:6c7b:c35 with SMTP id
 r19-20020a05640251d300b004316c7b0c35mr42965370edd.28.1655129976460; 
 Mon, 13 Jun 2022 07:19:36 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a170906139600b006fec3b2e4f3sm3864864ejc.205.2022.06.13.07.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 07:19:35 -0700 (PDT)
Message-ID: <50d14368-8dca-0b11-d4d5-f3cd8814fe82@amsat.org>
Date: Mon, 13 Jun 2022 16:19:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 4/7] crypto: Add ECDSA key parser
Content-Language: en-US
To: Lei He <helei.sig11@bytedance.com>, mst@redhat.com,
 arei.gonglei@huawei.com, berrange@redhat.com, qemu-devel@nongnu.org
Cc: pizhenwei@bytedance.com, jasowang@redhat.com
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
 <20220613084531.8086-5-helei.sig11@bytedance.com>
In-Reply-To: <20220613084531.8086-5-helei.sig11@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 13/6/22 10:45, Lei He wrote:
> Add ECDSA key parser and ECDSA signautre parser.
> 
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> ---
>   crypto/ecdsakey-builtin.c.inc | 248 ++++++++++++++++++++++++++++++++++++++++++
>   crypto/ecdsakey.c             | 118 ++++++++++++++++++++
>   crypto/ecdsakey.h             |  66 +++++++++++
>   crypto/meson.build            |   1 +
>   4 files changed, 433 insertions(+)
>   create mode 100644 crypto/ecdsakey-builtin.c.inc
>   create mode 100644 crypto/ecdsakey.c
>   create mode 100644 crypto/ecdsakey.h
> 
> diff --git a/crypto/ecdsakey-builtin.c.inc b/crypto/ecdsakey-builtin.c.inc
> new file mode 100644
> index 0000000000..5da317ec44
> --- /dev/null
> +++ b/crypto/ecdsakey-builtin.c.inc
> @@ -0,0 +1,248 @@
> +/*
> + * QEMU Crypto akcipher algorithms
> + *
> + * Copyright (c) 2022 Bytedance
> + * Author: lei he <helei.sig11@bytedance.com>
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + *
> + */
> +
> +#include "der.h"
> +#include "ecdsakey.h"
> +
> +#define QCRYPTO_ECDSA_PUBKEY_FMT_UNCOMPRESSED 0x04
> +
> +static int extract_mpi(void *ctx, const uint8_t *value,
> +                       size_t vlen, Error **errp)
> +{
> +    QCryptoAkCipherMPI *mpi = (QCryptoAkCipherMPI *)ctx;
> +    if (vlen == 0) {
> +        error_setg(errp, "Empty mpi field");
> +        return -1;

Functions taking Error* param usually return a boolean.

> +    }
> +    mpi->data = g_memdup2(value, vlen);
> +    mpi->len = vlen;
> +    return 0;
> +}
> +
> +static int extract_version(void *ctx, const uint8_t *value,
> +                           size_t vlen, Error **errp)
> +{
> +    uint8_t *version = (uint8_t *)ctx;
> +    if (vlen != 1 || *value > 1) {
> +        error_setg(errp, "Invalid rsakey version");
> +        return -1;
> +    }
> +    *version = *value;
> +    return 0;
> +}
> +
> +static int extract_cons_content(void *ctx, const uint8_t *value,
> +                                size_t vlen, Error **errp)
> +{
> +    const uint8_t **content = (const uint8_t **)ctx;
> +    if (vlen == 0) {
> +        error_setg(errp, "Empty sequence");
> +        return -1;
> +    }
> +    *content = value;

You need to check (vlen >= sizeof(uint8_t *)) to avoid overrun.

> +    return 0;
> +}
> +
> +static int __qcrypto_akcipher_builtin_ecdsa_pubkey_parse(
> +    QCryptoAkCipherECDSAKey *ecdsa,
> +    const uint8_t *key, size_t keylen, Error **errp);

Why use the reserved __prefix?

