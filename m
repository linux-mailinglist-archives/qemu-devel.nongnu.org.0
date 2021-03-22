Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FCB345312
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 00:33:18 +0100 (CET)
Received: from localhost ([::1]:57762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOU2u-0000eb-Gs
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 19:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=VkUl=IU=matejka.sk=lubos@adminit.cz>)
 id 1lOR9n-0000lV-46; Mon, 22 Mar 2021 16:28:11 -0400
Received: from posta.adminit.cz ([77.93.206.226]:34862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=VkUl=IU=matejka.sk=lubos@adminit.cz>)
 id 1lOR9k-0001B1-GG; Mon, 22 Mar 2021 16:28:10 -0400
Received: from localhost (localhost [127.0.0.1])
 by posta.adminit.cz (Postfix) with ESMTP id 9CADF5E87;
 Mon, 22 Mar 2021 21:28:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at posta.adminit.cz
Received: from posta.adminit.cz ([127.0.0.1])
 by localhost (posta.adminit.cz [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id H46cgfSxBMM9; Mon, 22 Mar 2021 21:28:01 +0100 (CET)
X-Envelope-To: qemu-devel@nongnu.org
X-Envelope-To: eblake@redhat.com
X-Envelope-To: vsementsov@virtuozzo.com
X-Envelope-To: pj@patrikjanousek.cz
X-Envelope-To: lmatejka@kiv.zcu.cz
X-Envelope-To: qemu-block@nongnu.org
Received: from [10.0.0.172] (nero.matejka.sk [90.179.133.32])
 by posta.adminit.cz (Postfix) with ESMTPSA id C0E0446A4;
 Mon, 22 Mar 2021 21:28:00 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Lubos Matejka <lubos@matejka.sk>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/2] block/raw: added support of persistent dirty bitmaps
Date: Mon, 22 Mar 2021 21:27:59 +0100
Message-Id: <FB0214FC-650A-41FF-B021-97C850F4F367@matejka.sk>
References: <c4e59b6c-2c42-c106-8855-ceccdb481447@patrikjanousek.cz>
In-Reply-To: <c4e59b6c-2c42-c106-8855-ceccdb481447@patrikjanousek.cz>
To: =?utf-8?Q?Patrik_Janou=C5=A1ek?= <pj@patrikjanousek.cz>
X-Mailer: iPhone Mail (18D52)
Received-SPF: pass client-ip=77.93.206.226;
 envelope-from=SRS0=VkUl=IU=matejka.sk=lubos@adminit.cz; helo=posta.adminit.cz
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 22 Mar 2021 19:31:35 -0400
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu block <qemu-block@nongnu.org>, Lmatejka@kiv.zcu.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kdy si muzem cinknout k dalsimu vyvoji?

Odesl=C3=A1no z iPhonu

> 22. 3. 2021 v 12:37, Patrik Janou=C5=A1ek <pj@patrikjanousek.cz>:
>=20
> =EF=BB=BF
>> On 3/22/21 12:18 PM, Vladimir Sementsov-Ogievskiy wrote:
>> 22.03.2021 13:46, Vladimir Sementsov-Ogievskiy wrote:
>>> 22.03.2021 13:18, Patrik Janou=C5=A1ek wrote:
>>>> On 3/22/21 9:41 AM, Vladimir Sementsov-Ogievskiy wrote:
>>>>> 20.03.2021 12:32, Patrik Janou=C5=A1ek wrote:
>>>>>> Current implementation of dirty bitmaps for raw format is very
>>>>>> limited, because those bitmaps cannot be persistent. Basically it
>>>>>> makes sense, because the raw format doesn't have space where could
>>>>>> be dirty bitmap stored when QEMU is offline. This patch solves it
>>>>>> by storing content of every dirty bitmap in separate file on the
>>>>>> host filesystem.
>>>>>>=20
>>>>>> However, this only solves one part of the problem. We also have to
>>>>>> store information about the existence of the dirty bitmap. This is
>>>>>> solved by adding custom options, that stores all required metadata
>>>>>> about dirty bitmap (filename where is the bitmap stored on the
>>>>>> host filesystem, granularity, persistence, etc.).
>>>>>>=20
>>>>>> Signed-off-by: Patrik Janou=C5=A1ek<pj@patrikjanousek.cz>
>>>>>=20
>>>>>=20
>>>>> Hmm. Did you considered other ways? Honestly, I don't see a reason for=

>>>>> yet another storing format for bitmaps.
>>>>>=20
>>>>> The task could be simply solved with existing features:
>>>>>=20
>>>>> 1. We have extenal-data-file feature in qcow2 (read
>>>>> docs/interop/qcow2.txt). With this thing enabled, qcow2 file contains
>>>>> only metadata (persistent bitmaps for example) and data is stored in
>>>>> separate sequential raw file. I think you should start from it.
>>>>=20
>>>> I didn't know about that feature. I'll look at it.
>>>>=20
>>>> In case I use NBD to access the bitmap context and qcow2 as a solution
>>>> for persistent layer. Would the patch be acceptable? This is
>>>> significant
>>>> change to my solution and I don't have enought time for it at the
>>>> moment
>>>> (mainly due to other parts of my bachelor's thesis). I just want to
>>>> know
>>>> if this kind of feature is interesting to you and its implementation is=

>>>> worth my time.
>>>=20
>>> Honestly, at this point I think it doesn't. If existing features
>>> satisfy your use-case, no reason to increase complexity of file-posix
>>> driver and QAPI.
>>>=20
>>=20
>> It's unpleasant to say this, keeping in mind that that's your first
>> submission :(
>>=20
>> I can still recommend in a connection with your bachelor's thesis to
>> look at the videos at kvm-forum youtube channel, searching for backup:
>>=20
>> =20
>> https://www.youtube.com/channel/UCRCSQmAOh7yzgheq-emy1xA/search?query=3Db=
ackup
>>=20
>> You'll get a lot of information about current developments of external
>> backup API.
>>=20
>> Also note, that there is (or there will be ?) libvirt Backup API,
>> which includes an API for external backup. I don't know the current
>> status of it, but if your project is based on libvirt, it's better to
>> use libvirt backup API instead of using qemu directly. About Libvirt
>> Backup API it's better to ask Eric Blake (adding him to CC).
> Unfortunately, my solution is based on Proxmox so I can't use libvirt's
> features. I know that a beta version of Proxmox Backup Server has been
> released and it would be much better to improve their solution, but they
> did it too late so I couldn't change assignment of my bachelor's thesis.
>=20

