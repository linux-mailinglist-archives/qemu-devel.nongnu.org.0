Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD5B39E2D5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:21:08 +0200 (CEST)
Received: from localhost ([::1]:60874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHzv-00070y-Tn
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqHyg-0005JI-AF
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:19:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqHyd-0008NC-0a
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623082785;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GxtT+W73D2SKGjaPd2KFaoaLilegiTamyfnGfWH/HvU=;
 b=DwcP8hcIFMWSRQeU7jV6Gy1qjT7ovAM0qV4G6E+sG6E5xr0SnKv9rY/63g/B2Cv8ygOPpy
 8ebXIP5fjIDdk/rx6vwxspigftfY8BqKgl5Uz3sHXWpT0fe+6XzEUN1sb40I9Jq3Xg7umL
 x+jlkqa10aOwgmyuV12Fhywl4dj4z/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-bO75-sCJPhag0kOYXD3-Hg-1; Mon, 07 Jun 2021 12:19:41 -0400
X-MC-Unique: bO75-sCJPhag0kOYXD3-Hg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6DFD801B15;
 Mon,  7 Jun 2021 16:19:40 +0000 (UTC)
Received: from redhat.com (ovpn-112-154.ams2.redhat.com [10.36.112.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B957B620DE;
 Mon,  7 Jun 2021 16:19:32 +0000 (UTC)
Date: Mon, 7 Jun 2021 17:19:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PULL 5/8] gitlab: work harder to avoid false positives in
 checkpatch
Message-ID: <YL5HEaV/2xUZqiqW@redhat.com>
References: <20210607143303.28572-1-alex.bennee@linaro.org>
 <20210607143303.28572-6-alex.bennee@linaro.org>
 <YL4yRyLgD1avZdRE@redhat.com> <8735ttodkw.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <8735ttodkw.fsf@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 05:14:35PM +0100, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Mon, Jun 07, 2021 at 03:33:00PM +0100, Alex Bennée wrote:
> >> This copies the behaviour of patchew's configuration to make the diff
> >> algorithm generate a minimal diff.
> >> 
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> >> Message-Id: <20210602153247.27651-1-alex.bennee@linaro.org>
> >> 
> >> diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
> >> index 8e30872164..7e685c6a65 100644
> >> --- a/.gitlab-ci.d/static_checks.yml
> >> +++ b/.gitlab-ci.d/static_checks.yml
> >> @@ -3,7 +3,11 @@ check-patch:
> >>    image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
> >>    needs:
> >>      job: amd64-centos8-container
> >> -  script: .gitlab-ci.d/check-patch.py
> >> +  script:
> >> +    - git config --local diff.renamelimit 0
> >> +    - git config --local diff.renames True
> >> +    - git config --local diff.algorithm histogram
> >> +    - .gitlab-ci.d/check-patch.py
> >
> > No objection to merging this patch as is, but I wonder if we ought to
> > make scripts/checkpatch.pl set these options explicitly when it runs
> > git, eg
> >
> >    git -c diff.renamelimit=0 -c diff.renames=True ...etc show
> >
> > so that everyone who runs checkpatch.pl benefits from the improvement.
> 
> Sure - I've generally held off messing with checkpatch directly because
> of the general desire to keep it in-sync with upstream. Maybe that's
> becoming less of a concern as time goes on?

The automatic extraction of patches from git is a feature that's
custom to QEMU in checkpatch, as I implemented that a few years
back :-)


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


