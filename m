Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A52C0707
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 16:10:21 +0200 (CEST)
Received: from localhost ([::1]:51346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDqwu-0006uA-Fm
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 10:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60371)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Aleksandar.Markovic@rt-rk.com>) id 1iDq3L-0003Up-C4
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:12:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Aleksandar.Markovic@rt-rk.com>) id 1iDq3J-0006ZV-Tt
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:12:55 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:52054 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Aleksandar.Markovic@rt-rk.com>)
 id 1iDq3J-0006P0-ID
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:12:53 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 3E2241A1FB1;
 Fri, 27 Sep 2019 15:11:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: by mail.rt-rk.com (Postfix, from userid 492)
 id C2EDF1A23F3; Fri, 27 Sep 2019 15:11:04 +0200 (CEST)
in-reply-to: <CAFEAcA-ougCHbdHG3fuyfqqhXLNE6KgRZ4kmn8eTPhGBhTz5Lw@mail.gmail.com>
to: "Peter Maydell" <peter.maydell@linaro.org>
from: "Aleksandar Markovic" <Aleksandar.Markovic@rt-rk.com>
message-id: <47e6-5d8e0a80-19-52027780@183847874>
subject: =?utf-8?q?Re=3A?==?utf-8?q?_=5BPATCH?= v2 =?utf-8?q?01=2F20=5D?=
 =?utf-8?q?_target=2Fmips=3A?= Clean up =?utf-8?q?helper=2Ec?=
X-Forward: 127.0.0.1
date: Fri, 27 Sep 2019 15:11:04 +0200
MIME-Version: 1.0
content-type: multipart/alternative;
 boundary="----=_=-_OpenGroupware_org_NGMime-18406-1569589864.738690-7------"
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
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_=-_OpenGroupware_org_NGMime-18406-1569589864.738690-7------
content-type: text/plain; charset=utf-8
content-length: 1482
content-transfer-encoding: quoted-printable


-------- Original Message --------
Subject: Re: [PATCH v2 01/20] target/mips: Clean up helper.c
Date: Friday, September 27, 2019 14:22 CEST
From: Peter Maydell <peter.maydell@linaro.org>


=C2=A0On Fri, 27 Sep 2019 at 13:03, Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> Aleksandar, your message is hard to read, because you sent Content-Ty=
pe:
> multipart/alternative, and both the test/html and the test/plain
> alternative ride roughshot over the quoted text's line structure.
> Quoted patches become unreadable garbage. Please check your e-mail
> setup.

Note that among the recent changes to the mailing list config to
handle DMARC/DKIM signed emails better is one where we no longer let th=
e
list server try to fix up multipart/alternative or html emails into
plain text. This is because we want to have the mailing list server
never edit emails, in case they're signed and editing would cause
DMARC/DKIM failures. So it's possible that an email sending config
that previously produced acceptable emails on the list receipient/archi=
ve
end might no longer do so.

thanks
-- PMM
=C2=A0=3Dgdkqvtcx5dxczmgpum5xioxr7j51bqm0k8vosjpa-tcq@mail.gmail.com>OK=
, my case belongs to "used to work before" group. I used GMail Android =
app to send this particular mail, and have been using that app for seve=
ral months without problema. I am going to find an alternative way of s=
ending mails to the list.

I am sorry for any incovenience I caused.

Aleksandar


=C2=A0

------=_=-_OpenGroupware_org_NGMime-18406-1569589864.738690-7------
content-type: text/html; charset=utf-8
content-length: 1953
content-transfer-encoding: quoted-printable

<html>-------- Original Message --------<br />Subject: Re: [PATCH v2 01=
/20] target/mips: Clean up helper.c<br />Date: Friday, September 27, 20=
19 14:22 CEST<br />From: Peter Maydell &lt;peter.maydell@linaro.org&gt;=
<br /><cal1e-=3Dgdkqvtcx5dxczmgpum5xioxr7j51bqm0k8vosjpa-tcq@mail.gmail=
.com><br /><br />&nbsp;<blockquote type=3D"cite" cite=3D"CAFEAcA-ougCHb=
dHG3fuyfqqhXLNE6KgRZ4kmn8eTPhGBhTz5Lw@mail.gmail.com">On Fri, 27 Sep 20=
19 at 13:03, Markus Armbruster &lt;armbru@redhat.com&gt; wrote:<br />&g=
t;<br />&gt; Aleksandar, your message is hard to read, because you sent=
 Content-Type:<br />&gt; multipart/alternative, and both the test/html =
and the test/plain<br />&gt; alternative ride roughshot over the quoted=
 text&#39;s line structure.<br />&gt; Quoted patches become unreadable =
garbage. Please check your e-mail<br />&gt; setup.<br /><br />Note that=
 among the recent changes to the mailing list config to<br />handle DMA=
RC/DKIM signed emails better is one where we no longer let the<br />lis=
t server try to fix up multipart/alternative or html emails into<br />p=
lain text. This is because we want to have the mailing list server<br /=
>never edit emails, in case they&#39;re signed and editing would cause<=
br />DMARC/DKIM failures. So it&#39;s possible that an email sending co=
nfig<br />that previously produced acceptable emails on the list receip=
ient/archive<br />end might no longer do so.<br /><br />thanks<br />-- =
PMM<br />&nbsp;</blockquote></cal1e-=3Dgdkqvtcx5dxczmgpum5xioxr7j51bqm0=
k8vosjpa-tcq@mail.gmail.com>OK, my case belongs to &quot;used to work b=
efore&quot; group. I used GMail Android app to send this particular mai=
l, and have been using that app for several months without problema. I =
am going to find an alternative way of sending mails to the list.<br />=
<br />I am sorry for any incovenience I caused.<br /><br />Aleksandar<b=
r /><br /><br />&nbsp;</html>

------=_=-_OpenGroupware_org_NGMime-18406-1569589864.738690-7--------


