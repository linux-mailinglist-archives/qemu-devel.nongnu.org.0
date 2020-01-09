Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF07D135E51
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 17:31:03 +0100 (CET)
Received: from localhost ([::1]:34970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipai6-0006Zp-RQ
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 11:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58077)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ipagp-0005vR-Do
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 11:29:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ipago-0006yH-7c
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 11:29:43 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34508
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ipago-0006vA-2v
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 11:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578587378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=iuEmfYxeIg575cU5DW0Z2Xsuvj/nbR7xSCJ7nlgOU+c=;
 b=Vua/8xoC8G0A4i7x0gz5d9iAc/QFrVce2fPaWAVyyhQAIobjHpRZLnMx8eIXM5/7ydBO8L
 czCo8XmlKtMEXChRRkNmbKuF4ds0+6i//pL2XgLUdn4TQgg3QHlryt0wH2lCepjaE+lKrm
 cjhKc1FDeRTsb8ah3mLb6XEUfMoSVlc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-KMouN4aJPjS6W22pSjInUA-1; Thu, 09 Jan 2020 11:29:35 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 153A8935CDA;
 Thu,  9 Jan 2020 16:29:34 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-32.ams2.redhat.com [10.36.117.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 994A360E3E;
 Thu,  9 Jan 2020 16:29:32 +0000 (UTC)
Subject: Re: Pre-Christmas meeting notes
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, Qemu-block <qemu-block@nongnu.org>
References: <eee7656f-8de1-9d44-7de2-db1b5ed68148@redhat.com>
 <23ba22f5-2990-3821-cfb9-7d448c65240a@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <4626afdf-ffe9-580c-fe75-f8f2aa506235@redhat.com>
Date: Thu, 9 Jan 2020 17:29:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <23ba22f5-2990-3821-cfb9-7d448c65240a@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: KMouN4aJPjS6W22pSjInUA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/01/2020 16.03, Vladimir Sementsov-Ogievskiy wrote:
> 06.01.2020 20:15, Max Reitz wrote:
>> Misc
>> ----
>>
>> The Wiki=E2=80=99s TODO list is horribly outdated.  What should we do ab=
out
>> it?  Maybe archive it and start a new one?  (Most of the things on the
>> current list are either done or we don=E2=80=99t want to do anymore.)
>=20
>=20
> May be, create block/TODO.txt instead? It would be simpler to manage file
> in git than wiki page.

Is it? We removed a bunch of stale TODO files in the past already:

https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dd494d79eabfdac0
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D9e564a1dde5abc7
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dba43da36983a0bf

And there are some more TODO files in the target/ subfolders which look
also quite stale... so I somewhat doubt that a TODO list in git is much
better than a TODO list in the wiki.

Maybe we just need a proper bug/feature tracker instead (since Launchpad
is IMHO quite a bad choice for bug tracking, too)...

 Thomas


