Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F273BEA12
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 16:51:15 +0200 (CEST)
Received: from localhost ([::1]:60278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m18tO-000570-A3
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 10:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m18rh-0003jS-5V
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:49:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m18rd-00056i-0t
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625669364;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lUjJhu9iMcaHCIrcFNOYU1G0Yn1VNxhCJ1x2dEg5t1I=;
 b=SBSw+xUcFE+dbJ9yj2kfJCr6GSc2WzEN7vG4vzDjYZVyx6JMg5vj4QJF9DI+d9jzePQAUM
 NBBPW/ll05l5fNhcKWgMuRNTkD05YkKoZ1Xcvoul0Dk8manb/l4xzHqFAaHqzqz4zAZ50K
 1C63JbvsvwFpQf6R69wu7ryppWw/aJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-j5kowGgfNvqOn8tGw3sLOw-1; Wed, 07 Jul 2021 10:49:22 -0400
X-MC-Unique: j5kowGgfNvqOn8tGw3sLOw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A43F31054FB9;
 Wed,  7 Jul 2021 14:49:15 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A412B772FF;
 Wed,  7 Jul 2021 14:49:05 +0000 (UTC)
Date: Wed, 7 Jul 2021 15:49:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v1 17/39] tests/docker: fix mistakes in ubuntu package
 lists
Message-ID: <YOW+3jIYLq/6oJzm@redhat.com>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
 <20210706145817.24109-18-alex.bennee@linaro.org>
 <357c694a-8a67-3b9b-68af-87c794f52197@amsat.org>
MIME-Version: 1.0
In-Reply-To: <357c694a-8a67-3b9b-68af-87c794f52197@amsat.org>
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
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 04:41:42PM +0200, Philippe Mathieu-Daudé wrote:
> On 7/6/21 4:57 PM, Alex Bennée wrote:
> > From: Daniel P. Berrangé <berrange@redhat.com>
> > 
> > librados-dev is not required by QEMU directly, only librbd-dev.
> > 
> > glusterfs-common is not directly needed by QEMU.
> > 
> > QEMU uses ncursesw only on non-Windows hosts.
> > 
> > The clang package is clang 10.
> > 
> > flex and bison are not required by QEMU.
> 
> Doh, it was practical to cross-build Linux kernel images
> while testing:
> 
> $ make O=/tmp/build ARCH=mips CROSS_PREFIX=mipsel-linux-gnu- jazz_defconfig
> make[1]: Entering directory '/tmp/build'
>   GEN     Makefile
>   LEX     scripts/kconfig/lexer.lex.c
> /bin/sh: 1: flex: not found
> make[2]: *** [scripts/Makefile.host:9: scripts/kconfig/lexer.lex.c]
> Error 127
> 
> But I agree it is not required by QEMU itself.

Yeah, this feels out of scope for QEMU. If we want to make it easy
to build kernel images for testing with QEMU, we ought to have a
dedicated git repo with standard .config recipes and containers
with suitable build environments. There's no reason to deal with
that all in qemu.git that I see.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


