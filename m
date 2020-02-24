Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FFA16A60D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 13:22:32 +0100 (CET)
Received: from localhost ([::1]:35590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Cko-0002sz-W9
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 07:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59374)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Aleksandar.Markovic@rt-rk.com>) id 1j6Cjp-000205-5A
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 07:21:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Aleksandar.Markovic@rt-rk.com>) id 1j6Cjn-0001eV-W1
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 07:21:28 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:53330 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Aleksandar.Markovic@rt-rk.com>)
 id 1j6Cjn-0001OQ-Om
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 07:21:27 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id E37961A200E;
 Mon, 24 Feb 2020 13:20:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: by mail.rt-rk.com (Postfix, from userid 492)
 id ED0111A203E; Mon, 24 Feb 2020 13:20:20 +0100 (CET)
in-reply-to: <a82ac9bf-2be3-a753-a79b-bfe1894a3f4e@redhat.com>
to: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
from: "Aleksandar Markovic" <Aleksandar.Markovic@rt-rk.com>
message-id: <4bee-5e53bf80-17-5b657e80@176142454>
subject: =?utf-8?q?Re=3A?==?utf-8?q?_=5BPATCH=5D?==?utf-8?q?_MAINTAINERS=3A?= 
 Reactivate MIPS KVM CPUs
X-Forward: 127.0.0.1
date: Mon, 24 Feb 2020 13:20:20 +0100
MIME-Version: 1.0
content-type: multipart/alternative;
 boundary="----=_=-_OpenGroupware_org_NGMime-19438-1582546820.935044-6------"
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
Cc: James Hogan <jhogan@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_=-_OpenGroupware_org_NGMime-19438-1582546820.935044-6------
content-type: text/plain; charset=utf-8
content-length: 598
content-transfer-encoding: quoted-printable


> Philippe Mathieu-Daud=C3=A9 wrote:
> > Aleksandar Markovic wrote:
> >> From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
> >>
> >> Reactivate MIPS KVM maintainership with a modest goal of keeping
> >> the support alive, checking common KVM code changes against MIPS
> >> functionality, etc. (hence the status "Odd Fixes"), with hope that=

> >> this component will be fully maintained at some further, but not
> >> distant point in future.
>
> My only worry here is, do you have hardware to run tests?

Yes, I do have access to the appropriate MIPS hardware.

Thank you,
Aleksandar
=C2=A0

------=_=-_OpenGroupware_org_NGMime-19438-1582546820.935044-6------
content-type: text/html; charset=utf-8
content-length: 822
content-transfer-encoding: quoted-printable

<html><br />&gt; Philippe Mathieu-Daud&eacute; wrote:<br />&gt; &gt; Al=
eksandar Markovic wrote:<br />&gt; &gt;&gt; From: Aleksandar Markovic &=
lt;aleksandar.m.mail@gmail.com&gt;<br />&gt; &gt;&gt;<br />&gt; &gt;&gt=
; Reactivate MIPS KVM maintainership with a modest goal of keeping<br /=
>&gt; &gt;&gt; the support alive, checking common KVM code changes agai=
nst MIPS<br />&gt; &gt;&gt; functionality, etc. (hence the status &quot=
;Odd Fixes&quot;), with hope that<br />&gt; &gt;&gt; this component wil=
l be fully maintained at some further, but not<br />&gt; &gt;&gt; dista=
nt point in future.<br />&gt;<br />&gt; My only worry here is, do you h=
ave hardware to run tests?<br /><br />Yes, I do have access to the appr=
opriate MIPS hardware.<br /><br />Thank you,<br />Aleksandar<br />&nbsp=
;</html>

------=_=-_OpenGroupware_org_NGMime-19438-1582546820.935044-6--------


