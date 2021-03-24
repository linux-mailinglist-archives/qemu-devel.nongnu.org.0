Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E923474FF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 10:49:02 +0100 (CET)
Received: from localhost ([::1]:59810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP08K-0000cX-Uq
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 05:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP06Q-0007pS-Mm; Wed, 24 Mar 2021 05:47:02 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP06N-0000HS-6g; Wed, 24 Mar 2021 05:47:02 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 z6-20020a1c4c060000b029010f13694ba2so790936wmf.5; 
 Wed, 24 Mar 2021 02:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R3JoigzkpfH29Dmg4jcZntYWA8c6KVX15QFXMMfEWXQ=;
 b=gO+e8rjrvwkxk+4iI4nLluhyW3hOx2hcVpUqfrSan/tEj9QiNOa/RA4gohszZO1Ow8
 D8YEhF4vBBmL3af7fh0TLjXNlx2dmAlvWGPQ1xOrOb0ntpPztUzIEAg2BzIn4vF85PxS
 H92461Uf9Lo5nxhwXrPTF0h/qamiDfQMqOe2+rWMSwliHvhXKHWzyIIxVpZSoQvGUFiF
 WVyu9+LnSTNqgD4u9nJpE+ET18LTkNY+k+gswjyy6V34aRDAwGXd7xED5FBfckACgCFM
 h49oTlKHq0OEFu+VyVZEx67Z5X2Pg69y70zpEJhrjeF56IwQMi6tjEbw5oZueOwFt13U
 1a1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R3JoigzkpfH29Dmg4jcZntYWA8c6KVX15QFXMMfEWXQ=;
 b=IOKQi58mY+U66hgZAROUSYnejO1jBg6rD8b7aD93/iZTkk+5gEE9vqcSoMEuPKD9cW
 pKxpVWr+7GLFJJYG+TP8yReVbysV1HITbpYpVvu9J2/+7mJyCana7LbuVGHpD1PO4d9M
 5J/JKKRP8lbseSecz6YDczuUk7yR/KMOzk460Pxg24btKO1uYCmLuqXtzpvcCihRXc/M
 6nGsmfmq7JmYbtRSA2ZTwuN8/MIAzoUl3LinXmKRwlIyKEb0Bc8B+TRqDTK7uw1y3TsB
 6IksJ/1w33lIDP1EqKBlXgGXKzbZl9JDHaj1aN07wjhuzBTq1oAfh9jKNUmVWFobJj8d
 6Itw==
X-Gm-Message-State: AOAM530JqbVxPdO3LgrlsdG413GcX0+hSlsmmYLscab3PdiDpKhXfVGR
 vI5wMJvi9fvMB8/g4i2hroK1untmULnLKQ==
X-Google-Smtp-Source: ABdhPJymBzIn7XzA8tboKkUSxzYlG++r37EIaM3kFc+6E74ljO2tKe0AZMgdzMCD5iQ7wMa4hMbyNg==
X-Received: by 2002:a1c:1f94:: with SMTP id f142mr2052154wmf.180.1616579216708; 
 Wed, 24 Mar 2021 02:46:56 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a13sm2449134wrp.31.2021.03.24.02.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 02:46:56 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] hw: Model ASPEED's Hash and Crypto Engine
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20210324070955.125941-1-joel@jms.id.au>
 <20210324070955.125941-2-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2a89ba2d-b703-e783-eb50-2251b65e3b78@amsat.org>
Date: Wed, 24 Mar 2021 10:46:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324070955.125941-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 8:09 AM, Joel Stanley wrote:
> The HACE (Hash and Crypto Engine) is a device that offloads MD5, SHA1,
> SHA2, RSA and other cryptographic algorithms.
> 
> This initial model implements a subset of the device's functionality;
> currently only direct access (non-scatter gather) hashing.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v3:
>  - rebase on upstream to fix meson.build conflict
> v2:
>  - reorder register defines
>  - mask src/dest/len registers according to hardware
> v4:
>  - Fix typos in comments
>  - Remove sdram base address; new memory region fixes mean this is not
>    required
>  - Use PRIx64
>  - Add Object Classes for soc familiy specific features
>  - Convert big switch statement to a lookup in a struct
> ---
>  include/hw/misc/aspeed_hace.h |  43 ++++
>  hw/misc/aspeed_hace.c         | 358 ++++++++++++++++++++++++++++++++++
>  hw/misc/meson.build           |   1 +
>  3 files changed, 402 insertions(+)
>  create mode 100644 include/hw/misc/aspeed_hace.h
>  create mode 100644 hw/misc/aspeed_hace.c

> +static int hash_algo_lookup(uint32_t mask)
> +{
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(hash_algo_map); i++) {
> +        if (mask == hash_algo_map[i].mask)

{

> +            return hash_algo_map[i].algo;

}

> +    }
> +
> +    return -1;
> +}
> +
> +static int do_hash_operation(AspeedHACEState *s, int algo)
> +{
> +    hwaddr src, len, dest;
> +    uint8_t *digest_buf = NULL;

Eventually g_autofree,

> +    size_t digest_len = 0;
> +    char *src_buf;
> +    int rc;
> +
> +    src = s->regs[R_HASH_SRC];
> +    len = s->regs[R_HASH_SRC_LEN];
> +    dest = s->regs[R_HASH_DEST];
> +
> +    src_buf = address_space_map(&s->dram_as, src, &len, false,
> +                                MEMTXATTRS_UNSPECIFIED);
> +    if (!src_buf) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map dram\n", __func__);
> +        return -EACCES;
> +    }
> +
> +    rc = qcrypto_hash_bytes(algo, src_buf, len, &digest_buf, &digest_len,
> +                            &error_fatal);
> +    if (rc < 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
> +        return rc;
> +    }
> +
> +    rc = address_space_write(&s->dram_as, dest, MEMTXATTRS_UNSPECIFIED,
> +                             digest_buf, digest_len);
> +    if (rc) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: address space write failed\n", __func__);
> +    }
> +    g_free(digest_buf);

removing g_free().

> +
> +    address_space_unmap(&s->dram_as, src_buf, len, false, len);
> +
> +    /*
> +     * Set status bits to indicate completion. Testing shows hardware sets
> +     * these irrespective of HASH_IRQ_EN.
> +     */
> +    s->regs[R_STATUS] |= HASH_IRQ;
> +
> +    return 0;
> +}

Generic model LGTM.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

