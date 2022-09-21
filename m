Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC62A5BF640
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 08:27:20 +0200 (CEST)
Received: from localhost ([::1]:38266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oatCV-00046A-Kz
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 02:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oat0a-0007MF-R4
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 02:14:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oat0Y-0001WL-5f
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 02:14:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663740893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tGdOOgXA3VRnXiIVwgeGWfN2WwBU9uncnPqPhbC/pqU=;
 b=LM21nnxAVkVXJJofeN98VbJ99d05+j3BoU0qslxEm1F1owWUfGDr3Fh4P4flMB1l95PhRB
 +5LHy6DZ1579nSLHHabG3z7FY1/c/baNqyuXhRN7gXh3UW3AqZd8ftNrFj30ORh8QCeZog
 gJneJcXQdOOkliKpXicDJmQ8OY4bI64=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-NuHxtFBhMPmDxR5ftZVXPw-1; Wed, 21 Sep 2022 02:14:49 -0400
X-MC-Unique: NuHxtFBhMPmDxR5ftZVXPw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B5672999B4C;
 Wed, 21 Sep 2022 06:14:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3383492B06;
 Wed, 21 Sep 2022 06:14:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5DE031800081; Wed, 21 Sep 2022 08:14:47 +0200 (CEST)
Date: Wed, 21 Sep 2022 08:14:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Liav Albani <liavalb@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/1] hw/display: expose linear framebuffer address in
 Bochs VBE registers
Message-ID: <20220921061447.e2ii6q24f2e6n64q@sirius.home.kraxel.org>
References: <20220920154922.248790-1-liavalb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920154922.248790-1-liavalb@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

  Hi,

> 1. Although it is reasonable to assume no more than one isa-vga device
>   will exist in one machine, this could be changed easily later on.

Nope.  Even if you fix the framebuffer address conflict you still have
the io address conflict.

>   As it stands now, on an ISA-PC machine with no PCI bus, there are
>   basically zero methods to detect hardware - you have to assume the
>   hardware is there, or just to probe for it and hope for the best.

Yep.  That's why isa-pc is pretty much unused these days.

>   However, for other machines, and the one I am especially interested
>   in, the microvm machine, this claim could be easily revoked as the
>   microvm machine exposes a device tree - we could easily place many
>   ISA-VGA devices on the "System bus" of a virtual machine, essentially
>   having multiple framebuffer devices on such machine setup, with no PCI
>   bus being involved at all. Of course, we will need to figure out how
>   to make some sort of an ISA-VGA device that resembles a bochs-display
>   device - it should not have VGA capabilities because otherwise the
>   devices' resources will be in conflict for VGA control of the VGA IO
>   space. The Bochs VBE registers will also need to be located in
>   different IO ports too for each device.

When you want build a sysbus variant of the bochs-display device and
make that discoverable by the guest somehow (dt or acpi) you can expose
both io ports and framebuffer address that way.  No need to touch the
bochs dispi interface for that.

>   This idea is quite neat in my opinion, because it could speed up the
>   boot of such VM while still providing sufficient display capabilities
>   for those we need them. It could help developers to test their OSes
>   on such hardware setups to ensure multi-monitor configuration works
>   reliably when there's no PCI bus at all but many framebuffer devices
>   being used in one VM.

Why not just use virtio-gpu?

> 2. This is more related to the SerenityOS project - I prefer to not 
>   hardcode physical addresses at all wherever I can do so. This makes
>   the code cleaner and more understandable as far as I observe this from
>   the angle of the person which is not me, that tries to make sense from
>   the code flow.

Yea, fully agree, but why continue to use non-discoverable isa bus
devices then?

> 3. The costs of adding this feature are pretty negligible compared to
>   the possible value of this, especially if we apply the idea of running
>   multiple ISA-VGA devices on one microvm machine. Still, the only major
>   "issue" that one can point to is the fact that I bump up the Bochs VBE
>   version number, which could be questionable with how the feature might
>   be insignificant for many guest OSes out there.

Touching isa-vga at this point doesn't make sense at all.  We simply
can't move around the framebuffer without screwing up users.

Also I don't see any actual value in this.  Even considering the
multiple devices case the patch is a partial solution only (handles
the framebuffer but not the ioports) which is pointless.

take care,
  Gerd


