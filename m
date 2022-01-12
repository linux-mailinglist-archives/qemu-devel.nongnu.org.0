Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4138048C9E6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 18:39:00 +0100 (CET)
Received: from localhost ([::1]:36854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7haM-0007o8-Jz
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 12:38:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7hWI-0005iA-EK
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:34:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7hWD-0000lY-PM
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:34:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642008870;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=fewx5cP9xatCfibBOhMGVt3NNaqgmnoQHO4yXjsTBLA=;
 b=C3Q8f+MARrteLsp2yDbEioM1QnISwngbTh5AHwF6KQ157Ww4mhilwukrfjK7xUO+4PN1Xw
 zoWP7/C4ouDBTZUkpj9Jnb6wSw6zk+oedWF7NUQTkr6JpFQyG3EqOegPownCtWyU1+uovq
 7r0j2R7YBjglHpUtRj1ITrWtuROPtUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-acYpxiI9MAi-HQoTmYDBUA-1; Wed, 12 Jan 2022 12:34:27 -0500
X-MC-Unique: acYpxiI9MAi-HQoTmYDBUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A7B710144EC
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 17:34:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 472D22B6F9;
 Wed, 12 Jan 2022 17:34:17 +0000 (UTC)
Date: Wed, 12 Jan 2022 17:34:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: PyPI account
Message-ID: <Yd8RFkaghPuEyBUF@redhat.com>
References: <CAFn=p-b+ene2vKCCDJR9viT9P=GyhBeAO5ZLGsUmiijoxrkfCg@mail.gmail.com>
 <Yd6z2WS3hGwPNKkl@stefanha-x1.localdomain>
 <CAFn=p-Zb3fmj5sf=+dGizxiYTySM4gU2Q6wudxnf67X=6nsyvQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-Zb3fmj5sf=+dGizxiYTySM4gU2Q6wudxnf67X=6nsyvQ@mail.gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 12:25:16PM -0500, John Snow wrote:
> On Wed, Jan 12, 2022 at 5:56 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > [Context: John created a PyPI QEMU user in order to publish the qemu.qmp
> > package. If anyone wants to publish additional Python packages from
> > qemu.git, please contact him for PyPI access.]
> >
> > On Tue, Jan 11, 2022 at 03:42:23PM -0500, John Snow wrote:
> > > Account made: https://pypi.org/user/QEMU/
> > >
> > > I can't update the wiki, I lack admin perms to edit
> > > https://wiki.qemu.org/AdminContacts
> > >
> > > I assume in the event that I fall into a black hole or get launched
> > > out of a cannon into the sun, any mails sent to jsnow@redhat.com can
> > > be recovered by Red Hat in general, so there's a sufficient recourse
> > > for recovering the account in that circumstance.
> >
> > Thanks, I have added the PyPI QEMU user and added you as the admin
> > contact:
> > https://wiki.qemu.org/AdminContacts#Other_resources
> >
> > Stefan
> 
> Thanks, Stefan!
> 
> As additional context, there is currently a single package that
> belongs to that user, "qemu.qmp" [1]. I published it "in advance" to
> be able to test integration in an RFC patch set I posted to the list
> just before the winter break [2]. The package is an "alpha prerelease"
> and is at a very low-risk to be installed by accident. The version
> chosen here will be considered "less than" any other valid version
> string chosen, and can be deleted permanently from PyPI after
> consensus on list review. Please forgive the mid-review publishing.
> The exact metadata, wording of the README, etc is still under review
> here [3].
> 
> As for the PyPI account itself, I have volunteered to administer it.
> If anyone wants access (esp. a leadership committee member from
> another employer), please contact me - I'm happy to share.

As a general rule we should ensure we always have 2 nominated people
with access to any account held on behalf of the QEMU project, so we
have some redundancy in case of unexpected events. So we definitely
ought to have a 2nd person with access to PyPI even if they do nothing
with it.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


