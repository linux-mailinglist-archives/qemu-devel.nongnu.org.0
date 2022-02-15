Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB844B747C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 19:59:08 +0100 (CET)
Received: from localhost ([::1]:47862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK32Y-0007Pr-QK
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 13:59:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nK2pT-00029S-FQ; Tue, 15 Feb 2022 13:45:38 -0500
Received: from [2607:f8b0:4864:20::32c] (port=44722
 helo=mail-ot1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nK2pO-0008D3-Fa; Tue, 15 Feb 2022 13:45:35 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 s6-20020a0568301e0600b0059ea5472c98so14382867otr.11; 
 Tue, 15 Feb 2022 10:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=168B1VhNfkYi6069xFDg6mfGsiPwApM+WMEdesjpZBU=;
 b=aFK+1Gndq7Gjhydad8DLG0C8KpBmmTu/7Y6aSZjzYXL97/RfeZAl82KD5XVrWLD6pS
 JrU4WKCfhIEhi2nk7RXUmt8xQRYAfwfLHDLLZxvLFKIlnAbqENS93WH6kCNmADBz8UYJ
 PANRL+W9Ef+DWprsYb7hLvQECxRCBmee0bcCDgXYi62gTPk3TvmDUFiUXPHcHk2kBXf4
 FpDtcICJXF9CFNUhmlLonum9nadCfH7zN49FA3a6Wr37fKgKq0EyRTJhwVWJcMBOM226
 rmK8kRBrse0GiueCFZL0CmA9lr7tIbpmDkGsycT77ceoTRtzdEXeEU95kXYDjnZ1/NDd
 nnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=168B1VhNfkYi6069xFDg6mfGsiPwApM+WMEdesjpZBU=;
 b=S3FZdjKVJKY3KWNkbD2h4HNeigs7y3UvdVbJ7pCkQ74Fj/ZftsLfWDLPUU7YnCgdvv
 OpQgQFWuT04CIqbZYySVEVeiAUB5913O8mfv61uxEz+zC969mrnWQmoBfv6TOeKMC+en
 onlBF+P5sAVAEglsgG1nds7t6twGa+P9EeSS+G1oIGADgR9kVO8szYC6M5sy5Q9SemYa
 HucQ+NNkez/ubJJN2XA6XOfLUM5q0630D+BEJ3zfi++uEVaTqmvYoGc38heTJVPX447r
 qsCRH5/QRzv5ay9wkhjFwQzM5Kxm0HzG/uNEtG8cl98UmiHcNV89vzTU/givhbRMybNE
 jm2Q==
X-Gm-Message-State: AOAM532cxxHP6s9fKSx6+XqGuvjX9KYh85FiPmrlSwtq83AnFROmtrkO
 gg9T47PftmM5p2Pb5etU+KyylxrB0LM=
X-Google-Smtp-Source: ABdhPJwo7vTIGiDGCp4n0fYtHPKA696F6v21uS70236bnFHs0CVgYfFxRhbcL7d4HHyUz4CGXXb6hA==
X-Received: by 2002:a9d:755a:: with SMTP id b26mr169837otl.230.1644950724905; 
 Tue, 15 Feb 2022 10:45:24 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:367f:eb9c:8725:6b7f:76b3?
 ([2804:431:c7c6:367f:eb9c:8725:6b7f:76b3])
 by smtp.gmail.com with ESMTPSA id a19sm14137830otf.27.2022.02.15.10.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 10:45:24 -0800 (PST)
Message-ID: <a7025097-79c9-cb23-71bb-b38b21c9d809@gmail.com>
Date: Tue, 15 Feb 2022 15:45:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/9] ppc: nested KVM HV for spapr virtual hypervisor
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <459593cb-6ab7-1998-687d-7b4b96f8cb97@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <459593cb-6ab7-1998-687d-7b4b96f8cb97@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/15/22 15:33, Cédric Le Goater wrote:
> On 2/15/22 04:16, Nicholas Piggin wrote:
>> Here is the rollup of patches in much better shape since the RFC.
>> I include the 2 first ones unchanged from independent submission
>> just to be clear that this series requires them.
>>
>> Thanks Cedric and Fabiano for wading through my poor quality RFC
>> code, very good changes suggested and I hope I got most of them
>> and this one is easier to follow.
> 
> This is in good shape and functional. I will try to propose a small
> buildroot environment for it, so that we don't have to start a full
> distro to test.
> 
> I would like to talk about the naming. KVM-HV is I think "reserved"
> to the PowerNV platform (baremetal). We also have KVM-PR which runs
> KVM guests on various platforms, including pseries.
> 
> How can we call this yet another KVM PPC implementation ?

Do we need a new name? I believe Nick uses the stock kvm_hv kernel module in this
implementation.

If we want a name to differ between the different KVM-HV usages, well, I'd suggest
KVM-EHV (Emulated HV) or KVM-NHV (Nested HV) or KVM-VHV (Virtual HV) or anything
that suggests that this is a different flavor of using KVM-HV.


Thanks,


Daniel

> 
> Thanks,
> 
> C.
> 
>>
>> Thanks,
>> Nick
>>
>> Nicholas Piggin (9):
>>    target/ppc: raise HV interrupts for partition table entry problems
>>    spapr: prevent hdec timer being set up under virtual hypervisor
>>    ppc: allow the hdecr timer to be created/destroyed
>>    target/ppc: add vhyp addressing mode helper for radix MMU
>>    target/ppc: make vhyp get_pate method take lpid and return success
>>    target/ppc: add helper for books vhyp hypercall handler
>>    target/ppc: Add powerpc_reset_excp_state helper
>>    target/ppc: Introduce a vhyp framework for nested HV support
>>    spapr: implement nested-hv capability for the virtual hypervisor
>>
>>   hw/ppc/pegasos2.c        |   6 +
>>   hw/ppc/ppc.c             |  22 ++-
>>   hw/ppc/spapr.c           |  41 ++++-
>>   hw/ppc/spapr_caps.c      |  11 +-
>>   hw/ppc/spapr_cpu_core.c  |   6 +-
>>   hw/ppc/spapr_hcall.c     | 321 +++++++++++++++++++++++++++++++++++++++
>>   include/hw/ppc/ppc.h     |   3 +
>>   include/hw/ppc/spapr.h   |  74 ++++++++-
>>   target/ppc/cpu.h         |   8 +-
>>   target/ppc/excp_helper.c | 129 ++++++++++++----
>>   target/ppc/mmu-radix64.c |  41 ++++-
>>   11 files changed, 610 insertions(+), 52 deletions(-)
>>
> 
> 

