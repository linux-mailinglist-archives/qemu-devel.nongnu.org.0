Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F9B49F804
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 12:14:44 +0100 (CET)
Received: from localhost ([::1]:46160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDPDH-0001fA-KO
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 06:14:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nDP8J-0006UE-BX
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:09:35 -0500
Received: from [2a00:1450:4864:20::52f] (port=44954
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nDP8H-0005hk-KP
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:09:35 -0500
Received: by mail-ed1-x52f.google.com with SMTP id u24so9058056eds.11
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 03:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BbhyAOW+yxiAX1idSRXp9cwqZzcZdnpVQ6iBb75z8ZE=;
 b=OEews7PALJk5/pOo8smP6MuWWC87D7qVwNFxoXqCNxx3EFYs5KcqYfhOcbF4h5iGzz
 z+RRhV/FETcN46bak3fd8wKlYw28kzSJK09WGPkcqGU/7vei7JzKX3W3zVy1R4cxAO4P
 OvfjWlfQSQxnSSGaJ9PQia3mrD6aIjiX3p86Bm85hlYSGkr4hISvKJwN+W4bc0+0cqWW
 gQ820ABy+eoBdgQMdnXmuj/W2uwZ+GvZBtPnar9uG2Yx9R1pfsgJ4zq3yvs5/CT2wfvJ
 3/RXKarKe71BpLixRs7hZQjFzOKvY6Vu2pz4N/w+n0zuAF8iuijkZ6ejZeP1nHZw6OCD
 DmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BbhyAOW+yxiAX1idSRXp9cwqZzcZdnpVQ6iBb75z8ZE=;
 b=4cFyPgKfGJOS1O/ci307XrbCTUTFIlXebxLTm4UEc+be5UsVm5UEa9qVRogpHZT87E
 aFanTLy6esbqwzFYI5WTfIUUAR4eCQrYF0Hw0F6ApWh9+HWL5D8QCah/HHkwNo9MW8LO
 gK6xnpXFODb9sLvK8fM6tt9DLYPH4iPehBpACeIN7jrUTtxuyxB66YHARYgJuHPWLv5Y
 1sPy0K3gg3PFWjXeimVHA8CCy42jqoje66IoA2XxJ+TldBf4DPxyWG+9QC+eBiEbJ/GN
 HT24ZIKU8rHsThgUPTEDUsPjSBUA7RsTHturHZWSodoDY8WbGzB/e7t+237P+kxaEn5K
 FnZA==
X-Gm-Message-State: AOAM531YYX9TW4yoz8Q8OkvqIvcSJdeJHEZHEYaP4bEYB24Ln10MW4Oi
 IRpd2xq8vks2NWnlX5SpVHk=
X-Google-Smtp-Source: ABdhPJwaVF77qg4ZxlXAmzCCBvWm1gBP53HQwhv9Gxo+fBJunJJuBCOXcdizoEqDnciexuSL0PMdoQ==
X-Received: by 2002:aa7:dbc3:: with SMTP id v3mr7929016edt.32.1643368172143;
 Fri, 28 Jan 2022 03:09:32 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id oz3sm9804822ejb.219.2022.01.28.03.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 03:09:31 -0800 (PST)
Message-ID: <bbcb6166-5c5f-bd61-887d-935713bb7bd2@redhat.com>
Date: Fri, 28 Jan 2022 12:09:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/7] x86: Grant AMX permission for guest
Content-Language: en-US
To: Yang Zhong <yang.zhong@intel.com>
References: <20220124075523.108875-1-yang.zhong@intel.com>
 <20220124075523.108875-4-yang.zhong@intel.com>
 <cdd1bc06-619c-cd8c-b9cf-e6da22fd8751@redhat.com>
 <20220127134520.GA8954@yangzhon-Virtual>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220127134520.GA8954@yangzhon-Virtual>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kevin.tian@intel.com, seanjc@google.com, jing2.liu@linux.intel.com,
 qemu-devel@nongnu.org, wei.w.wang@intel.com, guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/22 14:45, Yang Zhong wrote:
>    
>    Thanks Paolo, from your below KVM changes:
>    https://lore.kernel.org/kvm/20220126152210.3044876-3-pbonzini@redhat.com/T/#m7bf9a03c47c29d21deb78604bc290a45aa5e98f5
> 
>    So the changes in kvm_arch_get_supported_cpuid() like below?
>    +    } else if (function == 0xd && index == 0 && reg == R_EAX) {

&& (reg == R_EAX || reg == R_EDX)

>    +	struct kvm_device_attr attr = {
>    +		.group = 0,
>    +		.attr = KVM_X86_XCOMP_GUEST_SUPP,
>    +		.addr = (unsigned long) &bitmask
>    +	};
>    +
>    +	kvm_fd = open_kvm_dev_path_or_exit();
>    +	rc = ioctl(kvm_fd, KVM_GET_DEVICE_ATTR, &attr);

Yes, you need to check if it fails though (and in that case do not 
assign).  The file descriptor is already there in QEMU, so you can use 
kvm_ioctl.

>   +     ret = bitmask;

To support R_EDX as well:

ret = (reg == R_EAX) ? bitmask : bitmask >> 32;

>    So in the kvm_request_xsave_components(), we can do below steps?
>   
>    +    /* Check supported_xr0 firstly */
>    +    rc = kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EAX);
>    +    if (!(rc & XFEATURE_XTILE_MASK)) {

rc = kvm_arch_get_supported_cpuid(s, 0xd, 0,
                                   (xdata_bit < 32 ? R_EAX : R_EDX));
if (!(rc & BIT(xdata_bit & 31)) {
     ...
}

Also please use warn_report and don't exit.  With e.g. "-cpu 
foo,amx,xfd,enforce" you should not reach this code at all if the host 
lacks AMX.

Thanks,

Paolo

>    +        error_report("host xcr0 can't support AMX xdata and rc=0x%lx", rc);
>    +        exit(EXIT_FAILURE);
>    +    }
> 
>    +   /* request amx permission */
>    +   syscall(ARCH_REQ_XCOMP_GUEST_PERM, xdata_bit);
> 
> 
>    +   /* check amx permission */
>    +   syscall(ARCH_GET_XCOMP_GUEST_PERM);


