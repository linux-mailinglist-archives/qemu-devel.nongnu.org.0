Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2EE3218F5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:35:36 +0100 (CET)
Received: from localhost ([::1]:45820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBN9-0008Ed-Ph
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:35:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEB8g-0002w2-Cw
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:20:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEB8e-00034R-Ln
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614000035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJWjdUCoGmjlYYJjDuM5O67AN9W7JHmm4qGrcpUiK1Y=;
 b=Zse5mMOxmoUTDXYck0SHqzyHhpzI+j8id5ftNy/x1kPl4xCxjq1rPCickAS7W1q7AP9xW9
 S6EfCs9DWEPXa/uu0PZbsuNbU1reudFLsdBzX3vBrVv1Uz7UYlq8PfrWnhT6ylUYEdw2Gp
 dO3F6EEAyABxVoWzwr4jBNzZo5G04do=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-6qD4czHpN3eIjxwoXjjYig-1; Mon, 22 Feb 2021 08:20:34 -0500
X-MC-Unique: 6qD4czHpN3eIjxwoXjjYig-1
Received: by mail-ed1-f72.google.com with SMTP id d3so6983228edk.22
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZJWjdUCoGmjlYYJjDuM5O67AN9W7JHmm4qGrcpUiK1Y=;
 b=tq7MRP19HkgVklCaX7yIzhyxJdGXCcoU/vUMiNHAAdsIx7oHyXBwiqn3ZpHS2Qrno2
 +rb1gKi1oe9UJI7j+9zfgQv0yIKigMs9Pg23Rukc8x+4fgFb8MqpGvDk3GlQ4+urAD03
 OtqPxlL6P7FfXRDkNk0TVN9AqIMfXFLc5TM1+gYClnsk4hq4v2Lya8iWDVKPh/wmiT8I
 Zxl/lFWNbL20lAdEtp1j9BjBJkoBKXXGyLy0zrTOJM58BHAQ65MVPohGcywBhL1UIEw8
 50O6KRPA0hz1I3zVgYRPihrDJSRsuCXf5EFDq7jL2XXEMYCr8MRvKbHXjQLRdlFhXUvB
 X0Nw==
X-Gm-Message-State: AOAM531rxjJLn4mLV6fJhNhTIp8GxQlubjT2MRgVYfSSBqbXn5/skm0q
 2/Rkv0yx2i62fPgZYKqW0q6drbpKrwr3lVwC46MJdZREASVUGOOhsNhmLIZCIUj/wYPoazD6CRq
 LdPoch+ofEc9FdZc=
X-Received: by 2002:a05:6402:149a:: with SMTP id
 e26mr22977249edv.254.1614000033052; 
 Mon, 22 Feb 2021 05:20:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT4Tqtv92ARHyxvjWY5BK3sAmnvh6CPwmtp2pIUm2C+Tg2saU/MH98mf7wp+9OE0WT0jqsaw==
X-Received: by 2002:a05:6402:149a:: with SMTP id
 e26mr22977216edv.254.1614000032787; 
 Mon, 22 Feb 2021 05:20:32 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z16sm10310424ejd.102.2021.02.22.05.20.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:20:32 -0800 (PST)
Subject: Re: [PATCH v6 05/12] vfio: Support for RamDiscardMgr in the !vIOMMU
 case
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-6-david@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5920c566-6f4b-8935-bf4c-b941a67152aa@redhat.com>
Date: Mon, 22 Feb 2021 14:20:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222115708.7623-6-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/21 12:57, David Hildenbrand wrote:
> 
> +static int vfio_sync_ram_discard_listener_dirty_bitmap(VFIOContainer *container,
> +                                                   MemoryRegionSection *section)
> +{
> +    RamDiscardMgr *rdm = memory_region_get_ram_discard_mgr(section->mr);
> +    RamDiscardMgrClass *rdmc = RAM_DISCARD_MGR_GET_CLASS(rdm);
> +    VFIORamDiscardListener tmp_vrdl, *vrdl = NULL;
> +
> +    QLIST_FOREACH(vrdl, &container->vrdl_list, next) {
> +        if (vrdl->mr == section->mr &&
> +            vrdl->offset_within_region == section->offset_within_region) {
> +            break;
> +        }
> +    }
> +
> +    if (!vrdl) {
> +        hw_error("vfio: Trying to sync missing RAM discard listener");
> +    }
> +
> +    tmp_vrdl = *vrdl;
> +    ram_discard_listener_init(&tmp_vrdl.listener,
> +                              vfio_ram_discard_notify_dirty_bitmap, NULL, NULL);
> +    return rdmc->replay_populated(rdm, section->mr, &tmp_vrdl.listener);
> +}
> +

Can you explain why this is related to the sync_dirty_bitmap call?  This 
needs a comment in vfio_sync_dirty_bitmap.

Also, why can't you just pass vrdl to the call?

Paolo


