Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC363B6A6C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 23:28:04 +0200 (CEST)
Received: from localhost ([::1]:33238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxynT-0007hK-2P
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 17:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lxymW-0006vS-Tv
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lxymT-0004cV-Mm
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624915620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+QGXJ9RjtvAmkZzq5ERj4/jK2JRppUu9ykyhUOtPx3c=;
 b=NfMXXHteeEVM0e7lbdbC1YgA1//2fkwcliL9rQ2t+C0hI9nb4iLF9w1kz7+Mm+Hqwbpmt1
 mBrw0m6XlHQOYdQWA1Ey9EskbE6agZEPZtc5H72Gmd5JhCa8ypW1UmBgOtMR4jrYJYEuFt
 CwCqVA316qgtv4Rg+MewrTQzxrl8S6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-ot0jVGhWM7SzZY9r5EOigA-1; Mon, 28 Jun 2021 17:26:56 -0400
X-MC-Unique: ot0jVGhWM7SzZY9r5EOigA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C1ACEC1A1;
 Mon, 28 Jun 2021 21:26:55 +0000 (UTC)
Received: from redhat.com (ovpn-113-39.phx2.redhat.com [10.3.113.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 504AB5C1A1;
 Mon, 28 Jun 2021 21:26:51 +0000 (UTC)
Date: Mon, 28 Jun 2021 16:26:49 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PULL 00/10] Block Jobs patches
Message-ID: <20210628212649.aomv6yd7gkegafdx@redhat.com>
References: <20210625130006.276511-1-vsementsov@virtuozzo.com>
 <CAFEAcA_j+vQt_a5zYYghmBdo-+G+_sq3yV40w2CQSJ27+Py8Eg@mail.gmail.com>
 <eb11da56-fa17-77cb-8695-c190e7e631d8@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <eb11da56-fa17-77cb-8695-c190e7e631d8@virtuozzo.com>
User-Agent: NeoMutt/20210205-557-802118
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 07:19:47PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 28.06.2021 19:09, Peter Maydell wrote:
> > On Fri, 25 Jun 2021 at 14:00, Vladimir Sementsov-Ogievskiy
> > <vsementsov@virtuozzo.com> wrote:
> > > 
> > > The following changes since commit e0da9171e02f4534124b9a9e07333382b38376c6:
> > > 
> > >    Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210624-pull-request' into staging (2021-06-25 09:10:37 +0100)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    ssh://git@src.openvz.org/~vsementsov/qemu.git tags/pull-jobs-2021-06-25
> > 
> > This doesn't look like a public git url. I'm going to assume you mean
> >   https://src.openvz.org/scm/~vsementsov/qemu.git
> 
> Yes, that's a right URL, sorry.
> 
> > (the remote URL I have on file or you) since it has the right tag/commit.

This may be a factor of how you have set up your local copy of your
staging repo.  Easiest is to update your .git/config to set your
remote.NAME.url to be the readonly public name, and
remote.NAME.pushurl to be your personal one that you can push to.

This can also be done with repo URL shortening; for example, in my
~/.gitconfig, I have:

[url "https://repo.or.cz/"]
        insteadof = repo:
[url "ericb@repo.or.cz:/srv/git/"]
        pushinsteadof = repo:

and then in my qemu staging checkout, I have:

[remote "repo"]
        url = repo:qemu/ericb.git

where the repo: prefix takes care of letting me push pull requests
then producing a sane string in 'git request-pull' I use to announce
it. 'git remote show repo' lets me check that my nicknames properly
expanded into the actual URLs needed.

(Another benefit of having url different from pushurl is that you no
longer have to spend time authenticating when merely downloading from
the repo, although that matters more if you are using that repo to
synchronize changes across multiple machines, and less if you are
using it only for preparing pull requests for others to download)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


