Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3923D2B91
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:58:34 +0200 (CEST)
Received: from localhost ([::1]:45328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6cxt-0001iu-Ku
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6ctD-0007zc-HG
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:53:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6ct8-0002gU-7a
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:53:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/K4rltyqsAb7Ub8Q4FT9diwQD1UYRp71oj8U7qgcR0k=;
 b=DwSJoiqUXo6QZrhc1dNQUucL8ABshQalBnf0nuYXmmDk/5wMvBO50+f+NCSswaT4h8ayhR
 CM+gl8v5vSGRxxWw7nRlC72f7IApm06KOVytQEU9K04m3JA22+M/H+SGjcpHg50IYoXeXG
 xt/zg+NkUfHcqVkJTlc4ZHBGvOJ3+40=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-MyTET2DrOM-xWy284iNcpg-1; Thu, 22 Jul 2021 13:53:36 -0400
X-MC-Unique: MyTET2DrOM-xWy284iNcpg-1
Received: by mail-ot1-f70.google.com with SMTP id
 i11-20020a9d68cb0000b02904d0a18787d4so4153128oto.5
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/K4rltyqsAb7Ub8Q4FT9diwQD1UYRp71oj8U7qgcR0k=;
 b=sXtO0AvGn3rPMVyXEkmKJ6EW7hp3B6gEbOvxg+m3rBW2Pi91MVDIn6OJ5M4cQgeMhj
 n5Kap8U9F5SszHGOco7Qd3N1dqwsLSbefZ4OHOTpk27lItIM9i/RYrC8cILLVc8L/K2f
 CbyNeARNW1/H+cdKeumztN8/+2AIs4InvxI7xz7za/FQ44w3MQx6FQRa3yxFl9o/XquP
 1Y9B7zpbtMy+nUzbhQaZrnM8dPgm8MtUvhoWqg2O+W5y2Wb+1COCab7OomDgs0zH/9tY
 uuS2+VRR/OaHyHlZkh09UEbSLTlfk2YYfD0gGLTVlW/9fBWbeu0PCjh0Co1mn1NSl4w1
 tB6Q==
X-Gm-Message-State: AOAM533awfzOpsPk7eGn19yPXQaJFzgEbKAVmxDSxvIcuroymdDTvl2f
 awiRrOyLRxsk3Q+/BozZO9YJPP2kkX9cZCeImzbsJJmkMMjFVtg07MRWXPGGb/x3YgrJinDUXp0
 TbKYYdO4XagbepCM=
X-Received: by 2002:a9d:4f09:: with SMTP id d9mr623306otl.265.1626976415788;
 Thu, 22 Jul 2021 10:53:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeN9sQzyGrVPsk4cXiWBn35sZe9ThQAZ000dk8B7mgbgiS7OPXMDXEn3ZeJAkmnI4XqnBRhw==
X-Received: by 2002:a9d:4f09:: with SMTP id d9mr623298otl.265.1626976415641;
 Thu, 22 Jul 2021 10:53:35 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-176.ks.ok.cox.net. [68.102.25.176])
 by smtp.gmail.com with ESMTPSA id v203sm5686243oib.37.2021.07.22.10.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 10:53:35 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [RFC PATCH v2 32/44] tdx: add kvm_tdx_enabled() accessor for
 later use
To: isaku.yamahata@gmail.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 alistair@alistair23.me, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, cohuck@redhat.com, mtosatti@redhat.com,
 xiaoyao.li@intel.com, seanjc@google.com, erdemaktas@google.com
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <26d88e7618038c1fed501352a04144745abd12ae.1625704981.git.isaku.yamahata@intel.com>
Message-ID: <43a81d27-56da-07e8-b3d7-9800b6ed8da1@redhat.com>
Date: Thu, 22 Jul 2021 12:53:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <26d88e7618038c1fed501352a04144745abd12ae.1625704981.git.isaku.yamahata@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
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

On 7/7/21 7:55 PM, isaku.yamahata@gmail.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>   include/sysemu/tdx.h  | 1 +
>   target/i386/kvm/kvm.c | 5 +++++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/include/sysemu/tdx.h b/include/sysemu/tdx.h
> index 70eb01348f..f3eced10f9 100644
> --- a/include/sysemu/tdx.h
> +++ b/include/sysemu/tdx.h
> @@ -6,6 +6,7 @@
>   #include "hw/i386/pc.h"
>   
>   bool kvm_has_tdx(KVMState *s);
> +bool kvm_tdx_enabled(void);
>   int tdx_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
>   #endif
>   
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index af6b5f350e..76c3ea9fac 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -152,6 +152,11 @@ int kvm_set_vm_type(MachineState *ms, int kvm_type)
>       return -ENOTSUP;
>   }
>   
> +bool kvm_tdx_enabled(void)
> +{
> +    return vm_type == KVM_X86_TDX_VM;
> +}
> +

Is this the whole story? Does this guarantee that the VM QEMU is
responsible to bring up is a successfully initialized TD?

 From my reading of the series as it unfolded, this looks like the
function proves that KVM can support TDs and that the user requested
a TDX kvm-type, not that we have a fully-formed TD.

Is it possible to associate this with a more verifiable metric that
the TD has been or will be created successfully? I.e., once the VM
has successfully called the TDX INIT ioctl or has finalized setup?

My question mainly comes from a later patch in the series, where the
"query-tdx-capabilities" and "query-tdx" QMP commands are added.

Forgive me if I am misinterpreting the semantics of each of these
commands:

"query-tdx-capabilities" sounds like it answers the question of
"can it run a TD?"

and "query-tdx" sounds like it answers the question of "is it a TD?"

Is the assumption with "query-tdx" that anything that's gone wrong
with developing a TD will have resulted in the QEMU process exiting
and therefore if we get to a point where we can run "query-tdx" then
we know the TD was successfully formed?


