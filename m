Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E60A32A63C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 17:42:03 +0100 (CET)
Received: from localhost ([::1]:57078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH85y-0002h8-Kk
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 11:42:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH84g-0002F8-Gq
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:40:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH84e-0003Rv-HB
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:40:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614703239;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t9HdqjuEw6Pku+NFRACvWTU8y0d79dVdlnXFSiZXHGE=;
 b=FHwa+QV66iLfQW+0Fk2YkZ/aBsvcXYTmMDGK0xKU+o5j+sJAkctOtUkyJuox/kf5rmoLT4
 HCEAGV+073qICsCnJTUeDNs0GNyjaN2DYXAzNCanszR6bXBr1Xq4tnm7+Spezpz0LCMexB
 lh5jxBZOTIx24A4BGS/BslfB8oOeG6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-3fm9rqDfO96vG7g1dvW8hA-1; Tue, 02 Mar 2021 11:40:25 -0500
X-MC-Unique: 3fm9rqDfO96vG7g1dvW8hA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6F591020C21;
 Tue,  2 Mar 2021 16:40:24 +0000 (UTC)
Received: from redhat.com (ovpn-113-132.ams2.redhat.com [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94DBA2C01E;
 Tue,  2 Mar 2021 16:40:23 +0000 (UTC)
Date: Tue, 2 Mar 2021 16:40:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/2] gitlab-ci.yml: Add jobs to test CFI
Message-ID: <YD5qdKLNZwg6XB7T@redhat.com>
References: <20210226152108.7848-1-dbuono@linux.vnet.ibm.com>
 <YDy8qsRRR3FmWr1D@redhat.com>
 <56d3d1a6-00af-1cc9-e980-748548191202@linux.vnet.ibm.com>
 <YD0Day/wGawuWdpi@redhat.com>
 <950b36a4-ec19-84df-9292-c88c390ce5fc@linux.vnet.ibm.com>
 <YD4T1nVIEdL7/IoG@redhat.com>
 <50a8e650-841f-cac4-8a14-8c659ef274ca@linux.vnet.ibm.com>
 <YD5b74uynDvWUySy@redhat.com>
 <a4f78c9c-3a42-13dc-f095-16144d09ca6b@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <a4f78c9c-3a42-13dc-f095-16144d09ca6b@linux.vnet.ibm.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 02, 2021 at 11:31:54AM -0500, Daniele Buono wrote:
> 
> On 3/2/2021 10:38 AM, Daniel P. Berrangé wrote:
> > Is this scenario going to upset  CFI, or is it happy that 'void *'
> > is compatible with 'mytype *', and ok with the intermediate casts
> > to/from GCallback ?
> 
> This is a valid scenario. LLVM does offer the ability of considering all
> pointer types compatible, and it is being enabled in QEMU. So void* is
> compatible to any type* and that would not be considered a fault.

Ok that's good.

> Intermediate casts are also fine since you are just passing the pointer but
> not using it. The check will happen only when the function is called, at
> which point it was cast back to something compatible.

Makes sense.

So in general, it sounds like breadth of test coverage is fairly important
for the CFI jobs, at least if we're exercising different areas of
functionality.  So I think we do need to be testing more than just one
architecture target.

The CFI protection is something I'd say is relevant to virtualization
use cases, not to emulation use cases

   https://qemu-project.gitlab.io/qemu/system/security.html

IOW, the targets that are important to test are the ones where KVM
is available.

So that's  s390x, ppc, x86, mips, and arm.

I think we can probably ignore mips as that's fairly niche.
We can also reasonably limit ourselves to only test the 64-bit
variants of the target, on the basis that 32-bit is increasingly
legacy/niche too.

So that gives us  ppc64le, x86_64, aarch64 and s390x as the
targets we should get CI coverage for CFI.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


