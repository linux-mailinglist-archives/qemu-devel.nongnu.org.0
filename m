Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D27670F7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 16:05:54 +0200 (CEST)
Received: from localhost ([::1]:49758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlwBN-0004Z3-18
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 10:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35958)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <Aleksandar.Markovic@rt-rk.com>) id 1hlwB9-000496-8D
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:05:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Aleksandar.Markovic@rt-rk.com>) id 1hlwB8-0003p6-9N
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:05:39 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:43058 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Aleksandar.Markovic@rt-rk.com>)
 id 1hlwB8-0002vt-1h
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:05:38 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id A643A1A1FA7;
 Fri, 12 Jul 2019 16:04:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: by mail.rt-rk.com (Postfix, from userid 492)
 id 08E761A1FBB; Fri, 12 Jul 2019 16:04:31 +0200 (CEST)
in-reply-to: <59eb9c50-2452-922b-3154-fb71ddee2edc@redhat.com>
to: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
from: "Aleksandar Markovic" <Aleksandar.Markovic@rt-rk.com>
message-id: <1f57-5d289380-3-318c5400@225910095>
X-Forward: 127.0.0.1
date: Fri, 12 Jul 2019 16:04:30 +0200
MIME-Version: 1.0
User-Agent: SOGoMail 2.3.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] 
 =?utf-8?b?Pz09P3V0Zi04P3E/ID89PT91dGYtOD9xPyBbUEFU?=
 =?utf-8?b?Q0ggZm9yIDQuMT89PT91dGYtOD9xPyAyLzRdPz09P3V0Zi04P3E/IHRhcmdl?=
 =?utf-8?q?t/mips=3A_Add_missing_=27break=27_for_a_case_of_MTHC0_handling?=
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
Cc: arikalo@wavecomp.com, sw@weilnetz.de, qemu-devel@nongnu.org,
 amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=C2=A0
> > From: Aleksandar Markovic <amarkovic@wavecomp.com>
> >
> > This was found by GCC 8.3 static analysis.
> >
>=C2=A0
> I think you can amend:
>=C2=A0
> Fixes: 5fb2dcd1792
> Reported-by: Stefan Weil <sw@weilnetz.de>
>

Yes, indeed. This will be added in the next version.

Thanks,
Aleksandar
