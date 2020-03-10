Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D2F17EFB3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 05:29:28 +0100 (CET)
Received: from localhost ([::1]:53358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBWWF-0006kd-1C
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 00:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46326)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1jBWVV-0006MA-HZ
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 00:28:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1jBWVU-0006Vc-HQ
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 00:28:41 -0400
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:42262)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1jBWVU-0006Qg-9X
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 00:28:40 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail03.asahi-net.or.jp (Postfix) with ESMTPA id 66366E5A40;
 Tue, 10 Mar 2020 13:28:37 +0900 (JST)
Received: from www.ysato.name (localhost [IPv6:::1])
 by sakura.ysato.name (Postfix) with ESMTPA id EBDC41C0DCD;
 Tue, 10 Mar 2020 13:28:36 +0900 (JST)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Tue, 10 Mar 2020 13:28:36 +0900
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] docs: Add RX target.
In-Reply-To: <e6ccf136-cf93-865d-31bb-4463b65416a9@redhat.com>
References: <20200308130637.37651-1-ysato@users.sourceforge.jp>
 <e6ccf136-cf93-865d-31bb-4463b65416a9@redhat.com>
Message-ID: <b075c69c2528772f9f047baba7adc368@users.sourceforge.jp>
X-Sender: ysato@users.sourceforge.jp
User-Agent: Roundcube Webmail/1.3.10
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.15
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2020-03-10 00:07 =E3=81=AB Eric Blake =E3=81=95=E3=82=93=E3=81=AF=E6=9B=B8=
=E3=81=8D=E3=81=BE=E3=81=97=E3=81=9F:
> On 3/8/20 8:06 AM, Yoshinori Sato wrote:
>> Add rx-virt target specificaion document.
>=20
> specification
>=20
>>=20
>> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
>> ---
>>   docs/system/target-rx.rst | 35 +++++++++++++++++++++++++++++++++++
>>   docs/system/targets.rst   |  1 +
>>   2 files changed, 36 insertions(+)
>>   create mode 100644 docs/system/target-rx.rst
>>=20
>> diff --git a/docs/system/target-rx.rst b/docs/system/target-rx.rst
>> new file mode 100644
>> index 0000000000..8540fd5218
>> --- /dev/null
>> +++ b/docs/system/target-rx.rst
>> @@ -0,0 +1,35 @@
>> +.. _RX-System-emulator:
>> +
>> +RX System emulator
>> +--------------------
>> +
>> +Use the executable ``qemu-system-rx`` to simulate a Virtual RX=20
>> target.
>> +This target emulated following devices.
>=20
> s/emulated/emulates the/
>=20

OK. I'll fix it.

>=20
>> +++ b/docs/system/targets.rst
>> @@ -17,3 +17,4 @@ Contents:
>>      target-arm
>>      target-m68k
>>      target-xtensa
>> +   target-rx
>=20
> Is it worth keeping this list alphabetically sorted?

It was not in alphabetical order, it was added at the last. Is it better=20
to arrange in alphabetical order?

---
Yoshinori Sato

