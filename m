Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBFC5072EE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 18:27:37 +0200 (CEST)
Received: from localhost ([::1]:56504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngqhU-0007hK-NE
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 12:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngqeg-0006qZ-8V
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 12:24:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngqea-0005oK-EL
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 12:24:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650385474;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mYcYREaIajvIt/mlAdIHxo5MMBSKwoGfEXcYmYMggBQ=;
 b=ed1p7jW2uwZWQ0/5PhcFFGZRSm2mJTI+nPBptHCyyn7X+24jnH+/qof662ubYv4IZVF65m
 67+N3jztnNRkv7ZOWMykLfAQLF3enWSyen6ILsd/PxsX+F1HDnSyq9lM0I+KqB9GCgxzzJ
 0SDnQK+yX26mtytglfZixm1OlqTKCGw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-2PlJ_DF5MEqXxF2RDVr9bw-1; Tue, 19 Apr 2022 12:24:31 -0400
X-MC-Unique: 2PlJ_DF5MEqXxF2RDVr9bw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FFE486B8AA;
 Tue, 19 Apr 2022 16:24:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.155])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21B35C52D98;
 Tue, 19 Apr 2022 16:24:29 +0000 (UTC)
Date: Tue, 19 Apr 2022 17:24:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH for-7.1] Remove the slirp submodule (and only compile
 with an external libslirp)
Message-ID: <Yl7iOlknz21QVPXx@redhat.com>
References: <20220408164749.534758-1-thuth@redhat.com>
 <72fe734a-8bf6-adc6-474a-47f2006c2f6d@comstyle.com>
 <CAFEAcA-NdeN8S0JXqfrpTiDoUmfZHBXUtdAuRAdDRooTpnYipA@mail.gmail.com>
 <b701aa9f-4dff-4a67-92a5-529fd07a7f1d@comstyle.com>
 <07a2ce65-41b9-7313-d7cc-51c2edb8cfd3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <07a2ce65-41b9-7313-d7cc-51c2edb8cfd3@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 11, 2022 at 08:55:19AM +0200, Thomas Huth wrote:
> On 11/04/2022 01.50, Brad Smith wrote:
> > On 4/10/2022 5:06 AM, Peter Maydell wrote:
> > > On Sun, 10 Apr 2022 at 05:51, Brad Smith <brad@comstyle.com> wrote:
> > > > On 4/8/2022 12:47 PM, Thomas Huth wrote:
> > > > > QEMU 7.1 won't support Ubuntu 18.04 anymore, so the last big important
> > > > > distro that did not have a pre-packaged libslirp has been dismissed.
> > > > > All other major distros seem to have a libslirp package in their
> > > > > distribution already - according to repology.org:
> > > > > 
> > > > >             Fedora 34: 4.4.0
> > > > >     CentOS 8 (RHEL-8): 4.4.0
> > > > >         Debian Buster: 4.3.1 (in buster-backports)
> > > > >    OpenSUSE Leap 15.3: 4.3.1
> > > > >      Ubuntu LTS 20.04: 4.1.0
> > > > >         FreeBSD Ports: 4.6.1
> > > > >         NetBSD pkgsrc: 4.3.1
> > > > >              Homebrew: 4.6.1
> > > > >           MSYS2 mingw: 4.6.1
> > > > > 
> > > > > The only one that still seems to be missing a libslirp package is
> > > > > OpenBSD - but I assume that they can add it to their ports system
> > > > > quickly if required.
> > > > I wish I had seen this earlier as our 7.1 release was just tagged.
> > > > 
> > > > I have whipped up a port of 4.6.1 for OpenBSD as it was pretty simple. I
> > > > will
> > > > see about submitting it in a number of days when the tree opens.
> > > How awkward would it be for an end-user who's on OpenBSD 7.1 to
> > > build a QEMU that doesn't have libslirp? (That is, is it easy
> > > and common for an end user to pull in a port of libslirp that only
> > > came along in a later OpenBSD, or would they instead have to
> > > manually compile libslirp themselves from the upstream sources?)
> > > 
> > > (I'm asking here because if it's painful, then we should perhaps
> > > defer dropping our submodule copy of libslirp a little longer.)
> > > 
> > > thanks
> > > -- PMM
> > 
> > They would have to pull down a -current ports tree and build it. No package
> > would exist for the release. It is possible, but not "supported". I have
> > not looked
> > at the CI bits to see how difficult that would be.
> > 
> > Our release cycles are 6 months and the next release will be in the middle
> > of October.
> 
> OK, thanks for the update, Brad ... so I guess we should defer this patch to
> QEMU 7.2 (to be released in december) instead?
> (which would be fine for me - I just wanted to get the discussion started,
> that's also why I've marked this patch as RFC)

Perhaps make 7.1 simply issue a warning message in configure if
the bundled slirp is used, to give people a heads up that they'll
want to install libslirp-devel soon.

We don't need to follow the formal deprecations process for build
deps. Just feels like a nice thing todo if we postpone till 7.2

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


