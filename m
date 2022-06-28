Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA1D55BFAD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:01:51 +0200 (CEST)
Received: from localhost ([::1]:32808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o676T-0004lR-6T
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o66V9-0008WK-Fw
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:23:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o66V6-0003eS-GS
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656404592;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHCE74yg8Lqtah0lPO8Wy3BuqSJJGFDyaymh7Rv+n4A=;
 b=BvYxm3dYN+O53ZpdKNpuHXcNKUcZVEtLm3eFvAl9Lyf4IBuv3eRJG/rFeAdMShInXqJqu4
 8PQvrgNjkhv14LFnOil5lXApFhm9C2ALMHUqEKVbqAqc2N6UsHTkxUoyOFA1lKLz29MkIj
 9P9lmW5/0hExUT+pSn7LU2lvU6xfxt8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-P5Q0p8yqO5KKgTbZgaF9PA-1; Tue, 28 Jun 2022 04:23:10 -0400
X-MC-Unique: P5Q0p8yqO5KKgTbZgaF9PA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65241185A7A4;
 Tue, 28 Jun 2022 08:23:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 080D5112131B;
 Tue, 28 Jun 2022 08:23:08 +0000 (UTC)
Date: Tue, 28 Jun 2022 09:23:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <Yrq6anPW60FkjmK6@redhat.com>
References: <CAARzgwwf_WRWzbwPorpa-4XN7T6f6D7CRo70+07Z8LgZO+5Spg@mail.gmail.com>
 <20220628021757-mutt-send-email-mst@kernel.org>
 <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
 <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 28, 2022 at 01:21:35PM +0530, Ani Sinha wrote:
> On Tue, Jun 28, 2022 at 1:19 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Jun 28, 2022 at 09:25:35AM +0200, Thomas Huth wrote:
> > > On 28/06/2022 09.10, Michael S. Tsirkin wrote:
> > > > On Tue, Jun 28, 2022 at 09:03:33AM +0200, Thomas Huth wrote:
> > > > > > > > > > > No problem with that. So that's venv. But do we need pip and pulling
> > > > > > > > > > > packages from the net during testing?
> > > > > > > > > >
> > > > > > > > > > We do that too. See requirements.txt in tests/
> > > > > > > > > > Following two are downloaded:
> > > > > > > > > > avocado-framework==88.1
> > > > > > > > > > pycdlib==1.11.0
> > > > > > > > > >
> > > > > > > > > > Also see this line in Makefie.include:
> > > > > > > > > >
> > > > > > > > > > $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
> > > > > > > > >
> > > > > > > > > Right but that's avocado since it pulls lots of stuff from
> > > > > > > > > the net anyway.
> > > > > > > > > Are the libraries in question not packaged on major distros?
> > > > > > > >
> > > > > > > > Currently I only need this:
> > > > > > > > https://github.com/python-tap/tappy
> > > > > > > > which is the basic TAP processing library for python.
> > > > > > > >
> > > > > > > > It seems its only installed through pip:
> > > > > > > > https://tappy.readthedocs.io/en/latest/
> > > > > > > >
> > > > > > > > I do not think this is packaged by default. It's such a basic library
> > > > > > > > for parsing test output that maybe we can keep this somewhere within
> > > > > > > > the python src tree? Not sure ...
> > > > > > >
> > > > > > > It's pretty small for sure. Another submodule?
> > > > > >
> > > > > > Unlike BITS, this one is likely going to be maintained for a while and
> > > > > > will receive new releases through
> > > > > > https://pypi.org/project/tap.py/
> > > > > > so forking is OK but someone has to keep this updated.
> > > > > >
> > > > > > I am open to anything. Whatever feels right is fine to me.
> > > > >
> > > > > John Snow is currently working on the "Pythonification" of various QEMU
> > > > > bits, I think you should loop him into this discussion, too.
> > > > >
> > > > >   Thomas
> > > >
> > > > submodule does not mean we fork necessarily. We could have
> > > > all options: check for the module and use it if there, if not
> > > > use one from system if not there install with pip ..
> > > > But yea, I'm not sure what's best either.
> > >
> > > submodules create a dependency on an internet connection, too. So before you
> > > add yet another submodule (which have a couple of other disadvantages), I
> > > think you could also directly use the venv here.
> >
> > Definitely not submodules.
> >
> > We need to get out of the mindset that submodules are needed for every new
> > dependancy we add. Submodules are only appropriate if the external project
> > is designed to be used as a copylib (eg the keycodemapdb tool), or if we
> > need to bundle in order to prevent a regression for previously deployed
> > QEMU installs where the dependancy is known not to exist on all our
> > supported platforms.
> >
> > This does not apply in this case, because the proposed use of tappy is
> > merely for a test case. Meson just needs to check if tappy exists and if
> > it does, then use it, otherwise skip the tests that need it. The user can
> > arrange to install tappy, as they do with the majority of other deps.
> >
> > If John's venv stuff is relevant, then we don't even need the meson checks,
> > just delegate to the venv setup.
> >
> > Regardless, no submodules are needed or desirable.
> 
> What about keeping biosbits stuff? Source or pre-built.

Shipping them as pre-built binaries in QEMU is not a viable option
IMHO, especially for grub as a GPL'd project we need to be extremely
clear about the exact corresponding source and build process for any
binary.

For this kind of thing I would generally expect the distro to provide
packages that we consume. Looking at biosbits I see it is itself
bundling a bunch more 3rd party projects, libffi, grub2, and including
even an ancient version of python as a submodule.

So bundling a pre-built biosbits in QEMU appears to mean that we're in
turn going to unexpectedly bundle a bunch of other 3rd party projects
too, all with dubious license compliance. I don't think this looks like
something we should have in qemu.git or qemu tarballs. It will also
make it challenging for the distro to take biosbits at all, unless
those 3rd party bundles can be eliminated in favour of using existing
builds their have packaged for grub, python, libffi, etc.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


