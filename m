Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07940330C29
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:21:41 +0100 (CET)
Received: from localhost ([::1]:49002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJDxE-0001j9-3D
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJDvR-0000mf-Rx
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:19:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJDvQ-0003HL-6j
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615202387;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dK5KFWiL9dXyVNYt4QP4E/uRlb2MakQkvbsBPP/z6eE=;
 b=d5nc7DDvg2iWVlNse9iV0ETRDmRtN0XTmrwGhZ9YmN1KQMMmsxHlxYTZgeQTeoIMgC/p8C
 5p9mAW/kGJQWC5csUfKVv3zujLzBgNXCuOV3qjoigkOdecy1YK1t5EBLoULd5iFy8aBeWx
 Dioc7vu+W07133hvBjSY3HQ7W/uja+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-_XnD0lJ8Onm4mUZIhoGzKQ-1; Mon, 08 Mar 2021 06:19:42 -0500
X-MC-Unique: _XnD0lJ8Onm4mUZIhoGzKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FE481005D45;
 Mon,  8 Mar 2021 11:19:41 +0000 (UTC)
Received: from redhat.com (ovpn-114-69.ams2.redhat.com [10.36.114.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 563AD19C79;
 Mon,  8 Mar 2021 11:19:40 +0000 (UTC)
Date: Mon, 8 Mar 2021 11:19:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH] meson: Stop if cfi is enabled with system slirp
Message-ID: <YEYISUuI49rphmDe@redhat.com>
References: <20210304025939.9164-1-dbuono@linux.vnet.ibm.com>
 <YEC4Rk/eAStVIFU7@redhat.com>
 <771f3a7b-f42d-fbd9-5bdc-bce5d354278a@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <771f3a7b-f42d-fbd9-5bdc-bce5d354278a@linux.vnet.ibm.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Fri, Mar 05, 2021 at 11:53:07AM -0500, Daniele Buono wrote:
> On 3/4/2021 5:37 AM, Daniel P. Berrangé wrote:
> > Is there work being done, or at least an active plan, for fixing this ?
> > 
> > Distros generally won't want to static link slirp to QEMU when there is
> > a shared slirp available. It increases the security burden to maintain
> > slirp twice, especially as slirp has a history of CVEs.
> > 
> > IOW, the inability to use shared slirp may well prevent CFI from being
> > used in distros.
> 
> Daniel,
> Adoption is a very good point. We don't want to have multiple versions
> of the same library hanging around the O.S., unless strictly necessary.
> 
> The problem (if I wear my security hat) is that, as you pointed out,
> slirp is known to have a history of CVEs, and it also rely heavily on
> callbacks and function pointers. So it would be one of the best
> candidates for CFI support.
> 
> A (long-term) solution could be to compile libslirp as a shared library,
> WITH Control-Flow Integrity. Clang does have an experimental support for
> Cross-DSO CFI. However, it is not viable at the moment because:
> 1. It is still considered Experimental
> 2. It is not compatible with pointer type generalization (which we need
> because of Glib and other uses in QEMU).
> Cross-DSO CFI also have some performance implications but I think that
> would be a very small price to pay, and only in corner-case conditions.

My concern is that libslirp is just showing us one known example of
the problem. QEMU links to many more external libraries, which might
exhibit similar issues. If we need to rebuild all the dependancies
with CFI too, to be confident that the combined work will operate
correctly, then this is quite a significant implication. Overall I
think this is going to be a problem for the changes of distros adopting
the use of CFI, especially if they're not using CLang as their toolchain.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


