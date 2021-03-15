Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB5733B153
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:42:04 +0100 (CET)
Received: from localhost ([::1]:37576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlbn-0001SX-4U
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lLlZJ-0007kH-4U
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:39:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lLlZG-0001tU-Vg
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615808366;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+wS8ryUYKreCKp9oDPQhswOSVb7wPcXNxfUhXHl1D6o=;
 b=C1kgtycPoxHSQ3tiodcAdm0i2+VlqnIn0RhjlAYRcwae5c7jLZg3pcjvUgtevLsY3luP/O
 m427tKUOBD96uO1z2CP8ICeY885sEqAQBWF6uMsTrbQbB/QUnS9WxnUX1uCpcQyXzOlcNw
 sSs74xrwG42MfiXvdnBShCU7ZiLgI9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-qLe7YSRoMAadF1g0_yADWA-1; Mon, 15 Mar 2021 07:39:24 -0400
X-MC-Unique: qLe7YSRoMAadF1g0_yADWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E659107465E;
 Mon, 15 Mar 2021 11:39:23 +0000 (UTC)
Received: from redhat.com (ovpn-115-81.ams2.redhat.com [10.36.115.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B93CD10027A5;
 Mon, 15 Mar 2021 11:39:18 +0000 (UTC)
Date: Mon, 15 Mar 2021 11:39:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests: Move benchmarks into a separate folder
Message-ID: <YE9HY2G8ziBs9dtJ@redhat.com>
References: <20210312092238.79509-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210312092238.79509-1-thuth@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Longpeng <longpeng2@huawei.com>,
 "Emilio G . Cota" <cota@braap.org>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 12, 2021 at 10:22:38AM +0100, Thomas Huth wrote:
> Make it clear that these files are related to benchmarks by moving
> them into a new folder called "bench".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Based-on: 20210310063314.1049838-1-thuth@redhat.com
> 
>  tests/{ => bench}/atomic64-bench.c          |  0
>  tests/{ => bench}/atomic_add-bench.c        |  0
>  tests/{ => bench}/benchmark-crypto-cipher.c |  0
>  tests/{ => bench}/benchmark-crypto-hash.c   |  0
>  tests/{ => bench}/benchmark-crypto-hmac.c   |  0
>  tests/bench/meson.build                     | 34 +++++++++++++++++++++
>  tests/{ => bench}/qht-bench.c               |  0
>  tests/meson.build                           | 34 +--------------------
>  8 files changed, 35 insertions(+), 33 deletions(-)
>  rename tests/{ => bench}/atomic64-bench.c (100%)
>  rename tests/{ => bench}/atomic_add-bench.c (100%)
>  rename tests/{ => bench}/benchmark-crypto-cipher.c (100%)
>  rename tests/{ => bench}/benchmark-crypto-hash.c (100%)
>  rename tests/{ => bench}/benchmark-crypto-hmac.c (100%)
>  create mode 100644 tests/bench/meson.build
>  rename tests/{ => bench}/qht-bench.c (100%)

Acked-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


