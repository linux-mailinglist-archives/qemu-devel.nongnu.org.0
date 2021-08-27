Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837653F96A0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 11:03:20 +0200 (CEST)
Received: from localhost ([::1]:34392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJXlf-0004My-Ke
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 05:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mJXkg-0003hU-Ld
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 05:02:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mJXkc-0008Ne-9u
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 05:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630054932;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LADVSFINCs0VeXPMqU/YdHA08NgbebK75rFqALyPwRs=;
 b=TEi+N4bZ8kZrwRXUfO5a80N79fEuf3vKzdkfKz1SHZtrdfAVwv8U/A4khqxstcIX2k9/Vw
 QigA0s8mmdLfplF6YsmopXc+TmvZmAfy7/kbtoqvlb5GC/OZqexCl169JC/+Soifw9dgl+
 PQETexYfsxMi5brccRtU92LvlOZjH/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-YeZDktHXN0-NWUQrW6haiQ-1; Fri, 27 Aug 2021 05:02:03 -0400
X-MC-Unique: YeZDktHXN0-NWUQrW6haiQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4FF11082923;
 Fri, 27 Aug 2021 09:02:01 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.114])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DF5D5D9C6;
 Fri, 27 Aug 2021 09:01:56 +0000 (UTC)
Date: Fri, 27 Aug 2021 10:01:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] RFC: build-sys: drop dtc submodule
Message-ID: <YSiqAa0RBPoXpU8f@redhat.com>
References: <20210825124309.223622-1-marcandre.lureau@redhat.com>
 <c79fb3c7-e6cc-adea-b694-ffe1f25c0d59@amsat.org>
 <CAFEAcA8YNwe-PCt2VuY4Fhjbyqnm2G7BpZDs6wyXNFh3pmee2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8YNwe-PCt2VuY4Fhjbyqnm2G7BpZDs6wyXNFh3pmee2Q@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 25, 2021 at 07:12:10PM +0100, Peter Maydell wrote:
> On Wed, 25 Aug 2021 at 14:28, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> >
> > On 8/25/21 2:43 PM, marcandre.lureau@redhat.com wrote:
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > >
> > > DTC is widely available, we could consider to stop bundling it.
> > >
> > > curl -s 'https://repology.org/api/v1/project/dtc' |  \
> > >    jq -r 'group_by(.repo) | .[] | "\(.[0].repo): \(map(.version))"' | \
> > >    egrep -i 'ubuntu_18|debian_old|rhel|centos|bsd|suse_leap_15_2|sles|homebrew|pkgsrc'
> > >
> > > centos_8: ["1.6.0","1.6.0"]
> > > debian_oldstable: ["1.4.7"]
> > > freebsd: ["1.6.0"]
> > > homebrew: ["1.6.1"]
> > > openbsd: ["1.6.0"]
> > > opensuse_leap_15_2: ["1.5.1","1.5.1"]
> > > pkgsrc_current: ["1.4.7"]
> > > ubuntu_18_04: ["1.4.5"]
> > >
> > > MinGW package on Fedora pending review.
> > > (https://bugzilla.redhat.com/show_bug.cgi?id=1997511)
> > >
> > > Debian is lacking the MinGW package.
> > >
> > > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  configure         | 22 +-------------------
> > >  meson.build       | 53 ++++++++---------------------------------------
> > >  .gitmodules       |  3 ---
> > >  dtc               |  1 -
> > >  meson_options.txt |  3 ---
> > >  5 files changed, 10 insertions(+), 72 deletions(-)
> > >  delete mode 160000 dtc
> >
> > Does this fix https://gitlab.com/qemu-project/qemu/-/issues/255 ?
> > "Build on sparc64 fails with "undefined reference to `fdt_check_full'"
> 
> That bug sounds like it indicates that we can't use this patch:
> a comment in the bug says that fdt_check_full() (which we use)
> was only added in libfdt 1.5.1. So the libfdt version we need
> is still not available in several of the distros we care about.
> 
> I suspect the bug you link to may have been fixed -- certainly
> meson.build appears to be specifically looking for fdt_check_full()
> so we should never try to compile with a libfdt that doesn't have it.

It is slightly more complicated - the fdt_check_full function exists
in all the distros we target AFAICT, but libfdt's ELF symbols file 
never recorded its existance. So if you static link to libfdt you 
get fdt_check_full but if you dynamic link it is inaccessible :-(

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


