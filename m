Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538BF4B83CA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:15:11 +0100 (CET)
Received: from localhost ([::1]:33446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGP0-00042K-1F
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:15:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nKGKW-000088-AE
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:10:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nKGKT-00065X-Sw
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:10:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645002629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SZxbj0bwzeEFdMW1HJ0C2aWPIFg6d91GHbs4u2+t5ko=;
 b=RP5PRPtcW/hb4oh/rIBNx3mcQ3iarjZaxroCY7W9WBrbRVRr+56j9pAylgQ1wZVHP592qV
 O3PLmG9Fb/Qomoe2QeHzmJY0a4r7x0b4zffNDmQhxFwsoJcgLKQHeNP2dP74Em5XeXwpP0
 3P7XhEclD7A/ri/s63rE+0gmBkmeu68=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-Ep8HuwSIMJ-CvPCpNsdjBg-1; Wed, 16 Feb 2022 04:10:25 -0500
X-MC-Unique: Ep8HuwSIMJ-CvPCpNsdjBg-1
Received: by mail-wm1-f70.google.com with SMTP id
 h82-20020a1c2155000000b003552c13626cso2660694wmh.3
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 01:10:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=SZxbj0bwzeEFdMW1HJ0C2aWPIFg6d91GHbs4u2+t5ko=;
 b=01jMdj8o+8p1U8GZ21stIqH70nlMxCzqYVsoEy3wocQP14Q2gC+2W3jVrDizZxp24f
 DwqYsYj2RnWsYUHzCSzg7ylrijr7sHwMrk08rcQdI/rLQoothSQVLgWTX9CRBzrZuxor
 BntaJRwqfJoWchnG5h+zs/L5jmGvHatsMXVJSHbNdO1UU4lPpZFwCkRaaYc4XoTs15DP
 d0pHn/E2EEJEAG0chc2UPpVV+rREWRLz+lELd5GlICpRfTNCpK3b4m1iVf1elH+ZVssa
 Cbkcb7/MLjqwUXaZr8+xduV+Zr+4qtz12c41QIS2FeRjKN8DoqafnNTkw3zjofbeTxlg
 4v+w==
X-Gm-Message-State: AOAM532eeFhXMbVE/BG1WK0pCdm5xsAYlz9ipu3UTUm9Lyin8fgzCMqJ
 tRVcXMz2cbTPLOCkri/fJ84ECJ0hgh8SLFDUZNUXuQL+yVhI80J3prY2LXEBOcBtIqLkpywCKxL
 6x/wwUnvPV/9xk/KdcgXgm6mdlt9jo6m9So/QVQyPuoqTI3NFQpf4FcXnDO5epkq+Yh4=
X-Received: by 2002:adf:eec1:0:b0:1e3:1e0a:72f0 with SMTP id
 a1-20020adfeec1000000b001e31e0a72f0mr1572703wrp.524.1645002624331; 
 Wed, 16 Feb 2022 01:10:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9EH7WyNRqqFMELqB+Zifyrnmu8Hqr2FZ9GAFqRySpkv0NvMYo5orsx3JG4p50UH8R35kSGg==
X-Received: by 2002:adf:eec1:0:b0:1e3:1e0a:72f0 with SMTP id
 a1-20020adfeec1000000b001e31e0a72f0mr1572673wrp.524.1645002623941; 
 Wed, 16 Feb 2022 01:10:23 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id ay34sm12785325wmb.29.2022.02.16.01.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 01:10:23 -0800 (PST)
Message-ID: <ccb90f05-281a-78f1-9c46-135b95b1e719@redhat.com>
Date: Wed, 16 Feb 2022 10:10:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 1/4] hyperv: SControl is optional to enable SynIc
To: qemu-devel@nongnu.org, Jon Doron <arilou@gmail.com>
References: <20220204100723.406121-1-arilou@gmail.com>
 <20220204100723.406121-2-arilou@gmail.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20220204100723.406121-2-arilou@gmail.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 04/02/2022 11:07, Jon Doron wrote:
> SynIc can be enabled regardless of the SControl mechanisim which can
> register a GSI for a given SintRoute.
> 
> This behaviour can achived by setting enabling SIMP and then the guest
> will poll on the message slot.
> 
> Once there is another message pending the host will set the message slot
> with the pending flag.
> When the guest polls from the message slot, incase the pending flag is

