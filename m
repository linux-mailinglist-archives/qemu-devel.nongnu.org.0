Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C809F4B7444
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 19:16:06 +0100 (CET)
Received: from localhost ([::1]:56940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK2Mv-0007Z9-Ab
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 13:16:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nK2Ky-0006kH-A1
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:14:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nK2Kp-00035Z-Dc
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644948834;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=S7OMFT9gGKLOseZWKC5J4LOdcb6pHhtBFgWvPpHRfSI=;
 b=i+xmUuK4IRhYNUT2FJruHu7INGr5p0/MiPOtZcZ4+Hd5XvHg/e7Eqx6EV2PHMs1NfWgMgv
 KaKV+QgPrL1slZWiLAPnQ1x1aiezFCKqKgmE+RZ6hhXQwiiXbrRU2zcI8Fuv/FfFq20RuP
 lpI6QDRBsJcXfEWYLzVhbdQZNDGdaXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-G2GFf8K9P7mcJ2QSXIYzuA-1; Tue, 15 Feb 2022 13:13:46 -0500
X-MC-Unique: G2GFf8K9P7mcJ2QSXIYzuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E3C78144E6;
 Tue, 15 Feb 2022 18:13:45 +0000 (UTC)
Received: from redhat.com (unknown [10.39.196.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 186F37E915;
 Tue, 15 Feb 2022 18:13:04 +0000 (UTC)
Date: Tue, 15 Feb 2022 18:13:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
Message-ID: <YgvtLmoJcv+ZSW1S@redhat.com>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220215162537.605030-4-dgilbert@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: eduardo@habkost.net, thuth@redhat.com, quintela@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 04:25:33PM +0000, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The 'q35' machine type series has been around for a few years now, and
> is getting heavily used downstream without many problems;  lets flip
> to using it as the default.

I don't think I'd claim 'without many problems'.  In RHEL while 'q35'
is recommended, it explicitly isn't the default because it would havbe
created compatibility problems for applications. Every non-trivial
application needs to make code changes to cope with 'q35' if they're
using 'i440fx' today.  Apps that Red Hat ships, either in RHEL or as
add-on products, have been updated, but it was certainly not painfree
and took considerable time for OpenStack at least. I worry about how
ready the broader QEMU consumers are to work with 'q35' as an opt-in,
let alone as a default.


PCI is the really big ticket item here. If keeping the same command
line none of the PCI devices added will be hotpluggable because
they'll all be put in the root complex as integrated end points,
whether PCI or PCIe devices.

To allow for hot-unplug, any cold plugged PCIe devices need to be
placed in unique pcie-root-port (one root port per device). The
PCI devices meanwhile have to be put into a pci-bridge, which is
in turn plugged into a pcie-to-pci-bridge.  QEMU doesn't do this
placement by default so nothing is hot-unpluggable.

To allow for hot-plug, it is needed to pre-create many pcie-root-port
devices - one for each device to be plugged.

Libvirt tried to make this a little easier by putting cold plugged
devices into a place that allows them to be hot-unplugged.

On the libvirt side, there's also the need to know about sata vs
ide. That ones fun because at the QEMU level we still refer to it
as 'ide' throughout, even though q35 is implementing sata. 

There was one other notable difference that impacted apps, but I
can't remember what it was offhand.


> While it is of course newer and shinier than it's old i440fx cousin,
> the main reasons are:

s/newer and shinier/slightly less ancient and obsolete/ ;-P

>   * PCIe support
>   * No default floppy or IDE
>   * More modern defaults for NIC
>   * Better OVMF support

These are fine reasons for recommending apps to prefer use of 'q35'
on an opt-in basis.

Given the semantic differences from 'i440fx', changing the default
machine type has effects that are equivalent to breaking command
line syntax compatibility, which is something we've always tried
to avoid.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


