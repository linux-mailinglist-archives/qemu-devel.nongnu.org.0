Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502C51A0D24
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 13:59:27 +0200 (CEST)
Received: from localhost ([::1]:45946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLmt4-0005DP-BN
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 07:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jLms3-0003zC-U6
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 07:58:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jLms2-0007na-Lp
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 07:58:23 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:57136
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jLms1-0007mU-Ko
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 07:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586260700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LONoKhtBbm5VoTI5kDF+kpPuY331PJy3L53QS0TKvaU=;
 b=fRBhw9ddlf0Sr0Y69Hw9XsFXjyEMbJcfVvZd5BtexAEHOOtBi1gOZVnOmLTbUNh93plWD8
 Wtb65l+WGBuIfej/UDrzcLyT5VW7LmgeAfFIZwZY7cb4lYM/AKWgiamxP1TbSLBJNbjWY3
 Fg7BQs1s50CjHJUEiJXA9MtSYk0RpA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-4lve__yVN2CIT_g-fRI9GA-1; Tue, 07 Apr 2020 07:58:16 -0400
X-MC-Unique: 4lve__yVN2CIT_g-fRI9GA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D4A3800D4E;
 Tue,  7 Apr 2020 11:58:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59EE3272CB;
 Tue,  7 Apr 2020 11:58:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D0A0C11385C8; Tue,  7 Apr 2020 13:58:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Function-like macro with the same name as a typedef confuses
 Coccinelle
References: <87k12y5by1.fsf@dusky.pond.sub.org>
 <CAFEAcA8aBjWPVH7VsicTrKce1K-sOh0Sv+Ok-75zbtsJV=OBaA@mail.gmail.com>
 <87d08q3th5.fsf@dusky.pond.sub.org>
Date: Tue, 07 Apr 2020 13:58:13 +0200
In-Reply-To: <87d08q3th5.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Thu, 02 Apr 2020 15:30:46 +0200")
Message-ID: <87eeszcxt6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On Thu, 2 Apr 2020 at 13:06, Markus Armbruster <armbru@redhat.com> wrote=
:
>>>
>>> I discovered that Vladimir's auto-propagated-errp.cocci leaves
>>> hw/arm/armsse.c unchanged, even though it clearly should change it.
>>> Running spatch with --debug prints (among lots of other things)
>>
>>> Clearly, Coccinelle is getting spooked to easily.
>>
>> Is it worth asking on the coccinelle mailing list about whether
>> coccinelle could be made to be less picky in this area ?
>
> I guess we owe them the feedback.  I'll look into minimizing the
> reproducer.

https://systeme.lip6.fr/pipermail/cocci/2020-April/007097.html


