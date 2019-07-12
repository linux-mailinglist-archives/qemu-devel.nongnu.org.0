Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987F16711A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 16:15:39 +0200 (CEST)
Received: from localhost ([::1]:49846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlwKo-0001zg-Px
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 10:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38815)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <Aleksandar.Markovic@rt-rk.com>) id 1hlwKa-0001VN-98
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:15:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Aleksandar.Markovic@rt-rk.com>) id 1hlwKZ-0004dR-At
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:15:24 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:40228 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Aleksandar.Markovic@rt-rk.com>)
 id 1hlwKZ-0004aI-05
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:15:23 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 452891A1E89;
 Fri, 12 Jul 2019 16:15:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: by mail.rt-rk.com (Postfix, from userid 492)
 id 649D11A1FCD; Fri, 12 Jul 2019 16:15:17 +0200 (CEST)
in-reply-to: <f8e07873-f5f9-218a-d542-daef5a1c1621@redhat.com>
to: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
from: "Aleksandar Markovic" <Aleksandar.Markovic@rt-rk.com>
message-id: <207b-5d289600-f-2bd63600@199222767>
X-Forward: 127.0.0.1
date: Fri, 12 Jul 2019 16:15:17 +0200
MIME-Version: 1.0
User-Agent: SOGoMail 2.3.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] 
 =?utf-8?b?Pz09P3V0Zi04P3E/ID89PT91dGYtOD9xPyBbUEFU?=
 =?utf-8?b?Q0ggZm9yIDQuMT89PT91dGYtOD9xPyAzLzRdPz09P3V0Zi04P3E/IHRhcmdl?=
 =?utf-8?q?t/mips=3A_Add_missing_=27break=27_for_certain_cases_of_MFTR_han?=
 =?utf-8?q?dling?=
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
> >=C2=A0
> > This was found by GCC 8.3 static analysis.
> >
>=C2=A0
> Again, please amend:
>=C2=A0
> Fixes: ead9360e2fb

Who would think that this bug existed since 2007? ...=C3=A9trange.

Thanks,
Aleksandar
