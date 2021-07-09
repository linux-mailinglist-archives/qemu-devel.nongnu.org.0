Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA943C264F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:52:45 +0200 (CEST)
Received: from localhost ([::1]:46124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rrw-0006Wp-MJ
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m1reS-0007jg-5i
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m1reQ-0000gO-8s
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625841525;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qVv+wJ/QAA2Sj85+dkI7MIyEyrzQNcwqcFr9EbkHuKk=;
 b=YwjMnvyPKkvSEYurhU6+GqrsQkXh7sq9qiGAUa8tL6gDS+dJ+wyzc3E2G5wWWYI5Rh1Fg2
 E2H8O37ONrBBm4yhP5MzFZTxcW3pPsjVo2+4aDa5tjCm3LydviJptFOmQjHZrvZm49KK52
 uVtv60VEycMNkweeNq74S/kZuTEMrTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-9-z4M_XDOceyPNF69rJhcQ-1; Fri, 09 Jul 2021 10:38:40 -0400
X-MC-Unique: 9-z4M_XDOceyPNF69rJhcQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAB5E1084F5E;
 Fri,  9 Jul 2021 14:38:38 +0000 (UTC)
Received: from redhat.com (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58E385D6BA;
 Fri,  9 Jul 2021 14:38:28 +0000 (UTC)
Date: Fri, 9 Jul 2021 15:38:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] gitlab-ci: Test compilation on Windows with MSYS2
Message-ID: <YOhfXcZRkyfO3zV5@redhat.com>
References: <20210709075218.1796207-1-thuth@redhat.com>
 <YOgGuJkAZ3AeRVTK@redhat.com>
 <c7f2d936-bc4c-4524-f152-6517c0345016@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c7f2d936-bc4c-4524-f152-6517c0345016@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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

On Fri, Jul 09, 2021 at 04:34:54PM +0200, Thomas Huth wrote:
> On 09/07/2021 10.20, Daniel P. Berrangé wrote:
> > On Fri, Jul 09, 2021 at 09:52:18AM +0200, Thomas Huth wrote:
> > > Gitlab also provides runners with Windows, we can use them to
> > > test compilation with MSYS2.
> > > 
> > > However, it takes quite a long time to set up the VM, so to
> > > stay in the 1h time frame, we can only compile and check one
> > > target here. And there is also still a problem with compiling
> > > the multiboot.bin in pc-bios/optionrom/, so this is currently
> > > disabled, too.
> > 
> > THe gitlab VM provisioning seems quite fast (2+1/2 minutes),
> > so I guess you mean the time is sunk in intsalling msys
> > packages.
> > 
> > In the crurent Cirrus job there's a bunch of code that is
> > done to cache all the msys install, so that 90% of the time
> > we're merely extracting a local zipfile.
> > 
> > I wonder if we can do similar caching here.
> 
> Maybe, yes. It might save 10 - 15 minutes or so, I guess.
> 
> > Perhaps even
> > have 2 seprate jobs running on the windows runner. The
> > first job can just build a zip file and store it as an
> > artifact and cache it in gitlab for speed. The second
> > job can do the actual build ?
> 
> I'm not sure ... the Windows builders are likely single-threaded on Gitlab,
> too, just like the Linux containers. So that the main problem - while we can
> compile with -j8 on Cirrus, it's 8 times slower on Gitlab.

Ah yes, good point.

Since we have cirrus integration for freebsd/macos now, we ought todo
the same for Windows too.  I auto-generated the freebsd/mac logic
with libvirt-ci, but I ignored msys since it was somewhat special
in its build commands. We can still set it up manually though to
integrate

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


