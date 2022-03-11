Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC964D6238
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 14:16:43 +0100 (CET)
Received: from localhost ([::1]:42872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSf8M-0007X3-Ba
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 08:16:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSf6G-0006es-4G
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 08:14:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSf6E-00071w-Gt
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 08:14:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647004469;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=51sg2umVtN0UB/pjUNMQRo+oTwAibla8CgFFeTk8Pcc=;
 b=iAsHX6yQfENG42bXBjyrLuYRrUje59pZy4tLUpj5qVbEttBJ+b3K2m7R1i/Aw04VPhuuPG
 QmRxyPbIcJxzXUGuL8NiT11lrGCIzDfuJeAME/OwORk27JkiUe3ajLSnIvA6XtGiza0G03
 hJP3mlJQmp9Z2+yIvTaDArkwZltdL5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-9JlCcp6QPTuVXFdowljHGA-1; Fri, 11 Mar 2022 08:14:26 -0500
X-MC-Unique: 9JlCcp6QPTuVXFdowljHGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A158180FD71;
 Fri, 11 Mar 2022 13:14:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3B5A8357F;
 Fri, 11 Mar 2022 13:14:23 +0000 (UTC)
Date: Fri, 11 Mar 2022 13:14:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH] tests/avocado: starts PhoneServer upfront
Message-ID: <YitLLOiscBPS4MPn@redhat.com>
References: <20220311130919.2120958-1-bleal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220311130919.2120958-1-bleal@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: thuth@redhat.com, Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 11, 2022 at 10:09:19AM -0300, Beraldo Leal wrote:
> Race conditions can happen with the current code, because the port that
> was available might not be anymore by the time the server is started.
> 
> By setting the port to 0, PhoneServer it will use the OS default
> behavior to get a free port, then we save this information so we can
> later configure the guest.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Beraldo Leal <bleal@redhat.com>
> ---
>  tests/avocado/avocado_qemu/__init__.py | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Great improvement !

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


