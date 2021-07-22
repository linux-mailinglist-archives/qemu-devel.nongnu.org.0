Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0093D2B83
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:54:16 +0200 (CEST)
Received: from localhost ([::1]:57158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ctj-0007ax-A1
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6csF-0004hm-O9
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6csE-000277-6o
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6xP1fQO51T9rbjc3uyLaA5nbJ0QVtK1z6ySypVm5jHw=;
 b=bgsceQF65RMtShBDCgXsVm+nmWygmPNkX8+tPoBpTFG64mEINS3JzptTeEErb6e2sEcPEF
 Y1V2Y3XklE9y9mIianilGbGY3ZKjzhe9qYcc0cuAsxQPXMdBDQ3Y4g+8XsG2TrTR7p3xay
 D6knZdh1O6sPZNw2o7FOkEqwIdjBgqw=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-FXWiYe_YMe2Lda8fjKmskA-1; Thu, 22 Jul 2021 13:52:37 -0400
X-MC-Unique: FXWiYe_YMe2Lda8fjKmskA-1
Received: by mail-oi1-f198.google.com with SMTP id
 n134-20020acad68c0000b029025a4350857eso4470426oig.8
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6xP1fQO51T9rbjc3uyLaA5nbJ0QVtK1z6ySypVm5jHw=;
 b=C0BvT//zo2T9bXppAjENOmGMUEosaM0Ji4sY23qh4woMN16R7QNX3KuaFkVEM3qX30
 CyLv/wLr/4+OtMMLazuu+VVdmOQgy4LLhZ/KDdI6EoEIK/QvE6McYWfFmAUtwtE+nR7g
 GXeLIF3j2Y7sbc4x6wWS2HvqSxPasiDF9jWGLCJeznWNKpdy0cMS4lo1bDNfYzmmtmB2
 NCi+vG8mEtEbOtvXbeqTRzeOR01zbyzPKfiyfTLNN90qRqu75v+BK4Dmvr7lqC8j7LyR
 iY2NCh2AG3HwzURt1FVNk6zeXUQoxPVfaI6ztkDjDqkZF+NZPNxSnrvv0TjpZ0E65WDp
 rgNw==
X-Gm-Message-State: AOAM531H7/flwPGhGY2NPmcK8ZSLUFZ44Njkcan0hXPgErRFA12k3Vch
 P8rX/ztxISy+8/55d5X0xeCi7Cu4Am8BVWm6FtZ9ZVAmWJ+/94vEP8A99lxzmDBngH/D6gJcXrP
 cL5F7gS5cov4Y1dg=
X-Received: by 2002:a05:6830:91b:: with SMTP id
 v27mr614078ott.337.1626976356632; 
 Thu, 22 Jul 2021 10:52:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+9pKEg/reu5tUbtic0HLiZ6i9qpLtI8ghgmTFbVHFC+qdtBXV1CIM8yzw+km4VeXwZ+UqXg==
X-Received: by 2002:a05:6830:91b:: with SMTP id
 v27mr614064ott.337.1626976356484; 
 Thu, 22 Jul 2021 10:52:36 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-176.ks.ok.cox.net. [68.102.25.176])
 by smtp.gmail.com with ESMTPSA id 68sm5187184otd.74.2021.07.22.10.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 10:52:36 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [RFC PATCH v2 02/44] kvm: Switch KVM_CAP_READONLY_MEM to a per-VM
 ioctl()
To: isaku.yamahata@gmail.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 alistair@alistair23.me, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, cohuck@redhat.com, mtosatti@redhat.com,
 xiaoyao.li@intel.com, seanjc@google.com, erdemaktas@google.com
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <20f5a78e8c704adcf4e96dac4aa160b9b6a7c17c.1625704980.git.isaku.yamahata@intel.com>
Message-ID: <d5c778b5-9c1d-908b-2d26-108b3bcd8aef@redhat.com>
Date: Thu, 22 Jul 2021 12:52:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20f5a78e8c704adcf4e96dac4aa160b9b6a7c17c.1625704980.git.isaku.yamahata@intel.com>
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

On 7/7/21 7:54 PM, isaku.yamahata@gmail.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Switch to making a VM ioctl() call for KVM_CAP_READONLY_MEM, which may
> be conditional on VM type in recent versions of KVM, e.g. when TDX is
> supported.
> 
> kvm_vm_check_extension() has fallback from kvm_vm_ioctl() to
> kvm_check_extension(). fallback from VM ioctl to System ioctl for
> compatibility for old kernel.
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>   accel/kvm/kvm-all.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index e5b10dd129..fdbe24bf59 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2531,7 +2531,7 @@ static int kvm_init(MachineState *ms)
>       }
>   
>       kvm_readonly_mem_allowed =
> -        (kvm_check_extension(s, KVM_CAP_READONLY_MEM) > 0);
> +        (kvm_vm_check_extension(s, KVM_CAP_READONLY_MEM) > 0);
>   
>       kvm_eventfds_allowed =
>           (kvm_check_extension(s, KVM_CAP_IOEVENTFD) > 0);
> 

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


