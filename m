Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B185E5F19
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:56:37 +0200 (CEST)
Received: from localhost ([::1]:40450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obIwd-0000Ng-Lr
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obIe0-0001ye-Px
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obIdw-0001Xt-P0
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663839436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7oj+2jI4YoPXJ6AGpx0nxqfwe010tlDa7ZqwHb2xxQ0=;
 b=XPJ61wDh9ZCq2P/yWNIdscfx3Y3R+XYGXO/8u8QuPkE+jUL2rOM7bHLQPoIO6TPFBTJa0k
 QO0A9kZeBeuDBYXCFAXgGeSOZHGh7+yWdlPX6BVjkHsWTWs647IbaRhwN4r1JwxcJyI99B
 EsvaKN/HWB+zx7ZZkB/5Fat13UxQ9kc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-0vaBM6gePO25M4Y0MC3gcg-1; Thu, 22 Sep 2022 05:37:12 -0400
X-MC-Unique: 0vaBM6gePO25M4Y0MC3gcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64E2A294EDF2;
 Thu, 22 Sep 2022 09:37:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BD86C15BA8;
 Thu, 22 Sep 2022 09:37:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C22C91800084; Thu, 22 Sep 2022 11:37:10 +0200 (CEST)
Date: Thu, 22 Sep 2022 11:37:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3] x86: add etc/phys-bits fw_cfg file
Message-ID: <20220922093710.q3pxbxljdhu4a4yw@sirius.home.kraxel.org>
References: <20220922084356.878907-1-kraxel@redhat.com>
 <20220922044906-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922044906-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Thu, Sep 22, 2022 at 04:55:16AM -0400, Michael S. Tsirkin wrote:
> On Thu, Sep 22, 2022 at 10:43:56AM +0200, Gerd Hoffmann wrote:
> > In case phys bits are functional and can be used by the guest (aka
> > host-phys-bits=on) add a fw_cfg file carrying the value.  This can
> > be used by the guest firmware for address space configuration.
> > 
> > This is only enabled for 7.2+ machine types for live migration
> > compatibility reasons.
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> I'm curious why you decided to switch from a cpuid flag to fw cfg.

The kernel people didn't like the cpuid approach.

> I guess firmware reads fw cfg anyway.

Correct.

> But would the guest kernel then need to load a fw cfg driver very
> early to detect this, too?

Nope, the guest kernel can just work with the address space layout
created by the firmware.  The firmware can for example reserve a
larger 64-bit mmio window in case there is enough address space for
that.  So it programs the bridge windows etc accordingly, qemu
generates matching acpi tables and the kernel picks up the changes
via _CRS.

> > +void fw_cfg_phys_bits(FWCfgState *fw_cfg)
> > +{
> > +    X86CPU *cpu = X86_CPU(first_cpu);
> > +    uint64_t phys_bits = cpu->phys_bits;
> > +
> > +    if (cpu->host_phys_bits) {
> > +        fw_cfg_add_file(fw_cfg, "etc/phys-bits",
> > +                        g_memdup2(&phys_bits, sizeof(phys_bits)),
> > +                        sizeof(phys_bits));
> > +    }
> > +}
> 
> So, this allows a lot of flexibility, any phys_bits value at all can now
> be used. Do you expect a use-case for such a flexible mechanism?  If
> this ends up merely repeating CPUID at all times then we are just
> creating confusion.

Yes, it'll just repeat CPUID.  Advantage is that the guest gets the
information it needs right away.

Alternatively I could create a "etc/reliable-phys-bits" bool.
The firmware must consult both fw_cfg and cpuid then.

take care,
  Gerd


