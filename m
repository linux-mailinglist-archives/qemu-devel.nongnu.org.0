Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801F345DBB8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 14:54:32 +0100 (CET)
Received: from localhost ([::1]:58366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqFCp-0003KO-K3
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 08:54:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mqFB6-0001yt-Bc
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:52:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mqFAn-0007sv-Hs
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637848344;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=7ocIIQZCT6Q2XJM7p8CUW8xZ32pIxOP62CciIS+Hmqs=;
 b=ECy0DWxsFR/1T3OWzlcwCAkE2Fdck/kHXZyjaZprxLVsyk+3IVJpWWFR+FPelQCsqw5lSQ
 7jOLNT6x6AW0zp0zw1WdJshlf47bVtVEtxePvarjz99Q/CgurcEnAVUZvmHyKQi6xypphv
 eV/LlA2CnCz9fWlLPQ6heuGCGgrx4VY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-Kc-7kiSlO5OU2KU5dBYjuQ-1; Thu, 25 Nov 2021 08:52:22 -0500
X-MC-Unique: Kc-7kiSlO5OU2KU5dBYjuQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BACCC64083;
 Thu, 25 Nov 2021 13:52:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EADD272FA4;
 Thu, 25 Nov 2021 13:52:05 +0000 (UTC)
Date: Thu, 25 Nov 2021 13:52:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: SEV guest attestation
Message-ID: <YZ+VAotzIOwUjMc8@redhat.com>
References: <YZ58+T04uVXaO2Ab@redhat.com> <YZ6Ec0yG82nhbN+B@work-vm>
 <20211125071428.dpnavgxd3w4bzktr@mhamilton>
MIME-Version: 1.0
In-Reply-To: <20211125071428.dpnavgxd3w4bzktr@mhamilton>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: afrosi@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, dovmurik@linux.ibm.com,
 Tyler Fanelli <tfanelli@redhat.com>, dinechin@redhat.com,
 John Ferlan <jferlan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 25, 2021 at 08:14:28AM +0100, Sergio Lopez wrote:
> For SEV-SNP, this is pretty much the end of the story, because the
> attestation exchange is driven by an agent inside the guest. Well,
> there's also the need to have in the VM a well-known vNIC bridged to a
> network that's routed to the Attestation Server, that everyone seems
> to consider a given, but to me, from a CSP perspective, looks like
> quite a headache. In fact, I'd go as far as to suggest this
> communication should happen through an alternative channel, such as
> vsock, having a proxy on the Host, but I guess that depends on the CSP
> infrastructure.

Allowing network connections from inside the VM, to any kind
of host side mgmt LAN services is a big no for some cloud hosts.

They usually desire for any guest network connectivity to be
associated with a VLAN/network segment that is strictly isolated
from any host mgmt LAN.

OpenStack provides a virtual CCDROM for injecting cloud-init
metadata as an alternative to the network based metadata REST
service, since they latter often isn't deployed.

Similarly for virtual filesystems, we've designed virtiofs,
rather than relying on a 2nd NIC combined with NFS.

We cannot assume availability of a real network device for the
attestation. If one does exist fine, but there needs to be an
alternative option that can be used.


On a slightly different topic - if the attestation is driven
from an agent inside the guest, this seems to imply we let the
guest vCPUs start beforre attestation is done. Contrary to
the SEV/SEV-ES where we seem to be wanting vCPUs to remain
in the stopped state until attestation is complete & secrets
provided.  If the vCPUs are started, is there some mechanism
to restrict what can be done  before attestation is complete?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


