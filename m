Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF544DB708
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 18:21:44 +0100 (CET)
Received: from localhost ([::1]:46270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUXLD-0005wv-BZ
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 13:21:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUXJf-0005Fw-M5
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 13:20:07 -0400
Received: from [2a00:1450:4864:20::533] (port=38796
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUXJd-0003Fj-Ru
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 13:20:07 -0400
Received: by mail-ed1-x533.google.com with SMTP id h13so3610191ede.5
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 10:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JkywS5GuaqnFsYT3fuDtgfghG6HZHgeWXsKwwNyihrU=;
 b=N6ePRRyXMAMaZv+3O+ooI/PmZ1uR6aGU9plyLc1ozMyrKhWhqJHMDxE1KpxqexyCOQ
 5io57h0K91H8zMlblDdXpfX8OMMq37HrnM3S3pSHPniPW1gJA7hW9jAoVu0Y+CtkDDm7
 b4xKm2Wm2B4BmpiDWDxsMzaTBXaVbFI4CP/C5zqiz/pDhYRAgORDMkJdWm7xBaydTqHr
 pLNi1tqFr43Y02mfVGvkzxpqjcKuKTrL3J6QEHsLjIRn67j33uRGOKUyIJh9UEyCZVQJ
 C8RWg4dux0G1gTuQiflRQuVld4PyB72b5Y0kw/0oqkkSQjV8LHhMiId0Zm3TRGwJh/OZ
 1OFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JkywS5GuaqnFsYT3fuDtgfghG6HZHgeWXsKwwNyihrU=;
 b=ypsjOSkFrsTWC3dZn9gJUFkjNiznq7dw51GPxofWdaoXpvQF2NCZ05ZpZuE7UWCJwb
 Mc2aUiXi8bO8VRBvRRFEJHXgIMCpig2uMLYKZtrRRSSsvEB3Tx0RPG3Vzp3f0IRzo8/a
 OSFzV476iafcCY2djQBdv1VZg8BKmkMb5uE6hX8w/R9QcS3BR5Mdwa9oYzNeHlTpK9cS
 qfyLDuHVnAsq0uEHKJnbSYZlqLT8CBd5cNPosgPIESxtS6PFO11wXwsFJXAkWWFXr0Gw
 xNulCDCKfCzsp0n7LRJN/9/l6q7zmlmcNk91RMJl42szWjptCFd/4damLmszueXFHM0h
 6bfA==
X-Gm-Message-State: AOAM532QCDkRvQF6ErVAFxICmciuu/EpQTRCTCrKeqCJ07KsN0pToKz7
 c6kfv/J5Mr7ztFNFWnaHNT8=
X-Google-Smtp-Source: ABdhPJwaGmAXObv2pN7VBSxQoNmHiwUEvbHYAVgl1SoLhynlIYucj+rcFnF28F6YymVZykZLOv8Zaw==
X-Received: by 2002:a05:6402:d51:b0:416:5f17:990 with SMTP id
 ec17-20020a0564020d5100b004165f170990mr488317edb.239.1647451203703; 
 Wed, 16 Mar 2022 10:20:03 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 b13-20020aa7d48d000000b00418d53c61acsm1299643edr.85.2022.03.16.10.20.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 10:20:03 -0700 (PDT)
Message-ID: <19c431c2-283b-b483-6bd1-6817e483eb3a@redhat.com>
Date: Wed, 16 Mar 2022 18:20:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 15/22] x86: Grant AMX permission for guest
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
 <20220308113445.859669-16-pbonzini@redhat.com>
 <YjII86LKWTe0mVED@angien.pipo.sk> <YjIKrSZGcvh3/Aq7@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YjIKrSZGcvh3/Aq7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org,
 Jing Liu <jing2.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/22 17:05, Daniel P. Berrangé wrote:
> On Wed, Mar 16, 2022 at 04:57:39PM +0100, Peter Krempa wrote:
>> On Tue, Mar 08, 2022 at 12:34:38 +0100, Paolo Bonzini wrote:
>>> From: Yang Zhong <yang.zhong@intel.com>
>>>
>>> Kernel allocates 4K xstate buffer by default. For XSAVE features
>>> which require large state component (e.g. AMX), Linux kernel
>>> dynamically expands the xstate buffer only after the process has
>>> acquired the necessary permissions. Those are called dynamically-
>>> enabled XSAVE features (or dynamic xfeatures).
>>>
>>> There are separate permissions for native tasks and guests.
>>>
>>> Qemu should request the guest permissions for dynamic xfeatures
>>> which will be exposed to the guest. This only needs to be done
>>> once before the first vcpu is created.
>>>
>>> KVM implemented one new ARCH_GET_XCOMP_SUPP system attribute API to
>>> get host side supported_xcr0 and Qemu can decide if it can request
>>> dynamically enabled XSAVE features permission.
>>> https://lore.kernel.org/all/20220126152210.3044876-1-pbonzini@redhat.com/
>>>
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
>>> Signed-off-by: Jing Liu <jing2.liu@intel.com>
>>> Message-Id: <20220217060434.52460-4-yang.zhong@intel.com>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>   target/i386/cpu.c          |  7 +++++
>>>   target/i386/cpu.h          |  4 +++
>>>   target/i386/kvm/kvm-cpu.c  | 12 ++++----
>>>   target/i386/kvm/kvm.c      | 57 ++++++++++++++++++++++++++++++++++++++
>>>   target/i386/kvm/kvm_i386.h |  1 +
>>>   5 files changed, 75 insertions(+), 6 deletions(-)
>>
>> With this commit qemu crashes for me when invoking the following
>> QMP command:
> 
> It is way worse than that even. If you remove '-S' you get an
> immediate kaboom on startup on AMD hosts
> 
> $ ./build/qemu-system-x86_64 -accel kvm
> Unable to init server: Could not connect: Connection refused
> qemu-system-x86_64: ../target/i386/kvm/kvm-cpu.c:105: kvm_cpu_xsave_init: Assertion `esa->size == eax' failed.
> Aborted (core dumped)

I'll check it tomorrow, thanks.

Paolo


