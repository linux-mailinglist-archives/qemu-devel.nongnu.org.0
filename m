Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569AF42A1A3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 12:03:55 +0200 (CEST)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maEdV-0004oT-2q
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 06:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maEat-00044I-0h
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:01:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maEao-0003Jn-WE
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634032864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nfE7theAkjtm3wGl4uzt1qL7cdtTVrMyYyNXlICq2oU=;
 b=EoioidJGQcbcMbvLHSPgRYk9HAz6h/154RW1YkR/ANvGoztjwcfQA2zu9IiqHd3uqiTibZ
 7xgoB/ekdRmcQ2Zthe+b6IPtSiwHanSDWwWJv98go4jm1oNi0yZWx91tdl5jfir1M3zp5u
 qJcbzdc/thoAgUBcLltSai/SHlBiI2o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-y_wuIorCNYKtQCCvT277oQ-1; Tue, 12 Oct 2021 06:01:02 -0400
X-MC-Unique: y_wuIorCNYKtQCCvT277oQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so12833434edl.17
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 03:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nfE7theAkjtm3wGl4uzt1qL7cdtTVrMyYyNXlICq2oU=;
 b=YewoZuBrx0wJ3ccmoiQTsJZJkhJA2mKJ7prm6BYaklSy2UzSiZoKJLhC/MCxsaZozy
 TH0IIf9I2MUjfcdPMpHs018zZLIDHhp3Pl4gqHjUhhVHeFU3YHii3L9ajERZN2uFFcrc
 6VcOCjhgsVcflS2io7G2vZVvHpAXOCUn7ZbIWGHphXRqqPfId48QjdLec5f+iSKtZ3vt
 x6MK67lKAde62oP8IF4Dvxm0xmb16ZDkhoApoEMSd0IR2yasl9fE2fDRhT4y9fSa9Ice
 eeoLfUkDrMAN3AbhGpyhC+OCgAAz51TsE8wAJBh2UftUvv/vZrWebY2ZTHYtR/frwDCg
 DCfw==
X-Gm-Message-State: AOAM531XUpUMzpCphPYD9Ovk1RI7/hE/Ud+1V6eckh3YDRN3GnaS89Ib
 5hm3UezghDSAsiRccy22GQleuKbZyeNOUVJIrJuwnEAPkynd488Z4A5gQJAuOZCg1KnNEA6Js25
 ZwUqhulQOn8LwzPA=
X-Received: by 2002:a17:906:a94b:: with SMTP id
 hh11mr32568046ejb.85.1634032861529; 
 Tue, 12 Oct 2021 03:01:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXVJqgMj8p6t4ZEU5JOu4nstCoXf2A7l85nNiOgK4M+We1wA7ux3vVVotwWXobJ3MBtmo9JA==
X-Received: by 2002:a17:906:a94b:: with SMTP id
 hh11mr32568010ejb.85.1634032861308; 
 Tue, 12 Oct 2021 03:01:01 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id bm1sm4683606ejb.38.2021.10.12.03.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 03:01:00 -0700 (PDT)
Date: Tue, 12 Oct 2021 12:00:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/2] memory: Update description of
 memory_region_is_mapped()
Message-ID: <20211012120059.14e19dc1@redhat.com>
In-Reply-To: <a2078241-1dc9-782e-38a3-eab06c1b162c@redhat.com>
References: <20211011174522.14351-1-david@redhat.com>
 <20211011174522.14351-3-david@redhat.com>
 <93dead18-5ea5-0afe-18c1-de9a06773687@linaro.org>
 <8108c69d-a596-d6c9-a116-783f47904deb@amsat.org>
 <845d3d5f-f9e9-d59d-c868-5a9825eb7fba@redhat.com>
 <20211012105300.1ef25440@redhat.com>
 <a2078241-1dc9-782e-38a3-eab06c1b162c@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Oct 2021 11:28:56 +0200
David Hildenbrand <david@redhat.com> wrote:

> >> Before sending this patch, I had
> >>
> >> commit 71d15e90d513327c90d346ef73865d2db749fbba
> >> Author: David Hildenbrand <david@redhat.com>
> >> Date:   Thu Oct 7 11:25:18 2021 +0200
> >>
> >>       memory: make memory_region_is_mapped() succeed when mapped via an alias
> >>       
> >>       memory_region_is_mapped() currently does not return "true" when a memory
> >>       region is mapped via an alias. Let's fix that by adding a
> >>       "mapped_via_alias" counter to memory regions and updating it accordingly
> >>       when an alias gets (un)mapped.  
> > 
> > this needs a clarification,
> > is memory_region_is_mapped() used on aliased memory region or on alias?  
> 
> I think right now it's barely used with aliases 
> (memory_region_is_mapped(alias)), at least I am not aware of users.
> 
> What's more likely is that the final memory region will be the target of 
> memory_region_is_mapped().
> 
> The question is: which semantics do we want to have so we can properly 
> document and eventually fix.

The less confusing would be one where check works for any memory region
involved. 
 
> > 
> >   
> >>       I am not aware of actual issues, this is rather a cleanup.
> >>       
> >>       Signed-off-by: David Hildenbrand <david@redhat.com>
> >>
> >> diff --git a/include/exec/memory.h b/include/exec/memory.h
> >> index 75b4f600e3..93d0190202 100644
> >> --- a/include/exec/memory.h
> >> +++ b/include/exec/memory.h
> >> @@ -728,6 +728,7 @@ struct MemoryRegion {
> >>        const MemoryRegionOps *ops;
> >>        void *opaque;
> >>        MemoryRegion *container;
> >> +    int mapped_via_alias; /* Mapped via an alias, container might be NULL */
> >>        Int128 size;
> >>        hwaddr addr;
> >>        void (*destructor)(MemoryRegion *mr);
> >> diff --git a/softmmu/memory.c b/softmmu/memory.c
> >> index 3bcfc3899b..1168a00819 100644
> >> --- a/softmmu/memory.c
> >> +++ b/softmmu/memory.c
> >> @@ -2535,8 +2535,13 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
> >>                                                   hwaddr offset,
> >>                                                   MemoryRegion *subregion)
> >>    {
> >> +    MemoryRegion *alias;
> >> +
> >>        assert(!subregion->container);
> >>        subregion->container = mr;
> >> +    for (alias = subregion->alias; alias; alias = alias->alias) {
> >> +       alias->mapped_via_alias++;  
> > 
> > it it necessary to update mapped_via_alias for intermediate aliases?
> > Why not just update on counter only on leaf (aliased region)?  
> 
> Assume we have alias0 -> alias1 -> region and map alias0.
> 
> Once alias0 is mapped it will have ->container set and 
> memory_region_is_mapped(alias0) will return "true".
> 
> With my patch, both, "alias1" and the region will be marked 
> "mapped_via_alias" and memory_region_is_mapped() will succeed on both of 
> them. With what you propose, memory_region_is_mapped() would only 
> succeed on the region (well, and on alias 0) but not on alias1.

as long as add_subregion increments counter on leaf it doesn't matter
how many intermediate aliases are there. Check on every one of them
should end up at the leaf counter (at expense of traversing
chain on every check but less state to track/think about).


