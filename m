Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5572E2B6A64
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:37:06 +0100 (CET)
Received: from localhost ([::1]:46960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf3yb-0007sP-Ce
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kf3xH-0007Ol-Nh
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:35:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kf3xF-00012a-3G
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:35:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605630940;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8Og/buO+wXB1PPU6mu0jwYhEPaVSpp3Pe2xzwf8nq+A=;
 b=OMaQ/lz+Opo+mwA8Aax7yaK1PWj3Z8zofwCxmLPpl3VQZKd+cFC4yhpxcDI6euZRxcBD0x
 toCvC1XVO8NoQDJjEdzM+PPEE4LH/iSounmfjSNpms6HVcOUmALu63FCmfBjf8uH0dLP3p
 EszcDGyI9Yl37/k5bZG1hwZBcQqxc3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-bYYVKLGfO5aczPD6g95Iow-1; Tue, 17 Nov 2020 11:35:27 -0500
X-MC-Unique: bYYVKLGfO5aczPD6g95Iow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC1B81882FA1;
 Tue, 17 Nov 2020 16:35:25 +0000 (UTC)
Received: from redhat.com (ovpn-115-10.ams2.redhat.com [10.36.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 396DC5B4B6;
 Tue, 17 Nov 2020 16:35:18 +0000 (UTC)
Date: Tue, 17 Nov 2020 16:35:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: About 'qemu-security' mailing list
Message-ID: <20201117163514.GG135624@redhat.com>
References: <nycvar.YSQ.7.78.906.2009151536090.10832@xnncv>
 <20200916111025.GA756728@stefanha-x1.localdomain>
 <nycvar.YSQ.7.78.906.2009181031500.10832@xnncv>
 <m2362z8dvx.fsf@oracle.com>
 <nycvar.YSQ.7.78.906.2010011502290.830962@xnncv>
 <m2mu166uyg.fsf@oracle.com>
 <nycvar.YSQ.7.78.906.2010012320290.830962@xnncv>
 <nycvar.YSQ.7.78.906.2010161910530.1246156@xnncv>
 <20201117144612.GA140001@stefanha-x1.localdomain>
 <20201117161942.GA147428@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201117161942.GA147428@stefanha-x1.localdomain>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, sstabellini@kernel.org, pmatouse@redhat.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, michael.roth@amd.com,
 mst@redhat.com, QEMU Developers <qemu-devel@nongnu.org>,
 P J P <ppandit@redhat.com>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 17, 2020 at 04:19:42PM +0000, Stefan Hajnoczi wrote:
> On Tue, Nov 17, 2020 at 02:46:12PM +0000, Stefan Hajnoczi wrote:
> > On Fri, Oct 16, 2020 at 07:47:01PM +0530, P J P wrote:
> > 
> > I have CCed everyone from the Security Process wiki page so they can
> > participate in discussing changes to the process.
> > 
> > > * So ie. we need to:
> > > 
> > >   1. Create/setup a regular non-encrypted 'qemu-security' list.
> > > 
> > >   2. Invite representatives from user/downstream communities to subscribe to 
> > >      it.
> > > 
> > >   3. Collect & store their PGP public keys. Also create a key for the list.
> > > 
> > >   4. Write 'encrypt & email' automation tool(s) to provide encryption support.
> > > 
> > >   5. Document and publish above details and list workflow on a page.
> > > 
> > > 
> > > ...wdyt?
> > 
> > Writing/maintaining automation tools will take time so I suggest going
> > with confidential GitLab Issues instead:
> > https://docs.gitlab.com/ee/user/project/issues/confidential_issues.html
> > 
> > If you would like to test GitLab Issues, please post your username and
> > you will be given the "Reporter" role so you can view confidential
> > issues.
> > 
> > I have created a confidential issue here (you'll get 404 if you don't
> > have permissions to view it):
> > https://gitlab.com/qemu-project/qemu/-/issues/2
> > 
> > The intention is to migrate QEMU's bug tracker from Launchpad to GitLab
> > so this will unify reporting regular bugs and security bugs. It also
> > uses encryption all the time instead of relying on users explicitly
> > encrypting emails.
> 
> Dan and I tried out confidential issues and unfortunately it is
> currently too limited for our workflow.
> 
> It is not possible to add non-members to a confidential issue. Members
> need at least the 'Reporter' role to view confidential issues, and then
> they can view all of them (!).
> 
> This means there is no way of working on a need-to-know basis. We would
> have to give anyone who ever needs to comment on an issue access to all
> other issues :(.
> 
> Dan found this open feature request from 2 years ago:
> https://gitlab.com/gitlab-org/gitlab/-/issues/20252
> 
> For now I think we should stick to email. I'm still concerned about the
> prospect of writing custom mailing list software and hosting it
> somewhere. Can we run an encrypted mailing list without developing the
> software ourselves?

We certainly should NOT get into the business of writing or hosting
custom solutions ourselves IMHO. Even if someone volunteers to do the
work upfront, that'll inevitably turn into abandonware a few years
hence when the interested party moves onto other things.

I still question whether we genuinely need encrypted mailing lists in
the first place.

Our of all the security reports QEMU has received how many reporters
actually used GPG to encrypt their reporters, and how often did the
security team actually keep using GPG when triaging and resolving it
thereafter.

Out of countless security issues I've dealt with across many software
projects for 10 years, there have been less than 5 occassions where
encryption was used with email by a bug reporter notifying me, and out
of those only 1 of them actually justified the use of GPG.

For projects that did use confidential issues, they still all emailed
notifications in clear text behind the scenes regardless.

Is it not sufficient to just use a regular mailing list by default,
and continue publish security team pgp email addrs + keys for the
few cases where pgp might be desired.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


