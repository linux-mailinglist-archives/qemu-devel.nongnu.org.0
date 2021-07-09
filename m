Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6DF3C20B9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 10:21:58 +0200 (CEST)
Received: from localhost ([::1]:48608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1llk-0007Sn-Ou
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 04:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m1lkW-0006EN-HX
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 04:20:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m1lkU-0005hg-6U
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 04:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625818836;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vzgZVLN0Z1Pq1U9u8vaBP2aD8wJqYjVj2i6z2yw/KYw=;
 b=duE97VeczQPvXqumZBUxz7QlV/6C5ldpCZFR0tBKlJnsnSxUbQj+pFkqWvi6l+5WY2JptT
 QliofRXcfgHBRDRW/xI/6jmidh00XJxYVsQVcLyjhaVO6F9H7VM9I7DbCH2M4rw3kt9sgo
 NVyv/wCTOLFZPDIsMuH7f9pVP3Hf3sQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-Ke5Eeh6tPLWPLHdJ5Jfhrw-1; Fri, 09 Jul 2021 04:20:31 -0400
X-MC-Unique: Ke5Eeh6tPLWPLHdJ5Jfhrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28320100CF70;
 Fri,  9 Jul 2021 08:20:30 +0000 (UTC)
Received: from redhat.com (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 232905D9FC;
 Fri,  9 Jul 2021 08:20:16 +0000 (UTC)
Date: Fri, 9 Jul 2021 09:20:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] gitlab-ci: Test compilation on Windows with MSYS2
Message-ID: <YOgGuJkAZ3AeRVTK@redhat.com>
References: <20210709075218.1796207-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210709075218.1796207-1-thuth@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 09, 2021 at 09:52:18AM +0200, Thomas Huth wrote:
> Gitlab also provides runners with Windows, we can use them to
> test compilation with MSYS2.
> 
> However, it takes quite a long time to set up the VM, so to
> stay in the 1h time frame, we can only compile and check one
> target here. And there is also still a problem with compiling
> the multiboot.bin in pc-bios/optionrom/, so this is currently
> disabled, too.

THe gitlab VM provisioning seems quite fast (2+1/2 minutes),
so I guess you mean the time is sunk in intsalling msys
packages.

In the crurent Cirrus job there's a bunch of code that is
done to cache all the msys install, so that 90% of the time
we're merely extracting a local zipfile.

I wonder if we can do similar caching here. Perhaps even
have 2 seprate jobs running on the windows runner. The
first job can just build a zip file and store it as an
artifact and cache it in gitlab for speed. The second
job can do the actual build ?

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  I'm sending this out as an RFC in case somebody else wants to play
>  with this. Considering that the corresponding job in Cirrus-CI compiles
>  way more targets within 1 hour, we might rather want to keep using
>  the Cirrus-CI job instead?

Yes, unless we can do the same kind of caching tricks to speed it
all up.

> 
>  .gitlab-ci.d/qemu-project.yml |  1 +
>  .gitlab-ci.d/windows.yml      | 59 +++++++++++++++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644 .gitlab-ci.d/windows.yml

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


