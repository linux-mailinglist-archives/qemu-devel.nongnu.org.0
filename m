Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B40245B52
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 13:19:54 +0200 (CEST)
Received: from localhost ([::1]:50234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbkFM-0004E2-Ld
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 07:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35940)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hbkCL-0002Vi-Hl
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 07:16:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hbkAW-00022s-GN
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 07:14:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46556)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hbkAV-00021p-Cd; Fri, 14 Jun 2019 07:14:51 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EF85E30832C5;
 Fri, 14 Jun 2019 11:14:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A318060469;
 Fri, 14 Jun 2019 11:14:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4B38111386A6; Fri, 14 Jun 2019 13:14:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20190613153405.24769-1-kwolf@redhat.com>
 <20190613153405.24769-16-kwolf@redhat.com>
 <874l4sfsl9.fsf@dusky.pond.sub.org>
 <20190614091359.GB6042@dhcp-200-226.str.redhat.com>
Date: Fri, 14 Jun 2019 13:14:36 +0200
In-Reply-To: <20190614091359.GB6042@dhcp-200-226.str.redhat.com> (Kevin Wolf's
 message of "Fri, 14 Jun 2019 11:13:59 +0200")
Message-ID: <877e9oe7vn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 14 Jun 2019 11:14:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 15/15] vl: Deprecate -mon pretty=... for
 HMP monitors
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 14.06.2019 um 11:01 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > The -mon pretty=on|off switch of the -mon option applies only the QMP
>
> s/the QMP/to QMP/
>
> Can you fix up this one as well while you're at it?

Sure!

>> > monitors. It used to be silently ignored for HMP. Deprecate this
>> > combination so that we can make it an error in future versions.
>> >
>> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>

