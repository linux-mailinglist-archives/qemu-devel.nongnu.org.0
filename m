Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE588E7E2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 11:14:05 +0200 (CEST)
Received: from localhost ([::1]:39848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyBpc-0002qW-9I
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 05:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43656)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yury-kotov@yandex-team.ru>) id 1hyBon-0002I4-01
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 05:13:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yury-kotov@yandex-team.ru>) id 1hyBoj-0007DV-St
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 05:13:10 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:54432)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yury-kotov@yandex-team.ru>)
 id 1hyBoj-0007Ab-90
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 05:13:09 -0400
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::162])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id BED9B2E14E2;
 Thu, 15 Aug 2019 12:13:03 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp1j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 wBY72Sx7sq-D3ca8cLE; Thu, 15 Aug 2019 12:13:03 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1565860383; bh=B7EK2GhJGApi4tZTOKSu4Y3tsZBqHu13prTvNCPOzVA=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=ZjQPOoPjBW5UlWDz0n+cAWg7tLNwKPKJAq0+lcwb1/5HuYdQyqKzVDkbbeMjkHN8C
 IVu+2MvYeKw6a9NnWWTgBBdnSHmbFtTVorx366yeEyNGUB25X0z4JuLZQzdx2nGJqY
 GsdVQn/uyJ7GS8SPczOiLf87eghugq3SO5r9MyuA=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000071945
X-Yandex-Avir: 1
Received: from mxbackcorp1j.mail.yandex.net (localhost [::1])
 by mxbackcorp1j.mail.yandex.net with LMTP id lmtrCairuk-60OCv4Ek
 for <yury-kotov@yandex-team.ru>; Thu, 15 Aug 2019 12:12:52 +0300
Received: by sas1-fc7737ec834f.qloud-c.yandex.net with HTTP;
 Thu, 15 Aug 2019 12:12:52 +0300
From: Yury Kotov <yury-kotov@yandex-team.ru>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Juan Quintela <quintela@redhat.com>,
 Dr. David Alan Gilbert <dgilbert@redhat.com>, Stefan Weil <sw@weilnetz.de>
In-Reply-To: <2013231565163716@vla1-1374b6242101.qloud-c.yandex.net>
References: <20190723134215.25095-1-yury-kotov@yandex-team.ru>
 <2013231565163716@vla1-1374b6242101.qloud-c.yandex.net>
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 15 Aug 2019 12:13:02 +0300
Message-Id: <3137561565860372@sas1-fc7737ec834f.qloud-c.yandex.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a02:6b8:0:1619::183
Subject: Re: [Qemu-devel] [PATCH v4 0/3] High downtime with 95+ throttle pct
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:Overall" <qemu-devel@nongnu.org>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping ping

07.08.2019, 10:42, "Yury Kotov" <yury-kotov@yandex-team.ru>:
> Ping
>
> 23.07.2019, 16:42, "Yury Kotov" <yury-kotov@yandex-team.ru>:
>> =C2=A0Hi,
>>
>> =C2=A0V4:
>> =C2=A0* The test was simplified to prevent false fails.
>>
>> =C2=A0V3:
>> =C2=A0* Rebase fixes (migrate_set_parameter -> migrate_set_parameter_i=
nt)
>>
>> =C2=A0V2:
>> =C2=A0* Added a test
>> =C2=A0* Fixed qemu_cond_timedwait for qsp
>>
>> =C2=A0I wrote a test for migration auto converge and found out a stran=
ge thing:
>> =C2=A01. Enable auto converge
>> =C2=A02. Set max-bandwidth 1Gb/s
>> =C2=A03. Set downtime-limit 1ms
>> =C2=A04. Run standard test (just writes a byte per page)
>> =C2=A05. Wait for converge
>> =C2=A06. It's converged with 99% throttle percentage
>> =C2=A07. The result downtime was about 300-600ms <<<<
>>
>> =C2=A0It's much higher than expected 1ms. I figured out that cpu_throt=
tle_thread()
>> =C2=A0function sleeps for 100ms+ for high throttle percentage (>=3D95%=
) in VCPU thread.
>> =C2=A0And it sleeps even after a cpu kick.
>>
>> =C2=A0Fixed it by using timedwait for ms part of sleep.
>> =C2=A0E.g timedwait(halt_cond, 1ms) + usleep(500).
>>
>> =C2=A0Regards,
>> =C2=A0Yury
>>
>> =C2=A0Yury Kotov (3):
>> =C2=A0=C2=A0=C2=A0qemu-thread: Add qemu_cond_timedwait
>> =C2=A0=C2=A0=C2=A0cpus: Fix throttling during vm_stop
>> =C2=A0=C2=A0=C2=A0tests/migration: Add a test for auto converge
>>
>> =C2=A0=C2=A0cpus.c | 27 +++++++---
>> =C2=A0=C2=A0include/qemu/thread.h | 18 +++++++
>> =C2=A0=C2=A0tests/migration-test.c | 103 +++++++++++++++++++++++++++++=
+++++-----
>> =C2=A0=C2=A0util/qemu-thread-posix.c | 40 ++++++++++-----
>> =C2=A0=C2=A0util/qemu-thread-win32.c | 16 ++++++
>> =C2=A0=C2=A0util/qsp.c | 18 +++++++
>> =C2=A0=C2=A06 files changed, 191 insertions(+), 31 deletions(-)
>>
>> =C2=A0--
>> =C2=A02.22.0

