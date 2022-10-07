Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646795F754F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 10:29:12 +0200 (CEST)
Received: from localhost ([::1]:32788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogijH-0001Fn-0T
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 04:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogiOL-0007Di-Ba
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 04:07:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogiOG-0005jQ-1F
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 04:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665130047;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GB6iyD/wWpM8xS+FZ6rbEs3MA/Sc7F/p7LDsMkDkWQw=;
 b=RBhTFeEjrM9Z7zh1tvLemGs0fMsaqz5K4XCx2SrynHygIng+Naq2Fg34dngqxx4PIj/BDY
 KSyxT8xrYBo8bGCeldW2b8ejWPlMlvrQoT/HieQAx/DqGVAltSJi4/0zMtKC4YAbt/e4cM
 QlwTT1gkFf9NjqaU8c+/v8b/+yPMnA0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-J5T0-gFuMWqoLffGyHpHQQ-1; Fri, 07 Oct 2022 04:07:23 -0400
X-MC-Unique: J5T0-gFuMWqoLffGyHpHQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53A70811E81;
 Fri,  7 Oct 2022 08:07:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DF4A2024CBB;
 Fri,  7 Oct 2022 08:07:20 +0000 (UTC)
Date: Fri, 7 Oct 2022 09:07:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] gitmodules: recurse by default
Message-ID: <Yz/eNaP994pc+P6Q@redhat.com>
References: <20221006113906.179963-1-mst@redhat.com>
 <Yz8kfJcfbbTAnmuR@redhat.com>
 <20221006202250-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006202250-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 06, 2022 at 08:24:01PM -0400, Michael S. Tsirkin wrote:
> On Thu, Oct 06, 2022 at 07:54:52PM +0100, Daniel P. Berrangé wrote:
> > On Thu, Oct 06, 2022 at 07:39:07AM -0400, Michael S. Tsirkin wrote:
> > > The most commmon complaint about submodules is that
> > > they don't follow when one switches branches in the
> > > main repo. Enable recursing into submodules by default
> > > to address that.
> > > 
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  .gitmodules | 23 +++++++++++++++++++++++
> > >  1 file changed, 23 insertions(+)
> > 
> > What am I missing, as I tried something equiv to this change
> > with one submodule and it didn't appear to have any effect.
> > I started from a clean slate:
> > 
> > $ git submodule  deinit --all --force
> > 
> > The .gitmodules config has 'recurse = true' for the ui/keycodemapdb
> > module:
> > 
> > $ grep keycodemap --after 1 .gitmodules 
> > [submodule "ui/keycodemapdb"]
> > 	path = ui/keycodemapdb
> > 	url = https://gitlab.com/qemu-project/keycodemapdb.git
> > 	recurse = true
> > 
> > I have a change on master setting the submodule commit:
> > 
> > $ git show master | grep +Sub
> > +Subproject commit 7381b9bfadd31c4c9e9a10b5bb5032f9189d4352
> > 
> > and check it out:
> > 
> > $ git submodule update --init ui/keycodemapdb
> > Submodule 'ui/keycodemapdb' (https://gitlab.com/qemu-project/keycodemapdb.git) registered for path 'ui/keycodemapdb'
> > Submodule path 'ui/keycodemapdb': checked out '7381b9bfadd31c4c9e9a10b5bb5032f9189d4352'
> > 
> > 
> > In another branch I have a different commit:
> > 
> > $ git show sub-foo  | grep +Sub
> > +Subproject commit 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae
> > 
> > 
> > Now I switch branches and nothing happens, the submodule
> > is marked as dirty:
> > 
> > $ git checkout sub-foo
> > M	ui/keycodemapdb
> > Switched to branch 'sub-foo'
> > 
> > $ (cd ui/keycodemapdb && git show | head -1)
> > commit 7381b9bfadd31c4c9e9a10b5bb5032f9189d4352
> > 
> > 
> > >From your description (and indeed that of the man page) it
> > sounded like ui/keycodemapdb should have got updated to
> > commit 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae when I did
> > 'git checkout', but that didn't happen
> 
> I think .gitmodules got overwritten when you checked out the branch.
> Possible?

No, it the same in both branches, since they share a common
ancestor commit which added the recurse tag

$ git checkout master
Switched to branch 'master'
$ git grep keycodemapdb --after 1 .gitmodules 
[submodule "ui/keycodemapdb"]
	path = ui/keycodemapdb
	url = https://gitlab.com/qemu-project/keycodemapdb.git
	recurse = true
$ git checkout sub-foo 
M	ui/keycodemapdb
Switched to branch 'sub-foo'
$ grep keycodemapdb --after 1 .gitmodules 
[submodule "ui/keycodemapdb"]
	path = ui/keycodemapdb
	url = https://gitlab.com/qemu-project/keycodemapdb.git
	recurse = true


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


