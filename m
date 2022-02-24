Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A604C3458
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 19:11:29 +0100 (CET)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNIaN-000681-Mj
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 13:11:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNIXO-0003jx-7s
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:08:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNIXL-0006QM-CJ
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645726097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L1foLbYE3Ru2gqLlkjiY0ehvHJRzEbV3WjfasQ8f9O0=;
 b=Q6ICoRhYg5oQZY8TOsFX3i1nbJlYvMHEAVsoVieBNjB+4uHar1+7mG3TsiKwdR+O6XnWHh
 dj4qSAsnZTjfYVe+xrchRqY/OpcZIXNxJhXVTJPLpkcqwgECJ0ZHlxSmsR83Uf8lw1zeOw
 v/ZcfUKPELVQ8d8WKhGX265ak+3/LCY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-86r7xv57NY2CXfbTDncHng-1; Thu, 24 Feb 2022 13:08:16 -0500
X-MC-Unique: 86r7xv57NY2CXfbTDncHng-1
Received: by mail-ej1-f72.google.com with SMTP id
 hc39-20020a17090716a700b006ce88cf89dfso1575743ejc.10
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 10:08:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L1foLbYE3Ru2gqLlkjiY0ehvHJRzEbV3WjfasQ8f9O0=;
 b=o5/EOG2dlWIGXSj9EAT6eVN74cuAwWKwA5B0Ff6cgoz5RzgWJcfiOZoeliGGqOQpcP
 jl2t6yqP8pugq5dAPZZdcX+NP0YdfCSHkPjuUU90qQFEXnh6rWNKgCKjsDDynYBoCZMO
 2zp1R8bcEdXuRoAL+PickCToL41cvqjvKfnwV4cXmD8FBptmt4rsocRSgzgEiW8livmS
 1ZpeZhAs3bIs8zDGaCDp3kY/01T9TaBD7TEEissqKa1nkcCd+0vzc3BA0OtWh4cS1Hd+
 WIDU/wPN/pwOvYkd1B5BThN3DEOI+xLIIn//aX+0RkkMBj6ES6nV1GekJ/Ez+r6/GkwV
 wOng==
X-Gm-Message-State: AOAM5329ntkuQJIuLu/3K1kfk1Rc8xY9lxXS3Z/bmTFFC3kxru5Andmi
 7qcxRX22yBxbgFLBBJ0pilcjNxMhD+stU58qZF8gyjh9OYnDX3zrU2Qc4HFTEI3qX/t9wufa5eS
 Wn98MDDDwoXN0kQc=
X-Received: by 2002:a50:fa93:0:b0:40f:d482:ef63 with SMTP id
 w19-20020a50fa93000000b0040fd482ef63mr3426056edr.348.1645726095476; 
 Thu, 24 Feb 2022 10:08:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuQdKw6wRIxVbBSjJW2nhq5sQLcuHjwpfcgcwBisff8KhVIztOzjaVs3258+JtC7RHMNvr7Q==
X-Received: by 2002:a50:fa93:0:b0:40f:d482:ef63 with SMTP id
 w19-20020a50fa93000000b0040fd482ef63mr3426039edr.348.1645726095253; 
 Thu, 24 Feb 2022 10:08:15 -0800 (PST)
Received: from redhat.com ([2.55.145.157]) by smtp.gmail.com with ESMTPSA id
 j21-20020aa7c415000000b004127ac9ddc3sm95349edq.50.2022.02.24.10.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 10:08:14 -0800 (PST)
Date: Thu, 24 Feb 2022 13:08:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 0/4] Fix broken PCIe device after migration
Message-ID: <20220224130708-mutt-send-email-mst@kernel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220224174411.3296848-1-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 12:44:07PM -0500, Igor Mammedov wrote:
> Currently ACPI PCI hotplug is enabled by default for Q35 machine
> type and overrides native PCIe hotplug. It works as expected when
> a PCIe device is hotplugged into slot, however the device becomes
> in-operational after migration. Which is caused by BARs being
> disabled on target due to powered off status of the slot.
> 
> Proposed fix disables power control on PCIe slot when ACPI pcihp
> takes over hotplug control and makes PCIe slot check if power
> control is enabled before trying to change slot's power. Which
> leaves slot always powered on and that makes PCI core keep BARs
> enabled.
> 
> PS:
> it's still hacky approach as all ACPI PCI hotplug is, but it's
> the least intrusive one. Alternative, I've considered, could be
> chaining hotplug callbacks and making pcihp ones call overriden
> native callbacks while inhibiting hotplug event in native callbacks
> somehow. But that were a bit more intrusive and spills over to SHPC
> if implemented systematically, so I ditched that for now. It could
> be resurrected later on if current approach turns out to be
> insufficient.

Yes, I am wondering about this myself. Replace callbacks with
some kind of notifier, so instead of overrides we add things?
I will ponder this over the weekend.

> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
> CC: mst@redhat.com
> CC: kraxel@redhat.com
> 
> Igor Mammedov (4):
>   pci: expose TYPE_XIO3130_DOWNSTREAM name
>   pcie: update slot power status only is power control is enabled
>   acpi: pcihp: disable power control on PCIe slot
>   q35: compat: keep hotplugged PCIe device broken after migration for
>     6.2-older machine types
> 
>  include/hw/acpi/pcihp.h                    |  4 +++-
>  include/hw/pci-bridge/xio3130_downstream.h | 15 +++++++++++++++
>  hw/acpi/acpi-pci-hotplug-stub.c            |  3 ++-
>  hw/acpi/ich9.c                             | 21 ++++++++++++++++++++-
>  hw/acpi/pcihp.c                            | 16 +++++++++++++++-
>  hw/acpi/piix4.c                            |  3 ++-
>  hw/core/machine.c                          |  4 +++-
>  hw/pci-bridge/xio3130_downstream.c         |  3 ++-
>  hw/pci/pcie.c                              |  5 ++---
>  9 files changed, 64 insertions(+), 10 deletions(-)
>  create mode 100644 include/hw/pci-bridge/xio3130_downstream.h
> 
> -- 
> 2.31.1


