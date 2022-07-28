Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA61583C33
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 12:43:06 +0200 (CEST)
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH0yv-00088y-L6
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 06:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oH0sJ-0002CQ-DZ
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:36:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oH0sG-0006Fz-7W
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659004571;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=QQz0mvKWse3kBnHcENkOszuicVSoBsnp3yA7qJK4KWs=;
 b=RJtIpn7If02TEFNLbj5Fb6gDv3IIFkKNXT7iO4T7xsurRnqjwf1HL1lfhw5+VzR22ysMSi
 3cCE+rjmanxT3ReTDNiE+GLqq7Enj3gQ7xjX8Ef1zlL1WOpV9zd5SDc8KMJ7in6C7qdjH3
 PJm6dKPoTn/cihRcnKSAA6ZRj8Y5xkw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-bx0mXJyUNHG4sGCb3uGxwA-1; Thu, 28 Jul 2022 06:36:10 -0400
X-MC-Unique: bx0mXJyUNHG4sGCb3uGxwA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9E9B8032E3
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 10:36:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B0F240FD341;
 Thu, 28 Jul 2022 10:36:09 +0000 (UTC)
Date: Thu, 28 Jul 2022 11:36:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/docker: regenerate container Dockerfiles
Message-ID: <YuJmlyKBfRs/uWNF@redhat.com>
References: <20220728102955.240048-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220728102955.240048-1-pbonzini@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 28, 2022 at 12:29:55PM +0200, Paolo Bonzini wrote:
> Copy over the most recent qemu.yml from lcitool, with updated
> dependencies, and use it to regenerate the Dockerfiles.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


NB, the qemu.yml in libvirt-ci.git ought be removed. The
one in qemu.git is considered the canonical source of
info.

The latest refresh is already posted at

  https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg04030.html

and queued by Alex:

  https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg04284.html



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


