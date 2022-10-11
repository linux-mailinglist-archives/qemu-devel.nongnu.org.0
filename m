Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9275FA8E9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 02:07:56 +0200 (CEST)
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi2oN-0003rn-1I
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 20:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oi2ll-0002Ll-3S
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 20:05:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oi2lh-0003TP-Qu
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 20:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665446707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oPHLqqv8CldvjAiHhaN4cWJC+VHOpo1jj3Xsy1BYTOc=;
 b=YPjuvfwe9bS4GuuwLbkJDDUnAzXp0pjdxMqM8Ku1jabuTNeYcujmZckuRb7kdOiHeBHh3M
 V87qUsH0jTLb9uGCue9iEgvdN9JmKgUyi2SVdYntRsTMToUbeyezinh9uYDc8WyI3WpNVz
 PRDnXuE6iJJa3fatqOg4rGQUHmCTcYk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-315-AE1zrB3_NeKUEgxxbJRKlw-1; Mon, 10 Oct 2022 20:05:05 -0400
X-MC-Unique: AE1zrB3_NeKUEgxxbJRKlw-1
Received: by mail-qk1-f198.google.com with SMTP id
 u7-20020a05620a0c4700b006ee526183fcso1422768qki.8
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 17:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oPHLqqv8CldvjAiHhaN4cWJC+VHOpo1jj3Xsy1BYTOc=;
 b=47QkVd0eSngH8xWCd+ESI5LzQraFTU39ITd4Fkw2e+GH8HWOKT0jyxdEogiLxt09Us
 CqQriNHkXLTsdM4oDXm/7bYtWb+aP/11FBoR769YvtFNn62qR/V5yS2pFSHENvPErbat
 MuFx1D39n2/Zv19kG5s4ZRtc+MyUPyMC1erclh02yloofn9Xb6TWjI1x8QXhreY7CvAL
 kMbX8HY0KIdufl9jDgpe7nKZd1vT+gUEM3QzH4BfVebR1zSxV4SFT7HzBBcu+CblakTl
 Vd2K2POxA7cUdv+vo2jwpqvawXSRzYHD9FHbJwUoGt1q0yjvXh2+Qo8Dyx958c94NxaZ
 JVBQ==
X-Gm-Message-State: ACrzQf0QfZm8o8wGcYX+7xj3+lN4IffH7us69zXdp2IHr97Lfmw2YEkI
 X8meTaMJKkZ1U9r4qNxdhTtFaPzeIue+5sC70ujOF4CaP8RavaH7UnS/70L2OqKQddkb0Fp3cZi
 88zxGculuh8XKDuw=
X-Received: by 2002:a05:622a:30f:b0:39b:192a:3052 with SMTP id
 q15-20020a05622a030f00b0039b192a3052mr3966781qtw.412.1665446705109; 
 Mon, 10 Oct 2022 17:05:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5vZYFl1zAkTwuexCbwZfDn+DsttM+lZyGSfv3DQcrnae7P2DzLVuCOEl2zfT+tV9TnbjQn/A==
X-Received: by 2002:a05:622a:1441:b0:35c:da34:d5dc with SMTP id
 v1-20020a05622a144100b0035cda34d5dcmr17347580qtx.338.1665446693844; 
 Mon, 10 Oct 2022 17:04:53 -0700 (PDT)
