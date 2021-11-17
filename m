Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A4D454A4C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 16:49:25 +0100 (CET)
Received: from localhost ([::1]:55272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNBc-0002JD-Fa
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 10:49:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnN9W-0007j1-20
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:47:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnN9U-0000Vj-Hv
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637164031;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHimRn8lr8cq0OCxyYlBMS3kSemnAmwD62DesEo8zNg=;
 b=GGcdvNUBfslBmcNNKeaGoayl/fAqgHsNHpRUVvSa1qE7sCwOrd6yMmLghP6f4wU6cO0/Re
 ATTJuXi2M0tAJlGsmim0+fjXaguyCPlj7nCnnGhiEfUM8GRrbbKyV29n9ZOr5ZY//rUOxG
 y+xPp/a8P5/ofpOhmeX9XuWTvyen/Ho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-A1VJO_IJMimNRIF9X-bAQw-1; Wed, 17 Nov 2021 10:47:10 -0500
X-MC-Unique: A1VJO_IJMimNRIF9X-bAQw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73D6C100CD04;
 Wed, 17 Nov 2021 15:47:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79D35101E7F4;
 Wed, 17 Nov 2021 15:47:07 +0000 (UTC)
Date: Wed, 17 Nov 2021 15:47:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 1/2] iotests: Use aes-128-cbc
Message-ID: <YZUj+C/4/jmqJ0UB@redhat.com>
References: <20211117151707.52549-1-hreitz@redhat.com>
 <20211117151707.52549-2-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211117151707.52549-2-hreitz@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 17, 2021 at 04:17:06PM +0100, Hanna Reitz wrote:
> Our gnutls crypto backend (which is the default as of 8bd0931f6)
> supports neither twofish-128 nor the CTR mode.  CBC and aes-128 are
> supported by all of our backends (as far as I can tell), so use
> aes-128-cbc in our iotests.

Yes, AES is guarnateed by all backends, as is ECB,CBC & XTS modes.

> 
> (We could also use e.g. aes-256-cbc, but the different key sizes would
> lead to different key slot offsets and so change the reference output
> more, which is why I went with aes-128.)
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tests/qemu-iotests/206     | 4 ++--
>  tests/qemu-iotests/206.out | 6 +++---
>  tests/qemu-iotests/210     | 4 ++--
>  tests/qemu-iotests/210.out | 6 +++---
>  4 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


