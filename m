Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CFB454292
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:24:44 +0100 (CET)
Received: from localhost ([::1]:40188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGFH-0001Xp-F1
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:24:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mnGDL-00007E-Cb
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:22:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mnGD8-0001Vq-C8
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:22:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637137348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7esyfCe0KuLi/gMGSnRhzzsgc/XGzHwRyLJlZWYSe1o=;
 b=cQa6dcPBAWA+REQ2T9IHkU7gK6lKA60Z++2vSOzIeUyDSpir0I3jgumGFM5KbekUlvAsz8
 b0MZMk+9rcjU3i19+awBvPQi7hi936ktY5+S3KAmbvnTURJB2MA3AXbbploT4fHjXPOWbm
 E/r7zxOQS7RSPOraJH8P+sGcBBxjVtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-8mtYHTm4PG-8wpPnUj-mQA-1; Wed, 17 Nov 2021 03:22:25 -0500
X-MC-Unique: 8mtYHTm4PG-8wpPnUj-mQA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D19B1015DA1;
 Wed, 17 Nov 2021 08:22:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA52A5F4E0;
 Wed, 17 Nov 2021 08:22:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 80D2E18000B2; Wed, 17 Nov 2021 09:22:20 +0100 (CET)
Date: Wed, 17 Nov 2021 09:22:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] q35: turn off power_controller_present when acpi hotplug
 is enabled
Message-ID: <20211117082220.4xynuzsjx5qxkhyp@sirius.home.kraxel.org>
References: <20211116090433.3212549-1-kraxel@redhat.com>
 <20211116202641.463bd07a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211116202641.463bd07a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 08:26:41PM +0100, Igor Mammedov wrote:
> On Tue, 16 Nov 2021 10:04:33 +0100
> Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> > Disable power control for pcie slots in case acpi hotplug is enabled
> > (6.2+ only for compatibility reasons).  This makes sure we don't get
> > unpleasant surprises with pci devices not being functional due to slot
> > power being turned off.
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  hw/i386/pc_q35.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > index e1e100316d93..869ca4c130f0 100644
> > --- a/hw/i386/pc_q35.c
> > +++ b/hw/i386/pc_q35.c
> > @@ -247,9 +247,16 @@ static void pc_q35_init(MachineState *machine)
> >                                                   "x-keep-pci-slot-hpc",
> >                                                   NULL);
> >  
> > -    if (!keep_pci_slot_hpc && acpi_pcihp) {
> > -        object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
> > -                                   "false", true);
> > +    if (acpi_pcihp) {
> > +        if (keep_pci_slot_hpc) {
> > +            /* 6.2+ default: acpi-hotplug=on native-hotplug=on power-ctrl=off */
> > +            object_register_sugar_prop(TYPE_PCIE_SLOT, COMPAT_PROP_PCP,
> > +                                       "false", true);
> 
> that will also turn off COMPAT_PROP_PCP on ports attached to PXBs,
> where ACPI hotplug is not used and native one is active.

Oh, wasn't aware of that detail.

> So question is if it's expected behavior?

Nope.  When native hotplug is used slot power control should be enabled.

Not sure how to handle that best though ...

take care,
  Gerd


