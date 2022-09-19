Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBDE5BD490
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:12:01 +0200 (CEST)
Received: from localhost ([::1]:58688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaLFQ-0006kk-S7
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaKwb-0005LA-L3
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:52:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaKwY-0005UV-II
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663609949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BkiAZ7r4DddSXzZBQvqKq86FshUKONOpvYf9NNixnto=;
 b=JRHYJPwBCQpaour3Ih/ds3p+3G2bWvhQNFmT+dzHUVWSVkKfjUqs+n7ErUr2F8Et9IVZIe
 hxgUnMHD0JMx/C1+HTL3SrszfGmVEOlf+EhAhdTjT6gBDMI7J9lbk29xD7cWPMq1mtxwLc
 sV3HZSit/j0cqS8i5sZplQq68/3UKBA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-pEu5sMN_OtyhiW7EoCYI0Q-1; Mon, 19 Sep 2022 13:52:27 -0400
X-MC-Unique: pEu5sMN_OtyhiW7EoCYI0Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 t13-20020a056402524d00b00452c6289448so108172edd.17
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=BkiAZ7r4DddSXzZBQvqKq86FshUKONOpvYf9NNixnto=;
 b=HVJr5KslH9krQT8r6Mfb2bbMM9J4yavKuTScjrf7mxrPfAeYN01CpRGiEu1lt91jO/
 uz91l+35HiUW3spg+RANqfke+LjuQexWGaV9zPi3IzVUu2vaM8aB4sFngoy7pEpYnajb
 Jfs6s8RZ/FzIbELVlD8fuqunutT1q2vvY0QpB4Ny3PWBK2Vlxpe0EQptVPXFnBWiLyRV
 R8kpueH2BU/I30E8efDLPa7pqY9Z88KlbEdCZMQU2FWQhPfw+k+Tw/GCmJmPjJfV5WBv
 xBu/HDphytY4Yxv6m9skMms2dR3xdfPCR8Fk8cgVtG6eEGhswm2d3ZU53tcY39ZHznN/
 gj4A==
X-Gm-Message-State: ACrzQf2msKfrQcZPg6vXtEfCOzxsm8eLlgPcl+zPmFcVm84urUgYLeXh
 r6K/M3NvgnEbO0BgTMJRrCutt4n5s2tNmmEy6eEcojcZQB3wpYC/sEMiOVgg22cRDPFfhdBOWht
 oHwlror4cGjh6jyg=
X-Received: by 2002:a05:6402:2793:b0:452:5e81:c624 with SMTP id
 b19-20020a056402279300b004525e81c624mr16846176ede.36.1663609946762; 
 Mon, 19 Sep 2022 10:52:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4x+YEG1cAaVDP8wsIdjF3Kym8B8PeG5dMNriRKG5S9WMoV44/5Cr4VPFsIRltnzxBTn4d9/A==
X-Received: by 2002:a05:6402:2793:b0:452:5e81:c624 with SMTP id
 b19-20020a056402279300b004525e81c624mr16846160ede.36.1663609946494; 
 Mon, 19 Sep 2022 10:52:26 -0700 (PDT)
Received: from [192.168.8.103] (tmo-083-219.customers.d1-online.com.
 [80.187.83.219]) by smtp.gmail.com with ESMTPSA id
 cq26-20020a056402221a00b0044e81fa2055sm20781711edb.59.2022.09.19.10.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 10:52:26 -0700 (PDT)
Message-ID: <2be52925-a828-dcb8-715c-d6e9a69cd678@redhat.com>
Date: Mon, 19 Sep 2022 19:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: edgar.iglesias@amd.com, francisco.iglesias@amd.com,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220910061252.2614-1-vikram.garhwal@amd.com>
 <20220910061252.2614-4-vikram.garhwal@amd.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [QEMU][PATCH 4/5] tests/qtest: Introduce tests for Xilinx VERSAL
 CANFD controller
In-Reply-To: <20220910061252.2614-4-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.952, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/09/2022 08.12, Vikram Garhwal wrote:
> The QTests perform three tests on the Xilinx VERSAL CANFD controller:
>      Tests the CANFD controllers in loopback.
>      Tests the CANFD controllers in normal mode with CAN frame.
>      Tests the CANFD controllers in normal mode with CANFD frame.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>   tests/qtest/meson.build       |   1 +
>   tests/qtest/xlnx-canfd-test.c | 421 ++++++++++++++++++++++++++++++++++
>   2 files changed, 422 insertions(+)
>   create mode 100644 tests/qtest/xlnx-canfd-test.c
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index e910cb32ca..c3802fd788 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -217,6 +217,7 @@ qtests_aarch64 = \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
>     (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_XLNX_VERSAL') ? ['xlnx-canfd-test'] : []) + \
>     ['arm-cpu-features',
>      'numa-test',
>      'boot-serial-test',
> diff --git a/tests/qtest/xlnx-canfd-test.c b/tests/qtest/xlnx-canfd-test.c
> new file mode 100644
> index 0000000000..15dc03c98c
> --- /dev/null
> +++ b/tests/qtest/xlnx-canfd-test.c
> @@ -0,0 +1,421 @@
> +/*
> + * QTests for the Xilinx Versal CANFD controller.
> + *
> + * Copyright (c) 2022 AMD Inc.
> + *
> + * Written-by: Vikram Garhwal<vikram.garhwal@amd.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */

It's just my personal taste, but could you maybe add a SPDX license 
identifier in front of the license code? ... that would make it easier to 
identify the kind of license instead of reading through the whole text to 
understand which license it is.

Apart from that, patch looks fine to me at a quick glance.

Acked-by: Thomas Huth <thuth@redhat.com>


