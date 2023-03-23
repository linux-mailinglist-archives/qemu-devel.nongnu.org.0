Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B62E6C6374
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 10:26:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfHBr-0004VQ-Bm; Thu, 23 Mar 2023 05:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pfHBo-0004Un-DQ
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 05:24:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pfHBm-0004ON-Db
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 05:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679563493;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jp5oay/hjwWJVs/O9zEaDHTNgaLK8OqsbUGnQuA1r7k=;
 b=OUrUO5t7yaxJz6X0XrCC3YTY/iX89PEcADVA54WNDB9nKMtMaLZfeoq94+bA79MDp/lkNn
 Lmmg7vgDUUOj1CCSXyyiBpkMmv9NLVnpKXIdfunhJjoKTOC8vUicfw/dGygfqSvTM2WIQ8
 nAxf8oF44JaivnEz/BUpf4ZK/RSWuZc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-ynHrvOHsPbmWznkptqmVtg-1; Thu, 23 Mar 2023 05:24:49 -0400
X-MC-Unique: ynHrvOHsPbmWznkptqmVtg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6502185530C;
 Thu, 23 Mar 2023 09:24:49 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FD93140E960;
 Thu, 23 Mar 2023 09:24:47 +0000 (UTC)
Date: Thu, 23 Mar 2023 09:24:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jintao Yin <nicememory@gmail.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v2 2/2] cirrus-ci: Remove MSYS2 jobs duplicated with
 gitlab-ci
Message-ID: <ZBwa2/rt/bVq4vm9@redhat.com>
References: <20230322135721.61138-1-philmd@linaro.org>
 <20230322135721.61138-3-philmd@linaro.org>
 <ZBtLAvQ/5kFofyEJ@redhat.com>
 <64c9356e-1197-8893-db1d-860e6a202a87@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64c9356e-1197-8893-db1d-860e6a202a87@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 23, 2023 at 09:37:40AM +0100, Thomas Huth wrote:
> On 22/03/2023 19.37, Daniel P. Berrangé wrote:
> > On Wed, Mar 22, 2023 at 02:57:21PM +0100, Philippe Mathieu-Daudé wrote:
> ...
> > > diff --git a/.cirrus.yml b/.cirrus.yml
> > > deleted file mode 100644
> > > index 5fb00da73d..0000000000
> > > --- a/.cirrus.yml
> > > +++ /dev/null
> > 
> > > -    MSYS2_PACKAGES: "
> > > -      diffutils git grep make pkg-config sed
> > > -      mingw-w64-x86_64-python
> > > -      mingw-w64-x86_64-python-sphinx
> > 
> > This isn't listed in the .gitlab-ci.d/windows.yml file
> 
> I think that's fine. The gitlab CI Windows jobs are very slow and ran into
> timeout issues in the past already, so we certainly don't want to waste our
> time there with building the documentation.

IMHO, we should have the same deps present in all CI areas. If we
then need to skip docs because of speed lets pass --disable-docs
so that it is explicit that we're skipping them, rather than having
to infer the intention from the missing deps.

My hope would be that we can ultimately make the package listing huere
be auto-generated by lcitool too. It likely only needs a few naming
tweaks here & there for packages to get it working. At that point we
would need to control disablement via  configure flags.

> > > -      mingw-w64-x86_64-toolchain
> > 
> > This also isn't listed
> 
> Seems to be a "group" package:
> 
>  https://packages.msys2.org/groups/mingw-w64-x86_64-toolchain
> 
> It includes other languages like Fortran and Ada ... I think we don't want
> that in the gitlab-CI job.

Ok, yes, better to list exactly what we want.

> 
> > > -      mingw-w64-x86_64-SDL2
> > > -      mingw-w64-x86_64-SDL2_image
> > > -      mingw-w64-x86_64-gtk3
> > > -      mingw-w64-x86_64-glib2
> > > -      mingw-w64-x86_64-ninja
> > > -      mingw-w64-x86_64-jemalloc
> > 
> > This also isn't listed
> 
> I think jemalloc is very niche these days for building QEMU, especially on
> Windows, so I'd rather not use it there.


> > > -      mingw-w64-x86_64-lzo2
> > > -      mingw-w64-x86_64-zstd
> > > -      mingw-w64-x86_64-libjpeg-turbo
> > > -      mingw-w64-x86_64-pixman
> > > -      mingw-w64-x86_64-libgcrypt
> > > -      mingw-w64-x86_64-libpng
> > > -      mingw-w64-x86_64-libssh
> > > -      mingw-w64-x86_64-snappy
> > > -      mingw-w64-x86_64-libusb
> > > -      mingw-w64-x86_64-usbredir
> > > -      mingw-w64-x86_64-libtasn1
> > > -      mingw-w64-x86_64-nettle
> > > -      mingw-w64-x86_64-cyrus-sasl
> > > -      mingw-w64-x86_64-curl
> > > -      mingw-w64-x86_64-gnutls
> > > -      mingw-w64-x86_64-libnfs
> > 
> > The  .gitlab-ci.d/windows.yml file meanwhile adds 'dtc' 'gcc'
> > and 'pkgconf' which are not present here.
> 
> dtc for avoiding to recompile the submodule, gcc and pkgconf as replacement
> for the toolchain group package.

Ok, all makes sense.

> > Broadly I agree with this proposal, but it feels like we might want a
> > few tweak to the windows.yml file to address some of the inconsistencies
> 
> You can have a try, but from my experience, it will be very hard to increase
> the test coverage of those jobs without hitting timeout issues again.
> 
>  Thomas
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


