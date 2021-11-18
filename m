Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1746B45595B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 11:46:46 +0100 (CET)
Received: from localhost ([::1]:39700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnewH-0002A9-7a
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 05:46:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mneuP-0000If-9V
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:44:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mneuN-0006lX-A6
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:44:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637232285;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WxDhb68DRaTfAsNaoR/Js3Ybb8Z3xFbP8R/eHW7ITRk=;
 b=Izbt+KmRIhlpQBknOiWWSnb1xaJy0tDWTJnClMPbmxT7O9RrcKWo6LzCeB7Rq4tKlqGFQ6
 rUeRylcyiWcdPjVDJD2a9FuK7Zdnf/coPff6/VczH+g+LSwW2qBgsDSPWcS1Xq8wptsHfq
 NIkr5R0zW5aPsCb+VSY7fondXdpI0nQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-Yj5sPDzoNGW7bUKMkB96Pg-1; Thu, 18 Nov 2021 05:44:42 -0500
X-MC-Unique: Yj5sPDzoNGW7bUKMkB96Pg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7274781C860
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 10:44:41 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD34219D9B;
 Thu, 18 Nov 2021 10:44:40 +0000 (UTC)
Date: Thu, 18 Nov 2021 10:44:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [qemu-web PATCH] remove deployment phase from CI
Message-ID: <YZYulgVTIocv0TPN@redhat.com>
References: <20211118074702.216951-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211118074702.216951-1-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 18, 2021 at 08:47:01AM +0100, Paolo Bonzini wrote:
> qemu.org is now served via a reverse proxy from qemu-project.gitlab.io; it does
> not need anymore the rsync step to the QEMU project's shell server.
> Remove it from the CI.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .gitlab-ci.yml | 24 ------------------------
>  1 file changed, 24 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


