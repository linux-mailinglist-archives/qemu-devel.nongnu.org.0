Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA731407A4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 11:13:12 +0100 (CET)
Received: from localhost ([::1]:54812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isOcp-0000b5-Q3
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 05:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53483)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1isObv-0000AL-7k
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:12:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1isObp-0000Sy-Uo
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:12:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24983
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1isObp-0000Qs-CN
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579255928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3EGu704SUO8QER/L8NKa0ZRo5VuB6sK+xxU02AlQJDE=;
 b=OAxmTwI78AdHe1UgdounldMLtn+lb412uy80eSYMxvQXVBLLPnUaNqk8UuAyGOLZ6WgNRj
 fQSRbhwjXgD0ez5PS/pi/ISd1XvZebSugHjAz3ypPxY+ccPp/HAaJ6DmpuKzR6oPdeQTA2
 E57uUu1Vpjt1zwX+1UbRUKJ3IQkBs9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-zMWRw7s5PYyVPf67aI1CoQ-1; Fri, 17 Jan 2020 05:12:04 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 898F0DB61;
 Fri, 17 Jan 2020 10:12:03 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA1B719C4F;
 Fri, 17 Jan 2020 10:11:59 +0000 (UTC)
Date: Fri, 17 Jan 2020 11:11:58 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Coiby Xu <coiby.xu@gmail.com>
Subject: Re: [PATCH v2 3/5] a standone-alone tool to directly share disk
 image file via vhost-user protocol
Message-ID: <20200117101158.GC7394@dhcp-200-226.str.redhat.com>
References: <20200114140620.10385-1-coiby.xu@gmail.com>
 <20200114140620.10385-4-coiby.xu@gmail.com>
 <20200116140429.GJ163546@stefanha-x1.localdomain>
 <CAJAkqrVhvi-8MZ-mPjZ67yfjOaick5Gu_g3GxYAeYvH3Cp6QVw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJAkqrVhvi-8MZ-mPjZ67yfjOaick5Gu_g3GxYAeYvH3Cp6QVw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: zMWRw7s5PYyVPf67aI1CoQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: bharatlkmlkvm@gmail.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.01.2020 um 09:12 hat Coiby Xu geschrieben:
> Excellent! I will add an option (or object property) for
> vhost-user-blk server oject which will tell the daemon process to exit
> when the client disconnects, thus "make check-qtest" will not get held
> by this daemon process. After that since Kevin's qemu-storage-daemon
> support "-object" option
> (https://patchew.org/QEMU/20191017130204.16131-1-kwolf@redhat.com/2019101=
7130204.16131-3-kwolf@redhat.com/)
> and vhost-user-server is a user-creatable QOM object, it will work out
> of the box.

Yes, I think at least for the moment it should work fine this way.
Eventually, I'd like to integrate it with --export (and associated QMP
commands, which are still to be created), too. Maybe at that point we
want to make the QOM object not user creatable any more.

Would it make sense to prefix the object type name with "x-" so we can
later retire it from the external user interface without a deprecation
period?

As for test cases, do you think it would be hard to just modify the
tests to send an explicit 'quit' command to the daemon?

> I'm curious when will be formal version of qemu-storage-daemon
> finished so I can take advantage of it? Or should I apply the RFC
> PATCHes to my working branch directly and submit them together with
> the patches on vhost-user-blk server feature when posting v3?

It's the next thing I'm planning to work on after completing the
coroutine-base QMP handlers (which I hope to get finished very soon).

For the time being I would suggest that you put any patches that depend
on qemu-storage-daemon (if you do need it) at the end of your series so
that we could apply the first part even if the storage daemon isn't in
yet.

The latest version of my patches is at:

    git://repo.or.cz/qemu/kevin.git storage-daemon

But if you just need something for testing your code, I think it would
even make sense if you kept your standalone tool around (even though
we'll never merge it) and we'll deal with integration in the storage
daemon once both parts are ready.

Kevin


