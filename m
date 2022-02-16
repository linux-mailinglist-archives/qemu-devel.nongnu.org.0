Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD9B4B911C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 20:24:16 +0100 (CET)
Received: from localhost ([::1]:52716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKPuR-0002Kt-J6
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 14:24:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKPry-0000vF-8X
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 14:21:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKPru-0001aL-HK
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 14:21:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645039296;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nK2mb/nXaGRob1hJeYQUopuwTvbPharw8FlONI4ewGk=;
 b=hW3pW9W5qcmld+6+C+7hluk2CeMF7o8qMMSUqGbkmfcN3qIY+BzdX+sRXyfkPUq1osKduy
 c1BvkbyOSijC6bkyeXidplCRAMIL5Uv70sIm/dqHoDfkO0jsYWfhY7+pkGUZbsn/4jejZe
 pVR3smZFQKhmzeGUskBadi5d1dgg7R8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-8CUGXdT5NKi_OPkn7_uBzA-1; Wed, 16 Feb 2022 14:21:23 -0500
X-MC-Unique: 8CUGXdT5NKi_OPkn7_uBzA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D113D185302B;
 Wed, 16 Feb 2022 19:21:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16F755D6CF;
 Wed, 16 Feb 2022 19:21:18 +0000 (UTC)
Date: Wed, 16 Feb 2022 19:21:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: QEMU's Haiku CI image
Message-ID: <Yg1OrEqyDQm/ZGlm@redhat.com>
References: <c13291ec-ed73-a62d-24bc-e4282aad2031@redhat.com>
 <777cb005f1c2197ff3fd610f89215b4d@unixzen.com>
 <0a36d4b2-965d-84ad-1e04-ab4cd8c437f1@redhat.com>
 <ea30ad98-8e15-7404-c91c-ec475551b866@amsat.org>
MIME-Version: 1.0
In-Reply-To: <ea30ad98-8e15-7404-c91c-ec475551b866@amsat.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Zak <richard.j.zak@gmail.com>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 06:16:10PM +0100, Philippe Mathieu-Daudé via wrote:
> On 16/2/22 17:32, Thomas Huth wrote:
> > On 16/02/2022 16.52, Alexander von Gluck IV wrote:
> > > February 16, 2022 6:31 AM, "Thomas Huth" <thuth@redhat.com> wrote:
> > > > 
> > > > while researching the different "sed" options on our supported
> > > > build platform today, I started
> > > > "make vm-build-haiku.x86_64" in my QEMU build directory for the
> > > > first time since many months again.
> > > > And I had to discover that this is completely out of date. The
> > > > image does not contain any version
> > > > of Python 3 yet which we require for compilation since more than
> > > > a year now already, and the Haiku
> > > > version in there seems to be too old to do a "pkgman install -y
> > > > python3" ... so this has been
> > > > completely been bitrotting since more than a year now. Is
> > > > anybody still interested in keeping the
> > > > Haiku support in QEMU? If so, please help to get the VM image
> > > > updated. Thanks!
> > > 
> > > I submitted
> > > https://patchwork.kernel.org/project/qemu-devel/patch/20220216154208.2985103-1-kallisti5@unixzen.com/
> > > 
> > > to fix this issue.  The build runs as expected after that patchset.
> > > 
> > > Likely cause is us no longer packing a "python" binary, deferring to
> > > "python2" vs "python3"
> > > 
> > > I'm still the most likely maintainer.  Are there still plans to
> > > automate the tests for Haiku to
> > > prevent this from happening again in the future?
> > 
> > AFAIK we still don't have a machine where we could properly run VM-based
> > tests in the CI, do we? Peter? Cleber?
> 
> We still have unused fosshost.org resources. What we don't have is a
> sysadmin willing to install the VM and maintain it over time.

I feel like there must be scope for sharing some of this burden with
libvirt since we've got essentially the same problem & requirements.

For libvirt we're using lcitool for building our VMs, and have worked
on a GitLab custom executor for launching throw-away VMs per CI job
from a read-only base template.

  https://gitlab.com/eskultety/libvirt-gitlab-executor

With this there's an admin burden setting up the gitlab executor on
the host and preparing the VM templates, but after that the admin
burden should be lightweight, as most of the risk of breakage is in
the VMs getting messed up, but they get thrown away after 1 job.

With QEMU's recent use of lcitool we're better ready  to share some
of this work than in the past. The main issue is that for non-Linux,
we don't have full automation for building the VM templates. We need
someone to prepare the image by getting it able to run and expose
SSH, whereupon we can provision the build-deps. We also only have
package mappings for FreeBSD, not Haiku, NetBSD or OpenBSD, but that's
fairly straightforward to address.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


