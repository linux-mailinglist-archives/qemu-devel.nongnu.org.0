Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596495AEB73
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:26:33 +0200 (CEST)
Received: from localhost ([::1]:42154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZX5-0008Ck-Vz
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVYf8-0007PW-1I
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:30:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVYf4-0000Ig-CI
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662471040;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCQzoGST5yTAEWS8rvuQq/HhV6iK1parqWcShqULIf0=;
 b=Wyxx0PuCWFtHpPZ+iQAEIW6oDM3mX6RJfjt+3mpc/viv59zKWux/TwGvMroJ+wW4Bhp4J0
 YzkB9UJF4wqAPDAOpvhqsuplbIBwJCxjshTXM4ney97ee7AjMY4kxnv+ffF7GCfCUQBNXT
 FkBmP9MiFvcaFFPAFl4BQf1+PuAyVPg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-FaruFJXSOVuALjR2FkV2pg-1; Tue, 06 Sep 2022 09:30:37 -0400
X-MC-Unique: FaruFJXSOVuALjR2FkV2pg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A672880029D;
 Tue,  6 Sep 2022 13:30:36 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ABA11415137;
 Tue,  6 Sep 2022 13:30:34 +0000 (UTC)
Date: Tue, 6 Sep 2022 14:30:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, imammedo@redhat.com,
 jsnow@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 thuth@redhat.com
Subject: Re: [PATCH v2 00/11] Introduce new acpi/smbios python tests using
 biosbits
Message-ID: <YxdLd/rS8PyEY+z+@redhat.com>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220711044032-mutt-send-email-mst@kernel.org>
 <CAFEAcA_KUh_Hmozw2KthwNoM2L9rnA18ttrk9GHHnJZ-X_M4yQ@mail.gmail.com>
 <YxdH/c9jx+3oVs9m@redhat.com>
 <CAARzgwz7XzNHik3zxJUNXOuO8HN59zhd8nZgMMt+OL22AiVXjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwz7XzNHik3zxJUNXOuO8HN59zhd8nZgMMt+OL22AiVXjw@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Tue, Sep 06, 2022 at 06:58:02PM +0530, Ani Sinha wrote:
> On Tue, Sep 6, 2022 at 18:45 Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Thu, Jul 14, 2022 at 02:24:18PM +0100, Peter Maydell wrote:
> > > On Mon, 11 Jul 2022 at 10:34, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Sun, Jul 10, 2022 at 10:30:03PM +0530, Ani Sinha wrote:
> > > > > Changelog:
> > > > > v2:
> > > > >  - a new class of python based tests introduced that is separate
> > from avocado
> > > > >    tests or qtests. Can be run by using "make check-pytest".
> > > > >  - acpi biosbits tests are the first tests to use pytest environment.
> > > > >  - bios bits tests now download the bits binary archives from a
> > remote
> > > > >    repository if they are not found locally. The test skips if
> > download
> > > > >    fails.
> > > > >  - A new environment variable is introduced that can be passed by
> > the tester
> > > > >    to specify the location of the bits archives locally. test skips
> > if the
> > > > >    bits binaries are not found in that location.
> > > > >  - if pip install of python module fails for whatever reaoson, the
> > test skips.
> > > > >  - misc code fixes including spell check of the README doc. README
> > has been
> > > > >    updated as well.
> > > > >  - addition of SPDX license headers to bits test files.
> > > > >  - update MAINTAINERS to reflect the new pytest test class.
> > > > >
> > > > > For biosbits repo:
> > > > >  - added Dockerfile and build script. Made bios bits build on gcc 11.
> > > > >
> > https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
> > > > >
> > https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.sh
> > > > >    The build script generates the zip archive and tarball used by
> > the test.
> > > >
> > > > So far so good, I think it's ok for a start. It's probably a good idea
> > > > to host the source on qemu.org. Peter - any objection to this?
> > >
> > > Dan was looking at v1 from the point of view of how we handle the
> > > guest binary blobs for these tests -- I'd rather defer to him rather
> > > than taking the time to get up to speed on the issue myself.
> >
> > Storing the *source* git repo for biosbits on gitlab.com/qemu-project
> > is sensible, as that's what we've done for other 3rd party bits that
> > we bundle/depend on git repo access for.
> 
> 
> Great. Can you or Peter please create a git repo cloned from the official
> bios bits repo please? You don’t have to clone mine. Please provide me with
> push access so that I can push fixes that I have made in order to build it.

I don't have any admin privileges for qemu infra, so can't do this
myself.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


