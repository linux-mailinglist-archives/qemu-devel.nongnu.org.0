Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3A041D5A6
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 10:47:56 +0200 (CEST)
Received: from localhost ([::1]:36004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVrjP-0007ie-U5
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 04:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVrgp-0005zX-9U
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:45:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVrgn-0002bI-Ek
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:45:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632991512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lcfSpydyG+OS89VCFVNffBPIel0far4Ncf9N60YGsmk=;
 b=gjlUqbw6GZnxWmX7C64HU5K647bLcs1ViFs56VUT7cta4cjC6UIhIvQJ0KVuCzK4bPErLS
 Hlmr9zSFksrtvfhyYEsAf3GqzqQXmGLyeEfT3rKF+1YiA00kBoGnycT8PXYL67kTAZSWnT
 R2MfKxprp/prxR2xs/GhvZN0RrB4vGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-yhDU_rR3OMy9DPyBNtKr4A-1; Thu, 30 Sep 2021 04:45:09 -0400
X-MC-Unique: yhDU_rR3OMy9DPyBNtKr4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34AAF1808319;
 Thu, 30 Sep 2021 08:45:08 +0000 (UTC)
Received: from localhost (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D721160657;
 Thu, 30 Sep 2021 08:45:07 +0000 (UTC)
Date: Thu, 30 Sep 2021 09:45:07 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PULL 00/20] NBD patches through 2021-09-27
Message-ID: <20210930084506.GV3361@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
 <CAFEAcA9P_xzSce_3bVKO95HOdhbf1aqVJ-eiXOkJ09Hj4ow+bg@mail.gmail.com>
 <97e67c45-21f9-2630-7173-991d01871116@redhat.com>
 <CAFXwXrnZzyUBSikVr6uFLHQeD5hWcXDq+eG=uwBC5xQ8FVivmg@mail.gmail.com>
 <9ba3ebe2-4d74-628f-fb76-5541f629ff9e@redhat.com>
 <20210929182921.t3g4ozzweoo4vpyu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210929182921.t3g4ozzweoo4vpyu@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 01:29:21PM -0500, Eric Blake wrote:
> On Wed, Sep 29, 2021 at 05:03:08PM +0200, Paolo Bonzini wrote:
> > On 29/09/21 15:58, Richard Henderson wrote:
> > > 
> > >      > /usr/bin/ld: /usr/lib64/libselinux.so: error adding symbols: file in
> > >      > wrong format
> > >      > collect2: error: ld returned 1 exit status
> > > 
> > >     Missing libselinux-devel.i686 in
> > >     tests/docker/dockerfiles/fedora-i386-cross.docker, I think?

This part is easy to fix.

> > > But additionally, incorrect package probing, I think.
> > 
> > Probably Meson deciding to look at --print-search-dirs and crossing fingers.
> > But -m32 and other multilib flags should be added to config-meson.cross
> > rather than QEMU_CFLAGS.

However this part I've no idea.  The docker file uses:

  ENV QEMU_CONFIGURE_OPTS --extra-cflags=-m32 --disable-vhost-user

I emulated this locally using:

  PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig ../configure --extra-cflags=-m32 --disable-vhost-user

but config-meson.cross does not have -m32 anywhere.  Nevertheless it
seemed to build a 32 bit qemu with selinux fine:

$ file ./qemu-system-x86_64
./qemu-system-x86_64: ELF 32-bit LSB pie executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, BuildID[sha1]=1d070416c7d211f8bfa018557265c25e79a913bb, for GNU/Linux 3.2.0, with debug_info, not stripped
$ ldd ./qemu-system-x86_64 | grep selin
  libselinux.so.1 => /lib/libselinux.so.1 (0xf52b0000)

I will post v3 soon, but how can I test patches under your CI system?

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


