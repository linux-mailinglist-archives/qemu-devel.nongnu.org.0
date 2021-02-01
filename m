Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D0930A9E9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 15:36:51 +0100 (CET)
Received: from localhost ([::1]:32820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6aJu-0002WS-Fl
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 09:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6aIb-000213-BV
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 09:35:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6aIY-0007oL-Gg
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 09:35:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612190125;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZ8l7r17GVytINZ8sDUc7oeLNeo7bmdAUPMLVdQdZ40=;
 b=Vl02FSEhAUNTBU8uPRdtcBIaEnwLuuM/jPw218K2VE6NZM5ccnMI2zdHBD0mOFHW+JJnz3
 2IPeBeAAyQXUACzJlQu0rDRSSRWEAT7mJoaAvNTqOt7TU9PEXkfr55EB7Oz6zWeyuTfW43
 T08mlrxT0z6MdzRie7t09cw5Xk20ocM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-ZMti0b5PMKmFqJQMjmujeA-1; Mon, 01 Feb 2021 09:35:23 -0500
X-MC-Unique: ZMti0b5PMKmFqJQMjmujeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC0021800D41;
 Mon,  1 Feb 2021 14:35:21 +0000 (UTC)
Received: from redhat.com (ovpn-114-195.ams2.redhat.com [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B34195D9DC;
 Mon,  1 Feb 2021 14:35:19 +0000 (UTC)
Date: Mon, 1 Feb 2021 14:35:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: suggest myself as co-maintainer for Block
 Jobs
Message-ID: <20210201143516.GJ4131462@redhat.com>
References: <20210128144144.27617-1-vsementsov@virtuozzo.com>
 <878s8d85dz.fsf@dusky.pond.sub.org>
 <2651677f-aa5e-1937-0fb6-767c080fccdc@redhat.com>
 <094df33d-f944-7a68-c0b4-a7c509287a6b@virtuozzo.com>
 <87tuqvvpau.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87tuqvvpau.fsf@linaro.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 01, 2021 at 01:50:26PM +0000, Alex Bennée wrote:
> 
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
> > 28.01.2021 18:28, John Snow wrote:
> >> On 1/28/21 10:09 AM, Markus Armbruster wrote:
> >>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> >>>
> >>>> I'm developing Qemu backup for several years, and finally new backup
> >>>> architecture, including block-copy generic engine and backup-top filter
> >>>> landed upstream, great thanks to reviewers and especially to
> >>>> Max Reitz!
> <snip>
> >> Great!
> >>
> >> Reviewed-by: Max Reitz <mreitz@redhat.com>
> >
> >
> > Thanks!
> >
> > Could someone pull it?
> >
> > I don't have any signed PGP key for now, to send pull requests :\
> > Interesting, could I get one while sitting in Moscow?
> 
> Hmm this does point somewhat to a hole in our maintainer process that has
> previously relied on semi-regular physical meet-up for key signing
> purposes. It might be some time before we return to a new normal. Are
> there any other maintainers in Moscow that you could safely meet for a
> socially distanced key-signing?

AFAIK, we've never actually set expectations for what process a key
signing must use. Merely that key should be signed by one or more
people who are already QEMU maintainers. It is more or less up to
the person signing the key what hoops they want to jump through
before adding their signature.

So while physically meeting is a traditional standard, some might
be fine to do key signing verification over a video conference
system, especially if both sides already know each other by sight
after previous physical meetings.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


