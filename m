Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A04C319B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 17:38:47 +0100 (CET)
Received: from localhost ([::1]:36972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNH8g-0004I9-Gr
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 11:38:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNH6V-0002Ra-4O
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:36:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNH6S-0008OA-EC
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645720587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQPHX3dWopPRgdo3LBQNfWdqjPgErL8/bSbBSPhLCDo=;
 b=PcE6/chJCoINhyUPdS0sIIBZq9Lw2VJXBH5NC3WosI1CoKvTLbV3x9svYVMfu8HDGLMyeK
 60IBVpSPjV6ttx7Z4sF3eIKEsKTf6p5E+ii5Gz2O8Cob7R6VACiqweEkvt0xWBHS27KUXv
 UQoFPKEIMEQX3+9H7arFCGIDWJElsRQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-xEczLt_YO1GXeXLOYhtclw-1; Thu, 24 Feb 2022 11:36:26 -0500
X-MC-Unique: xEczLt_YO1GXeXLOYhtclw-1
Received: by mail-wm1-f71.google.com with SMTP id
 q127-20020a1ca785000000b0037faac72dcbso1670489wme.1
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 08:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CQPHX3dWopPRgdo3LBQNfWdqjPgErL8/bSbBSPhLCDo=;
 b=TYubE7+MmmGVw7qx4I3+AAd1XZRzTawEwkJYC6eIzVuc5B8u088t6/JiC2tbQS9HOo
 3TnhrJJHjr0zPCdiYvdIhPVQnS5cCAzVVtVLOnxr0kNIRfor4f9lyWPjcsV5vZBNyZer
 cmDXxhPbOiDdS8bluwaV0jOrCBc+C1L5JsOiJ4SXGqKty1+zmNH6f8UWBdC8Uf47vbqc
 1XUzP5uaMXFpVnPA80XY/hBAJOlT2Demm+gF1wsblc142L421fRO4itpqTmNNKzc+o+d
 1wha6Xg8ovfC/T2MXbvjA5kZtDBM/edjBAUm9AJEnXxaTXlPJaUFpFGHQtvIWtjrKyVY
 6qZQ==
X-Gm-Message-State: AOAM531usQVbZ9/60viZBzx0lFa+Ih6SekLB0frqGE9ktDMwUJ7KHnTc
 rgLvr0WlSU0hPUz+HPUM0lBX9lIlqlBipyduyOwQcbAEdk0KN9zbR3dgFyeGR/NSHaYrmKrS8aP
 WGfut0EjZMJG368g=
X-Received: by 2002:a7b:c141:0:b0:381:8a:21e5 with SMTP id
 z1-20020a7bc141000000b00381008a21e5mr5314615wmi.155.1645720585362; 
 Thu, 24 Feb 2022 08:36:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzv+cBOTZyg4N8nGkK9PzsQeNEMtraE3eAffLbEibegXpdG/YzzBYPketohoYdHaQzA75zPag==
X-Received: by 2002:a7b:c141:0:b0:381:8a:21e5 with SMTP id
 z1-20020a7bc141000000b00381008a21e5mr5314599wmi.155.1645720585143; 
 Thu, 24 Feb 2022 08:36:25 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 v25-20020a05600c215900b0038117f41728sm1775264wml.43.2022.02.24.08.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 08:36:24 -0800 (PST)
Message-ID: <296c5f3c-29ce-23a8-7507-50730cb58997@redhat.com>
Date: Thu, 24 Feb 2022 17:36:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/4] hyperv: Add definitions for syndbg
To: Jon Doron <arilou@gmail.com>, qemu-devel@nongnu.org
References: <20220216102500.692781-1-arilou@gmail.com>
 <20220216102500.692781-3-arilou@gmail.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20220216102500.692781-3-arilou@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 16/02/2022 11:24, Jon Doron wrote:
