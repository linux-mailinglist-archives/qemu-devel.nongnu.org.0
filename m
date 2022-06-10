Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DAF5469E7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 17:57:04 +0200 (CEST)
Received: from localhost ([::1]:40026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzh0Q-0007N6-IP
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 11:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgyq-0006Nx-Ve
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:55:25 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgyp-0005Kx-90
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:55:24 -0400
Received: by mail-pl1-x62f.google.com with SMTP id i1so23093362plg.7
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 08:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vWBILHyYafkrGwWyaeFe5YmusHC5lkUrN4uXu0qFjZk=;
 b=TwOc2504hMD47saMCOHBimoCVqf2LRWUJ1k9vjUdePnd8WYqZ9KiHkGBuT8gdDdIJu
 43F1nUagnd0kW2Z1cIvaj//oSsqqCHw1bCp5nGScmoHFpqGSGEvdGWKdKOhlhROlKEQx
 xeW2t0X+R8ZDfMJr7jbd2d4NBhs0WwT/9gPkUj4MJmI4wIysWktJ9O+WbjOdtcjZaSPA
 tGcsT7AfDhvlMiJ1GyjxUZCSI3aZ9fKHbfH3yW7wEDkrvybBxwwecXG9bNT4lvVSVf4s
 JxGdmX1a8VZpdJqxUoMYGXkOPa7z8SO6DklGKSv+f0YccbnmAP6StGFEVF31VfeGeiAr
 1nYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vWBILHyYafkrGwWyaeFe5YmusHC5lkUrN4uXu0qFjZk=;
 b=3FlRpop9WQRS5ppEYu3x/Kuy2jQxhvk5CAuQR0w2OS/WxPwlMXJ8mtEuzs3yCef7iZ
 kjMVTXJGNuw67lXNRzCe8NaY7PQEfAJ34qVatPPbqUUF7m+AbZHIfEZvveo5pPyA66wp
 QxLCu3YV9V8Wf0FpgVRRpWvFkWR6TpQioSGrtCU3IJ/4/OIhIcoIfV+RqgAMqdSgiTAq
 qxWfdKDKUDM5EuviyK/hVFdFs/kQHWpnQ3Y2BWMMyBI7Luf4pA/3C+ceXBkkgG5VHrPE
 txZeuu5YujvgNwFhDu10blmcHsOOX4lGHSue5ysYeKBXLkNxNNfsJt+afjmba5hJ6idW
 MRVQ==
X-Gm-Message-State: AOAM530B6G7iLqym/8LWk5S2CZN/WkyMVFzc1EO5uMER8zYnSDnsvh/G
 M605dHyw+DD9IlXKqqiEO8w=
X-Google-Smtp-Source: ABdhPJwJ7/5SFD0NWj2DrIxCX2CeM7CPw5YTGOw45ekAaijFXEWRRn9XPPDsVT0C+vIkgFE2WHiBPg==
X-Received: by 2002:a17:903:2348:b0:163:fc70:a4cd with SMTP id
 c8-20020a170903234800b00163fc70a4cdmr45806031plh.89.1654876521690; 
 Fri, 10 Jun 2022 08:55:21 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00163d6164889sm18981809plb.236.2022.06.10.08.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 08:55:21 -0700 (PDT)
Message-ID: <93d111a8-222e-b46f-2f36-1d1784cf0373@amsat.org>
Date: Fri, 10 Jun 2022 17:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PULL 54/54] crypto: Introduce RSA algorithm
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>, Gonglei <arei.gonglei@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220610075631.367501-1-mst@redhat.com>
 <20220610075631.367501-55-mst@redhat.com>
In-Reply-To: <20220610075631.367501-55-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
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

