Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCA15EBFCB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:33:50 +0200 (CEST)
Received: from localhost ([::1]:56618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7uP-0003nc-Ca
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1od7fO-0000zl-3C
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:18:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1od7fK-0003Om-Ft
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664273892;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=s3PqlNYrYD1KGbZ7uxS+DCM3jv8HPDhKWSZGxSqK09g=;
 b=A5lR3OsE3nXiVU1PyPb0YFTBEbB6O95EKIJeTW5/tZh7M/NEsduWQTWpgSTsbymJYlW17g
 qCr5lT/ejNbY9M457NMN64L5qAETnAfkHiYlQj/W3jUZ31K44EML87NT8EO/7+O4jl5ZcC
 CYF8Cmek0LVXdPlVob/r8UqgRSlADrg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-btCPNMxJN1eEXcdsbx8RUg-1; Tue, 27 Sep 2022 06:18:09 -0400
X-MC-Unique: btCPNMxJN1eEXcdsbx8RUg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEC7E85A5A6;
 Tue, 27 Sep 2022 10:18:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A21B492B04;
 Tue, 27 Sep 2022 10:18:07 +0000 (UTC)
Date: Tue, 27 Sep 2022 11:18:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, imammedo@redhat.com,
 jsnow@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, thuth@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <YzLN3Y1pNO8SVn9M@redhat.com>
References: <20220715015941-mutt-send-email-mst@kernel.org>
 <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
 <20220716112943-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
 <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
 <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com>
 <CAARzgwxpm-tF3OwK95gHe+9_6qBebiqPFLug-59RUt85aCnuZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAARzgwxpm-tF3OwK95gHe+9_6qBebiqPFLug-59RUt85aCnuZQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Tue, Sep 27, 2022 at 03:37:39PM +0530, Ani Sinha wrote:
> > > > > > >
> > > > > > > OK fine. Lets figuire out how to push bits somewhere in git.qemu.org and
> > > > > > > the binaries in some other repo first. Everything else hinges on that. We
> > > > > > > can fix the rest of the bits later incrementally.
> > > > > >
> > > > > > DanPB, any thoughts on putting bits on git.qemu.org or where and how to
> > > > > > keep the binaries?
> > > > >
> > > > > Can we please conclude on this?
> > > > > Peter, can you please fork the repo? I have tried many times to reach
> > > > > you on IRC but failed.
> > > >
> > > > Probably because of travel around KVM forum.
> > > >
> > > > I think given our CI is under pressure again due to gitlab free tier
> > > > limits, tying binaries to CI isn't a great idea at this stage.
> > > > Can Ani just upload binaies to qemu.org for now?
> > >
> > > I agree with Michael here. Having a full ci/cd job for this is
> > > overkill IMHO. We should create a repo just for the binaries, have a
> > > README there to explain how we generate them and check in new versions
> > > as and when needed (it won't be frequent).
> > > How about biosbits-bin repo?
> >
> > If QEMU is hosting binaries, where any part contains GPL code, then we
> > need to be providing the full and corresponding source and the build
> > scripts needed to re-create the binary. Once we have such scripts it
> > should be trivial to trigger that from a CI job. If it isn't then
> > we're doing something wrong.
> 
> I was thinking of commiting the build scripts in a branch of
> https://gitlab.com/qemu-project/biosbits-bits.
> This would separate them from the main source. The scripts would build
> a version of qemu-bits based on the version information passed to it
> from the environment.
> Before I committed the scripts, I wanted to check whether we would
> want to do that or have a separate repo containing the binaries and
> the build scripts.
> Seems we want the former.
> 
> As for the gitlab-ci, I looked at the yaml file and the qemu ones
> looks quite complicated. Can someone help me generate one based on the
> build script here?
> https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.sh

Yes, QEMU's rules aren't a good place to start if you're trying
to learn gitlab CI, as they're very advanced.

The simple case though is quite simple.

  * You need a container image to act as the build env
  * In 'before_script'  install any packages you need on top of the
    base container image for build deps
  * In 'script'  run whatever shell commands you need in order
    to build the project
  * Add an 'artifacts' section to publish one (or more) files/dirs
    as output

The simplest example would be something like

   mybuild:
     image: fedora:36
     before_script:
       - dnf install -y gcc
     script:
       - gcc -o myapp myapp.c
     artifacts
       paths:
         - myapp


So essentially use 'docker run yourimage:tag' locally to bring
up the build env, and interactively work out what packags yuo
need to install, and what scripts to invoke to build it. When
you have it figured out, just copy those commands into the
before_script/script sections in .gitlab-ci.yml


Note, the .gitlab-ci.yml file would be in the git repo of the
project you're building typically, which would be the main
'biosbits' project i presume. 

There's a fairly decent reference of syntax here:

  https://docs.gitlab.com/ee/ci/yaml/

And broader set of docs

 https://docs.gitlab.com/ee/ci/

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


