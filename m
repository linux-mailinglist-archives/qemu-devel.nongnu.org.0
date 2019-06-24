Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C70509F1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 13:40:58 +0200 (CEST)
Received: from localhost ([::1]:50092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfNLF-00071Z-Rq
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 07:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34681)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hfNEk-0002Vf-DM
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 07:34:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hfNEj-000205-5w
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 07:34:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52188)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hfNEg-0001sh-P9
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 07:34:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C14DD882FB
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 11:34:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-169.ams2.redhat.com
 [10.36.117.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EEC95D9C8;
 Mon, 24 Jun 2019 11:34:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1307911386A0; Mon, 24 Jun 2019 13:34:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <20190619201050.19040-1-armbru@redhat.com>
 <20190619201050.19040-18-armbru@redhat.com>
 <a3ed96f0-4037-bdb5-60af-e537190587b6@redhat.com>
Date: Mon, 24 Jun 2019 13:34:05 +0200
In-Reply-To: <a3ed96f0-4037-bdb5-60af-e537190587b6@redhat.com> (Eric Blake's
 message of "Wed, 19 Jun 2019 15:19:15 -0500")
Message-ID: <87zhm7qksy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 24 Jun 2019 11:34:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 17/17] dump: Move HMP command handlers to
 dump/
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
Cc: kwolf@redhat.com,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 6/19/19 3:10 PM, Markus Armbruster wrote:
>> Move the HMP handlers related to qapi/dump.json to
>> dimp/dump-hmp-cmds.c, where they are covered by MAINTAINERS section
>
> s/dimp/dump/

Will fix.  Thanks!

>> "Dump", just like qapi/dump.json.
>>=20
>> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---

