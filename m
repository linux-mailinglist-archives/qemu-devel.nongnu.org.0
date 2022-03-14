Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DFF4D8A2F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 17:55:54 +0100 (CET)
Received: from localhost ([::1]:33284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTnz7-0008Te-47
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 12:55:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nTnw8-0006Yy-UV
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 12:52:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nTnw7-0001Hb-B1
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 12:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647276766;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mpMDbZ3EQU1fQZzX91KRI0T2NWpnlm/0FSpQMM1XUq8=;
 b=R3BCBNXBjTpMJzkxVvq9pdxbMe7aZgU0cUWUt/ai68+i79Ly/CDgfESiuFd9i2lzRAbFR8
 rYPrIrBXTCFoKBMR2U+FNza8BvvzbXltIVwD3MF/DjPQkPxKwW0UW0mIxAF6RKmPKLUYYo
 pKmjnZmohDG1n+3BPhDjwgAVC7mbHJc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-Cz7_BZVLOsKKZ_xPjyadnw-1; Mon, 14 Mar 2022 12:52:41 -0400
X-MC-Unique: Cz7_BZVLOsKKZ_xPjyadnw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F4C43C01BB0;
 Mon, 14 Mar 2022 16:52:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50C6F4B8D58;
 Mon, 14 Mar 2022 16:52:38 +0000 (UTC)
Date: Mon, 14 Mar 2022 16:52:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Message-ID: <Yi9y0xQ2O00y1uJ5@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 10:31:47AM +0100, Paolo Bonzini wrote:
> This was compiled with GCC 11 only.  Coroutine support was added in
> GCC 10, released in 2020, which IIRC is much newer than the most recent
> release we support.

Currrently we target 7.4:

  commit 2a85a08c998e418a46a308095893f223642f6fc9
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri May 14 13:04:15 2021 +0100

    configure: bump min required CLang to 6.0 / XCode 10.0
    
    Several distros have been dropped since the last time we bumped the
    minimum required CLang version.
    
    Per repology, currently shipping versions are:
    
                 RHEL-8: 10.0.1
          Debian Buster: 7.0.1
     openSUSE Leap 15.2: 9.0.1
       Ubuntu LTS 18.04: 6.0.0
       Ubuntu LTS 20.04: 10.0.0
             FreeBSD 12: 8.0.1
              Fedora 33: 11.0.0
              Fedora 34: 11.1.0
    


Ubuntu 18.04 drops off our list after 7.0 comes out

Buster is already  off our list as that hit the 2 year
mark in AUg 2021.

OpenSUSE Leap 15.2 was EOL'd by SUSE themselves in Jan 2022,
We use it as a proxy for SLES, but I think we can required
SLES 15 sp3.

FreeBSD 12 is something we still support until April 2023,
but arguably we only care about CLang there.

NetBSD 9 wasn't listed, but it was reported to required
GCC 7.4  (commit 3830df5f83b9b52d9496763ce1a50afb9231c998)
and that is still the latest release of NetBSD.

So NetBSD is our biggest constraint on requiring GCC 10

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


