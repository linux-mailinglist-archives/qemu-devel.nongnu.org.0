Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB447613401
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 11:53:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opSPn-0007ep-3Z; Mon, 31 Oct 2022 06:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1opSPl-0007Xo-8n
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:53:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1opSPj-0000fM-Ef
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667213586;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FaIMeZQqVHbhLgZ22F9mkuCh6f2SQvEyMec4F6Lj7Y8=;
 b=KuVf+7jTDDL0eFHfwibPyt50DfArHzgJNzyZ6BpM0mRyI3abFZ2+5q64NK7iBQe+jJsClJ
 mgqh+cMmU/emhCAzYB95n6zomJ7+jThlFIcsJ29rLycT4KaT3SueumexfeNAurRDnJ5IjT
 PFvqQB/c/4d6xYx8Cw+YHHy3oAesflE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-ryAJkOi9MvijTx1qCTozTg-1; Mon, 31 Oct 2022 06:53:02 -0400
X-MC-Unique: ryAJkOi9MvijTx1qCTozTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B01429DD996;
 Mon, 31 Oct 2022 10:53:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EAD5111E3E4;
 Mon, 31 Oct 2022 10:53:01 +0000 (UTC)
Date: Mon, 31 Oct 2022 10:52:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH] Add new build target 'check-spelling'
Message-ID: <Y1+pCngxGwq5tl3H@redhat.com>
References: <20221031074317.377366-1-sw@weilnetz.de>
 <280c2059-1b1f-85db-eca0-71e5e5800b21@redhat.com>
 <1ed28d1b-4b80-055d-5fac-d4d87ac187d3@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ed28d1b-4b80-055d-5fac-d4d87ac187d3@weilnetz.de>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 11:44:48AM +0100, Stefan Weil via wrote:
> Am 31.10.22 um 08:52 schrieb Thomas Huth:
> 
> > On 31/10/2022 08.43, Stefan Weil wrote:
> > > `make check-spelling` can now be used to get a list of spelling errors.
> > > It uses the latest version of codespell, a spell checker implemented
> > > in Python.
> > > 
> > > Signed-off-by: Stefan Weil <sw@weilnetz.de>
> > > ---
> > > 
> > > This RFC can already be used for manual tests, but still reports false
> > > positives, mostly because some variable names are interpreted as words.
> > > These words can either be ignored in the check, or in some cases the
> > > code
> > > might be changed to use different variable names.
> > > 
> > > The check currently only skips a few directories and files, so for
> > > example
> > > checked out submodules are also checked.
> > > 
> > > The rule can be extended to allow user provided ignore and skip lists,
> > > for example by introducing Makefile variables CODESPELL_SKIP=userfile
> > > or CODESPELL_IGNORE=userfile. A limited check could be implemented by
> > > providing a base directory CODESPELL_START=basedirectory, for example
> > > CODESPELL_START=docs.
> > > 
> > > Regards,
> > > Stefan
> [...]
> > > I like the idea, but I think it's unlikely that we can make this
> > > work for the whole source tree any time soon. So maybe it makes more
> > > sense to start with some few directories first (e.g. docs/ ) and
> > > then the maintainers can opt-in by cleaning up their directories
> > > first and then by adding their directories to this target here?
> > 
> >  Thomas
> 
> 
> Even without implementing CODESPELL_START as described above, the script can
> already be used and integrated into CI scripts.

To get most value from CI, we strongly prefer the test to be a clear
pass/fail.

We do have some jobs that are marked non-gating, since they have
false failures and need manual inspection of results. The effect
is those jobs are largely ignored by everyone, so not really of
significant benefit.

So I'd agree with Thomas about starting with a config that can
get a clear pass/fail, and expanding from there if we can't get
the full-tree clean from the start.

> It shows that "roms" contributes by far the most typos. Omitting it would
> reduce the required time to 22 seconds and the number of typos found (2947
> lines in output) very much.

We should not look at 'roms' at all since it is just a place for
git submodulees, and build system integration. No interesting code
lives there.

> "capstone" (which has no entry in MAINTAINERS), "target" and "hw" also
> contribute more than 300 hits each, therefore cc'ing Richard.

We should completely ignoring 'capstone' and any other git submodule
as those are 3rd party codebases we don't maintain ourselves.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