s/incase/in case
> set it will write to the HV_X64_MSR_EOM indicating it has cleared the
> slow and we can try and push our message again.

what do you mean by "the slow"?
> 
> Signed-off-by: Jon Doron <arilou@gmail.com>
> ---
>  hw/hyperv/hyperv.c         | 233 ++++++++++++++++++++++++-------------
>  include/hw/hyperv/hyperv.h |   2 +
>  2 files changed, 153 insertions(+), 82 deletions(-)
> 
> diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
> index cb1074f234..88c9cc1334 100644
> --- a/hw/hyperv/hyperv.c
> +++ b/hw/hyperv/hyperv.c
> @@ -27,18 +27,70 @@ struct SynICState {
>  
>      CPUState *cs;
>  
> -    bool enabled;
> +    bool sctl_enabled;
>      hwaddr msg_page_addr;
>      hwaddr event_page_addr;
>      MemoryRegion msg_page_mr;
>      MemoryRegion event_page_mr;
>      struct hyperv_message_page *msg_page;
>      struct hyperv_event_flags_page *event_page;
> +
> +    QemuMutex sint_routes_mutex;
> +    QLIST_HEAD(, HvSintRoute) sint_routes;
>  };
>  
>  #define TYPE_SYNIC "hyperv-synic"
>  OBJECT_DECLARE_SIMPLE_TYPE(SynICState, SYNIC)
>  
> +/*
> + * KVM has its own message producers (SynIC timers).  To guarantee
> + * serialization with both KVM vcpu and the guest cpu, the messages are first
> + * staged in an intermediate area and then posted to the SynIC message page in
> + * the vcpu thread.
> + */
> +typedef struct HvSintStagedMessage {
> +    /* message content staged by hyperv_post_msg */
> +    struct hyperv_message msg;
> +    /* callback + data (r/o) to complete the processing in a BH */
> +    HvSintMsgCb cb;
> +    void *cb_data;
> +    /* message posting status filled by cpu_post_msg */
> +    int status;
> +    /* passing the buck: */
> +    enum {
> +        /* initial state */
> +        HV_STAGED_MSG_FREE,
> +        /*
> +         * hyperv_post_msg (e.g. in main loop) grabs the staged area (FREE ->
> +         * BUSY), copies msg, and schedules cpu_post_msg on the assigned cpu
> +         */
> +        HV_STAGED_MSG_BUSY,
> +        /*
> +         * cpu_post_msg (vcpu thread) tries to copy staged msg to msg slot,
> +         * notify the guest, records the status, marks the posting done (BUSY
> +         * -> POSTED), and schedules sint_msg_bh BH
> +         */
> +        HV_STAGED_MSG_POSTED,
> +        /*
> +         * sint_msg_bh (BH) verifies that the posting is done, runs the
> +         * callback, and starts over (POSTED -> FREE)
> +         */
> +    } state;
> +} HvSintStagedMessage;
> +
> +struct HvSintRoute {
> +    uint32_t sint;
> +    SynICState *synic;
> +    int gsi;
> +    EventNotifier sint_set_notifier;
> +    EventNotifier sint_ack_notifier;
> +
> +    HvSintStagedMessage *staged_msg;
> +
> +    unsigned refcount;
> +    QLIST_ENTRY(HvSintRoute) link;
> +};
> +
>  static bool synic_enabled;

