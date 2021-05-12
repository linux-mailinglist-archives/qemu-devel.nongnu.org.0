Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05DB37C086
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:44:39 +0200 (CEST)
Received: from localhost ([::1]:45946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgq6J-0005pZ-1K
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgq5N-000575-QQ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:43:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgq5H-0003yb-Sc
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620830615;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tVfucgCLLlV/EzI5p2q0s1UZnfF23nSSRumtRrtdvAk=;
 b=KDqSqd4TyI3q48UsIVK2y9Xad7meC0i07V7q91EjqYSMXu9ve7kXKqiR4iFynpBtPIbKMU
 eC7g0jrRQ0FU9reXw5awZDMW437zR8lj6xA1XUchWJ9p9ePeei4K5OoRtNKVGU3HQubDnu
 X9+bYeGocY7M9vpS802mwOWPqxvhI7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-xIRO_6j3NZulgRR_qtpf5A-1; Wed, 12 May 2021 10:43:28 -0400
X-MC-Unique: xIRO_6j3NZulgRR_qtpf5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8425681840C;
 Wed, 12 May 2021 14:43:27 +0000 (UTC)
Received: from redhat.com (ovpn-114-167.ams2.redhat.com [10.36.114.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE70D6091A;
 Wed, 12 May 2021 14:43:18 +0000 (UTC)
Date: Wed, 12 May 2021 15:43:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 12/12] configure: bump min required CLang to 7.0.0 /
 XCode 10.2
Message-ID: <YJvpg1Ez9hzFvfNs@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-13-berrange@redhat.com>
 <fcb6b808-c1de-d5f3-064c-1725c49999e0@redhat.com>
 <YJvJNdsGmp+cCPuZ@redhat.com>
 <0e2fce4c-c8fb-de53-7529-93e8a9d667b7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0e2fce4c-c8fb-de53-7529-93e8a9d667b7@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 12, 2021 at 04:10:03PM +0200, Philippe Mathieu-Daudé wrote:
> On 5/12/21 2:25 PM, Daniel P. Berrangé wrote:
> > On Wed, May 12, 2021 at 01:44:51PM +0200, Philippe Mathieu-Daudé wrote:
> >> On 5/11/21 3:26 PM, Daniel P. Berrangé wrote:
> >>> Several distros have been dropped since the last time we bumped the
> >>> minimum required CLang version.
> >>>
> >>> Per repology, currently shipping versions are:
> >>>
> >>>              RHEL-8: 10.0.1
> >>>      Debian Stretch: 7.0.1
> >>>       Debian Buster: 7.0.1
> >>>  openSUSE Leap 15.2: 9.0.1
> >>>    Ubuntu LTS 18.04: 10.0.0
> >>>    Ubuntu LTS 20.04: 11.0.0
> >>>          FreeBSD 12: 8.0.1
> >>>           Fedora 33: 11.0.0
> >>>           Fedora 34: 11.1.0
> >>>
> >>> With this list Debian Stretch is the constraint at 7.0.1
> >>>
> >>> An LLVM version of 7.0.1 corresponds to macOS XCode version of 10.2
> >>> which dates from March 2019.
> >>
> >> But we still rely on Travis-CI (Ubuntu Bionic 18.04 LTS)
> >> for non-x86 targets until we have figured out who is willing
> >> to share/maintain such non-x86 native runners on Gitlab.
> >>
> >> There:
> >>
> >> $ clang --version
> >> clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
> >>
> >> If we don't use Travis-CI, then your patch is fine, but we
> >> need a previous patch removing .travis.yml.
> > 
> > Bioic has clang 10 available so not sure why you're seeing
> > version 6 there
> > 
> >   https://packages.ubuntu.com/bionic/clang-10
> 
> But only i386/amd64 are listed there.
> 
> However s390x is indeed in the bionic-updates stream:
> 
> https://packages.ubuntu.com/bionic-updates/clang-10

Never mind, lets just stick as 6.0.0 for min clang. There's no reason
why we /must/ pick 7.0.0 - it is just what i thought was the min across
our distros. I didn't realize ubuntu had multiple streams for clang.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


