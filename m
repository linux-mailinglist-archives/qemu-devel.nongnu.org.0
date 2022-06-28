Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EFE55C019
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:12:05 +0200 (CEST)
Received: from localhost ([::1]:54796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68CS-00071c-Am
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o686y-0002wM-BE
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:06:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o686u-0005s2-Fu
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656410778;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6BbkySCfARKVCcHNnCRw9/SWyiUK2lPllc4llt4TLg=;
 b=cOyEqNaBlgHiCc5ipWKUdPut/fcJOHAm15HUS1ycXFHzdfMDEK9qpAYwYRuKs9lwhAU7g3
 sWQbLsVUUzT/RUBlyYKEkIPrA9lM+lDjWnF7TY6HQLUIYvOerdlUIblPUP1IROUru+kxMP
 mVwbe55AEObm0EnHyeAsXrkUX49wnGA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-e-pESkBCMtWMLeaRmrQURg-1; Tue, 28 Jun 2022 06:06:15 -0400
X-MC-Unique: e-pESkBCMtWMLeaRmrQURg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 709AC18A6523;
 Tue, 28 Jun 2022 10:06:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E43F492C3B;
 Tue, 28 Jun 2022 10:06:14 +0000 (UTC)
Date: Tue, 28 Jun 2022 11:06:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com
Subject: Re: [PATCH 00/12] Introduce new acpi/smbios qtests using biosbits
Message-ID: <YrrSk+HPXqCc/Jz3@redhat.com>
References: <20220627072856.1529357-1-ani@anisinha.ca>
 <Yrq3HUEghZ7IFh//@redhat.com>
 <CAARzgwzDdQGQ81bNAOg6t=4rhfdkQjunscT+x=sUOEp92R=cmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwzDdQGQ81bNAOg6t=4rhfdkQjunscT+x=sUOEp92R=cmg@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

On Tue, Jun 28, 2022 at 02:03:15PM +0530, Ani Sinha wrote:
> On Tue, Jun 28, 2022 at 1:39 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Mon, Jun 27, 2022 at 12:58:44PM +0530, Ani Sinha wrote:
> > > Biosbits is a software written by Josh Triplett that can be downloaded by
> > > visiting https://biosbits.org/. The github codebase can be found here:
> > > https://github.com/biosbits/bits/tree/master. It is a software that exercizes
> > > the bios components such as acpi and smbios tables directly through acpica
> > > bios interpreter (a freely available C based library written by Intel,
> > > downloadable from https://acpica.org/ and is included with biosbits) without an
> > > operating system getting involved in between.
> > > There are several advantages to directly testing the bios in a real physical
> > > machine or VM as opposed to indirectly discovering bios issues through the
> > > operating system. For one thing, the OSes tend to hide bios problems from the
> > > end user. The other is that we have more control of what we wanted to test
> > > and how by directly using acpica interpreter on top of the bios on a running
> > > system. More details on the inspiration for developing biosbits and its real
> > > life uses can be found in (a) and (b).
> > > This patchset contains QEMU qtests written in python that exercizes the QEMU
> > > bios components using biosbits and reports test failures.
> > >
> > > Details of each of the files added by this patchset are provided in the README
> > > file which is part of Patch 11. Every effort to contact Josh, through various
> > > means including email, twitter, linkedIn etc has failed. Hence, the changes to
> > > build biosbits with the newer compiler, upgrade acpica and other changes are
> > > currently maintained in a forked project in my personal github. We may want to
> > > maintain bits in a separate fork in a stable repository that is accessible by
> > > QEMU developers.
> > >
> > > The newly introduced qtest currently only run for x86_64 platform. They pass
> > > both when running make check on a baremetal box as well as from inside a vm.
> > >
> > > Thanks to Igor M for pointing me to this work.
> > >
> > > (a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/867/original/bits.pdf
> > > (b) https://www.youtube.com/watch?v=36QIepyUuhg
> > >
> > > Ani Sinha (12):
> > >   qtest: meson.build changes required to integrate python based qtests
> > >   acpi/tests/bits: add prebuilt bios bits zip archive
> > >   acpi/tests/bits: add prebuilt bits generated grub modules and scripts
> >
> > These two files didn't arrive on the mailing list, presumaby because
> > pre-built binaries made the patches way too large.
> 
> Yes they are over 25 MB and my gmail account does not support
> attachments more than that size.

Ok, with that kind of size, it is definitely not something we want to
be committing to git either, nor consuming via a submodule since the
latter would bloat the release tarballs too.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


