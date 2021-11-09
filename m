Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3CD44AAFE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 10:54:46 +0100 (CET)
Received: from localhost ([::1]:40208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkNq1-0003eZ-6h
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 04:54:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkNop-0002xK-PU
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:53:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkNob-0005iM-9e
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636451596;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dFrmOgTKgYBxMHmF5gDWRitRFn7KU6TSJFfkzBVBXg4=;
 b=SGQeMKh8hg9t4VW0k7p5D2kSxxtNcSpReb0EcZ6DPTTA5PxhCtZqdnY1Y7b4M+Yi0s/0LY
 ruHFemGHOg79iFafkV8JK+/zRajM9RPaCO6YjoXy+Pj/9C1V0OxKSrI9oFtB9SzKXO3Rg9
 mH8H2TevgEghp/DMEpaJRevslwDjIYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-c401ToXaNcK9J4h_y9Q8sw-1; Tue, 09 Nov 2021 04:53:10 -0500
X-MC-Unique: c401ToXaNcK9J4h_y9Q8sw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A23310151E1;
 Tue,  9 Nov 2021 09:53:09 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16CC419741;
 Tue,  9 Nov 2021 09:52:54 +0000 (UTC)
Date: Tue, 9 Nov 2021 09:52:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: Failure of hot plugging secondary virtio_blk into q35 Windows 2019
Message-ID: <YYpE8zhRR2WWFl+j@redhat.com>
References: <57170d20-635b-95fd-171e-e84de0d2d84e@oracle.com>
 <31c8012c-234f-2bb8-7db2-f7fee7bd311f@oracle.com>
 <4be352af-f3fc-0ef3-1d97-cd3eafbbb98f@oracle.com>
 <alpine.DEB.2.22.394.2111091226350.133428@anisinha-lenovo>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2111091226350.133428@anisinha-lenovo>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "imammedo@redhat.com" <imammedo@redhat.com>,
 "Annie.li" <annie.li@oracle.com>, jusual@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 12:41:39PM +0530, Ani Sinha wrote:
> 
> +gerd
> 
> On Mon, 8 Nov 2021, Annie.li wrote:
> 
> > Update:
> >
> > I've tested q35 guest w/o OVMF, the APCI PCI hot-plugging works well in q35
> > guest. Seems this issue only happens in q35 guest w/ OVMF.
> >
> > Looks that there is already a bug filed against this hotplug issue in q35
> > guest w/ OVMF,
> >
> > https://bugzilla.redhat.com/show_bug.cgi?id=2004829
> >
> > In this bug, it is recommended to add "-global
> > ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off \" on qemu command for 6.1.
> > However, with this option for 6.1(PCIe native hotplug), there still are kinds
> > of issues. For example, one of them is the deleted virtio_blk device still
> > shows in the Device Manager in Windows q35 guest, the operation of re-scanning
> > new hardware takes forever there. This means both PCIe native hotplug and ACPI
> > hotplug all have issues in q35 guests.
> 
> This is sad.
> 
> >
> > Per comments in this bug, changes in both OVMF and QEMU are necessary to
> > support ACPI hot plug in q35 guest. The fixes may likely be available in QEMU
> > 6.2.0.
> 
> So we are in soft code freeze for 6.2:
> https://wiki.qemu.org/Planning/6.2
> 
> I am curious about Gerd's comment #10:
> "The 6.2 rebase should make hotplug work
> again with the default configuration."
> 
> Sadly I have not seen any public discussion on what we want to do
> for the issues with acpi hotplug for bridges in q35.

I've raised one of the problems a week ago and there's a promised 
fix

 https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00558.html

but we're now a week after freeze and still no patch has been posted
AFAIK.

IMHO it is pretty much time to revert to native hotplug, otherwise 
we're going to risk getting too late into freeze to do anything, and 
end up shipping with broken PCI hotplug again in 6.2

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


