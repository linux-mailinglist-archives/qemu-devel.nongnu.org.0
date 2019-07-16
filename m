Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318A36A8A4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 14:25:33 +0200 (CEST)
Received: from localhost ([::1]:48256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnMWS-0006n0-Cb
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 08:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55905)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <lifei1214@126.com>) id 1hnMWF-0006KW-9L
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 08:25:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lifei1214@126.com>) id 1hnMWD-0000VQ-Bg
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 08:25:19 -0400
Received: from m15-112.126.com ([220.181.15.112]:36643)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <lifei1214@126.com>) id 1hnMWB-0000LR-VI
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 08:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Mime-Version:Subject:From:Date:Message-Id; bh=YTskz
 mEjmmjoADQ8kzV3Jb1piG6nSxvqtkSbmTE1aoU=; b=QbMaPirbRgdY/fYV+5GS0
 /Fii0Giv6gYQSTZPfWKd9mv+YCvzJckI+FHh8akAGci2G3Oxk+qLlqeyXfQ16TVX
 cCM5Ib7c8Xf5Wq+nmPnx6PypH+sNqrcsn8seOXqSMOwb/9a1UNtCxTrgNSUz0UMc
 xc9xzm2jvKnJX8dCZRrETI=
Received: from [192.168.1.6] (unknown [124.127.72.194])
 by smtp2 (Coremail) with SMTP id DMmowAAnKAggwi1dcQt7IQ--.510S2;
 Tue, 16 Jul 2019 20:25:05 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
From: fei <lifei1214@126.com>
X-Mailer: iPhone Mail (15G77)
In-Reply-To: <871ryviym8.fsf@dusky.pond.sub.org>
Date: Tue, 16 Jul 2019 20:25:04 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <D4F6DDE5-6C30-4611-B4C4-35112265FB0D@126.com>
References: <20190201051806.53183-1-lifei1214@126.com>
 <871ryviym8.fsf@dusky.pond.sub.org>
To: Markus Armbruster <armbru@redhat.com>
X-CM-TRANSID: DMmowAAnKAggwi1dcQt7IQ--.510S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw1kCF1UGFWrXF15Jw4kXrb_yoWfXrb_Wr
 Z0939xCa12qr4aqanIk3W3Zr1DJas5Xr1kX3y0ywnrKryfC3WDWrWvqrnIgF1fZryq9rs3
 urnYy3y7K3srujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5qzuJUUUUU==
X-Originating-IP: [124.127.72.194]
X-CM-SenderInfo: 5olivxarsrkqqrswhudrp/1tbiaAHzIVpD9mTE8gAAsG
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.15.112
Subject: Re: [Qemu-devel] [PATCH v11 for-4.0 00/11] qemu_thread_create:
 propagate the error to callers to handle
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
Cc: qemu-devel@nongnu.org, shirley17fei@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry for the late reply.
Yes, so sorry that this gets stuck for a long while. Actually I needs to sen=
d a v14 with a little update from v13. I will send a new version ASAP.

=E5=8F=91=E8=87=AA=E6=88=91=E7=9A=84 iPhone

> =E5=9C=A8 2019=E5=B9=B47=E6=9C=8812=E6=97=A5=EF=BC=8C13:57=EF=BC=8CMarkus A=
rmbruster <armbru@redhat.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Did this get stuck?
>=20
> Fei Li <lifei1214@126.com> writes:
>=20
>> Hi,
>>=20
>> This idea comes from BiteSizedTasks, and this patch series implement
>> the error checking of qemu_thread_create: make qemu_thread_create
>> return a flag to indicate if it succeeded rather than failing with
>> an error; make all callers check it.
>>=20
>> The first patch modifies the qemu_thread_create() by passing
>> &error_abort and returing a value to indicate if it succeeds. The next
>> 10 patches will improve on &error_abort for callers who could handle
>> more properly.
>>=20
>> Please help to review, thanks a lot!=20
> [...]


