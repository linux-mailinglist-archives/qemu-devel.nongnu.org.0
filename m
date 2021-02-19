Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C753731F781
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:44:31 +0100 (CET)
Received: from localhost ([::1]:42500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD3Gw-0001s9-QY
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:44:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lD3Ft-0001So-I3
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:43:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lD3Fr-0008K9-6b
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:43:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613731401;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJ8sAiKjbvcOdbUuy/iUbdF1NkslLoEpyuMAbcKffwc=;
 b=NmoU26udzDe6zridk6/6Yu9fZqHVUje5gkpOxgyloFRD68dghoRVjKsvRNIt4PBh+qaNPh
 ciW2n4nkq8Ahjc/6nu83bju+HlGdfANULW5BpaXoD6M8t/LrkFpGieEL+9lmFjJ2/KOFuL
 dMUaAqzGe1YnxIb1wVzwXP9BEBBUHKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-gfjOoNU7NmSsGuI0opY9bQ-1; Fri, 19 Feb 2021 05:43:04 -0500
X-MC-Unique: gfjOoNU7NmSsGuI0opY9bQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0545480198A;
 Fri, 19 Feb 2021 10:43:03 +0000 (UTC)
Received: from redhat.com (ovpn-113-184.ams2.redhat.com [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F0935D9C2;
 Fri, 19 Feb 2021 10:43:01 +0000 (UTC)
Date: Fri, 19 Feb 2021 10:42:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: FreeBSD build regressions
Message-ID: <YC+WMtkuQjttKns9@redhat.com>
References: <8735xss5q3.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <8735xss5q3.fsf@linaro.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Ed Maste <emaste@freebsd.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <gerd@kraxel.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 10:29:50AM +0000, Alex Bennée wrote:
> 
> Hi,
> 
> It looks like the build has been broken on Cirrus since at least 7b2c4c:
> 
>   https://cirrus-ci.com/github/qemu/qemu
> 
> I did attempt to have a look but "vm-build-freebsd" seems to be failing
> with a different error:
> 
>   10:31:47  [alex.bennee@hackbox2:~/l/q/b/all] master|✔ + make vm-build-freebsd
>     GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 meson dtc capstone slirp
>       VM-BUILD freebsd
>   cross containers  no
> 
>   NOTE: guest cross-compilers enabled: cc cc
>   ld-elf.so.1: /usr/local/lib/libpython3.7m.so.1.0: Undefined symbol "close_range@FBSD_1.6"
>   ld-elf.so.1: /usr/local/lib/libpython3.7m.so.1.0: Undefined symbol "close_range@FBSD_1.6"
>   The Meson build system
>   Version: 0.55.3
>   Source dir: /usr/home/qemu/qemu-test.egp8wG/src
>   Build dir: /usr/home/qemu/qemu-test.egp8wG/build
>   Build type: native build
>   Project name: qemu
>   Project version: 5.2.50
>   ld-elf.so.1: /usr/local/lib/libpython3.7m.so.1.0: Undefined symbol "close_range@FBSD_1.6"
> 
>   ../src/meson.build:1:0: ERROR: Executables created by c compiler cc are not runnable.
> 
>   A full log can be found at /usr/home/qemu/qemu-test.egp8wG/build/meson-logs/meson-log.txt
> 
>   ERROR: meson setup failed
> 
>   /home/alex.bennee/lsrc/qemu.git/tests/vm/Makefile.include:95: recipe for target 'vm-build-freebsd' failed
>   make: *** [vm-build-freebsd] Error 3
> 
> Tracking back to before the previously mentioned commit it was still
> failing which makes me think something has happened to the BSD image (or
> something is missing since the build changes). I'd appreciate it if
> someone with more FreeBSD knowledge can look into both regressions
> because frankly I find it exhausting enough tracking down Linux
> regressions when they occur.

Yes, this is a problem with the image in Cirrus, which hit libvirt
CI too. We "fixed" it by changing to the freebsd-12-2  instead of
freebsd-12-1 image.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


