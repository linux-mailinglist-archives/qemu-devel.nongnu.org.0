Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A1432B66D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:06:11 +0100 (CET)
Received: from localhost ([::1]:49622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOOQ-0004Sj-B0
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:06:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHOMY-00039A-9s
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:04:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHOMW-0005h7-FR
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:04:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614765851;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nYemywl9aB5aBUN/flCqdbkS8tkkUiOv/kh7PudpcaY=;
 b=KoR+4in9Aw4gukvKGyZri5Hvi9w/pALY8K/UG4s3ImMJmc9iKSWK7U1PWg5t4LcjDWOc93
 2XyFjwr+bzKz0iuQ+ULtED3lGb4cOhtaAKa6kgrQkaNAyVuiAaqDFt/PtSzr5HLOLkUJZ8
 7sYHeReLRIKV9ZkYowe/sZuhN1I/Jtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87--tMPlnO1NxOYzhcaXutvyg-1; Wed, 03 Mar 2021 05:04:08 -0500
X-MC-Unique: -tMPlnO1NxOYzhcaXutvyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C57AE195D562;
 Wed,  3 Mar 2021 10:04:07 +0000 (UTC)
Received: from redhat.com (ovpn-115-145.ams2.redhat.com [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEB4C189CE;
 Wed,  3 Mar 2021 10:04:06 +0000 (UTC)
Date: Wed, 3 Mar 2021 10:04:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/2] gitlab-ci.yml: Add jobs to test CFI
Message-ID: <YD9fE623LlgncsVw@redhat.com>
References: <YDy8qsRRR3FmWr1D@redhat.com>
 <56d3d1a6-00af-1cc9-e980-748548191202@linux.vnet.ibm.com>
 <YD0Day/wGawuWdpi@redhat.com>
 <950b36a4-ec19-84df-9292-c88c390ce5fc@linux.vnet.ibm.com>
 <YD4T1nVIEdL7/IoG@redhat.com>
 <50a8e650-841f-cac4-8a14-8c659ef274ca@linux.vnet.ibm.com>
 <YD5b74uynDvWUySy@redhat.com>
 <a4f78c9c-3a42-13dc-f095-16144d09ca6b@linux.vnet.ibm.com>
 <YD5qdKLNZwg6XB7T@redhat.com>
 <4c72d19e-9df6-d9fa-e8c8-f199307e9454@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <4c72d19e-9df6-d9fa-e8c8-f199307e9454@linux.vnet.ibm.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 02, 2021 at 04:01:17PM -0500, Daniele Buono wrote:
> On 3/2/2021 11:40 AM, Daniel P. Berrangé wrote:
> > The CFI protection is something I'd say is relevant to virtualization
> > use cases, not to emulation use cases
> > 
> >     https://qemu-project.gitlab.io/qemu/system/security.html
> > 
> > IOW, the targets that are important to test are the ones where KVM
> > is available.
> > 
> > So that's  s390x, ppc, x86, mips, and arm.
> > 
> > I think we can probably ignore mips as that's fairly niche.
> > We can also reasonably limit ourselves to only test the 64-bit
> > variants of the target, on the basis that 32-bit is increasingly
> > legacy/niche too.
> > 
> > So that gives us  ppc64le, x86_64, aarch64 and s390x as the
> > targets we should get CI coverage for CFI.
> 
> Thanks Daniel,
> I'll start working on a V3 that only contains those 4 targets, probably in
> two sets of build/check/acceptance to maintain the jobs below the hour mark.
> 
> These would still be x86 binaries that are not testing KVM, however,
> because of the capabilities of the shared gitlab runners.

Yes, that's fine.

> I see that there's some work from Cleber Rosa to allow running custom jobs
> on aarch64 and s390x systems. I think that, when the infrastructure is
> ready, having a KVM-based CFI test there would help a lot in terms of
> coverage for those architectures.

Yep, that should be possible.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