Why did you move this struct above?
I think it was done purposefully to separate synic_* functions from the
others below (sint_*).
>  
>  bool hyperv_is_synic_enabled(void)
> @@ -51,11 +103,11 @@ static SynICState *get_synic(CPUState *cs)
>      return SYNIC(object_resolve_path_component(OBJECT(cs), "synic"));
>  }
>  
> -static void synic_update(SynICState *synic, bool enable,
> +static void synic_update(SynICState *synic, bool sctl_enable,
>                           hwaddr msg_page_addr, hwaddr event_page_addr)
>  {
>  
> -    synic->enabled = enable;
> +    synic->sctl_enabled = sctl_enable;
>      if (synic->msg_page_addr != msg_page_addr) {
>          if (synic->msg_page_addr) {
>              memory_region_del_subregion(get_system_memory(),
> @@ -80,7 +132,7 @@ static void synic_update(SynICState *synic, bool enable,
>      }
>  }
>  
> -void hyperv_synic_update(CPUState *cs, bool enable,
> +void hyperv_synic_update(CPUState *cs, bool sctl_enable,
>                           hwaddr msg_page_addr, hwaddr event_page_addr)
>  {
>      SynICState *synic = get_synic(cs);
> @@ -89,7 +141,7 @@ void hyperv_synic_update(CPUState *cs, bool enable,
>          return;
>      }
>  
> -    synic_update(synic, enable, msg_page_addr, event_page_addr);
> +    synic_update(synic, sctl_enable, msg_page_addr, event_page_addr);
>  }
>  
>  static void synic_realize(DeviceState *dev, Error **errp)
> @@ -110,16 +162,20 @@ static void synic_realize(DeviceState *dev, Error **errp)
>                             sizeof(*synic->event_page), &error_abort);
>      synic->msg_page = memory_region_get_ram_ptr(&synic->msg_page_mr);
>      synic->event_page = memory_region_get_ram_ptr(&synic->event_page_mr);
> +    qemu_mutex_init(&synic->sint_routes_mutex);
> +    QLIST_INIT(&synic->sint_routes);
>  
>      g_free(msgp_name);
>      g_free(eventp_name);
>  }
> +
>  static void synic_reset(DeviceState *dev)
>  {
>      SynICState *synic = SYNIC(dev);
>      memset(synic->msg_page, 0, sizeof(*synic->msg_page));
>      memset(synic->event_page, 0, sizeof(*synic->event_page));
>      synic_update(synic, false, 0, 0);
> +    assert(QLIST_EMPTY(&synic->sint_routes));
>  }
>  
>  static void synic_class_init(ObjectClass *klass, void *data)
> @@ -168,54 +224,6 @@ static void synic_register_types(void)
>  
>  type_init(synic_register_types)
>  
> -/*
> - * KVM has its own message producers (SynIC timers).  To guarantee
> - * serialization with both KVM vcpu and the guest cpu, the messages are first
> - * staged in an intermediate area and then posted to the SynIC message page in
> - * the vcpu thread.
> - */
> -typedef struct HvSintStagedMessage {
> -    /* message content staged by hyperv_post_msg */
> -    struct hyperv_message msg;
> -    /* callback + data (r/o) to complete the processing in a BH */
> -    HvSintMsgCb cb;
> -    void *cb_data;
> -    /* message posting status filled by cpu_post_msg */
> -    int status;
> -    /* passing the buck: */
> -    enum {
> -        /* initial state */
> -        HV_STAGED_MSG_FREE,
> -        /*
> -         * hyperv_post_msg (e.g. in main loop) grabs the staged area (FREE ->
> -         * BUSY), copies msg, and schedules cpu_post_msg on the assigned cpu
> -         */
> -        HV_STAGED_MSG_BUSY,
> -        /*
> -         * cpu_post_msg (vcpu thread) tries to copy staged msg to msg slot,
> -         * notify the guest, records the status, marks the posting done (BUSY
> -         * -> POSTED), and schedules sint_msg_bh BH
> -         */
> -        HV_STAGED_MSG_POSTED,
> -        /*
> -         * sint_msg_bh (BH) verifies that the posting is done, runs the
> -         * callback, and starts over (POSTED -> FREE)
> -         */
> -    } state;
> -} HvSintStagedMessage;
> -
> -struct HvSintRoute {
> -    uint32_t sint;
> -    SynICState *synic;
> -    int gsi;
> -    EventNotifier sint_set_notifier;
> -    EventNotifier sint_ack_notifier;
> -
> -    HvSintStagedMessage *staged_msg;
> -
> -    unsigned refcount;
> -};
> -
>  static CPUState *hyperv_find_vcpu(uint32_t vp_index)
>  {
>      CPUState *cs = qemu_get_cpu(vp_index);
> @@ -259,7 +267,7 @@ static void cpu_post_msg(CPUState *cs, run_on_cpu_data data)
>  
>      assert(staged_msg->state == HV_STAGED_MSG_BUSY);
>  
> -    if (!synic->enabled || !synic->msg_page_addr) {
> +    if (!synic->msg_page_addr) {

Not sure if this is important, but why don't you check for
!synic->sctl_enabled anymore here? You do it below.

>          staged_msg->status = -ENXIO;
>          goto posted;
>      }
> @@ -343,7 +351,7 @@ int hyperv_set_event_flag(HvSintRoute *sint_route, unsigned eventno)
>      if (eventno > HV_EVENT_FLAGS_COUNT) {
>          return -EINVAL;
>      }
> -    if (!synic->enabled || !synic->event_page_addr) {
> +    if (!synic->sctl_enabled || !synic->event_page_addr) {
>          return -ENXIO;
>      }
>  
> @@ -364,11 +372,13 @@ int hyperv_set_event_flag(HvSintRoute *sint_route, unsigned eventno)
>  HvSintRoute *hyperv_sint_route_new(uint32_t vp_index, uint32_t sint,
>                                     HvSintMsgCb cb, void *cb_data)
>  {
> -    HvSintRoute *sint_route;
> -    EventNotifier *ack_notifier;
> +    HvSintRoute *sint_route = NULL;
> +    EventNotifier *ack_notifier = NULL;
>      int r, gsi;
>      CPUState *cs;
>      SynICState *synic;
> +    bool ack_event_initialized = false, sint_notifier_initialized = false,
> +         irqfd_initialized = false;
>  
>      cs = hyperv_find_vcpu(vp_index);
>      if (!cs) {
> @@ -381,57 +391,82 @@ HvSintRoute *hyperv_sint_route_new(uint32_t vp_index, uint32_t sint,
>      }
>  
>      sint_route = g_new0(HvSintRoute, 1);
> -    r = event_notifier_init(&sint_route->sint_set_notifier, false);
> -    if (r) {
> -        goto err;
> +    if (!sint_route) {
> +        goto cleanup_err;
>      }
>  
> +    sint_route->gsi = 0;

useless, as g_new0 zeroes all fields

> +    sint_route->synic = synic;
> +    sint_route->sint = sint;
> +    sint_route->refcount = 1;
>  
>      ack_notifier = cb ? &sint_route->sint_ack_notifier : NULL;
>      if (ack_notifier) {
>          sint_route->staged_msg = g_new0(HvSintStagedMessage, 1);
> +        if (!sint_route->staged_msg) {
> +            goto cleanup_err;
> +        }
>          sint_route->staged_msg->cb = cb;
>          sint_route->staged_msg->cb_data = cb_data;
>  
>          r = event_notifier_init(ack_notifier, false);
>          if (r) {
> -            goto err_sint_set_notifier;
> +            goto cleanup_err;
>          }
> -
>          event_notifier_set_handler(ack_notifier, sint_ack_handler);
> +        ack_event_initialized = true;
> +    }
> +
> +    /* See if we are done or we need to setup a GSI for this SintRoute */
> +    if (!synic->sctl_enabled) {
> +        goto cleanup;
>      }
>  
> +    /* We need to setup a GSI for this SintRoute */
> +    r = event_notifier_init(&sint_route->sint_set_notifier, false);
> +    if (r) {
> +        goto cleanup_err;
> +    }
> +    sint_notifier_initialized = true;
> +
>      gsi = kvm_irqchip_add_hv_sint_route(kvm_state, vp_index, sint);
>      if (gsi < 0) {
> -        goto err_gsi;
> +        goto cleanup_err;
>      }
> +    irqfd_initialized = true;
>  
>      r = kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
>                                             &sint_route->sint_set_notifier,
>                                             ack_notifier, gsi);
>      if (r) {
> -        goto err_irqfd;
> +        goto cleanup_err;
>      }
>      sint_route->gsi = gsi;
> -    sint_route->synic = synic;
> -    sint_route->sint = sint;
> -    sint_route->refcount = 1;
> -
> +cleanup:
> +    qemu_mutex_lock(&synic->sint_routes_mutex);
> +    QLIST_INSERT_HEAD_RCU(&synic->sint_routes, sint_route, link);
> +    qemu_mutex_unlock(&synic->sint_routes_mutex);
>      return sint_route;
>  
> -err_irqfd:
> -    kvm_irqchip_release_virq(kvm_state, gsi);
> -err_gsi:
> +cleanup_err:
> +    if (irqfd_initialized) {
> +        kvm_irqchip_release_virq(kvm_state, gsi);
> +    }
> +
> +    if (sint_notifier_initialized) {
> +        event_notifier_cleanup(&sint_route->sint_set_notifier);
> +    }
> +
>      if (ack_notifier) {
> -        event_notifier_set_handler(ack_notifier, NULL);
> -        event_notifier_cleanup(ack_notifier);
> +        if (ack_event_initialized) {
> +            event_notifier_set_handler(ack_notifier, NULL);
> +            event_notifier_cleanup(ack_notifier);
> +        }
> +
>          g_free(sint_route->staged_msg);
>      }
> -err_sint_set_notifier:
> -    event_notifier_cleanup(&sint_route->sint_set_notifier);
> -err:
> -    g_free(sint_route);
>  
> +    g_free(sint_route);
>      return NULL;
>  }

It is good that you check that sint_route is not NULL, but I don't find
it easy to read nor a common practice to have one single goto label and
multiple booleans to distinguish various error cases.

I think you should do as it was done before, with a specific label for
each type of error, and not always use cleanup_err.

>  
> @@ -442,6 +477,8 @@ void hyperv_sint_route_ref(HvSintRoute *sint_route)
>  
>  void hyperv_sint_route_unref(HvSintRoute *sint_route)
>  {
> +    SynICState *synic;
> +
>      if (!sint_route) {
>          return;
>      }
> @@ -452,21 +489,33 @@ void hyperv_sint_route_unref(HvSintRoute *sint_route)
>          return;
>      }
>  
> -    kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
> -                                          &sint_route->sint_set_notifier,
> -                                          sint_route->gsi);
> -    kvm_irqchip_release_virq(kvm_state, sint_route->gsi);
> +    synic = sint_route->synic;
> +    qemu_mutex_lock(&synic->sint_routes_mutex);
> +    QLIST_REMOVE_RCU(sint_route, link);
> +    qemu_mutex_unlock(&synic->sint_routes_mutex);

Not really important, but you can use WITH_QEMU_LOCK_GUARD instead of
doing lock/unlock.

> +
> +    if (sint_route->gsi) {
> +        kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
> +                                              &sint_route->sint_set_notifier,
> +                                              sint_route->gsi);
> +        kvm_irqchip_release_virq(kvm_state, sint_route->gsi);
> +        event_notifier_cleanup(&sint_route->sint_set_notifier);
> +    }
> +
>      if (sint_route->staged_msg) {
>          event_notifier_set_handler(&sint_route->sint_ack_notifier, NULL);
>          event_notifier_cleanup(&sint_route->sint_ack_notifier);
>          g_free(sint_route->staged_msg);
>      }
> -    event_notifier_cleanup(&sint_route->sint_set_notifier);
>      g_free(sint_route);
>  }
>  
>  int hyperv_sint_route_set_sint(HvSintRoute *sint_route)
>  {
> +    if (!sint_route->gsi) {
> +        return 0;
> +    }
> +
>      return event_notifier_set(&sint_route->sint_set_notifier);
>  }
>  
> @@ -529,6 +578,26 @@ int hyperv_set_msg_handler(uint32_t conn_id, HvMsgHandler handler, void *data)
>      return ret;
>  }
>  
> +int hyperv_synic_eom(CPUState *cs)
> +{
> +    SynICState *synic = get_synic(cs);
> +    HvSintRoute *sint_route;
> +
> +    if (!synic) {
> +        return -1;
> +    }

use here
QEMU_LOCK_GUARD(&synic->sint_routes_mutex);
instead of lock/unlock
> +
> +    qemu_mutex_lock(&synic->sint_routes_mutex);
> +    QLIST_FOREACH(sint_route, &synic->sint_routes, link) {
> +        /* Try to complete every SintRoute */
> +        aio_bh_schedule_oneshot(qemu_get_aio_context(), sint_msg_bh,
> +                                sint_route);
> +    }
> +    qemu_mutex_unlock(&synic->sint_routes_mutex);> +    return 0;
> +}
> +
>  uint16_t hyperv_hcall_post_message(uint64_t param, bool fast)
>  {
>      uint16_t ret;
> diff --git a/include/hw/hyperv/hyperv.h b/include/hw/hyperv/hyperv.h
> index a63ee0003c..ef9f6b6c09 100644
> --- a/include/hw/hyperv/hyperv.h
> +++ b/include/hw/hyperv/hyperv.h
> @@ -28,6 +28,8 @@ void hyperv_sint_route_unref(HvSintRoute *sint_route);
>  
>  int hyperv_sint_route_set_sint(HvSintRoute *sint_route);
>  
> +int hyperv_synic_eom(CPUState *cs);
> +

Documentation here? Where is this function used?

>  /*
>   * Submit a message to be posted in vcpu context.  If the submission succeeds,
>   * the status of posting the message is reported via the callback associated
> 


