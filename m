Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3B7B5F0A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 10:22:31 +0200 (CEST)
Received: from localhost ([::1]:55686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAVEM-0004gY-MZ
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 04:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46453)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pierre@freepascal.org>) id 1iAVCb-0003S7-3U
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 04:20:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pierre@freepascal.org>) id 1iAVCZ-0006Q5-Lg
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 04:20:40 -0400
Received: from vps46799.freepascal.org ([85.222.228.11]:38652
 helo=mail.freepascal.org) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <pierre@freepascal.org>) id 1iAVCZ-0006Pb-DK
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 04:20:39 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.freepascal.org (Postfix) with ESMTP id 57A0581D76;
 Wed, 18 Sep 2019 10:20:38 +0200 (CEST)
Received: from mail.freepascal.org ([127.0.0.1])
 by localhost (idefix.freepascal.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHUo4_C9CFHz; Wed, 18 Sep 2019 10:20:38 +0200 (CEST)
Received: from [192.168.50.107] (gw-ics.u-strasbg.fr [130.79.210.225])
 by mail.freepascal.org (Postfix) with ESMTPSA id 9223081CAB;
 Wed, 18 Sep 2019 10:20:37 +0200 (CEST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1615bbe5-3033-3b76-5cfb-52e343dc4d67@freepascal.org>
 <ae7415a9-54be-14de-9590-f9ff6ef025c4@redhat.com>
From: Pierre Muller <pierre@freepascal.org>
Openpgp: preference=signencrypt
Autocrypt: addr=pierre@freepascal.org; prefer-encrypt=mutual; keydata=
 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 Hw==
Message-ID: <ddb842e7-dd48-1e74-20db-dea75de0552d@freepascal.org>
Date: Wed, 18 Sep 2019 10:20:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ae7415a9-54be-14de-9590-f9ff6ef025c4@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 85.222.228.11
Subject: Re: [Qemu-devel] [PATCH] * include/fpu/softfloat.h
 (floatx80_invalid_encoding): Handle m68k specific infinity pattern.
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
Reply-To: Pierre Muller <pierre@freepascal.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, laurent@vivier.eu,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi Thomas,

  I tried to use git format-patch -s below,
and change the commit message that appears below:


muller@gcc123:~/gnu/qemu/qemu$ git format-patch -s a017dc6d43aaa4ffc7be40=
ae3adee4086be9cec2^
0001-Fix-floatx80_invalid_encoding-function-for-m68k-cpu.patch
muller@gcc123:~/gnu/qemu/qemu$ cat 0001-Fix-floatx80_invalid_encoding-fun=
ction-for-m68k-cpu.patch
From a017dc6d43aaa4ffc7be40ae3adee4086be9cec2 Mon Sep 17 00:00:00 2001
From: Pierre Muller <pierre@freepascal.org>
Date: Wed, 18 Sep 2019 08:04:19 +0000
Subject: [PATCH]    Fix floatx80_invalid_encoding function for m68k cpu

    As m68k accepts different patterns for infinity,
    and additional test for valid infinity must be added
    for m68k cpu target.

Signed-off-by: Pierre Muller <pierre@freepascal.org>
---
 include/fpu/softfloat.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index ecb8ba0114..dea24384e9 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -685,10 +685,17 @@ static inline int floatx80_is_any_nan(floatx80 a)
 | pseudo-infinities and un-normal numbers. It does not include
 | pseudo-denormals, which must still be correctly handled as inputs even
 | if they are never generated as outputs.
+| As m68k accepts different patterns for infinity, thus an additional te=
st
+| for valid infinity value must be added for m68k CPU.
 *-----------------------------------------------------------------------=
-----*/
 static inline bool floatx80_invalid_encoding(floatx80 a)
 {
+#if defined (TARGET_M68K)
+    return ((a.low & (1ULL << 63)) =3D=3D 0 && (a.high & 0x7FFF) !=3D 0)
+           && (! floatx80_is_infinity(a));
+#else
     return (a.low & (1ULL << 63)) =3D=3D 0 && (a.high & 0x7FFF) !=3D 0;
+#endif
 }

 #define floatx80_zero make_floatx80(0x0000, 0x0000000000000000LL)
--
2.20.1

I hope this is correct according to the guidelines.


Le 18/09/2019 =C3=A0 09:26, Thomas Huth a =C3=A9crit=C2=A0:
> On 17/09/2019 22.04, Pierre Muller wrote:
>>
>> Hello,
....
>=20
>  Hi Pierre,
>=20
> thanks a lot for the patch! But please note that the QEMU project has
> some constraints for patches that have to be followed before a patch ca=
n
> be applied.
>=20
> Most important one: You need to provide a "Signed-off-by:" line in the
> patch description to make sure that you agree with the Developer
> Certificate Of Origin. See this URL for more details:
>=20
>  https://wiki.qemu.org/Contribute/SubmitAPatch

   I tried to follow this guide.

> Then it would be nice if you add some proper commit message to the patc=
h
> (something similar to the comment that you've added to the source code
> would do the job, I guess).

  I hope the above is OK.

> And finally, please note that qemu-devel is a high traffic mailing list=
.
> When sending patches, you best make sure to put some maintainers on CC:=
,
> or your patch might get lost in the high traffic. You can either have a
> look at the MAINTAINERS file in the main directory, or use the
> scripts/get_maintainers.pl script on your patch to see who should be pu=
t
> on CC:.

Thus I took the liberty to use 'Reply to all' as you have
added several persons which are listed using
./scripts/get_maintainer.pl -f  include/fpu/softfloat.h
and Laurent who is more specifically involved in m68k support.

Please let me know if more is needed to get this patch accepted.

Pierre Muller


