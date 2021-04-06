Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0232E355055
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 11:50:05 +0200 (CEST)
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTiLU-0002WH-3U
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 05:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lTiJF-0001dY-7g
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 05:47:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lTiJ4-0008RW-6z
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 05:47:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617702451;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=PNvaWNPL2Y1WPPsqporgBhyuhMu+0f6ltnCNLMWNAYg=;
 b=cKOitJm50YeIdxS2VIeyzSFndxiE1XNk86Jj0pWHLlPYwvM3P51uqEk2EzY0KmSa3RgN4L
 A0eUe1FN1tVV4tsUI8la0Vk5DuPVFCxACgZ4MLyi/dGPaY59IgsTkFfZjNWKKXZS2KLm4O
 VY62NG3kYjqh9aez+MgIeGdb0Z4vbmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-GcLkASTEMr-wqxfzpKz5aQ-1; Tue, 06 Apr 2021 05:47:27 -0400
X-MC-Unique: GcLkASTEMr-wqxfzpKz5aQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C500783DD22
 for <qemu-devel@nongnu.org>; Tue,  6 Apr 2021 09:47:26 +0000 (UTC)
Received: from redhat.com (ovpn-114-172.ams2.redhat.com [10.36.114.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8894019635;
 Tue,  6 Apr 2021 09:47:15 +0000 (UTC)
Date: Tue, 6 Apr 2021 10:47:12 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 2/6] pci: introduce apci-index property for PCI device
Message-ID: <YGwuIF69gi4a0fbo@redhat.com>
References: <20210315180102.3008391-1-imammedo@redhat.com>
 <20210315180102.3008391-3-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210315180102.3008391-3-imammedo@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jusual@redhat.com, qemu-devel@nongnu.org, laine@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 02:00:58PM -0400, Igor Mammedov wrote:
> In x86/ACPI world, linux distros are using predictable
> network interface naming since systemd v197. Which on
> QEMU based VMs results into path based naming scheme,
> that names network interfaces based on PCI topology.
> 
> With itm on has to plug NIC in exactly the same bus/slot,
> which was used when disk image was first provisioned/configured
> or one risks to loose network configuration due to NIC being
> renamed to actually used topology.
> That also restricts freedom to reshape PCI configuration of
> VM without need to reconfigure used guest image.
> 
> systemd also offers "onboard" naming scheme which is
> preferred over PCI slot/topology one, provided that
> firmware implements:
>     "
>     PCI Firmware Specification 3.1
>     4.6.7.  DSM for Naming a PCI or PCI Express Device Under
>             Operating Systems
>     "
> that allows to assign user defined index to PCI device,
> which systemd will use to name NIC. For example, using
>   -device e1000,acpi-index=100
> guest will rename NIC to 'eno100', where 'eno' is default
> prefix for "onboard" naming scheme. This doesn't require
> any advance configuration on guest side to com in effect
> at 'onboard' scheme takes priority over path based naming.
> 
> Hope is that 'acpi-index' it will be easier to consume by
> management layer, compared to forcing specific PCI topology
> and/or having several disk image templates for different
> topologies and will help to simplify process of spawning
> VM from the same template without need to reconfigure
> guest NIC.
> 
> This patch adds, 'acpi-index'* property and wires up
> a 32bit register on top of pci hotplug register block
> to pass index value to AML code at runtime.
> Following patch will add corresponding _DSM code and
> wire it up to PCI devices described in ACPI.

You've illustrated usage & benefits with NICs, but IIUC, this
feature is wired up for any PCI device. Are you aware of any
usage of this feature for non-NIC devices ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


