Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD5C3C6FAD
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 13:23:44 +0200 (CEST)
Received: from localhost ([::1]:48590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3GVr-0004hh-E1
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 07:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3GUk-00040M-9I
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 07:22:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3GUi-0003sd-Gm
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 07:22:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626175351;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHSmd/fTp4x+6swJksVw0QnzSBtFN1S8qopvYMXesF8=;
 b=ZManDim9D7NiweVIlF7noGL51CD9KDXrJV66gVY7pB1Zu087FdCr8NBphLcJ71AhENYF/D
 0i7gLyB30i6tPf1tGjGLG4VW61IPTSDc9A81H1xXLLmlggyIKkjwgdoIRbypja0MdajVq0
 iEQpiV5wmsij5ryoV+YNVOdTFRg1JMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-qBpRMvDyNv-M692Gr7P_kw-1; Tue, 13 Jul 2021 07:22:29 -0400
X-MC-Unique: qBpRMvDyNv-M692Gr7P_kw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC550100C611;
 Tue, 13 Jul 2021 11:22:28 +0000 (UTC)
Received: from redhat.com (ovpn-113-1.ams2.redhat.com [10.36.113.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 986D85D6AB;
 Tue, 13 Jul 2021 11:22:26 +0000 (UTC)
Date: Tue, 13 Jul 2021 12:22:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PULL 0/4] OVMF patches for 2021-07-12
Message-ID: <YO13bze66/sKVj3O@redhat.com>
References: <20210712145630.2857814-1-philmd@redhat.com>
 <CAFEAcA8Epk4WKPj6fjFEPyYrT7FQzMRK1A8rf7hN8Buex6Xmng@mail.gmail.com>
 <e6299310-4d65-682a-2359-24226c37a349@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e6299310-4d65-682a-2359-24226c37a349@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 13, 2021 at 12:35:18PM +0200, Philippe Mathieu-Daudé wrote:
> On 7/13/21 12:25 PM, Peter Maydell wrote:
> > On Mon, 12 Jul 2021 at 16:02, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> >>
> >> The following changes since commit bd38ae26cea0d1d6a97f930248df149204c210a2:
> >>
> >>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210710' into staging (2021-07-12 11:02:39 +0100)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://github.com/philmd/qemu.git tags/fw-edk2-20210712
> >>
> >> for you to fetch changes up to d1e79210457323b225c369fa00e97577e0d0da95:
> >>
> >>   MAINTAINERS: remove Laszlo Ersek's entries (2021-07-12 16:55:23 +0200)
> >>
> >> ----------------------------------------------------------------
> >> Patches related to EDK2/OVMF
> >>
> >> - MAINTAINERS: remove Laszlo Ersek's entries
> >> - Introduce X86_FW_OVMF Kconfig symbol
> >> - pc_system_ovmf_table_find: Assert that flash was parsed, document
> >>
> >> ----------------------------------------------------------------
> > 
> > So, even though this pullreq doesn't seem to be changing gitlab CI
> > config, I get a "yaml invalid" failure in the pipeline:
> > https://gitlab.com/qemu-project/qemu/-/pipelines/335995843
> > 
> > "'build-edk2' job needs 'docker-edk2' job but it was not added to the pipeline"
> > 
> > Any ideas what that's about?
> 
> For me this is related to what I tried to fix last year but
> couldn't convince Daniel there was a problem. See this thread:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg773939.html

The situation was different back then, as there was no direct 'needs'
relation between the jobs.

This is also addressing a different issue, which I better understand
now. The filtering based on file names is unreliable when combined
with git pushes. Gitlab looks at the files modified in the delta beween
what is pushed as what already exists on the remote branch. So if you
push 3 changes to a branch, and then push another 2 changes later,
files modified by the first 3 changes won't be considered by the filter
rules, leading to unexpected execution behaviour.

Essentially filtering based on filename is only sane when used with
merge requests, not pushes, because a merge request has a well defined
base commit against which file changes are evaluated.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


