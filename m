Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC093FDFF1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:30:40 +0200 (CEST)
Received: from localhost ([::1]:38998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLT8J-0006Bx-HL
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLT1J-0007xj-V1
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:23:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLT1F-0006Xn-Oi
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:23:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630513400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYgdXHdL0YCsRKrOCrJMdoX0fhsnWenSVg49uWJfhHg=;
 b=A9uhkKEyR/fpYhXOjIkHnox5IKOUaoyuWj8rG7JZ8SSa1vKq3uzKGIqExa8189eGmN12AQ
 JCNVLKMUnjQTiLB3TIjkD56KczlDfzk6ie1iNLCWXcq37+AX/b/0UIzZypG4Jd2utQ+ZMD
 khyiP2WbU65Nbc40xnWDsBp+FMCyiIo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-14RIC2p-Pwe6hhpmq_ORmg-1; Wed, 01 Sep 2021 12:23:19 -0400
X-MC-Unique: 14RIC2p-Pwe6hhpmq_ORmg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r11-20020a5d4e4b000000b001575c5ed4b4so88771wrt.4
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 09:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZYgdXHdL0YCsRKrOCrJMdoX0fhsnWenSVg49uWJfhHg=;
 b=EvNwZ3PLPX99Abyg9pTWLPdR8q57scTiNs8DULpl9lZsElynjzVBpACK7bRBT4Onxl
 0vZgCMtvBrOKSjLkEcun0BFwCgKNewi0QsyquyafRvYwvu05cLTDH1REc2LWqVMQJ1nn
 dZrjQvOpjmQd63lfN7U/U+gYlhIyy3Pg8fYlqJVDm0ZxR0riAu8Nutcc5PeRaXkflqcU
 z+w85W6NPo5/UaDAHhcpv39x/qwqHnbkk2lqYeN5xw8avgJxMMqWM8xiv2IzCB2oJN8K
 lFfAbnKn/QYtsg5kQT+A/lXseJcv4q5EgOJRPvqPrRtNxrSHe4tBMqsHbIkN4PmMv7SS
 6ZaA==
X-Gm-Message-State: AOAM53074CR36GT2LZedvfidPc2dCrLIf5+OGb0L97cRAEszFz1TdkRR
 s8RdcagH9H9WQVRAmfYdTu1Q/TyOMn4qX3qYurUzxrPBX/AGr+3tFZP8F10Zt8YmrLPh6CXIX4P
 klj5lD55LFjTD/HA=
X-Received: by 2002:a05:6000:374:: with SMTP id
 f20mr193514wrf.129.1630513398347; 
 Wed, 01 Sep 2021 09:23:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPsD92gL9+AvYkgnoLUMMq2CujO1RBgKBKTyqJjqoVbGxMmCmiXF6h4djdJEzZbQE+5/zI1A==
X-Received: by 2002:a05:6000:374:: with SMTP id
 f20mr193491wrf.129.1630513398201; 
 Wed, 01 Sep 2021 09:23:18 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id r20sm22584782wrr.47.2021.09.01.09.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 09:23:17 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] memory: Extract mtree_info_flatview() from
 mtree_info()
To: qemu-devel@nongnu.org
References: <20210901161943.4174212-1-philmd@redhat.com>
 <20210901161943.4174212-2-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ea031839-6c3e-fc91-5688-45acfb1d2fca@redhat.com>
Date: Wed, 1 Sep 2021 18:23:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901161943.4174212-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 6:19 PM, Philippe Mathieu-Daudé wrote:
> While mtree_info() handles both ASes and flatviews cases,
> the two cases share basically no code. Split mtree_info_flatview()
> out of mtree_info() to simplify.
> 
> Note: Patch easier to review using 'git-diff --color-moved=blocks'.

Surprisingly git-format-patch choose a better algorithm automatically...

> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  softmmu/memory.c | 72 ++++++++++++++++++++++++++----------------------
>  1 file changed, 39 insertions(+), 33 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4df..3eb6f52de67 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -3246,6 +3246,44 @@ static gboolean mtree_info_flatview_free(gpointer key, gpointer value,
>      return true;
>  }
>  
> +static void mtree_info_flatview(bool dispatch_tree, bool owner)
> +{
> +    struct FlatViewInfo fvi = {
> +        .counter = 0,
> +        .dispatch_tree = dispatch_tree,
> +        .owner = owner,
> +    };
> +    AddressSpace *as;
> +    FlatView *view;
> +    GArray *fv_address_spaces;
> +    GHashTable *views = g_hash_table_new(g_direct_hash, g_direct_equal);
> +    AccelClass *ac = ACCEL_GET_CLASS(current_accel());
> +
> +    if (ac->has_memory) {
> +        fvi.ac = ac;
> +    }
> +
> +    /* Gather all FVs in one table */
> +    QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
> +        view = address_space_get_flatview(as);
> +
> +        fv_address_spaces = g_hash_table_lookup(views, view);
> +        if (!fv_address_spaces) {
> +            fv_address_spaces = g_array_new(false, false, sizeof(as));
> +            g_hash_table_insert(views, view, fv_address_spaces);
> +        }
> +
> +        g_array_append_val(fv_address_spaces, as);
> +    }
> +
> +    /* Print */
> +    g_hash_table_foreach(views, mtree_print_flatview, &fvi);
> +
> +    /* Free */
> +    g_hash_table_foreach_remove(views, mtree_info_flatview_free, 0);
> +    g_hash_table_unref(views);
> +}
> +
>  void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>  {
>      MemoryRegionListHead ml_head;
> @@ -3253,39 +3291,7 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>      AddressSpace *as;
>  
>      if (flatview) {
> -        FlatView *view;
> -        struct FlatViewInfo fvi = {
> -            .counter = 0,
> -            .dispatch_tree = dispatch_tree,
> -            .owner = owner,
> -        };
> -        GArray *fv_address_spaces;
> -        GHashTable *views = g_hash_table_new(g_direct_hash, g_direct_equal);
> -        AccelClass *ac = ACCEL_GET_CLASS(current_accel());
> -
> -        if (ac->has_memory) {
> -            fvi.ac = ac;
> -        }
> -
> -        /* Gather all FVs in one table */
> -        QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
> -            view = address_space_get_flatview(as);
> -
> -            fv_address_spaces = g_hash_table_lookup(views, view);
> -            if (!fv_address_spaces) {
> -                fv_address_spaces = g_array_new(false, false, sizeof(as));
> -                g_hash_table_insert(views, view, fv_address_spaces);
> -            }
> -
> -            g_array_append_val(fv_address_spaces, as);
> -        }
> -
> -        /* Print */
> -        g_hash_table_foreach(views, mtree_print_flatview, &fvi);
> -
> -        /* Free */
> -        g_hash_table_foreach_remove(views, mtree_info_flatview_free, 0);
> -        g_hash_table_unref(views);
> +        mtree_info_flatview(dispatch_tree, owner);
>  
>          return;
>      }
> 


