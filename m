Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BB34A4063
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 11:43:45 +0100 (CET)
Received: from localhost ([::1]:56460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEU9v-00084w-SJ
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 05:43:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nEU6y-0006NT-JQ
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 05:40:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nEU6v-0000tC-Qn
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 05:40:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643625636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PtkZQe57BZqCD3cMISGM1BMNcBa5BWyG5fXpOkKA53U=;
 b=WB84QeNYYUupRp+15p8LDqjJIq1v0UOTzgP/GoI0Buh35Xz9k5AUhiPjBOgyM29UzSpY6R
 QAM7HSNf+RgvSLSG4PYMlk7+Z+qmal9TTdLDcVlKIepGoUpC8sHFNEnY5Ha21opbPu+oFK
 7Yxw/YCEQHoLOwSARckQLe2bGU8ubVE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-BHKddC0xM4SlqKdHBlxkeA-1; Mon, 31 Jan 2022 05:40:35 -0500
X-MC-Unique: BHKddC0xM4SlqKdHBlxkeA-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg16-20020a05600c3c9000b0034bea12c043so10156651wmb.7
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 02:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=PtkZQe57BZqCD3cMISGM1BMNcBa5BWyG5fXpOkKA53U=;
 b=SRy+PCrVcjJvEniy3lsZuA2wf6umpPcULpREp1luhro5hkdqBe1wKEKnuvRJnFEc4H
 QUbacJ0YzZwUHr/yIxHc5E96ltz8ml0zrO1CpgwhpBRc0jBJNIACim/aY5wSZ4kCA8ri
 qwZzNmdVDs1EwRdtFfNOZtzLnkIuWwcVJDv380UDBK5RBlwALJ/cxX0SnS8POSKd2x3p
 zlrhQVeXjtB7+3+iVc0Q/Pi/Z1iB3uHIgjDPydCiTtyCQo6BJ2yGfhK9OVcUT3TbSVpr
 PJ5GDu+qFWu9flCyyWWikWFuunfx7P7j+/G6x7ISVQQoTrSyxBf9tsjRScBCY1C3Zbni
 azyQ==
X-Gm-Message-State: AOAM531+rP0skGjaLMsLFvsr+J4Jcme8fz9lX46XtF1BECePdxfe2CW6
 MxsCMyYENgJJ+O58UaOlVoZoxwwsCTJ2mx5TynftKgGyL56SZvGHIg2e/NwT5L4rSGcnuf5oxkd
 tsj+8k6TiBdzNPrXLqcqf1MvrErJBCdYLur9+575WVtghiTmIGJMdBpW0F4ePSqs=
X-Received: by 2002:a05:600c:1f06:: with SMTP id
 bd6mr8256468wmb.98.1643625634180; 
 Mon, 31 Jan 2022 02:40:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylXSYdATJZuU3+RO1aJ+aiJJsez9xW/UfBX0WwQQ4EJQHh0zAx38XHBs60Lt6x9qiibUvz/A==
X-Received: by 2002:a05:600c:1f06:: with SMTP id
 bd6mr8256430wmb.98.1643625633830; 
 Mon, 31 Jan 2022 02:40:33 -0800 (PST)
Received: from ?IPV6:2003:cb:c709:b200:f007:5a26:32e7:8ef5?
 (p200300cbc709b200f0075a2632e78ef5.dip0.t-ipconnect.de.
 [2003:cb:c709:b200:f007:5a26:32e7:8ef5])
 by smtp.gmail.com with ESMTPSA id f20sm9894920wmg.2.2022.01.31.02.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 02:40:33 -0800 (PST)
Message-ID: <83a45a1f-41aa-2e40-7927-cabaa5590457@redhat.com>
Date: Mon, 31 Jan 2022 11:40:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: qemu-devel@nongnu.org
References: <20220125135734.134928-1-david@redhat.com>
 <20220125135734.134928-3-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 2/2] virtio-mem: Handle preallocation with migration
In-Reply-To: <20220125135734.134928-3-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Michal Privoznik <mprivozn@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.01.22 14:57, David Hildenbrand wrote:
> During precopy we usually write all plugged ares and essentially
> allocate them. However, there are two corner cases:
> 
> 1) Migrating the zeropage
> 
> When the zeropage gets migrated, we first check if the destination range is
> already zero and avoid performing a write in that case:
> ram_handle_compressed(). If the memory backend, like anonymous RAM or
> most filesystems, populate the shared zeropage when reading a (file) hole,
> we don't preallocate backend memory. In that case, we have to explicitly
> trigger the allocation to allocate actual backend memory.
> 
> 2) Excluding memory ranges during migration
> 
> For example, virtio-balloon free page hinting will exclude some pages
> from getting migrated. In that case, we don't allocate memory for
> plugged ranges when migrating.
> 
> So trigger allocation of all plugged ranges when restoring the device state
> and fail gracefully if allocation fails.
> 
> Handling postcopy is a bit more tricky, as postcopy and preallocation
> are problematic in general. To at least mimic what ordinary
> preallocation does, temporarily try allocating the requested amount
> of memory and fail postcopy in case the requested size on source and
> destination doesn't match. This way, we at least checked that there isn't
> a fundamental configuration issue and that we were able to preallocate
> the required amount of memory at least once, instead of failing
> unrecoverably during postcopy later. However, just as ordinary
> preallocation with postcopy, it's racy.
> 
> Tested-by: Michal Privoznik <mprivozn@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

While this patch improves the situation, I'm going to think about one
prealloc case a bit more:

For precopy with ordinary preallocation, the order on the destination is:

-> Preallocate RAM
-> Restore RAM
-> Restore devices

For precopy with virtio-mem preallocation, the order is:

-> Restore RAM
-> Restore devices
 -> Restore preallocation of virito-mem

The end result is the same if preallocation succeeds. However, if
preallocation would fail, for example, if there are insufficient huge
pages around (i.e., user error), we'll crash with a SIGBUS during RAM
migration, instead of failing earlier with "guest RAM allocation
failed". In both events, the VM can continue running on the source,
however, doing the preallocation earlier would be nicer.

Ideally, we'd migrate the virtio-mem bitmap (+eventually other state)
*before* migrating the RAM state. Saving and restoring it before
saving/restoring RAM. The bitmap is effectively immutable while
migration is active already.


We'd simply preallcoate when restoring the state, which wouldn't require
any postcopy specific handling anymore.

I think it should be doable implementation-wise, I just have to think
about possible implications.

-- 
Thanks,

David / dhildenb


