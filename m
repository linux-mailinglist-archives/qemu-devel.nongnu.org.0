Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4C433C412
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:26:16 +0100 (CET)
Received: from localhost ([::1]:41068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqyt-0000oh-0c
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lLqsZ-00049e-Ix
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:19:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lLqsU-0007QZ-Ar
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615828775;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=GDn5NXm7Gz3z+YjdHoMrlFLHbgZNsRHqfwjd15+jD8o=;
 b=O7OB7Bi2Yr2wpwcX6YFJbShoUvKUcLcG+/Pgx/6HIrcacAyy9PSK4XXz35jLARUGIk/c8R
 jf8+QqamGg4TPSq4taWx9Y5w/w3Cu30r8TQPk2fZiLsqwTVBUSj+sna9GGbbVANeRcMtKm
 UdgvUZpz0cgOtgXzJnupDGDUaD5mh9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-LUdh60I2NMG2i309cUhPJw-1; Mon, 15 Mar 2021 13:19:26 -0400
X-MC-Unique: LUdh60I2NMG2i309cUhPJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31479817471;
 Mon, 15 Mar 2021 17:19:25 +0000 (UTC)
Received: from redhat.com (ovpn-115-81.ams2.redhat.com [10.36.115.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62405620DE;
 Mon, 15 Mar 2021 17:19:20 +0000 (UTC)
Date: Mon, 15 Mar 2021 17:19:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <YE+XFQ9MUcp9QHs6@redhat.com>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
MIME-Version: 1.0
In-Reply-To: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 05:58:04PM +0100, Reinoud Zandijk wrote:
> Hi,
> 
> with the introduction of the following patch from 17th of February, Win10
> won't boot anymore without explicitly setting the machine to be 5.2 compatible
> like pc-1440fx-5.2. The default 6.0 will cause it to panic and gives as reason
> only "ACPI error".
> 
> It might work to counter a bug in Linux but this is not the place to do the
> patch. The BSDs don't care and will boot fine with full ACPI regardless of the
> machine chosen. Windows 10 however DOES care and gets confused.
> 
> I think its better to revert this and fix Linux ;) or make it a selectable
> feature as a workaround that's by default OFF :)

I'm copying the people involved in creating/reviewing the commit you
mention below.

I've also added this regression to the 6.0 issues list, since being
able to boot current Windows guests with the default machine type
should be considered a release blocker IMHO.

   https://wiki.qemu.org/Planning/6.0#Not_fixed_yet

> 
> With regards,
> Reinoud
> 
> 
> The patch concerned is:
> 
> commit 6be8cf56bc8bda2ed9a070bdb04446191f31acc9
> Author: Isaku Yamahata <isaku.yamahata@intel.com>
> Date:   Wed Feb 17 21:51:12 2021 -0800
> 
>     acpi/core: always set SCI_EN when SMM isn't supported
>     
>     If SMM is not supported, ACPI fixed hardware doesn't support
>     legacy-mode. ACPI-only platform. Where SCI_EN in PM1_CNT register is
>     always set.
>     The bit tells OS legacy mode(SCI_EN cleared) or ACPI mode(SCI_EN set).
>     
>     With the next patch (setting fadt.smi_cmd = 0 when smm isn't enabled),
>     guest Linux tries to switch to ACPI mode, finds smi_cmd = 0, and then
>     fails to initialize acpi subsystem. This patch proactively fixes it.
>     
>     This patch changes guest ABI. To keep compatibility, use
>     "smm-compat" introduced by earlier patch. If the property is true,
>     disable new behavior.
>     
>     ACPI spec 4.8.10.1 PM1 Event Grouping
>     PM1 Eanble Registers
>     > For ACPI-only platforms (where SCI_EN is always set)
>     
>     Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>     Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
>     Message-Id:
> <500f62081626997e46f96377393d3662211763a8.1613615732.git.isaku.yamahata@intel.com>
>     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
>  hw/acpi/core.c         | 11 ++++++++++-
>  hw/acpi/ich9.c         |  2 +-
>  hw/acpi/piix4.c        |  3 ++-
>  hw/core/machine.c      |  5 ++++-
>  hw/isa/vt82c686.c      |  2 +-
>  include/hw/acpi/acpi.h |  4 +++-
>  6 files changed, 21 insertions(+), 6 deletions(-)
> 
> 



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


