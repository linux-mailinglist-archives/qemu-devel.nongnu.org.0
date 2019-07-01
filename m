Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369B036F1F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 10:51:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYo6w-0001az-Bu
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 04:51:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hYnyq-00043u-LM
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 04:42:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hYnyp-0003jW-Ow
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 04:42:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44918)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hYnyR-0003B2-7o; Thu, 06 Jun 2019 04:42:16 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 317263092641;
	Thu,  6 Jun 2019 08:42:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
	[10.36.116.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0045B18AC1;
	Thu,  6 Jun 2019 08:42:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8609D11386A0; Thu,  6 Jun 2019 10:42:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <20190605205706.569-1-richard.henderson@linaro.org>
	<20190605205706.569-5-richard.henderson@linaro.org>
	<CAL1e-=jYwL9bb_YVp28pf=R4Gb0+1MgxYLsO=2927W=CtUrQ-A@mail.gmail.com>
Date: Thu, 06 Jun 2019 10:42:12 +0200
In-Reply-To: <CAL1e-=jYwL9bb_YVp28pf=R4Gb0+1MgxYLsO=2927W=CtUrQ-A@mail.gmail.com>
	(Aleksandar Markovic's message of "Thu, 6 Jun 2019 07:45:58 +0200")
Message-ID: <87o93bhzq3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 06 Jun 2019 08:42:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6 4/6] include/elf: Add defines related to
 notes for GNU systems
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Aleksandar Markovic <aleksandar.m.mail@gmail.com> writes:

> On Jun 5, 2019 11:03 PM, "Richard Henderson" <richard.henderson@linaro.org>
> wrote:
>>
>> This is a collection of related
>
> Related to what?
>
>> defines for notes, copied
>> from glibc's <elf.h>.  We're not going to use all of these
>> right away, but it seemed foolish
>
> I don't think this an appropriate word for a commit message.

Calling an alternative you considered but rejected "foolish" feels
perfectly alright to me.

>> to cherry-pick only the
>> ones we need now.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

