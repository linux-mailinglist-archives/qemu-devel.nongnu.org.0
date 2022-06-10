Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6D7546C22
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 20:07:19 +0200 (CEST)
Received: from localhost ([::1]:48330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzj2U-0007qz-A2
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 14:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzj0a-00072X-SS
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 14:05:21 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzj0Z-00010g-5N
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 14:05:20 -0400
Received: by mail-pf1-x436.google.com with SMTP id z17so79795pff.7
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 11:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=P6X8+yeGg+WycNNKNu7JupPNb/HaIUN+q9W1g8qHYsI=;
 b=nXhqCBlnyTwhAxCUdNbz2RIkGHcEBk92i18DiUJjZX1aikuXcGiGrgkt79iiHmZSRB
 usu13KxGzqFFBOhU21LUccKOPwL/AsVoOcgVCDzsv8AQ1zLmKR77GbgcOG/B0zDbCgLZ
 gFZkdKZKYymQ0VS4Tiefr9hQdUcM9yp50R6foRJ3fXGi1IPIFFFeRkvyj0vcz7aPYYm+
 MofmwA5TYKToSXkiV1R54P76c8eFhvk/QKDkDMjAskNkpR43nmZk1MoMHrdZdwoTn+ia
 41nvSflTdENI7NzlyqXfhOrtHE2wmxub+CciAonhFz4R7KmXCpDF5ApcRDeugh+DQ3++
 M4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P6X8+yeGg+WycNNKNu7JupPNb/HaIUN+q9W1g8qHYsI=;
 b=psCf2OAYtAggPPPtCz1nblUHd0Uk0VA+404H4Qgg7qTUtYqI1UgQckrpMz56+/UQas
 zbWVgBtt01VGpRd77crzQbwH0RPcJQxkDu6rfLXoW8xI2p2nFwJ/EjDmY9KXit3dhPQo
 xUz/pYRUS8jeKhoxBAtbanXg4AoGsCXbSCrM5bFMskMBYk734xWeyXcmgYzwJTHZw/YJ
 QSFAsyocUPlwqIWkbctL1ai3c28Ge5bI+WhQnutbkw1K+WB6Rhze+Z0zkkwl6kcCSa4G
 d7MwtshwOA++vvrVAZtdrqGAEdWI/Vvlgu9jROBqPR9jYNH9dPd4zqb5YV1BDZmTBjHe
 uNaQ==
X-Gm-Message-State: AOAM533NYFWCJv3zROudGN6Ea4xxOAczr+yQ6EV8/BQoo8e5aMfQ5XZi
 fBKdTXblIR7NlScX4Q1rNGz1eA==
X-Google-Smtp-Source: ABdhPJxcDD7S4N8WrvmdQzTTfCMOpheKZjHZnzrm/d11gBg7AuEgqwQiN2QWTnjLV1/MEs9+l5ls4A==
X-Received: by 2002:a05:6a00:140f:b0:4e0:6995:9c48 with SMTP id
 l15-20020a056a00140f00b004e069959c48mr113125030pfu.59.1654884317041; 
 Fri, 10 Jun 2022 11:05:17 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a17090a64c800b001e08461ceaesm2054470pjm.37.2022.06.10.11.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 11:05:16 -0700 (PDT)
Message-ID: <fff6fbb7-b1be-610d-c48d-0498df879ae2@linaro.org>
Date: Fri, 10 Jun 2022 11:05:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 54/54] crypto: Introduce RSA algorithm
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>, Gonglei <arei.gonglei@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20220610075631.367501-1-mst@redhat.com>
 <20220610075631.367501-55-mst@redhat.com>
 <93d111a8-222e-b46f-2f36-1d1784cf0373@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <93d111a8-222e-b46f-2f36-1d1784cf0373@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/10/22 08:55, Philippe Mathieu-Daudé wrote:
> On 10/6/22 09:59, Michael S. Tsirkin wrote:
>> From: zhenwei pi <pizhenwei@bytedance.com>
>> +static int cryptodev_builtin_set_rsa_options(
>> +                    int virtio_padding_algo,
>> +                    int virtio_hash_algo,
>> +                    QCryptoAkCipherOptionsRSA *opt,
>> +                    Error **errp)
>> +{
>> +    if (virtio_padding_algo == VIRTIO_CRYPTO_RSA_PKCS1_PADDING) {
>> +        opt->padding_alg = QCRYPTO_RSA_PADDING_ALG_PKCS1;
>> +        opt->hash_alg =
>> +            cryptodev_builtin_get_rsa_hash_algo(virtio_hash_algo, errp);
>> +        if (opt->hash_alg < 0) {
>> +            return -1;
>> +        }
>> +        return 0;
>> +    }
>> +
>> +    if (virtio_padding_algo == VIRTIO_CRYPTO_RSA_RAW_PADDING) {
>> +        opt->padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW;
>> +        return 0;
>> +    }
>> +
>> +    error_setg(errp, "Unsupported rsa padding algo: %d", virtio_padding_algo);
>> +    return -1;
>> +}
> 
> Build failure:
> 
> ../backends/cryptodev-builtin.c:187:27: error: result of comparison of unsigned enum 
> expression < 0 is always false [-Werror,-Wtautological-unsigned-enum-zero-compare]
>          if (opt->hash_alg < 0) {
>              ~~~~~~~~~~~~~ ^ ~

Yep, e.g.

https://gitlab.com/qemu-project/qemu/-/jobs/2574418442


r~

