Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5494130C570
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:25:24 +0100 (CET)
Received: from localhost ([::1]:51858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yUV-0007EV-CZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:25:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6y3w-0007He-Eh
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:57:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6y3s-0002Ui-UK
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:57:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612281472;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=x1NW/Q+fzhWjt85f4CfrciRZvZSC8LsgLz8xkg3wixA=;
 b=N+j6Xrj1G33bQIEoeuXFAS6bdxP98m1DluUJ7RcsEhFFCCakjmKJPS6w9aosM9+9rTbpYm
 +CEbIr1Jf/0ZKjzUiFc5hCZMdmhu7X/YbP/8FDLV2Jlt9Lid+cQDUfM9dMA/X2BFogGF/o
 o9xPjvs1m1mcYerOYfZlOIGHtKepYgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-mw1aEyg2OP-G-WV-snyGDQ-1; Tue, 02 Feb 2021 10:57:47 -0500
X-MC-Unique: mw1aEyg2OP-G-WV-snyGDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49CE98799EB;
 Tue,  2 Feb 2021 15:57:46 +0000 (UTC)
Received: from redhat.com (ovpn-112-202.ams2.redhat.com [10.36.112.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 423FF5C224;
 Tue,  2 Feb 2021 15:57:43 +0000 (UTC)
Date: Tue, 2 Feb 2021 15:57:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v9 6/6] iotests: rename and move 169 and 199 tests
Message-ID: <20210202155741.GN4168502@redhat.com>
References: <20210125185056.129513-1-vsementsov@virtuozzo.com>
 <20210125185056.129513-7-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210125185056.129513-7-vsementsov@virtuozzo.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 09:50:56PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Rename bitmaps migration tests and move them to tests subdirectory to
> demonstrate new human-friendly test naming.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test}   | 0
>  .../{199.out => tests/migrate-bitmaps-postcopy-test.out}          | 0
>  tests/qemu-iotests/{169 => tests/migrate-bitmaps-test}            | 0
>  tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out}    | 0
>  4 files changed, 0 insertions(+), 0 deletions(-)
>  rename tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test} (100%)
>  rename tests/qemu-iotests/{199.out => tests/migrate-bitmaps-postcopy-test.out} (100%)
>  rename tests/qemu-iotests/{169 => tests/migrate-bitmaps-test} (100%)
>  rename tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out} (100%)
> 
> diff --git a/tests/qemu-iotests/199 b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> similarity index 100%
> rename from tests/qemu-iotests/199
> rename to tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> diff --git a/tests/qemu-iotests/199.out b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test.out
> similarity index 100%
> rename from tests/qemu-iotests/199.out
> rename to tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test.out
> diff --git a/tests/qemu-iotests/169 b/tests/qemu-iotests/tests/migrate-bitmaps-test
> similarity index 100%
> rename from tests/qemu-iotests/169
> rename to tests/qemu-iotests/tests/migrate-bitmaps-test
> diff --git a/tests/qemu-iotests/169.out b/tests/qemu-iotests/tests/migrate-bitmaps-test.out
> similarity index 100%
> rename from tests/qemu-iotests/169.out
> rename to tests/qemu-iotests/tests/migrate-bitmaps-test.out

Thanks for making tihs happen. It is great that we now have this
feature and I can stop chasing conflicts on rebases !

I converted my savevm series iotests to use the named test in the
tests/ subdir, and hit a tiny issue that will affect any tests
written in shell. They can't load config.common. I've included a
possible fix for this problem here:

https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00627.html


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


