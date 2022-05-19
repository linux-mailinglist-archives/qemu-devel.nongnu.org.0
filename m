Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DFA52D02B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 12:10:15 +0200 (CEST)
Received: from localhost ([::1]:38990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrd6Z-0000ja-Rt
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 06:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrd26-0005tL-Cy
 for qemu-devel@nongnu.org; Thu, 19 May 2022 06:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrd23-0004OI-P5
 for qemu-devel@nongnu.org; Thu, 19 May 2022 06:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652954722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KeFAnuq7dSkV3sHbZVHPg2BvSeVnPZbjkizgfIWRBw=;
 b=WVyK46N7SPeht6y7n9Y81Mgy7KRZ3ECpfaHAgHriAds+CI2ezKaJHKGIjlyXVABMZTCu9d
 OGrc7kRI+N5sANjGfFucLnTdCQ7R3sQckESSf1XELK676jxLQoLFfzAFKaB6zPGc0pCtFg
 bObEccYh5JI7cRKaz3qVGSk7LnIWXac=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-egmS0BhDN6yzU8EPO-8tlQ-1; Thu, 19 May 2022 06:05:21 -0400
X-MC-Unique: egmS0BhDN6yzU8EPO-8tlQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so1671188wmj.0
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 03:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1KeFAnuq7dSkV3sHbZVHPg2BvSeVnPZbjkizgfIWRBw=;
 b=gBGVO0gUFiO9IvwYEku/kONbxZmCcVvmEVne0EajGpUqgla2hP20TYlTxlcmRVAZpn
 aFOZWFv5NZ8mgHjgAjYAlfSTIobv+QzXR3sHrJ7o3Jz6p7TOOm22dETXGrITOTzPbT98
 eoaKZIkSdioMbg7RyGLO1dzSYOZITucKuKhi0BWY1MmoqOaCZf2KlcfxsF3oWk1qNFA9
 8ML8glYnXgxXlQsGbehoEFLCgm1fAKerK0HS0/5uPE6hUpoX+azrnnz8wAxMtL7XNDrD
 FwzHudLpOdm6a15vIF08Zj5xlUmeXCLmU1BcPSOuv1qiu7oPp+AsIRIZgLSmXoY/rIKF
 8kiA==
X-Gm-Message-State: AOAM5312YG4UgESILj1Hc4Mgk2xGb7Ye5JUUkOHw7AnqaZ/HEkchEhjs
 V/PybRRfNVPmBIXDlSeqBwmwJ7Dsp4ifhVU6Wk3rOu9ZWxnhwG16RV5Ya3OyEBR7QbW/xHBicLU
 U/2lqzrmHhv7oGIA=
X-Received: by 2002:a05:600c:3d89:b0:396:fd5d:8934 with SMTP id
 bi9-20020a05600c3d8900b00396fd5d8934mr3450441wmb.161.1652954720317; 
 Thu, 19 May 2022 03:05:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXPl1kLu4OFG46AddARtBNypwx+4NJPy6jK2XEXTZ+s9tEaUfY6Huu3AbMWnVLid/RGBuLwQ==
X-Received: by 2002:a05:600c:3d89:b0:396:fd5d:8934 with SMTP id
 bi9-20020a05600c3d8900b00396fd5d8934mr3450426wmb.161.1652954720142; 
 Thu, 19 May 2022 03:05:20 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-176-97.web.vodafone.de.
 [109.43.176.97]) by smtp.gmail.com with ESMTPSA id
 v23-20020adfa1d7000000b0020d09f0b766sm4543203wrv.71.2022.05.19.03.05.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 03:05:19 -0700 (PDT)
Message-ID: <21468730-e57f-a54a-bde4-6bb927d6b651@redhat.com>
Date: Thu, 19 May 2022 12:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] target/s390x: kvm: Honor storage keys during emulation
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, 
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20220506153956.2217601-1-scgl@linux.ibm.com>
 <20220506153956.2217601-3-scgl@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220506153956.2217601-3-scgl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 06/05/2022 17.39, Janis Schoetterl-Glausch wrote:
> Storage key controlled protection is currently not honored when
> emulating instructions.
> If available, enable key protection for the MEM_OP ioctl, thereby
> enabling it for the s390_cpu_virt_mem_* functions, when using kvm.
> As a result, the emulation of the following instructions honors storage
> keys:
> 
> * CLP
>    	The Synch I/O CLP command would need special handling in order
>    	to support storage keys, but is currently not supported.
> * CHSC
> 	Performing commands asynchronously would require special
> 	handling, but commands are currently always synchronous.
> * STSI
> * TSCH
> 	Must (and does) not change channel if terminated due to
> 	protection.
> * MSCH
> 	Suppressed on protection, works because fetching instruction.
> * SSCH
> 	Suppressed on protection, works because fetching instruction.
> * STSCH
> * STCRW
> 	Suppressed on protection, this works because no partial store is
> 	possible, because the operand cannot span multiple pages.
> * PCISTB
> * MPCIFC
> * STPCIFC
> 
> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
> ---
>   target/s390x/kvm/kvm.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 53098bf541..7bd8db0e7b 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -151,12 +151,15 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>   static int cap_sync_regs;
>   static int cap_async_pf;
>   static int cap_mem_op;
> +static int cap_mem_op_extension;
>   static int cap_s390_irq;
>   static int cap_ri;
>   static int cap_hpage_1m;
>   static int cap_vcpu_resets;
>   static int cap_protected;
>   
> +static bool mem_op_storage_key_support;
> +
>   static int active_cmma;
>   
>   static int kvm_s390_query_mem_limit(uint64_t *memory_limit)
> @@ -354,6 +357,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>       cap_sync_regs = kvm_check_extension(s, KVM_CAP_SYNC_REGS);
>       cap_async_pf = kvm_check_extension(s, KVM_CAP_ASYNC_PF);
>       cap_mem_op = kvm_check_extension(s, KVM_CAP_S390_MEM_OP);
> +    cap_mem_op_extension = kvm_check_extension(s, KVM_CAP_S390_MEM_OP_EXTENSION);
> +    mem_op_storage_key_support = cap_mem_op_extension > 0;

Ah, so KVM_CAP_S390_MEM_OP_EXTENSION is a "version number", not a boolean 
flag? ... ok, now I've finally understood that ... ;-)

(would it be better to treat it as a flag field, so that certain extensions 
could go away again in the future? In that case, it would be better to check 
with "& 1" instead of "> 0" here)

  Thomas


