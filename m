Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF103C1966
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:50:49 +0200 (CEST)
Received: from localhost ([::1]:33540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Z6m-00043B-QX
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1m1Yg6-0006Qy-7O; Thu, 08 Jul 2021 14:23:14 -0400
Received: from kerio.kamp.de ([195.62.97.192]:52502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1m1Yg4-00077e-CH; Thu, 08 Jul 2021 14:23:13 -0400
X-Footer: a2FtcC5kZQ==
Received: from [172.30.124.17] ([62.159.140.18])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Thu, 8 Jul 2021 20:22:57 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Peter Lieven <pl@kamp.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v5 0/6] block/rbd: migrate to coroutines and add write
 zeroes support
Date: Thu, 8 Jul 2021 20:23:00 +0200
Message-Id: <77F23D4A-18B3-4367-9D4E-9710FA6269B2@kamp.de>
References: <YObtGbd5jlQNUbn0@redhat.com>
In-Reply-To: <YObtGbd5jlQNUbn0@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
X-Mailer: iPhone Mail (18D70)
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Dryomov <idryomov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> Am 08.07.2021 um 14:18 schrieb Kevin Wolf <kwolf@redhat.com>:
>=20
> =EF=BB=BFAm 07.07.2021 um 20:13 hat Peter Lieven geschrieben:
>>> Am 06.07.2021 um 17:25 schrieb Kevin Wolf <kwolf@redhat.com>:
>>> Am 06.07.2021 um 16:55 hat Peter Lieven geschrieben:
>>>> I will have a decent look after my vacation.
>>>=20
>>> Sounds good, thanks. Enjoy your vacation!
>>=20
>> As I had to fire up my laptop to look into another issue anyway, I
>> have sent two patches for updating MAINTAINERS and to fix the int vs.
>> bool mix for task->complete.
>=20
> I think you need to reevaluate your definition of vacation. ;-)

Lets talk about this when the kids are grown up. Sometimes sending patches c=
an be quite relaxing :-)

>=20
> But thanks anyway.
>=20
>> As Paolos fix (5f50be9b5) is relatively new and there are maybe other
>> non obvious problems when removing the BH indirection and we are close
>> to soft freeze I would leave the BH removal change for 6.2.
>=20
> Sure, code cleanups aren't urgent.

Isn=E2=80=99t the indirection also a slight performance drop?

Peter




