Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5F754A9DD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 09:01:18 +0200 (CEST)
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o10Y9-00071R-SV
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 03:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o10P6-00028b-Qx
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 02:51:56 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:45829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o10P5-00066E-Da
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 02:51:56 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso8197683pjh.4
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 23:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1EG21iRt6rNAtqpS3PlFqph50BJP9ggt6bb9GEmlC+o=;
 b=BSNPoGPbsNtnjKN8f1wZHjK+T9t/ZtfSPpIaE9er1Uq6PAQUgddskxQruEHz8DY7z7
 mpvGCqIel9MfzqzfNGYgoki/84L7pVHJgJC1oL2kkiUNS7tgunQw+KkppxYT7zeW1ajZ
 mbyKEo4bcBKCJOYmDCejz26GOscz17BQkZaLsjxeCl4wCIFhZtPz0oiJFj183YetlV57
 4nB/9zWNCDT5LwovYDGRKOffAQKkVAU04RIjSqRk+bo+Eo1fsaUiX3wNk3c2yVCeu2FR
 4znQubWRNvQ7Flp7tflEuJ0D76B3prt8dAjjQU9SfWe3mjkon4B3+zi7CRa0XJQndvPp
 MPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1EG21iRt6rNAtqpS3PlFqph50BJP9ggt6bb9GEmlC+o=;
 b=dp0eNFiLCkxnAtGKyOoEyRU7fju3aFQ0fbOLQkJpOX/f+dfzkyBou+mhJKW5a70/DR
 qBJoXgp+52xPcwf1I+bGHy1KzO93VWujsgGB+NXYPvhF1+roUqSBBi09c7JWs61YTaTg
 ZIRLakNj3nuzDSCl4aEyax59pSmRQc/YNdB+210m+6qoafKJTaM2zOJgAeZGUfOwlQEa
 KB6XCDEFYQBRNXpzQ0cqO2D7FumYaBlIm0rAHPcCIYXvrio8s+TNpJcFEWWcwna+cRdj
 M6fIQrG2it8/ig4s9vmP8x3pwIgGXZ2p9OFptzvd0hica1yn47JIU9gQI5h0xvbKAKdp
 gkOg==
X-Gm-Message-State: AJIora/Lqb77A8hoDN+6yCsCAjBbcBN8aJxlrKHOhrNbEV6qb/pc4ZHq
 MZ/D6doDDkFPGhJ/BjW+6VQ=
X-Google-Smtp-Source: AGRyM1sEE5hwRx9jOp852A59+bKjlDtnA3n/d5Yp8Z9lcfA1YW4HRebPkunub7Fy7cvXEI+qhm/4Aw==
X-Received: by 2002:a17:902:c2d3:b0:168:e13c:4e23 with SMTP id
 c19-20020a170902c2d300b00168e13c4e23mr3160437pla.99.1655189513918; 
 Mon, 13 Jun 2022 23:51:53 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r33-20020a17090a43a400b001e305f5cd22sm6429604pjg.47.2022.06.13.23.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 23:51:53 -0700 (PDT)
Message-ID: <a347da68-5b00-1e0b-0e8e-62cba81fa30f@amsat.org>
Date: Tue, 14 Jun 2022 08:51:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 1/7] crypto: Introduce ECDSA algorithm API
Content-Language: en-US
To: Lei He <helei.sig11@bytedance.com>, mst@redhat.com,
 arei.gonglei@huawei.com, berrange@redhat.com, qemu-devel@nongnu.org
Cc: pizhenwei@bytedance.com, jasowang@redhat.com
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
 <20220613084531.8086-2-helei.sig11@bytedance.com>
In-Reply-To: <20220613084531.8086-2-helei.sig11@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
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
> Introduce ECDSA related structures to qapi-crypto.
> 
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> ---
>   qapi/crypto.json | 28 ++++++++++++++++++++++++++--
>   1 file changed, 26 insertions(+), 2 deletions(-)

> +##
> +# @QCryptoAkCipherOptionsECDSA:
> +#
> +# Specific parameters for ECDSA algorithm.
> +#
> +# @curve-id: QCryptoCurveId
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'QCryptoAkCipherOptionsECDSA',
> +  'data': { 'curve-id':'QCryptoCurveID' }}

Missing an extra space after 'curve-id':, otherwise
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