> Add all required definitions for hyperv synthetic debugger interface.
> 
> Signed-off-by: Jon Doron <arilou@gmail.com>
> ---
>  include/hw/hyperv/hyperv-proto.h | 52 ++++++++++++++++++++++++++++++++
>  target/i386/kvm/hyperv-proto.h   | 37 +++++++++++++++++++++++
>  2 files changed, 89 insertions(+)
> 
> diff --git a/include/hw/hyperv/hyperv-proto.h b/include/hw/hyperv/hyperv-proto.h
> index 21dc28aee9..4a2297307b 100644
> --- a/include/hw/hyperv/hyperv-proto.h
> +++ b/include/hw/hyperv/hyperv-proto.h
> @@ -24,12 +24,17 @@
>  #define HV_STATUS_INVALID_PORT_ID             17
>  #define HV_STATUS_INVALID_CONNECTION_ID       18
>  #define HV_STATUS_INSUFFICIENT_BUFFERS        19
> +#define HV_STATUS_NOT_ACKNOWLEDGED            20
> +#define HV_STATUS_NO_DATA                     27
>  
>  /*
>   * Hypercall numbers
>   */
>  #define HV_POST_MESSAGE                       0x005c
>  #define HV_SIGNAL_EVENT                       0x005d
> +#define HV_POST_DEBUG_DATA                    0x0069
> +#define HV_RETRIEVE_DEBUG_DATA                0x006a
> +#define HV_RESET_DEBUG_SESSION                0x006b
>  #define HV_HYPERCALL_FAST                     (1u << 16)
>  
>  /*
> @@ -127,4 +132,51 @@ struct hyperv_event_flags_page {
>      struct hyperv_event_flags slot[HV_SINT_COUNT];
>  };
>  
> +/*
> + * Kernel debugger structures
> + */
> +
> +/* Options flags for hyperv_reset_debug_session */
> +#define HV_DEBUG_PURGE_INCOMING_DATA        0x00000001
> +#define HV_DEBUG_PURGE_OUTGOING_DATA        0x00000002
> +struct hyperv_reset_debug_session_input {
> +    uint32_t options;
> +} __attribute__ ((__packed__));
> +
> +struct hyperv_reset_debug_session_output {
> +    uint32_t host_ip;
> +    uint32_t target_ip;
> +    uint16_t host_port;
> +    uint16_t target_port;
> +    uint8_t host_mac[6];
> +    uint8_t target_mac[6];
> +} __attribute__ ((__packed__));
> +
> +/* Options for hyperv_post_debug_data */
> +#define HV_DEBUG_POST_LOOP                  0x00000001
> +
> +struct hyperv_post_debug_data_input {
> +    uint32_t count;
> +    uint32_t options;
> +    /*uint8_t data[HV_HYP_PAGE_SIZE - 2 * sizeof(uint32_t)];*/
> +} __attribute__ ((__packed__));
> +
> +struct hyperv_post_debug_data_output {
> +    uint32_t pending_count;
> +} __attribute__ ((__packed__));
> +
> +/* Options for hyperv_retrieve_debug_data */
> +#define HV_DEBUG_RETRIEVE_LOOP              0x00000001
> +#define HV_DEBUG_RETRIEVE_TEST_ACTIVITY     0x00000002
> +
> +struct hyperv_retrieve_debug_data_input {
> +    uint32_t count;
> +    uint32_t options;
> +    uint64_t timeout;
> +} __attribute__ ((__packed__));
> +
> +struct hyperv_retrieve_debug_data_output {
> +    uint32_t retrieved_count;
> +    uint32_t remaining_count;
> +} __attribute__ ((__packed__));
>  #endif
> diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
> index 89f81afda7..e40e59411c 100644
> --- a/target/i386/kvm/hyperv-proto.h
> +++ b/target/i386/kvm/hyperv-proto.h
> @@ -19,6 +19,9 @@
>  #define HV_CPUID_ENLIGHTMENT_INFO             0x40000004
>  #define HV_CPUID_IMPLEMENT_LIMITS             0x40000005
>  #define HV_CPUID_NESTED_FEATURES              0x4000000A
> +#define HV_CPUID_SYNDBG_VENDOR_AND_MAX_FUNCTIONS    0x40000080
> +#define HV_CPUID_SYNDBG_INTERFACE                   0x40000081
> +#define HV_CPUID_SYNDBG_PLATFORM_CAPABILITIES       0x40000082
>  #define HV_CPUID_MIN                          0x40000005
>  #define HV_CPUID_MAX                          0x4000ffff
>  #define HV_HYPERVISOR_PRESENT_BIT             0x80000000
> @@ -55,8 +58,14 @@
>  #define HV_GUEST_IDLE_STATE_AVAILABLE           (1u << 5)
>  #define HV_FREQUENCY_MSRS_AVAILABLE             (1u << 8)
>  #define HV_GUEST_CRASH_MSR_AVAILABLE            (1u << 10)
> +#define HV_FEATURE_DEBUG_MSRS_AVAILABLE         (1u << 11)
>  #define HV_STIMER_DIRECT_MODE_AVAILABLE         (1u << 19)
>  
> +/*
> + * HV_CPUID_FEATURES.EBX bits
> + */
> +#define HV_PARTITION_DEBUGGING_ALLOWED          (1u << 12)
> +
>  /*
>   * HV_CPUID_ENLIGHTMENT_INFO.EAX bits
>   */
> @@ -72,6 +81,11 @@
>  #define HV_ENLIGHTENED_VMCS_RECOMMENDED     (1u << 14)
>  #define HV_NO_NONARCH_CORESHARING           (1u << 18)
>  
> +/*
> + * HV_CPUID_SYNDBG_PLATFORM_CAPABILITIES.EAX bits
> + */
> +#define HV_SYNDBG_CAP_ALLOW_KERNEL_DEBUGGING    (1u << 1)
> +
>  /*
>   * Basic virtualized MSRs
>   */
> @@ -130,6 +144,18 @@
>  #define HV_X64_MSR_STIMER3_CONFIG               0x400000B6
>  #define HV_X64_MSR_STIMER3_COUNT                0x400000B7
>  
> +/*
> + * Hyper-V Synthetic debug options MSR
> + */
> +#define HV_X64_MSR_SYNDBG_CONTROL               0x400000F1
> +#define HV_X64_MSR_SYNDBG_STATUS                0x400000F2
> +#define HV_X64_MSR_SYNDBG_SEND_BUFFER           0x400000F3
> +#define HV_X64_MSR_SYNDBG_RECV_BUFFER           0x400000F4
> +#define HV_X64_MSR_SYNDBG_PENDING_BUFFER        0x400000F5
> +#define HV_X64_MSR_SYNDBG_OPTIONS               0x400000FF
> +
> +#define HV_X64_SYNDBG_OPTION_USE_HCALLS         BIT(2)
> +
>  /*
>   * Guest crash notification MSRs
>   */
> @@ -168,5 +194,16 @@
>  
>  #define HV_STIMER_COUNT                       4
>  
> +/*
> + * Synthetic debugger control definitions
> + */
> +#define HV_SYNDBG_CONTROL_SEND              (1u << 0)
> +#define HV_SYNDBG_CONTROL_RECV              (1u << 1)
> +#define HV_SYNDBG_CONTROL_SEND_SIZE(ctl)    ((ctl >> 16) & 0xffff)
> +#define HV_SYNDBG_STATUS_INVALID            (0)
> +#define HV_SYNDBG_STATUS_SEND_SUCCESS       (1u << 0)
> +#define HV_SYNDBG_STATUS_RECV_SUCCESS       (1u << 2)
> +#define HV_SYNDBG_STATUS_RESET              (1u << 3)
> +#define HV_SYNDBG_STATUS_SET_SIZE(st, sz)   (st | (sz << 16))
>  
>  #endif
> 

Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


