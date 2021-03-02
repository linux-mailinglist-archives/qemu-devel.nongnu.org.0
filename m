Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6579329A32
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 11:33:04 +0100 (CET)
Received: from localhost ([::1]:33154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2Kt-0008Pe-NJ
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 05:33:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH2Iq-0006Fb-C4
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:30:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH2Io-0001hq-GT
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:30:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614681053;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ZAZadhor1emSlAHRqChAv4A0O66Z9g8ZhzfOgodE4U=;
 b=abyqU+IgA4FPBuxnhOLUaumUvmGVEYgs4zoYbXMbjQcjUlJjz1pJBo7aIl3FZohhkR5Fp6
 fHamxfYWdFb6WO5pPxO/w7QO/26YUc+fDI6XX7BiST4acbdmQuYTu2VdUMhEnWCeh00+IC
 r8J5B3/qwQ1c11o8jRN7N/+SjRna+pI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-TkC6xGnsOte_vg6-C1KQdA-1; Tue, 02 Mar 2021 05:30:51 -0500
X-MC-Unique: TkC6xGnsOte_vg6-C1KQdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D28B1005501;
 Tue,  2 Mar 2021 10:30:50 +0000 (UTC)
Received: from redhat.com (ovpn-113-132.ams2.redhat.com [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7201F1759F;
 Tue,  2 Mar 2021 10:30:49 +0000 (UTC)
Date: Tue, 2 Mar 2021 10:30:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/2] gitlab-ci.yml: Add jobs to test CFI
Message-ID: <YD4T1nVIEdL7/IoG@redhat.com>
References: <20210226152108.7848-1-dbuono@linux.vnet.ibm.com>
 <YDy8qsRRR3FmWr1D@redhat.com>
 <56d3d1a6-00af-1cc9-e980-748548191202@linux.vnet.ibm.com>
 <YD0Day/wGawuWdpi@redhat.com>
 <950b36a4-ec19-84df-9292-c88c390ce5fc@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <950b36a4-ec19-84df-9292-c88c390ce5fc@linux.vnet.ibm.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

On Mon, Mar 01, 2021 at 03:39:42PM -0500, Daniele Buono wrote:
> Hi Daniel,
> 
> On 3/1/2021 10:08 AM, Daniel P. Berrangé wrote:
> > What are the unique failure scenarios for CFI that these jobs are
> > likely to expose ? Is it likely that we'll have cases where
> > CFI succeeds in say, x86_64 target, but fails in aarch64 target ?
> 
> For CFI to fail (even if it shouldn't) you'll need code that is calling a
> function pointer that was not well defined at compile time. Although
> unlikely, that could happen everywhere in the code.

What does "was not well defined" mean here ? 

> 
> So by just testing one (or few) targets we are are not covering the code in
> the TCG frontend used to compile the target ISA to tcg ops, which should be
> the in target/, and the architecture-dependent code in linux-user.
> 
> That code seems unlikely (at least to me) to cause a false positive with
> CFI. Examples that I've seen in QEMU so far are:
> - Calling code that was JIT-ed at runtime
> - Callbacks to functions that were loaded from shared libraries
> - Signal Handlers
> And none of those should happen there IMHO. But you know, corner cases are
> still possible, and it's quite difficult to predict what new code may bring.
> 
> We could also consider always testing one or two targets, and keep an
> optional job to test them all when deemed necessary. I'm thinking for
> example full testing when code in target/ or linux-user/ is considered, or
> for testing pre-release code. Would be nice to have this automated but I am
> not sure that's possible.
> 
> Regards,
> Daniele
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