On 10/6/22 09:59, Michael S. Tsirkin wrote:
> From: zhenwei pi <pizhenwei@bytedance.com>
> 
> There are two parts in this patch:
> 1, support akcipher service by cryptodev-builtin driver
> 2, virtio-crypto driver supports akcipher service
> 
> In principle, we should separate this into two patches, to avoid
> compiling error, merge them into one.
> 
> Then virtio-crypto gets request from guest side, and forwards the
> request to builtin driver to handle it.
> 
> Test with a guest linux:
> 1, The self-test framework of crypto layer works fine in guest kernel
> 2, Test with Linux guest(with asym support), the following script
> test(note that pkey_XXX is supported only in a newer version of keyutils):
>    - both public key & private key
>    - create/close session
>    - encrypt/decrypt/sign/verify basic driver operation
>    - also test with kernel crypto layer(pkey add/query)
> 
> All the cases work fine.
> 
> Run script in guest:
> rm -rf *.der *.pem *.pfx
> modprobe pkcs8_key_parser # if CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
> rm -rf /tmp/data
> dd if=/dev/random of=/tmp/data count=1 bs=20
> 
> openssl req -nodes -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -subj "/C=CN/ST=BJ/L=HD/O=qemu/OU=dev/CN=qemu/emailAddress=qemu@qemu.org"
> openssl pkcs8 -in key.pem -topk8 -nocrypt -outform DER -out key.der
> openssl x509 -in cert.pem -inform PEM -outform DER -out cert.der
> 
> PRIV_KEY_ID=`cat key.der | keyctl padd asymmetric test_priv_key @s`
> echo "priv key id = "$PRIV_KEY_ID
> PUB_KEY_ID=`cat cert.der | keyctl padd asymmetric test_pub_key @s`
> echo "pub key id = "$PUB_KEY_ID
> 
> keyctl pkey_query $PRIV_KEY_ID 0
> keyctl pkey_query $PUB_KEY_ID 0
> 
> echo "Enc with priv key..."
> keyctl pkey_encrypt $PRIV_KEY_ID 0 /tmp/data enc=pkcs1 >/tmp/enc.priv
> echo "Dec with pub key..."
> keyctl pkey_decrypt $PRIV_KEY_ID 0 /tmp/enc.priv enc=pkcs1 >/tmp/dec
> cmp /tmp/data /tmp/dec
> 
> echo "Sign with priv key..."
> keyctl pkey_sign $PRIV_KEY_ID 0 /tmp/data enc=pkcs1 hash=sha1 > /tmp/sig
> echo "Verify with pub key..."
> keyctl pkey_verify $PRIV_KEY_ID 0 /tmp/data /tmp/sig enc=pkcs1 hash=sha1
> 
> echo "Enc with pub key..."
> keyctl pkey_encrypt $PUB_KEY_ID 0 /tmp/data enc=pkcs1 >/tmp/enc.pub
> echo "Dec with priv key..."
> keyctl pkey_decrypt $PRIV_KEY_ID 0 /tmp/enc.pub enc=pkcs1 >/tmp/dec
> cmp /tmp/data /tmp/dec
> 
> echo "Verify with pub key..."
> keyctl pkey_verify $PUB_KEY_ID 0 /tmp/data /tmp/sig enc=pkcs1 hash=sha1
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> Signed-off-by: lei he <helei.sig11@bytedance.com
> Message-Id: <20220527084734.2649594-2-pizhenwei@bytedance.com>
> Reviewed-by: Gonglei <arei.gonglei@huawei.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   include/hw/virtio/virtio-crypto.h |   5 +-
>   include/sysemu/cryptodev.h        |  83 ++++++--
>   backends/cryptodev-builtin.c      | 274 +++++++++++++++++++++----
>   backends/cryptodev-vhost-user.c   |  34 +++-
>   backends/cryptodev.c              |  32 ++-
>   hw/virtio/virtio-crypto.c         | 319 ++++++++++++++++++++++++------
>   6 files changed, 605 insertions(+), 142 deletions(-)

> +static int cryptodev_builtin_set_rsa_options(
> +                    int virtio_padding_algo,
> +                    int virtio_hash_algo,
> +                    QCryptoAkCipherOptionsRSA *opt,
> +                    Error **errp)
> +{
> +    if (virtio_padding_algo == VIRTIO_CRYPTO_RSA_PKCS1_PADDING) {
> +        opt->padding_alg = QCRYPTO_RSA_PADDING_ALG_PKCS1;
> +        opt->hash_alg =
> +            cryptodev_builtin_get_rsa_hash_algo(virtio_hash_algo, errp);
> +        if (opt->hash_alg < 0) {
> +            return -1;
> +        }
> +        return 0;
> +    }
> +
> +    if (virtio_padding_algo == VIRTIO_CRYPTO_RSA_RAW_PADDING) {
> +        opt->padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW;
> +        return 0;
> +    }
> +
> +    error_setg(errp, "Unsupported rsa padding algo: %d", virtio_padding_algo);
> +    return -1;
> +}

Build failure:

../backends/cryptodev-builtin.c:187:27: error: result of comparison of 
unsigned enum expression < 0 is always false 
[-Werror,-Wtautological-unsigned-enum-zero-compare]
         if (opt->hash_alg < 0) {
             ~~~~~~~~~~~~~ ^ ~

