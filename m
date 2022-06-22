Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A02554EBE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 17:10:11 +0200 (CEST)
Received: from localhost ([::1]:47906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o41ze-000844-Ob
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 11:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o41wR-0005VB-P7
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 11:06:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o41wO-0003Kg-Q4
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 11:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655910404;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R7MyzDzZV7Kne4Myo8w2+AutuUqjLFPXfUML4rPh5Dc=;
 b=QoIip5he+Efy27ZXq9UcPvZXK5X2s9Q4ZroUE40jVFVcqjmhivFWqEERoQ8WZyiTD4DlVA
 ynyKAX3WSLaR2SFpuhH5x1x+NkgkOHxrmPrxI07uXUVyYrH9gXRBM4/JkK0a6qyCwpwwR/
 5uy5YDpHGVHKT4DZAtUyOpKCGo5b3t0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-4b80fQQhMWeS0M3QoPUr2A-1; Wed, 22 Jun 2022 11:06:41 -0400
X-MC-Unique: 4b80fQQhMWeS0M3QoPUr2A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B440C801E80;
 Wed, 22 Jun 2022 15:06:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD3AA492C3B;
 Wed, 22 Jun 2022 15:06:38 +0000 (UTC)
Date: Wed, 22 Jun 2022 16:06:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Anders Roxell <anders.roxell@linaro.org>,
 Remi Duraffort <remi.duraffort@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] gitlab: add a binary build to project registry
Message-ID: <YrMv+9l1VUJJUKMS@redhat.com>
References: <20220622123305.3971169-1-alex.bennee@linaro.org>
 <CAFEAcA_v+VM1kd=_D2Tm7DkkS=i+3k26aaM-YGjnTT6-zsPDxg@mail.gmail.com>
 <87bkukrbwz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bkukrbwz.fsf@linaro.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jun 22, 2022 at 03:43:54PM +0100, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > On Wed, 22 Jun 2022 at 13:33, Alex Bennée <alex.bennee@linaro.org> wrote:
> >>
> >> There have been requests from other projects such LKFT to have
> >> "official" docker images with pre-built QEMU binaries. These could
> >> then be consumed by downstream CI systems by pulling directly from the
> >> qemu-project container registry. The final image could then be run by
> >> doing:
> >>
> >>   docker run --rm -it \
> >>     registry.gitlab.com/qemu-project/qemu/qemu/debian-amd64-binaries \
> >>     /opt/bin/qemu-system-aarch64 $ARGS
> >>
> >> To keep the build time down we skip user-mode, documents, plugins and
> >> a selection of the more esoteric hardware emulations. Even so it still
> >> takes over an hour to build and install everything.
> >
> >> This is very much an RFC for now as we have traditionally not provided
> >> binaries for our users except for the slightly special case of
> >> Windows. As currently structured this will rebuild the binaries on
> >> every merge but we could change the generation rules to only trigger
> >> for tagged or stable branch pushes. We also wouldn't be testing these
> >> binaries so we are basically assuming they are OK by the nature of
> >> being built from master which in theory never breaks.
> >
> > I'm a bit uncertain about providing "official" docker images
> > or other pre-built binaries, because it might give the impression
> > that these are OK to use with KVM, when in fact they won't necessarily
> > get security fixes in a timely manner, and almost all users of QEMU for
> > KVM purposes are better off with the distro QEMU.
> 
> Do we have any sort of idea how long it takes from a CVE being fixed in
> a distro kernel to the eventual merge of a patch in master?
> 
> Anyway the main use case for this is emulation where we want to get new
> features under -cpu max into the CI loops as soon as possible. I think
> the LKFT guys are testing KVM as well though and again want to see new
> KVM features as soon as possible.
> 
> I'm not proposing these images are uploaded to docker.io so less likely
> to be hit by the default:
> 
>   docker run qemu:latest
> 
> (they instead get 6 year old things packages by someone calling
> themselves qemu: https://hub.docker.com/u/qemu)

I guess I would question whether we really need to introduce ourselves
as a dependancy of arbitrary downstream projects. We will have little
insight into what other projects are doing with any containers we publish.
This in turn means our scope for making changes to the containers over
time is quite limited, unless we're willing to risk breaking those
unknown projects' CI systems.

Personally, I feel CI systems are already fragile enough that it is
better to have a self contained system as much as possible. This is why,
for example, libvirt's integration test suite builds QEMU from git
itself. We get exact control over which QEMU features are built, and
get to choose which distros we target too. It isn't hard for apps wanting
to use QEMU to perform a build:

  https://gitlab.com/libvirt/libvirt/-/blob/master/ci/integration-template.yml#L5

Probably the hardest part here is understanding the build time package
dependancies that are required to be installed, if you want to all QEMU
features enabled. We could perhaps use lcitool to record the full set of
build dependancies for each distro in git, so 3rd party CI can grab the
package list and install it, and thus get the trivial build done. Even
better if we publish the package list info in our docs too.

I wonder why LKFT isn't building QEMU themselves in the way that they
need already ?  Would be nice to know what their problems are, rather
than just assume that a container build is the solution.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


