Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DCB3D2BA5
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:01:45 +0200 (CEST)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6d0x-0001ND-OK
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6csw-0006ot-Ad
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:53:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6cst-0002XJ-3k
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BUGEDrvDrkdnybG4YE3OQFBFsKppcfcF1RVLI038sIo=;
 b=c4FnsIwxltA8eTkmGUXfKPSLsjTi7bmJ+e0+i5bD3+D9sX5x0LiTmj+VWrjJWt7wtIgS0s
 Mn7i4Fqdt97r6Ld/EpPQcEiNc+mpRTOZVmg7+HF/afChXI/N2v96fNSvU8FWaXMbUQ1nfK
 bV1+zRhLR0ljqEukzzdO5a27HiyH4T8=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-4Vt3oPVgO0OufR6xngfDMA-1; Thu, 22 Jul 2021 13:53:21 -0400
X-MC-Unique: 4Vt3oPVgO0OufR6xngfDMA-1
Received: by mail-oi1-f198.google.com with SMTP id
 s24-20020a0568080b18b029025cbda427bbso1887848oij.5
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BUGEDrvDrkdnybG4YE3OQFBFsKppcfcF1RVLI038sIo=;
 b=QfBmG7AeskaZudVAOCnP7kGUXuhaTVHhCoVq4VwxhgMFdsR3VpSxTH33td42Kf5yGQ
 B85zEz0XUWbDwvU2SV9lNlD0dmHkg6k34CCC46RjsOtlp/JJwdh05x/gnENyvQADX7MT
 RrsGOXHiZWVMJqhyELm/EG2v3w5SC5fDf9brHqWuchH4MUUngc6B7yzMsqL3ba05ouVL
 pRacp7fcXjKBkQ+Vh9w1ZtIGWgAPpV+slkhgw+btSY2cinWeAJS59DBjDiLi6EWBrjB1
 NrKSJRxoBUeNrmGiOG5BENbbLyNgEykVjGyUqZJRSmM5CZNC3JS5TJjdVQRpD2edJsZS
 PpMw==
X-Gm-Message-State: AOAM532gtR+xfq9F4e5VDSNQYnwu58bF70+DbkSdKGbYrVRpZYCgjvwJ
 S3tJsMBQfL6b7/Oov7zbZv4CgBLP6mkSAszGuNr+YYTbAvBJwdOBeLg8gyAOBIKuLlUtZU7KYc8
 XU7+inBSGzGn+g/Y=
X-Received: by 2002:a54:488f:: with SMTP id r15mr857581oic.130.1626976400384; 
 Thu, 22 Jul 2021 10:53:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVc9F1fOlsFQ9LMMFmUvcXX0lsG4ZB1b5VWL93dfX7guKilv+syk2srUjxQkEMcJAidUEAPQ==
X-Received: by 2002:a54:488f:: with SMTP id r15mr857561oic.130.1626976400271; 
 Thu, 22 Jul 2021 10:53:20 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-176.ks.ok.cox.net. [68.102.25.176])
 by smtp.gmail.com with ESMTPSA id l7sm98923oie.32.2021.07.22.10.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 10:53:19 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [RFC PATCH v2 12/44] target/i386/tdx: Finalize the TD's
 measurement when machine is done
To: isaku.yamahata@gmail.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 alistair@alistair23.me, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, cohuck@redhat.com, mtosatti@redhat.com,
 xiaoyao.li@intel.com, seanjc@google.com, erdemaktas@google.com
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <a9948a7cd4f002ba4c3161287b366f4378523502.1625704981.git.isaku.yamahata@intel.com>
Message-ID: <b4cc314b-1ba9-122a-f9c3-2d5b528f5f73@redhat.com>
Date: Thu, 22 Jul 2021 12:53:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a9948a7cd4f002ba4c3161287b366f4378523502.1625704981.git.isaku.yamahata@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 7:54 PM, isaku.yamahata@gmail.com wrote:
> From: Xiaoyao Li <xiaoyao.li@intel.com>
> 
> Invoke KVM_TDX_FINALIZEMR to finalize the TD's measurement and make
> the TD vCPUs runnable once machine initialization is complete.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>   target/i386/kvm/kvm.c |  7 +++++++
>   target/i386/kvm/tdx.c | 21 +++++++++++++++++++++
>   target/i386/kvm/tdx.h |  3 +++
>   3 files changed, 31 insertions(+)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index be0b96b120..5742fa4806 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -53,6 +53,7 @@
>   #include "migration/blocker.h"
>   #include "exec/memattrs.h"
>   #include "trace.h"
> +#include "tdx.h"
>   
>   //#define DEBUG_KVM
>   
> @@ -2246,6 +2247,12 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>           return ret;
>       }

This is probably a good place in the series to update the comment
preceding the sev_kvm_init call since TDX is now here and otherwise
the comment seems untimely.

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


