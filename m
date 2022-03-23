Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4262E4E5270
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:46:47 +0100 (CET)
Received: from localhost ([::1]:32834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX0Nx-0000vU-PB
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:46:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX0E0-0007pF-6B
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:36:30 -0400
Received: from [2607:f8b0:4864:20::532] (port=46876
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX0Dy-0003Rh-29
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:36:27 -0400
Received: by mail-pg1-x532.google.com with SMTP id o23so987119pgk.13
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 05:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1/cwjisYWhPAjguq3RkHg62B/Qtu8tC3102zHeh5xtA=;
 b=TOZkxKBkSLiML8A7JfcKmCcxE0a+yPgGERUi6wtN3p6/0lRDW3gjwd858Vme6h9GCR
 eIZVyojOyV/7FcpBYvOJ8U7SYGr8fF3ZbrDjFeaYl8C2Q+x6kpMn2h3eRq69yNNcF1Un
 Ws5yIxud1uHNkEfs9MZC4+NuSxwbKQDcoRg9Tc9KW2bHyWMgPovPTv4L5qY9mGH5I6Px
 kRlOBAO4To16zESLnLIK3E3D1G/jD2PJYGYtmzNxfH9vmJtMMRvrNW1A5PdspMPCCkbp
 DAiicZmchDbVwpRlZGBNEqncJC+orL4JuCROd8U3YJtpaYUtCvRP43EaaUOVlQAPYra3
 pPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1/cwjisYWhPAjguq3RkHg62B/Qtu8tC3102zHeh5xtA=;
 b=VmmEYg1/VhECfqdv06PtAallfQaXyC20kAwYM21hXp7+tipEUgrIvwpOA4B+GbwzC4
 s872WPi09AmhZCQ07Xr25vogV+3ZHUvdzBJr+67GXnHWaBjuxrVSBmOFD6HQMVLSyZNz
 UFsunv160DkLvGnhCYPQzwPFXTyfIBdesrzwdMsjCUf7utmxMnwrmPzWr5LvLBEUfbds
 C8nLacCMZWHEM62dS+8hzOPKeJlCwRkjC9lXs4OAzTopcL76dxqtBknnUZlBAsr0QkWL
 4bCMbjUTOmPRolwc2qTnc+fiDhcI/5PSPzCWwcR5GqHZF//KUyTLQax/+ROP81oXOqZu
 JPnw==
X-Gm-Message-State: AOAM531moKYbYuhOu7WkBzhrHEFQXpeIr86xItggrsAfsROvfCoHNBl7
 DvUjnbyHLHCNMT79Yk+GO94=
X-Google-Smtp-Source: ABdhPJz/hb43Jn0t74G4KrVSuw+vJtAKWyn3T/YQhVtIrwEzvIr6LmW1459H27J4c/Dq9i/j0ag09g==
X-Received: by 2002:a05:6a00:2310:b0:4fa:7eb1:e855 with SMTP id
 h16-20020a056a00231000b004fa7eb1e855mr22772727pfh.14.1648038983119; 
 Wed, 23 Mar 2022 05:36:23 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a8b0300b001c735089cc2sm6115487pjn.54.2022.03.23.05.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 05:36:22 -0700 (PDT)
Message-ID: <6a63c13b-f5c6-5088-640e-8b2cd0ce0712@gmail.com>
Date: Wed, 23 Mar 2022 13:36:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 0/6] Support akcipher for virtio-crypto
Content-Language: en-US
To: zhenwei pi <pizhenwei@bytedance.com>, arei.gonglei@huawei.com,
 mst@redhat.com, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220323024912.249789-1-pizhenwei@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220323024912.249789-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: linux-crypto@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, herbert@gondor.apana.org.au,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Daniel & Laurent.

On 23/3/22 03:49, zhenwei pi wrote:
> v2 -> v3:
> - Introduce akcipher types to qapi
> - Add test/benchmark suite for akcipher class
> - Seperate 'virtio_crypto: Support virtio crypto asym operation' into:
>    - crypto: Introduce akcipher crypto class
>    - virtio-crypto: Introduce RSA algorithm
> 
> v1 -> v2:
> - Update virtio_crypto.h from v2 version of related kernel patch.
> 
> v1:
> - Support akcipher for virtio-crypto.
> - Introduce akcipher class.
> - Introduce ASN1 decoder into QEMU.
> - Implement RSA backend by nettle/hogweed.
> 
> Lei He (3):
>    crypto-akcipher: Introduce akcipher types to qapi
>    crypto: Implement RSA algorithm by hogweed
>    tests/crypto: Add test suite for crypto akcipher
> 
> Zhenwei Pi (3):
>    virtio-crypto: header update
>    crypto: Introduce akcipher crypto class
>    virtio-crypto: Introduce RSA algorithm
> 
>   backends/cryptodev-builtin.c                  | 319 +++++++-
>   backends/cryptodev-vhost-user.c               |  34 +-
>   backends/cryptodev.c                          |  32 +-
>   crypto/akcipher-nettle.c                      | 523 +++++++++++++
>   crypto/akcipher.c                             |  81 ++
>   crypto/asn1_decoder.c                         | 185 +++++
>   crypto/asn1_decoder.h                         |  42 +
>   crypto/meson.build                            |   4 +
>   hw/virtio/virtio-crypto.c                     | 326 ++++++--
>   include/crypto/akcipher.h                     | 155 ++++
>   include/hw/virtio/virtio-crypto.h             |   5 +-
>   .../standard-headers/linux/virtio_crypto.h    |  82 +-
>   include/sysemu/cryptodev.h                    |  88 ++-
>   meson.build                                   |  11 +
>   qapi/crypto.json                              |  86 +++
>   tests/bench/benchmark-crypto-akcipher.c       | 163 ++++
>   tests/bench/meson.build                       |   6 +
>   tests/bench/test_akcipher_keys.inc            | 277 +++++++
>   tests/unit/meson.build                        |   1 +
>   tests/unit/test-crypto-akcipher.c             | 715 ++++++++++++++++++
>   20 files changed, 2990 insertions(+), 145 deletions(-)
>   create mode 100644 crypto/akcipher-nettle.c
>   create mode 100644 crypto/akcipher.c
>   create mode 100644 crypto/asn1_decoder.c
>   create mode 100644 crypto/asn1_decoder.h
>   create mode 100644 include/crypto/akcipher.h
>   create mode 100644 tests/bench/benchmark-crypto-akcipher.c
>   create mode 100644 tests/bench/test_akcipher_keys.inc
>   create mode 100644 tests/unit/test-crypto-akcipher.c
> 


