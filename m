Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19564402DFD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 19:53:33 +0200 (CEST)
Received: from localhost ([::1]:58320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNfHn-0008IP-Vi
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 13:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mNfGn-0007dZ-7F
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 13:52:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mNfGj-0000OQ-90
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 13:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631037143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QFO+6Ir+tiNj6TuXNlJVCTAyo2od91mIiQTbnqv38us=;
 b=VjAKLpkxjpfmjLBY6KK3Yr0mTeCl3hqJ1pLpMUrZMBYhr0KOAj7Lbwe6mn5nW96qEH/QBy
 AcwW4gvtHawxXnxtkTfzZVf742aKvvXmuv6P89wPCIEF9KGXnX4Z7K+DrZMTdBfhcaM8ls
 U2m7/RF82+vZOqc4VF0XC5c2eoO+LVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-RpClBSMDPIiAtlZNiLXx2w-1; Tue, 07 Sep 2021 13:52:22 -0400
X-MC-Unique: RpClBSMDPIiAtlZNiLXx2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C127584A5EC
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 17:52:21 +0000 (UTC)
Received: from redhat.com (ovpn-112-95.phx2.redhat.com [10.3.112.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 449A217258;
 Tue,  7 Sep 2021 17:52:18 +0000 (UTC)
Date: Tue, 7 Sep 2021 12:52:16 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [qemu-web PATCH] Update FUSE block export blog post
Message-ID: <20210907175216.dze5fvinpo5pxlt2@redhat.com>
References: <20210906162916.21714-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210906162916.21714-1-hreitz@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Klaus Kiwi <kkiwi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 06, 2021 at 06:29:16PM +0200, Hanna Reitz wrote:
> Because I forgot to CC Thomas on the discussion adding this post, it was
> merged prematurely.  This patch updates the post to incorporate the
> feedback I received on it:
>

Overall, nice!  I see it's already live, but another tweak you might
want to make:

> +## File mounts
>  
> -A perhaps little-known fact is that, on Linux, filesystems do not need to have
> -a root directory, they only need to have a root node.  A filesystem that only
> -provides a single regular file is perfectly valid.
> +To transparently translate a file into a different format, like we did above, we
> +make use of two little-known facts about filesystems and the VFS on Linux.  The
> +first one of these we can explain immediately, for the second one we will need
> +some more information about how FUSE exports work, so that secret will be lifted

s/lifted/revealed/

> +later (down in the “Mounting an image on itself” section).
> +

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