Received: from xz-m1.local ([70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 w41-20020a05622a192900b0035d5e5660cbsm511862qtc.59.2022.10.10.17.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 17:04:53 -0700 (PDT)
Date: Mon, 10 Oct 2022 20:04:47 -0400
From: Peter Xu <peterx@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PULL 29/55] Revert "intel_iommu: Fix irqchip / X2APIC
 configuration checks"
Message-ID: <Y0SzH9/gAzFezV5A@xz-m1.local>
References: <20221010172813.204597-1-mst@redhat.com>
 <20221010172813.204597-30-mst@redhat.com>
 <ff11454f877ce7ccb0a02a9343715bbb8f32194f.camel@infradead.org>
 <Y0RtkAWh28ALg1oB@xz-m1.local>
 <42339a0a365fe8abba801089e27822cac463da45.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42339a0a365fe8abba801089e27822cac463da45.camel@infradead.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 10, 2022 at 04:16:33PM -0700, David Woodhouse wrote:
> On Mon, 2022-10-10 at 15:08 -0400, Peter Xu wrote:
> > On Mon, Oct 10, 2022 at 10:39:52AM -0700, David Woodhouse wrote:
> > > On Mon, 2022-10-10 at 13:30 -0400, Michael S. Tsirkin wrote:
> > > > From: Peter Xu <
> > > > peterx@redhat.com
> > > > 
> > > > 
> > > > It's true that when vcpus<=255 we don't require the length of 32bit APIC
> > > > IDs.  However here since we already have EIM=ON it means the hypervisor
> > > > will declare the VM as x2apic supported (e.g. VT-d ECAP register will have
> > > > EIM bit 4 set), so the guest should assume the APIC IDs are 32bits width
> > > > even if vcpus<=255.  In short, commit 77250171bdc breaks any simple cmdline
> > > > that wants to boot a VM with >=9 but <=255 vcpus with:
> > > 
> > > I find that paragraph really hard to parse. What does it even mean that
> > > "guest should assume the APIC IDs are 32bits"? 
> > 
> > Quotting EIM definition:
> > 
> >  0: On Intel® 64 platforms, hardware supports only 8-bit APIC-IDs (xAPIC
> >     Mode).
> > 
> >  1: On Intel® 64 platforms, hardware supports 32-bit APIC- IDs (x2APIC
> >     mode).  Hardware implementation reporting Interrupt Remapping support
> >     (IR) field as Clear also report this field as Clear.
> > 
> > I hope the statement was matching the spec.  Please let me know if you have
> > better way to reword it.
> 
> It needs to mention logical mode addressing. Because that, I presume,
> is why it broke only when you had more than 8 vCPUs. Because that's
> when the *logical* destination ID grew past 0xFF.

Agree.

> 
> > > In practice, all the EIM bit does is *allow* 32 bits of APIC ID in the
> > > tables. Which is perfectly fine if there are only 254 CPUs anyway, and
> > > we never need to use a higher value.
> > > 
> > > I *think* the actual problem here is when logical addressing is used,
> > > which puts the APIC cluster ID into higher bits? But it's kind of weird
> > > that the message doesn't mention that at all?
> > 
> > The commit message actually doesn't even need to contain a lot of
> > information in this case, IMO.
> 
> Well, it would be kind of useful if it said what the actual problem
> was, no?

Yes it'll be nice to have.

> 
> > Literally it can be seen as a revert of a commit which breaks guest with
> > > 8vcpu from boot.  I kept the other lines because that still make sense, or
> > 
> > it can be a full revert with "something broke with commit xxx, revert it to
> > fix" and anything else could be reworked.  AFAICT that's how it normally
> > works with QEMU or Linux.
> > 
> > I am not 100% familiar with the original purpose of the patch, would
> > eim=off work for you even after patch applied?  Anything severely wrong
> > with this patch?
> 
> I think the patch itself is fine; I'd just like the commit message to
> be clearer about what the problem was.

Thanks for confirming.

> 
> > > That's fixable by just setting the X2APIC_PHYSICAL bit in the ACPI
> > > FADT, isn't it? Then the only values that a guest may put into those
> > > fields — 32-bit fields or not — are lower than 0xff anyway.
> > 
> > It's still not clear to me why we need to make it inconsistent between the
> > EIM we declare to the guest and the KVM behavior on understanding EIM bit.
> > Even if enforced physical mode will work we loose the possibility of
> > cluster mode, and I also don't see what's the major benefit since EIM=off
> > will just work, afaiu, meanwhile make everything aligned.
> 
> Yeah, I think turning EIM off is absolutely fine.
> 
> > Are you fine if we proceed with this pull request first and revisit later?
> > Follow up patches will always be fine, and we're unbreaking something.  I
> > have copied you since the 1st patch I posted and the small patch was there
> > for weeks, it'll be appreciated if either you could comment earlier next
> > time, or even propose a better fix then we can discuss what's the best way
> > to fix.  Thanks.
> 
> Yeah, sorry for the delay. But that was partly because the commit
> message was confusing me and it took me a while to work out what was
> actually going on... which is really all I'm heckling now.

I see, that was totally fine, and it'll be definitely also fine to comment
anything even on the pull req.  It's just that as I tried to argue for this
specific case IMHO we should move on and revisit later so we shrink the
regression window, rather than redo a pull and let this fix wait for
another one.  It seems we reached a consensus on this, thanks for that.

In all cases (irrelevant of the pull req), feel free to post any patch
either based on this one or as replacement.  I'll be happy to read and
rethink.  So far it still doesn't make sense to me to not enable kvm x2apic
with eim=on, but maybe I'm wrong, and I'd be happy to be corrected in that
case.

Thanks,

-- 
Peter Xu


