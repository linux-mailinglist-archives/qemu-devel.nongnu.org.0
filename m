Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBD75BAA37
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 12:24:55 +0200 (CEST)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ8Wj-0003Di-Qh
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 06:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oZ8Un-0001r5-QU
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 06:22:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oZ8Uk-0007vM-4I
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 06:22:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663323768;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtD+em+AHo5FNB/Udyb4gN4gZFeMYJht9o9VAV3u1/Q=;
 b=H9zAD80mA/QqMD/n3Zk9/H5hcP9HeZe6ck9WG+9z2lVaiUbRgCUVtAs9KiNVayXTubkG+P
 0fgYjw6toF+77C3z83T4Ff3PtVYwL3jAqQEAyNbR35OyKd801QNWhbOR7B2tBFXOFNiw+S
 Of3lYprU2cyaWLwBH5/XMAVq2NmBvVo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-lEOcLsgpPiGP63GiJjZSgg-1; Fri, 16 Sep 2022 06:22:44 -0400
X-MC-Unique: lEOcLsgpPiGP63GiJjZSgg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED3361C0690A;
 Fri, 16 Sep 2022 10:22:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 416AE40C6EC2;
 Fri, 16 Sep 2022 10:22:43 +0000 (UTC)
Date: Fri, 16 Sep 2022 11:22:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pierre Muller <pierre@freepascal.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 21/30] Deprecate 32 bit big-endian MIPS
Message-ID: <YyROcDHO7u9QL582@redhat.com>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-22-alex.bennee@linaro.org>
 <8d64e197-7002-79fd-4e97-cc224099f26f@linaro.org>
 <68abfbc9-929b-92bd-071a-11e2dec7adc1@freepascal.org>
 <9b3aa9b3-f657-7087-9d4c-06e071f7da4d@linaro.org>
 <d63b636b-aaf5-461b-d83d-827ee41616b4@freepascal.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d63b636b-aaf5-461b-d83d-827ee41616b4@freepascal.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 16, 2022 at 12:10:30PM +0200, Pierre Muller wrote:
> 
> 
> Le 16/09/2022 à 10:38, Richard Henderson a écrit :
> > On 9/16/22 10:08, Pierre Muller wrote:
> > > 
> > >     I am using gcc230 machine for the gcc compile farm.
> > > 
> > >     This is a big endian mips64 machine runnig Debian Buster.
> > > 
> > > When compiling the qemu 7.1.0 release source,
> > > the generated binaries are 32-bit mips binaries,
> > > and I did not find out how to generate a 64-bit versions
> > > of the executables.
> > 
> > Yes, that host seems to have been installed with the o32 abi instead of the n64 (or n32) abi.
> 
> Indeed,
> > >     As mips32 seems to still be the default arch that gcc uses,
> > > I don't really understand the idea of depreciating big endian mips32.
> > > 
> > > Is this solely related to cross-compilation issues?
> > 
> > Yes.  Even gcc230 is fairly small for actually compiling qemu, it takes many hours.  So
> > for many hosts we rely on cross-compilation from x86_64.
> > 
> > For that, we rely on the set of cross-compilers built by Debian 11 (bullseye) plus (!) the
> > host libraries for that platform.  We cannot simply rely on crossbuild-essential-mips
> > because building qemu requires many more system libraries than just libc.
> > 
> > In https://www.debian.org/releases/bullseye/, you'll note that big-endian mips is not
> > listed, so we are now missing those system libraries.
> 
>  So this is not limited to mips32, as big endian mips64 is also not supported anymore in bulleye...

Right, so as a general policy, for a platform target to be considered
fully supported, there needs to be a non-EOL (end of life) OS distro
with which we can run automated CI. In terms of unusual architectures,
Debian has historically been our best bet for being able to put together
container images suitable for running CI.

When even Debian has dropped an architecture, as well as removing our
ability to do CI, it is also a sign of the architectures diminishing
importance to the ecosystem as a whole. This makes it hard to justify
investing in figuring out new CI options, though we're open to suggestions
and help if people can point to non-EOL platforms that can be used,
especially if container based.

We don't wish to use end of life platforms for CI, since we periodically
intend to increase our minimum required versions of 3rd party libraries,
based on what current OS ship & testing using EOL platforms would prevent
that.

FWIW: https://www.qemu.org/docs/master/about/build-platforms.html

> > We are not intending to *remove* support for big-endian mips, as 99% of the code paths are
> > shared with little-endian mips, which we can continue to test.  But we are now saying that
> > big-endian mips is not "supported" and might break.
> 
>   Thank you for your answer and the clarifications!

In practical terms the lack of CI means that we can't guarantee that a
new QEMU release will compile successfully. We're handing off responsbility
for keeping it working to any interested users to do adhoc testing of their
own. We can still accept bug reports & patches when people discover problems.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


