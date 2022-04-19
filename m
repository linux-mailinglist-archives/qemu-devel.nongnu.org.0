Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C15B5075E7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 19:04:30 +0200 (CEST)
Received: from localhost ([::1]:49156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngrHB-0008EE-3C
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 13:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngrDa-0006T4-FU
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 13:00:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngrD1-0003Bv-FK
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 13:00:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650387608;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CPh3w3hKI2YNhFyyQIqNZY395zB4wSTp9TpWnENHY40=;
 b=KBcQB8u0rZ82CKf1IdEwMe5pIXrtrxb0y1tT6LTLHIntkbgTXRZBPXu3XUkJC/ll8ig/ee
 vRfxJh3r5PoRePTye4uKxJBGjDvBDIuq8Vq36BkmU7BuW64M4aI3+FjTB+ez6JNEUzsbEl
 YoHE/CZZ8ifnblEU0lKr3Erb8LNTP/g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-zaQqgLs1NkyOICYDuudO3g-1; Tue, 19 Apr 2022 13:00:04 -0400
X-MC-Unique: zaQqgLs1NkyOICYDuudO3g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67C093801FF5;
 Tue, 19 Apr 2022 17:00:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.155])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91B95C53527;
 Tue, 19 Apr 2022 17:00:00 +0000 (UTC)
Date: Tue, 19 Apr 2022 17:59:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cole Robinson <crobinso@redhat.com>
Subject: Re: adding 'official' way to dump SEV VMSA
Message-ID: <Yl7qiySOgljonWSR@redhat.com>
References: <a713533d-c4c5-2237-58d0-57b812a56ba4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a713533d-c4c5-2237-58d0-57b812a56ba4@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, "Singh,
 Brijesh" <brijesh.singh@amd.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 13, 2022 at 09:36:23AM -0400, Cole Robinson wrote:
> Hi all,
> 
> SEV-ES and SEV-SNP attestation require a copy of the initial VMSA to
> validate the launch measurement. For developers dipping their toe into
> SEV-* work, the easiest way to get sample VMSA data for their machine is
> to grab it from a running VM.
> 
> There's two techniques I've seen for that: patch some printing into
> kernel __sev_launch_update_vmsa, or use systemtap like danpb's script
> here: https://gitlab.com/berrange/libvirt/-/blob/lgtm/scripts/sev-vmsa.stp
> 
> Seems like this could be friendlier though. I'd like to work on this if
> others agree.
> 
> Some ideas I've seen mentioned in passing:
> 
> - debugfs entry in /sys/kernel/debug/kvm/.../vcpuX/
> - new KVM ioctl
> - something with tracepoints
> - some kind of dump in dmesg that doesn't require a patch

The problem with all the approaches of dumping / extracting a VMSA
is that the VMSA contains a register whose value contains CPU model,
family, stepping. IOW, over time there are large number of possible
valid VMSA blobs, one for each possible CPU variant that is relevant
to SEV.

Given that, I came to the conclusion that dumping / extracting a VMSA
is only useful for the purpose of debugging. We should still have such
a mechanism, but it isn't sufficient on its own.

For actual launch measurement validation, we need to be able to
construct an expected VMSA from technical specs & knowledge of QEMU's
SEV impl, such that we can plug in variable field values.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


