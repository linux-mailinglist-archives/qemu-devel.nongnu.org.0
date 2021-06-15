Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D095A3A8714
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:07:28 +0200 (CEST)
Received: from localhost ([::1]:48916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCX9-0003QF-UT
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltCSF-0007lp-8x
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:02:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltCSD-0003gf-8W
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623776540;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U0tZ7Ljk+6pcWGC0Wr9/45bUeOt92eYnwpZfkRWETO4=;
 b=BKrHIx+0xcj0yo8GWmvT+2Wnn3m2L6lOyMguU/OJN3sHXrBEFyZWN1z7Jx9ftk56ymLOuP
 rxI1fu8wsIABu92WzMBxS2yx1anBM2pklRXIga1hR3blgsh3IbYKTwwBIsalP9/c0CBrHj
 2o3xAn6sBrQKCDxm8t1a1rvcnoXqnKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-pmMtZXJLP_i0i3iZbGRzSQ-1; Tue, 15 Jun 2021 13:02:18 -0400
X-MC-Unique: pmMtZXJLP_i0i3iZbGRzSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D0D79F92C;
 Tue, 15 Jun 2021 17:02:17 +0000 (UTC)
Received: from redhat.com (ovpn-115-226.ams2.redhat.com [10.36.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD3D35C1C2;
 Tue, 15 Jun 2021 17:02:05 +0000 (UTC)
Date: Tue, 15 Jun 2021 18:02:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH] tests/vm/freebsd: Increase code coverage
Message-ID: <YMjdCjNOyUnprhd8@redhat.com>
References: <20210531100348.1655156-1-f4bug@amsat.org>
 <ccb9dd6f-e41a-1be6-b193-0ecad89b5732@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ccb9dd6f-e41a-1be6-b193-0ecad89b5732@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Willian Rampazzo <willianr@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 31, 2021 at 05:53:25PM -0300, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 5/31/21 7:03 AM, Philippe Mathieu-Daudé wrote:
> > Install more dependencies to increase code coverage.
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > ---
> >   tests/vm/freebsd | 5 +++++
> >   1 file changed, 5 insertions(+)
> 
> With or without this patch I got an error when `make vm-build-freebsd`. It
> fails to install packages.
> 
> For example, with this patch I got:
> 
> < Output omitted>
> 
> ### Installing packages ...
> Failed to prepare guest environment
> Traceback (most recent call last):
>   File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 634, in main
>     return vm.build_image(args.image)
>   File "/home/wmoschet/src/qemu/tests/vm/freebsd", line 206, in build_image
>     self.ssh_root_check("pkg install -y %s\n" % " ".join(self.pkgs))
>   File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 255, in
> ssh_root_check
>     self._ssh_do(self._config["root_user"], cmd, True)
>   File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 242, in _ssh_do
>     raise Exception("SSH command failed: %s" % cmd)
> Exception: SSH command failed: pkg install -y git pkgconf bzip2 python37
> ninja bash gmake gsed gettext cyrus-sasl gnutls nettle jpeg-turbo png sdl2
> gtk3 libxkbcommon pixman libepoxy mesa-libs zstd usbredir
> 
> Is it a known issue?

Hard to actually tell what the error really is. This message is
only giving the command that was invoked, but seems to have thrown
away stdout/stderr which would have the messages telling us what
went wrong.  This lack of error reporting in basevm.py so badly
needs to be fixed, otherwise we're working blind when debugging
failures.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


