Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE6B40A6C2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 08:38:55 +0200 (CEST)
Received: from localhost ([::1]:41712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ25m-0005ZO-8Z
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 02:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ23T-0004eb-1n
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ23R-0001ET-FZ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631601388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXG4ETTJ93/lueaMCGk3QBfEggfL2Tycl1iHrmvM+io=;
 b=Wqz6sAjAgs2iXncarFc704EPhQ56Q82TvCLkYQ+3OkuaW7Z3TGBYknY1oSH9TQfLpLuvav
 of+KNou1V1Kl3q3uGR8VVGApRFUoRFeA+2U2yaKGM5dSBe1y0QOM+1k8BA4+pW990HEgzH
 ttGM7Y84oD01VtHNZJOyNwd5bedr7t8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-7KtHdiAcP7aBL9IC-fITkA-1; Tue, 14 Sep 2021 02:36:27 -0400
X-MC-Unique: 7KtHdiAcP7aBL9IC-fITkA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m4-20020a05600c3b0400b00303b904380dso323341wms.6
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 23:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sXG4ETTJ93/lueaMCGk3QBfEggfL2Tycl1iHrmvM+io=;
 b=BSYEIWra9SIrG4VQXrgNxjWyROtXHACM+y7MRVbBE6LSxHXPqcpz8eFRh7G/MqqcCG
 WppmLStjoAOK/KNyY82ObsOeuk7Dy1DbDC1Q8/5/4hD/bHg3VVvOW+8liIZLbRlfMcp6
 1gcAbgyhOh1ZqJIAgDvle5Gnoo/jBx1VJ/dwnj9hAJ9+4xmSRym/chFs4n+kWUrW3EIQ
 uzLp6clsApFZvtGw07pzuieJnzwOZhdq06iBBi6l/AGdTYO2T0rPfA16sRze+5Umt0ql
 rooqfJ7Etiwgt4ooH80YpHG3VTnThkUXDx1id4/TzuW2yxc9emSQCW+F97r/4wW4bJEL
 q92A==
X-Gm-Message-State: AOAM531twy7jdzSgsfiuJ+9vemxfRpg7dOtzkCqZ0IsUpDf+uN1DfPbu
 ZWYuOebLreXnsDbXgelFzg2I0C6Okuo4Cn9nwcCsvov47mEmlgCDQjzazrHipXFia9TYt4i8STS
 w97Zv7m9CLjL3ePQ=
X-Received: by 2002:a1c:398a:: with SMTP id g132mr307641wma.125.1631601385993; 
 Mon, 13 Sep 2021 23:36:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw77eU/tzLJ1LttwZ0DabuGzMUzbmNPESGTeCnMBRlYpBnITohU26hCBRYhRKnwW7Hg+gYeLg==
X-Received: by 2002:a1c:398a:: with SMTP id g132mr307605wma.125.1631601385713; 
 Mon, 13 Sep 2021 23:36:25 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id u6sm11350313wrp.0.2021.09.13.23.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 23:36:25 -0700 (PDT)
Subject: Re: [PATCH v4 04/33] i386: Add 'sgx-epc' device to expose EPC
 sections to guest
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-5-yang.zhong@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6a2fe37a-0016-018d-ff41-77f1e57b8aeb@redhat.com>
Date: Tue, 14 Sep 2021 08:36:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719112136.57018-5-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: seanjc@google.com, kai.huang@intel.com, eblake@redhat.com,
 jarkko@kernel.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/21 1:21 PM, Yang Zhong wrote:
> From: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> SGX EPC is enumerated through CPUID, i.e. EPC "devices" need to be
> realized prior to realizing the vCPUs themselves, which occurs long
> before generic devices are parsed and realized.  Because of this,
> do not allow 'sgx-epc' devices to be instantiated after vCPUS have
> been created.
> 
> The 'sgx-epc' device is essentially a placholder at this time, it will
> be fully implemented in a future patch along with a dedicated command
> to create 'sgx-epc' devices.
> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  hw/i386/meson.build       |   1 +
>  hw/i386/sgx-epc.c         | 161 ++++++++++++++++++++++++++++++++++++++
>  include/hw/i386/sgx-epc.h |  44 +++++++++++
>  3 files changed, 206 insertions(+)
>  create mode 100644 hw/i386/sgx-epc.c
>  create mode 100644 include/hw/i386/sgx-epc.h
> 
> diff --git a/hw/i386/meson.build b/hw/i386/meson.build
> index 80dad29f2b..27476b36bb 100644
> --- a/hw/i386/meson.build
> +++ b/hw/i386/meson.build
> @@ -5,6 +5,7 @@ i386_ss.add(files(
>    'e820_memory_layout.c',
>    'multiboot.c',
>    'x86.c',
> +  'sgx-epc.c',
>  ))
>  
>  i386_ss.add(when: 'CONFIG_X86_IOMMU', if_true: files('x86-iommu.c'),
> diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
> new file mode 100644
> index 0000000000..aa487dea79
> --- /dev/null
> +++ b/hw/i386/sgx-epc.c
> @@ -0,0 +1,161 @@
> +/*
> + * SGX EPC device
> + *
> + * Copyright (C) 2019 Intel Corporation
> + *
> + * Authors:
> + *   Sean Christopherson <sean.j.christopherson@intel.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +#include "qemu/osdep.h"
> +#include "hw/i386/pc.h"
> +#include "hw/i386/sgx-epc.h"
> +#include "hw/mem/memory-device.h"
> +#include "hw/qdev-properties.h"
> +#include "monitor/qdev.h"

Is that include used?

> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "qemu/config-file.h"

Ditto.

> +#include "qemu/error-report.h"

Ditto.

> +#include "qemu/option.h"

Ditto.

> +#include "qemu/units.h"

Ditto.

> +#include "target/i386/cpu.h"
> +#include "exec/address-spaces.h"


