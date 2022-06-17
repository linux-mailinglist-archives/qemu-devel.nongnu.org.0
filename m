Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B798154F47E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 11:39:52 +0200 (CEST)
Received: from localhost ([::1]:50418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o28SD-00010M-4v
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 05:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o28Mw-0007al-JY
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 05:34:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o28Mu-00016Z-Dg
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 05:34:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655458459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Elj+7vw7WLIoWU07bQnWIGNRkhZTxsFl52yPV0Tt9js=;
 b=cMxSnNYjH7bdzx/lqWoQQmpEpXFsNVFASkxTx2IW2Id0o/yGtCSwzF4rdkkTtVU87UU5Py
 R5XMbP7kW62U8/0ymDmAZIO+Pk15vBSddQFQcaBMYKbrqS86c+k8+Tpc970VdUNlZg/XKw
 DcOIg039EnNRI5GxVCqlU82TrRKCMHo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-OAQxaC17PEavXrraT9Bhtw-1; Fri, 17 Jun 2022 05:34:07 -0400
X-MC-Unique: OAQxaC17PEavXrraT9Bhtw-1
Received: by mail-wr1-f72.google.com with SMTP id
 m24-20020adfa3d8000000b00219ea0ecfbaso827600wrb.16
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 02:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Elj+7vw7WLIoWU07bQnWIGNRkhZTxsFl52yPV0Tt9js=;
 b=7tY7fUwihOrSiXdc0w2/T0CmSfKyhEaoSf+heyjqwLiqzqVjSB/S5AcxlfJ1CnLDzm
 DjLdO9kU+2dkq1YuUejQvnxJDJmR0a/yur7X26gZ+nV7TBdkqCJqtbtx3cfWVp56QbVH
 RYKSfmcShpxJJEj7/+wqtHzQfM0qpl/NMip4mEh1jYyCnfks95XXv+UEd++vpnMaTP1L
 /bJhCwF1OkUay3NLrdGDFPm8w07ScAhhbYkSjmskBZYTSJqdtNRyHPspUlRpZB2morLa
 yP0zi203lz+NFS+tURr17NmHpA8ERhuyXniOSnL98evkyaKBK4sG7Zu/N9nbEsaMJajb
 g5RQ==
X-Gm-Message-State: AJIora8F67hYTQzGbwSOB5Gaemx3rbPOPil3esrlezpHM445RVu8wOo2
 ptZ1snSpSvIuUaYR2gj1beODPoJG9wqGcAkyS49Whz/Yk0E41xjWvC1XYfwpU90BdKaMz9QGQwK
 47bDnCcidJSHVpj8=
X-Received: by 2002:a7b:cd1a:0:b0:39c:4133:ade7 with SMTP id
 f26-20020a7bcd1a000000b0039c4133ade7mr9029317wmj.111.1655458446124; 
 Fri, 17 Jun 2022 02:34:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sD6rUFX6XekzK92utOOvoub5sPYYiCa7VhkBTHQyQLskS7doztjIFeY/GEWwwI2+k8eTSDIQ==
X-Received: by 2002:a7b:cd1a:0:b0:39c:4133:ade7 with SMTP id
 f26-20020a7bcd1a000000b0039c4133ade7mr9029298wmj.111.1655458445936; 
 Fri, 17 Jun 2022 02:34:05 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-114-75.web.vodafone.de.
 [109.42.114.75]) by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c4f8500b0039c18d3fe27sm4924130wmq.19.2022.06.17.02.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 02:34:05 -0700 (PDT)
Message-ID: <841d2152-d843-0bff-d877-6944e486a3d3@redhat.com>
Date: Fri, 17 Jun 2022 11:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 12/12] test/qtest: Add ubpf basic test case
Content-Language: en-US
To: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
 <20220617073630.535914-13-chen.zhang@intel.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220617073630.535914-13-chen.zhang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 17/06/2022 09.36, Zhang Chen wrote:
> TODO: This test case does not work. Need add ubpf.h header in qtest
> compile "-I ../ubpf/vm -I ../ubpf/vm/inc".
> I'm not sure if we need it in qtest. Because normal tests/qtest
> not including external module test case like fdt. Or we just
> need a qtest case for filter-ubpf module.
> This test will load pre-compiled ebpf binary and run it in QEMU.
> 
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
[...]
> diff --git a/tests/qtest/ubpf-test.c b/tests/qtest/ubpf-test.c
> new file mode 100644
> index 0000000000..6e70a99320
> --- /dev/null
> +++ b/tests/qtest/ubpf-test.c
> @@ -0,0 +1,64 @@
> +/*
> + * QEMU Userspace eBPF test case
> + *
> + * Copyright(C) 2022 Intel Corporation.
> + *
> + * Author:
> + *  Zhang Chen <chen.zhang@intel.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +#include "ebpf/ubpf.h"
> +
> +/*
> + * Demo userspace ebpf program
> + * The test binary use clang to build this source code:
> + * demo_ubpf.c
> + *
> + * #include <stdint.h>
> + *
> + * static uint32_t double_it(uint32_t a)
> + * {
> + *      return (a * 2);
> + * }
> + *
> + * uint32_t bpf_prog(int32_t *arg) {
> + *       uint32_t result = 0;
> + *       result = double_it(*arg);
> + *
> + *       return result;
> + * }
> + *
> + * Build the userspace ebpf program binary file:
> + * clang -O2 -target bpf -c demo_ubpf.c -o demo_ubpf.o
> + *
> + * The external terget source:
> + * printf "%b" '\x05\x00\x00\x00' > integer_5.mem
> + *
> + */
> +
> +int main(int argc, char **argc)
> +{
> +    UbpfState u_ebpf;
> +    char program_path[] = "demo_ubpf.o";
> +    /* uBPF can read target from internal source or external source*/
> +    char target_path[] = "integer_5.mem";
> +
> +    qemu_ubpf_init_jit(&u_ebpf, true);
> +
> +    g_assert_cmpuint(qemu_ubpf_prepare(&u_ebpf, program_path), ==, 0);
> +
> +    g_assert_true(qemu_ubpf_read_target(&u_ebpf, target_path));
> +
> +    g_assert_cmpuint(qemu_run_ubpf_once(&u_ebpf, u_ebpf.target,
> +		     u_ebpf.target_len), ==, 10);
> +
> +    ubpf_destroy(u_ebpf.vm);
> +
> +    return 0;
> +}

Apart from the #include "libqtest.h" there is nothing related to qtest in 
here ... should this maybe rather go into test/unit/ instead?

  Thomas


