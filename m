Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10C830AD6B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:09:51 +0100 (CET)
Received: from localhost ([::1]:49908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6chy-00029V-Uq
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6cX4-0006Vt-8y
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:58:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6cX1-0006wM-Fs
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:58:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612198710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sJWoQyyFaCJd+8H4aAND/RJjk2Nr8Ve+WrVihDNOfx4=;
 b=A2mU5w882Jl/gB6zaLqtuN/3vVJJqbHX9u5blH4oLMMqVpQEhl/wk2SCMOYTjDPKNGbeYK
 U1OxkEjNffiNL05rg1ZDq4jxBrAsOFvfkJ4zBuo05WtSxWcp8MAHyfmNEfdAkVVsZdek6t
 MA6pHPKh0POUfEezG3t+jLvhXCI+OV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-K34OJH_iOyysMNWyVO2Etg-1; Mon, 01 Feb 2021 11:58:27 -0500
X-MC-Unique: K34OJH_iOyysMNWyVO2Etg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57D07800D55;
 Mon,  1 Feb 2021 16:58:26 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FD0C5C1A1;
 Mon,  1 Feb 2021 16:58:24 +0000 (UTC)
Date: Mon, 1 Feb 2021 17:58:23 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] MAINTAINERS: suggest myself as co-maintainer for Block
 Jobs
Message-ID: <20210201165823.GJ13157@merkur.fritz.box>
References: <20210128144144.27617-1-vsementsov@virtuozzo.com>
 <878s8d85dz.fsf@dusky.pond.sub.org>
 <2651677f-aa5e-1937-0fb6-767c080fccdc@redhat.com>
 <094df33d-f944-7a68-c0b4-a7c509287a6b@virtuozzo.com>
 <20210201145056.GD13157@merkur.fritz.box>
 <304b3b7c-a58e-901d-7f52-b6efb1c1fbfe@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <304b3b7c-a58e-901d-7f52-b6efb1c1fbfe@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: mreitz@redhat.com, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.02.2021 um 17:20 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 01.02.2021 17:50, Kevin Wolf wrote:
> > Am 01.02.2021 um 12:03 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > 28.01.2021 18:28, John Snow wrote:
> > > > On 1/28/21 10:09 AM, Markus Armbruster wrote:
> > > > > Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> > > > > 
> > > > > > I'm developing Qemu backup for several years, and finally new backup
> > > > > > architecture, including block-copy generic engine and backup-top filter
> > > > > > landed upstream, great thanks to reviewers and especially to
> > > > > > Max Reitz!
> > > > > > 
> > > > > > I also have plans of moving other block-jobs onto block-copy, so that
> > > > > > we finally have one generic block copying path, fast and well-formed.
> > > > > > 
> > > > > > So, now I suggest to bring all parts of backup architecture into
> > > > > > "Block Jobs" subsystem (actually, aio_task is shared with qcow2 and
> > > > > > qemu-co-shared-resource can be reused somewhere else, but I'd keep an
> > > > > > eye on them in context of block-jobs) and add myself as co-maintainer.
> > > > > > 
> > > > > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > > > > 
> > > > > With pleasure:
> > > > > Reviewed-by: Markus Armbruster <armbru@redhat.com>
> > > > > 
> > > > 
> > > > Absolutely! Glad to see it.
> > > > 
> > > > Reviewed-by: John Snow <jsnow@redhat.com>
> > > > 
> > > 
> > > [..]
> > > 
> > > > Great!
> > > > 
> > > > Reviewed-by: Max Reitz <mreitz@redhat.com>
> > > 
> > > Thanks!
> > > 
> > > Could someone pull it?
> > 
> > I've put it in my block branch (with s/suggest myself/Add Vladimir/ in
> > the subject line), but I don't know when I'll send the next pull
> > request. If someone else sends one first, feel free to include it with:
> > 
> > Acked-by: Kevin Wolf <kwolf@redhat.com>
> > 
> > > I don't have any signed PGP key for now, to send pull requests :\
> > > Interesting, could I get one while sitting in Moscow?
> > 
> > If you're planning to send pull requests, should a git tree of yours be
> > added to the MAINTAINERS sections, too?
> > 
> 
> I didn't add it because of signed key absence. As it turned out, Denis
> Lunev (my boss) already has a signed key, so it's not a problem.
> 
> I think it's appropriate to add
> 
> T: git https://src.openvz.org/scm/~vsementsov/qemu.git jobs

I've added it to the patch in my queue. Now you just need to actually
create that branch. :-)

Kevin


