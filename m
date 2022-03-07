Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6683C4CFF2F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:53:44 +0100 (CET)
Received: from localhost ([::1]:59524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCrv-0006xH-Gf
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:53:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRCpd-0004r2-KV
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:51:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRCpa-0005hr-JO
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:51:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646657477;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=tsqduwnVnaMIzIJF+yn0iEIPWYwJ2rAW2lhpW4yPYso=;
 b=ikTTMuZMKbTvbO7XPUdp+spR/mVgh0A2d8xW5y31/R3sHzMzfilMPuCiik64y+HdCmKE86
 ccZ5oikdpUxHsAc3UkKOEpFGg9TFEis/k6BI3/xEYn4Mq6GW1TQB4kpI6qJH0KDpz9efaw
 P2hzxOGVVAkWAJlMFSKUd0/Op24uzsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-eEmoM_iJNO6nd67AhI03iA-1; Mon, 07 Mar 2022 07:51:11 -0500
X-MC-Unique: eEmoM_iJNO6nd67AhI03iA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DE621854E27;
 Mon,  7 Mar 2022 12:51:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74E8D7D3CE;
 Mon,  7 Mar 2022 12:50:30 +0000 (UTC)
Date: Mon, 7 Mar 2022 12:50:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/avocado: Cancel BootLinux tests in case there is
 no free port
Message-ID: <YiX/kzf7cW+YcNN5@redhat.com>
References: <20220228114325.818294-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220228114325.818294-1-thuth@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Cc: Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 12:43:25PM +0100, Thomas Huth wrote:
> The BootLinux tests are currently failing with an ugly python
> stack trace on my RHEL8 system since they cannot get a free port
> (likely due to the firewall settings on my system). Let's properly
> check the return value of find_free_port() instead and cancel the
> test gracefully if it cannot get a free port.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Unfortunately, it still takes > 70 seconds for each and every
>  tests from tests/avocado/boot_linux.py to get canceled, so
>  tests/avocado/boot_linux.py still renders "make check-avocado"
>  for me pretty unusable... looking at the implementation of
>  find_free_port() in Avocado, I wonder whether there isn't a
>  better way to get a free port number in Python? Brute-forcing
>  all ports between 1024 and 65536 seems just quite cumbersome
>  to me...

Even in the worst case of testing every single port,
for INET and INET6 and for STREAM and DGRAM sockets,
that find_free_port port completes in a couple of
seconds. 

The impl though is totally overkill, in checking
for both INET and INET6 and STREAM and DGRAM.

The code using the phone_home_port hardcodes
0.0.0.0 and TCP. So it would be sufficient to
let the kernel tell you what port is free:

   import socket
   s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
   s.bind(("0.0.0.0", 0))

   freeport = s.getsockname()[1]
   s.close()
   return freeport


This code is all inherantly racy though, because as
designed it is checking for a port that's available
and then later calls wait_for_phone_home which spins
up a HTTP server listening on the port. The port can
be used in between the check and use. This can be
the case if running many things in parallel on the
host.

It would be better to spin up that server using
kernel port auto-selection at the start eliminating
the race entirely.  Then just record the port that
was allocated and use that when building thue
cloudinit config for the guest.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


