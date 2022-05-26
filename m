Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072E75351EC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 18:20:01 +0200 (CEST)
Received: from localhost ([::1]:49240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuGDP-0002GG-Ir
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 12:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuGBp-0001Tz-Sq
 for qemu-devel@nongnu.org; Thu, 26 May 2022 12:18:24 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:35353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuGBn-0005Tl-Vs
 for qemu-devel@nongnu.org; Thu, 26 May 2022 12:18:21 -0400
Received: by mail-pl1-x633.google.com with SMTP id c2so1845694plh.2
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 09:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zf6CYnLmZ63qa6ONxHmbfRLawmRDDlHRAhQ31P7tk1M=;
 b=QyDTDQBy14TMfv9gtm+RlFBCi/TFAa2ZubSKrXsTe3RoizxwRoGJhEYE+QmHBmfVWH
 Mq0YFZuMxujApdSVzjL+Qa28c6L8jAvUpnjjbYyds0xZKt/A3AmJgXiJQQuqyqfwDboW
 SmP5eJH6qKzirP0UdQf8jwr21RZwM2ga4zbUOdtDrJdzOu99Md3+Lq8KH+NztAQ7AUX4
 JsaTZNIfoytVgkQEabKha83O4qvim3L5Px0cjF1+oTKAcsL+0txR8wYZSkcUmeTNAWPd
 VXb7Ku+SQ5Oc3RKYGozBZngGHqLILqpznNCBaYR3QHFPIkbg7m8HN03VFMphzNEevQkE
 pxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zf6CYnLmZ63qa6ONxHmbfRLawmRDDlHRAhQ31P7tk1M=;
 b=MGUYREZL81zlFE9sII6FP9xxA7xuGSCGwR2JPVhaMmif6i6XkzDJFFZJHIzcIelMHF
 KXmzjYy9CPefRCo+Ip5MuRzl4EeacMQGnjfhtrQ5uw5l4kyT4GMeeZmD89ERhUCMM7ZS
 wixVh82/cliFsEdm6nr347Q9RPTH84ZmvDrLHfr+P50hjSWgIStN14klUgwX0H+CfCq6
 oeG/phoXEbyDTVBrReON3ss6sXYnSwktSmdGVL6kKOPlufhL3N3cBRkt/7eCzPEA/ae/
 /vjeh1qxsclFYn0T0Gh6+7SiQ8rqTkeP4WLXeac9HFKuaSKAwMteGu7eJy1fc6Lgs5C+
 Eg/g==
X-Gm-Message-State: AOAM5303mfGU5iAuQY8X0CMfm+fT+FgYZsWS0BZ5bnru9ebZ2E+dpKNX
 TkJ/zf7cpxOUUES3XiAIhfTGcQ==
X-Google-Smtp-Source: ABdhPJzd5+/ovcQ3HmFsqfBPlqLsSs+AdOm22pOPSYodPOKDZvuE7vIg12b2VSGD/egp3KzMsUmjZw==
X-Received: by 2002:a17:903:1211:b0:15e:8208:8cc0 with SMTP id
 l17-20020a170903121100b0015e82088cc0mr39069798plh.52.1653581898006; 
 Thu, 26 May 2022 09:18:18 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 ix10-20020a170902f80a00b00162451a825asm1726780plb.307.2022.05.26.09.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 09:18:17 -0700 (PDT)
Message-ID: <df547f11-1cb3-3b2f-f590-dfd2e0b209b6@linaro.org>
Date: Thu, 26 May 2022 09:18:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/7] crypto asymmetric cipher patches
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20220526104541.492781-1-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220526104541.492781-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

On 5/26/22 03:45, Daniel P. Berrangé wrote:
> The following changes since commit 58b53669e87fed0d70903e05cd42079fbbdbc195:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-05-25 13:46:29 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/berrange/qemu tags/ak-pull-request
> 
> for you to fetch changes up to f0cfb761bc6e590d648b759e6bdb8c946062b5f5:
> 
>    tests/crypto: Add test suite for RSA keys (2022-05-26 11:41:56 +0100)
> 
> ----------------------------------------------------------------
> Merge asymmetric cipher crypto support
> 
> This extends the internal crypto APIs to support the use of asymmetric
> ciphers.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Lei He (6):
>    qapi: crypto-akcipher: Introduce akcipher types to qapi
>    crypto: add ASN.1 DER decoder
>    crypto: Implement RSA algorithm by hogweed
>    crypto: Implement RSA algorithm by gcrypt
>    test/crypto: Add test suite for crypto akcipher
>    tests/crypto: Add test suite for RSA keys
> 
> Zhenwei Pi (1):
>    crypto: Introduce akcipher crypto class
> 
>   crypto/akcipher-gcrypt.c.inc            | 595 ++++++++++++++
>   crypto/akcipher-nettle.c.inc            | 451 +++++++++++
>   crypto/akcipher.c                       | 108 +++
>   crypto/akcipherpriv.h                   |  55 ++
>   crypto/der.c                            | 189 +++++
>   crypto/der.h                            |  81 ++
>   crypto/meson.build                      |   6 +
>   crypto/rsakey-builtin.c.inc             | 200 +++++
>   crypto/rsakey-nettle.c.inc              | 158 ++++
>   crypto/rsakey.c                         |  44 ++
>   crypto/rsakey.h                         |  92 +++
>   include/crypto/akcipher.h               | 158 ++++
>   meson.build                             |  11 +
>   qapi/crypto.json                        |  64 ++
>   tests/bench/benchmark-crypto-akcipher.c | 137 ++++
>   tests/bench/meson.build                 |   1 +
>   tests/bench/test_akcipher_keys.inc      | 537 +++++++++++++
>   tests/unit/meson.build                  |   2 +
>   tests/unit/test-crypto-akcipher.c       | 990 ++++++++++++++++++++++++
>   tests/unit/test-crypto-der.c            | 290 +++++++
>   20 files changed, 4169 insertions(+)
>   create mode 100644 crypto/akcipher-gcrypt.c.inc
>   create mode 100644 crypto/akcipher-nettle.c.inc
>   create mode 100644 crypto/akcipher.c
>   create mode 100644 crypto/akcipherpriv.h
>   create mode 100644 crypto/der.c
>   create mode 100644 crypto/der.h
>   create mode 100644 crypto/rsakey-builtin.c.inc
>   create mode 100644 crypto/rsakey-nettle.c.inc
>   create mode 100644 crypto/rsakey.c
>   create mode 100644 crypto/rsakey.h
>   create mode 100644 include/crypto/akcipher.h
>   create mode 100644 tests/bench/benchmark-crypto-akcipher.c
>   create mode 100644 tests/bench/test_akcipher_keys.inc
>   create mode 100644 tests/unit/test-crypto-akcipher.c
>   create mode 100644 tests/unit/test-crypto-der.c
> 


