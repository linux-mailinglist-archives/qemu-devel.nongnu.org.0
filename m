Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7F14E2098
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 07:24:06 +0100 (CET)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWBSX-0002w2-Ad
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 02:24:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWBGF-0000Ej-Qp
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 02:11:24 -0400
Received: from mga06.intel.com ([134.134.136.31]:11681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWBGD-0002uG-EQ
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 02:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647843081; x=1679379081;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YX3EtHyoc+rRobAvLm9ROpna2RtILtiVYzShu3ZinXU=;
 b=Yl5bqa9i2DjmROLSIG+sTVy2MYzpj4AlWxYWW2/x4se8j/EUDaO/K8wc
 bUOSGYcCidNmUnpIU0+3KwXd9+NuYgstYWgZyj6eZGOmjR0736jAprQHo
 eAxXXNbj/VP4lj5eH9cG31dguzQDmrVIbK33Hr/Xsvcbu6CiaFgctXwF2
 TVBHy5xQjjMyhO1l/mcEErCJkgpXBf8rfXPg61hWNG7y0shsgzI2Fjklt
 f0HTaQqrND8LO0T1Rghb4pOdeT4V2wB6nyHTKX1uCiAGX1KvUwYgtnLSG
 BCtk+y4H151C8a1PJWPxi1CgsBFd+awM1SThZojSHtFUFVquKCeAbKy8K A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="318186694"
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="318186694"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 23:11:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="559720521"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.169.245])
 ([10.249.169.245])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 23:11:13 -0700
Message-ID: <e3ca31cb-cd82-6214-6c5b-6293119c2098@intel.com>
Date: Mon, 21 Mar 2022 14:11:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [RFC PATCH v3 18/36] i386/tdvf: Introduce function to parse TDVF
 metadata
Content-Language: en-US
To: Isaku Yamahata <isaku.yamahata@gmail.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-19-xiaoyao.li@intel.com>
 <20220318171924.GA4050087@ls.amr.corp.intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220318171924.GA4050087@ls.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=xiaoyao.li@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 "Daniel P. Berrang???" <berrange@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daud??? <f4bug@amsat.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/2022 1:19 AM, Isaku Yamahata wrote:
> On Thu, Mar 17, 2022 at 09:58:55PM +0800,
> Xiaoyao Li <xiaoyao.li@intel.com> wrote:
> 
>> diff --git a/hw/i386/tdvf.c b/hw/i386/tdvf.c
>> new file mode 100644
>> index 000000000000..02da1d2c12dd
>> --- /dev/null
>> +++ b/hw/i386/tdvf.c
>> @@ -0,0 +1,196 @@
>> +/*
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> + * Copyright (c) 2020 Intel Corporation
>> + * Author: Isaku Yamahata <isaku.yamahata at gmail.com>
>> + *                        <isaku.yamahata at intel.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> +
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> +
>> + * You should have received a copy of the GNU General Public License along
>> + * with this program; if not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/i386/pc.h"
>> +#include "hw/i386/tdvf.h"
>> +#include "sysemu/kvm.h"
>> +
>> +#define TDX_METADATA_GUID "e47a6535-984a-4798-865e-4685a7bf8ec2"
>> +#define TDX_METADATA_VERSION    1
>> +#define TDVF_SIGNATURE_LE32     0x46564454 /* TDVF as little endian */
> 
> _LE32 doesn't make sense.  qemu doesn't provide macro version for byteswap.
> Let's convert at the usage point.

OK
>> +
>> +    /* Finally, verify the signature to determine if this is a TDVF image. */
>> +   if (metadata->Signature != TDVF_SIGNATURE_LE32) {
> 
> 
> metadata->Signature = le32_to_cpu(metadata->Signature);
> metadata->Signature != TDVF_SIGNATURE for consistency.
> 


