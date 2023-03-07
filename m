Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8FD6ADD38
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:26:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVSH-0004x4-5w; Tue, 07 Mar 2023 06:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZVSE-0004vd-Ne
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:26:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZVSD-0005Ma-32
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678188360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sNq3hBdUN/pyTSpZx2b5XHfpkC2sUYuHND2JNoRhAX8=;
 b=f8smVKkGZs2BZzHBMJi6xfwVaaSVWL0wfpt3n4bw7r7sUcF/FUr0kFoQwmGcxzt4e4Cp+X
 6DSV4g9SsZon4O160j75T22KdqEnU4Rco8jEOKBIk1+6U8KRH/7iOT9fG1NgM5ZQnDu2oa
 +Hq8FOeIvjYPAiAiqvIVqsHzHlbtWIA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-aUB0m9RIO5CR_lboggeSzg-1; Tue, 07 Mar 2023 06:25:58 -0500
X-MC-Unique: aUB0m9RIO5CR_lboggeSzg-1
Received: by mail-ed1-f70.google.com with SMTP id
 v11-20020a056402348b00b004ce34232666so15165561edc.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678188358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sNq3hBdUN/pyTSpZx2b5XHfpkC2sUYuHND2JNoRhAX8=;
 b=WdPfTYiYhV2/HY+gZp/LTdzNfoX1oFrpXIpBmDhbg80fbUkKwIGrwbl0LQkE9DIqfE
 ufNmLG0TgdNJ58nlwYO5LfpBW/2n6FEw/uXu2peNTjAoNVDyXOnMXnYeyg5PEQG21Fkn
 V5p4cFKxzqAhL5pnSYCdlWgrVqDxAFSzYfnNp6/V6jtdTjRoiWps1Rq8JgjYEGP8N0AW
 YbRZSyrQIg+WgrJiUaVdbIa/dwpPhyKESP5Ly8Uo/Y6KZWg/fMaHv4b+CD2j7XFyzv16
 c4dHL7N9KuQc7m64rNJ1zlsPEBhT4Jg08AA2F93GyM/wtweKKUDFABKOrK8camtmv49/
 YBrQ==
X-Gm-Message-State: AO0yUKWT65hwwUC1ribQk68NQF2y/DW4nnfgJc6b4V+uDR4Sb/3yFBs+
 RKNDC3D5aCL6t1eNr5eITn4zuWtbgH3hmqwNq83nm4HMs/cuS78OpfQ6U3xqMpm9g44dBUYBnoT
 ibwBNQiIhaAOJsx4=
X-Received: by 2002:a17:907:c785:b0:8b0:2440:3903 with SMTP id
 tz5-20020a170907c78500b008b024403903mr15055550ejc.6.1678188357922; 
 Tue, 07 Mar 2023 03:25:57 -0800 (PST)
X-Google-Smtp-Source: AK7set874ynojjmhCKCjaHKJtNDM6ryJ4Grbx4spJYhAxbbo8Tv7dYFIaasatRckSsh/5YMQNrT45Q==
X-Received: by 2002:a17:907:c785:b0:8b0:2440:3903 with SMTP id
 tz5-20020a170907c78500b008b024403903mr15055533ejc.6.1678188357663; 
 Tue, 07 Mar 2023 03:25:57 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 n24-20020a1709062bd800b008b17aa6afc8sm5946959ejg.30.2023.03.07.03.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:25:57 -0800 (PST)
Date: Tue, 7 Mar 2023 12:25:56 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Bui Quang Minh  <minhquangbui99@gmail.com>, qemu-devel@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/4] apic: add support for x2APIC mode
Message-ID: <20230307122556.0abe296a@imammedo.users.ipa.redhat.com>
In-Reply-To: <96f1f670d576dbb1969055353b9e7b5a8632a4c8.camel@infradead.org>
References: <20230221160500.30336-1-minhquangbui99@gmail.com>
 <20230221160500.30336-2-minhquangbui99@gmail.com>
 <20230224152932.1de436cb@imammedo.users.ipa.redhat.com>
 <ee3d42c1-9e52-57f9-eba8-a5dc3a45d14f@gmail.com>
 <20230227170759.12297901@imammedo.users.ipa.redhat.com>
 <f24683be-f3a7-34fe-279a-11d01e696bbc@gmail.com>
 <20230228173954.6a7b6c4f@imammedo.users.ipa.redhat.com>
 <71d9e801-80b2-d5ed-4c02-b328f0b175d4@gmail.com>
 <20230306114331.531c9cd2@imammedo.users.ipa.redhat.com>
 <96f1f670d576dbb1969055353b9e7b5a8632a4c8.camel@infradead.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 06 Mar 2023 15:51:45 +0000
David Woodhouse <dwmw2@infradead.org> wrote:

> On Mon, 2023-03-06 at 11:43 +0100, Igor Mammedov wrote:
> > > However, there are still problems while trying to extending support to 
> > > APIC ID larger than 255 because there are many places assume APIC ID is 
> > > 8-bit long.  
> >
> > that's what I was concerned about (i.e. just enabling x2apic without fixing
> > with all code that just assumes 8bit apicid).  
> 
> Even before you extend the physical APIC IDs past 254 or 255, there's
> still the issue that 255 isn't a broadcast in X2APIC mode. And that
> *logical* addressing will use more than 8 bits even when the physical
> IDs are lower.
> 
> > > One of that is interrupt remapping which returns 32-bit 
> > > destination ID but uses MSI (which has 8-bit destination) to send to 
> > > APIC. I will look more into this.  
> 
> The translated 'output' from the interrupt remapping doesn't "use MSI",
> in the sense of a write transaction which happens to go to addresses in
> the 0x00000000FEExxxxx range. The *input* to interrupt remapping comes
> from that intercept.
> 
> The output is already "known" to be an MSI message, with a full 64-bit
> address and 32-bit data, and the KVM API puts the high 24 bits of the
> target APIC ID into the high word of the address.
> 
> If you look at the "generic" x86_iommu_irq_to_msi_message() in
> hw/intc/x86-iommu.c you'll see it's also using the same trick:
> 
>     msg.__addr_hi = irq->dest & 0xffffff00;
> 
> 
> That hack isn't guest-visible. There *is* a trick which is guest-
> visible, implemented by both Hyper-V and KVM, which is to recognise
> that actually there was an 'Extended Destination ID' field in bits 4-11
> of the actual 32-bit MSI. Intel eventually used the low bit as the
> selector for 'Remappable Format' MSI messages, but we've used the other
> seven to extend the APIC ID to 15 bits even in a guest-visible way,
> allowing up to 32768 CPUs without having to expose a virtual IOMMU.
> 
> But that should get translated to the KVM format with the high bits in
> the top 32 bits of the address, fairly much transparently. All you need
> to do is ensure that the TCG X2APIC support takes that KVM format, and
> that it all enabled in the right circumstances.
I wouldn't bother with 'Extended Destination ID' KVM trick for emulated
x2apic and just limit impl. to what real hardware does.
Though potentially supporting it in TCG mode could be used for CI tests
to make sure we do not regress it (if someone bothered to write test-cases
for it).


