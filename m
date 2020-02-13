Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2FA15BE71
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 13:30:20 +0100 (CET)
Received: from localhost ([::1]:51400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2DdL-0004mM-Gi
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 07:30:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40209)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Aleksandar.Markovic@rt-rk.com>) id 1j2Dc9-00047j-9y
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 07:29:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Aleksandar.Markovic@rt-rk.com>) id 1j2Dc7-0005kf-RV
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 07:29:04 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:34108 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Aleksandar.Markovic@rt-rk.com>)
 id 1j2Dc7-0005aW-Kg
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 07:29:03 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 241631A1CC4;
 Thu, 13 Feb 2020 13:27:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: by mail.rt-rk.com (Postfix, from userid 492)
 id CC7481A20AD; Thu, 13 Feb 2020 13:27:53 +0100 (CET)
in-reply-to: <9146df56-af9e-ca88-5565-b0b6a160af5d@vivier.eu>
to: "Laurent Vivier" <laurent@vivier.eu>
from: "Aleksandar Markovic" <Aleksandar.Markovic@rt-rk.com>
message-id: <5824-5e454100-7-2ea1ccc0@56748061>
subject: =?utf-8?q?Re=3A?==?utf-8?q?_=5BPATCH?= v2 =?utf-8?q?5=2F9=5D?=
 =?utf-8?q?_linux-user=3A?==?utf-8?q?_mips=3A?= Update syscall numbers to 
 kernel =?utf-8?q?5=2E5?= level
X-Forward: 127.0.0.1
date: Thu, 13 Feb 2020 13:27:53 +0100
MIME-Version: 1.0
content-type: multipart/alternative;
 boundary="----=_=-_OpenGroupware_org_NGMime-22564-1581596873.802189-2------"
User-Agent: SOGoMail 2.3.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_=-_OpenGroupware_org_NGMime-22564-1581596873.802189-2------
content-type: text/plain; charset=utf-8
content-length: 564
content-transfer-encoding: quoted-printable


=C2=A0> > + MIPS=5FSYS(sys=5Fclock=5Fgettime64, 2)
> > + MIPS=5FSYS(sys=5Fclock=5Fsettime64, 4)
> > + MIPS=5FSYS(sys=5Fclock=5Fadjtime64, 2) /* 405 */
> > + MIPS=5FSYS(sys=5Fclock=5Fgetres=5Ftime64, 4)
>
> According to
> https://github.com/strace/strace/blob/master/linux/syscallent-common-=
32.h:
>
> [BASE=5FNR + 406] =3D { 2, 0, SEN(clock=5Fgetres=5Ftime64),
> "clock=5Fgetres=5Ftime64" },
>

404 also has the same problem, I am going to fix both.

Thanks,
Aleksandar

>
> once fixed you can add my
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>


=C2=A0

------=_=-_OpenGroupware_org_NGMime-22564-1581596873.802189-2------
content-type: text/html; charset=utf-8
content-length: 892
content-transfer-encoding: quoted-printable

<html>&nbsp;<blockquote type=3D"cite" cite=3D"9146df56-af9e-ca88-5565-b=
0b6a160af5d@vivier.eu">&gt; &gt; + MIPS=5FSYS(sys=5Fclock=5Fgettime64, =
2)<br />&gt; &gt; + MIPS=5FSYS(sys=5Fclock=5Fsettime64, 4)<br />&gt; &g=
t; + MIPS=5FSYS(sys=5Fclock=5Fadjtime64, 2) /* 405 */<br />&gt; &gt; + =
MIPS=5FSYS(sys=5Fclock=5Fgetres=5Ftime64, 4)<br />&gt;<br />&gt; Accord=
ing to<br />&gt; https://github.com/strace/strace/blob/master/linux/sys=
callent-common-32.h:<br />&gt;<br />&gt; [BASE=5FNR + 406] =3D { 2, 0, =
SEN(clock=5Fgetres=5Ftime64),<br />&gt; &quot;clock=5Fgetres=5Ftime64&q=
uot; },<br />&gt;<br /><br />404 also has the same problem, I am going =
to fix both.<br /><br />Thanks,<br />Aleksandar<br /><br />&gt;<br />&g=
t; once fixed you can add my<br />&gt;<br />&gt; Reviewed-by: Laurent V=
ivier &lt;laurent@vivier.eu&gt;</blockquote><br /><br /><br />&nbsp;</h=
tml>

------=_=-_OpenGroupware_org_NGMime-22564-1581596873.802189-2--------


