Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438E73278CC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 09:01:24 +0100 (CET)
Received: from localhost ([::1]:56474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdUZ-0007K0-5g
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 03:01:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGdS8-0006me-M7
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:58:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGdS4-0007lj-L2
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614585526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SqcwGH4tbuzk1dP4t7iQU7qoNA9jcAj0kH27OIj//7E=;
 b=hsATQYTuAXtwjkeeK8p+rbF2rS28Gh9ZbM9NnDRnAhEDLSE0oOVcyjSHf0d0rSyyNHjdOZ
 NsHca7HWadAolf9lmQg+0hsGKtodSmA6rmRSdgaAk0pl3CtVdwbDiJ34F1bNJFoe2lBeBf
 Fu7BCkMZ77XwB9mhTgrp+e+sC1q4rDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-eRJWROYQOH2-5YX-40FRGA-1; Mon, 01 Mar 2021 02:58:44 -0500
X-MC-Unique: eRJWROYQOH2-5YX-40FRGA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88F441936B60;
 Mon,  1 Mar 2021 07:58:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2233216D38;
 Mon,  1 Mar 2021 07:58:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AE6E0113860F; Mon,  1 Mar 2021 08:58:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] iotests: Fix up python style in 300
References: <20210215220518.1745469-1-eblake@redhat.com>
 <39d5d446-3271-a8fd-0755-6a0fbfe24c09@redhat.com>
 <82a77c1b-95b4-5d94-d5f9-db025422caf4@virtuozzo.com>
Date: Mon, 01 Mar 2021 08:58:41 +0100
In-Reply-To: <82a77c1b-95b4-5d94-d5f9-db025422caf4@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 26 Feb 2021 10:04:14 +0300")
Message-ID: <87v9abl2z2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 16.02.2021 02:21, John Snow wrote:
>> On 2/15/21 5:05 PM, Eric Blake wrote:
>>> Break some long lines, and relax our type hints to be more generic to
>>> any JSON, in order to more easily permit the additional JSON depth now
>>> possible in migration parameters.=C2=A0 Detected by iotest 297.
>>>
>>> Fixes: ca4bfec41d56
>>> =C2=A0 (qemu-iotests: 300: Add test case for modifying persistence of b=
itmap)
>>> Reported-by: Kevin Wolf <kwolf@redhat.com>
>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: John Snow <jsnow@redhat.com>
>>=20
>>> ---
>>> =C2=A0 tests/qemu-iotests/300 | 10 ++++++----
>>> =C2=A0 1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
>>> index 63036f6a6e13..adb927629747 100755
>>> --- a/tests/qemu-iotests/300
>>> +++ b/tests/qemu-iotests/300
>>> @@ -22,7 +22,7 @@
>>> =C2=A0 import os
>>> =C2=A0 import random
>>> =C2=A0 import re
>>> -from typing import Dict, List, Optional, Union
>>> +from typing import Dict, List, Optional
>>>
>>> =C2=A0 import iotests
>>>
>>> @@ -30,7 +30,7 @@ import iotests
>>> =C2=A0 # pylint: disable=3Dwrong-import-order
>>> =C2=A0 import qemu
>>>
>>> -BlockBitmapMapping =3D List[Dict[str, Union[str, List[Dict[str, str]]]=
]]
>>> +BlockBitmapMapping =3D List[Dict[str, object]]
>>>
>> Assuming iotest 297 didn't yap about this, I think this has the
>> necessary power for this file and we don't have to work any harder.
>> If in the future you try to treat e.g. bmap['persistent'] as a
>> particular kind of value (string? bool? int?) mypy will likely
>> complain about that a little, saying it has no insight into the type
>> beyond "object".
>> If *that* becomes annoying, you can degrade this type to use 'Any'
>> instead of 'object' and even those checks will cease.
>
> Probably at some future moment we'll have generated python types for QAPI=
 structures ? :)

Generating Python from the QAPI schema is possible.  I'm not aware of
anyone planning to work on it near term.


