Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041F61343AC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 14:21:14 +0100 (CET)
Received: from localhost ([::1]:43676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipBGq-0004UM-Tw
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 08:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34654)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipBFo-0003r7-Ms
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 08:20:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipBFn-0001sd-JN
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 08:20:08 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54522
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipBFn-0001sN-FU
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 08:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578489607;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AtgRUXkxC0f5MYhGoBbdBZ8dGiDYnQt/S4XHSLEqe8g=;
 b=BkkD88K38rXRprobMACQ6Lp/X+rK90GWYgEXBT+0ojsXOdnpi6ZPU7Pvuz39Zq2etZssQO
 e6EzTK/4C29Y9KqG3AMV8lHFDa8vpD9Es6g2FNy80vJys1PyrHOjeF0oBRl2rGHlpHy+wB
 h9Nob/d4ZGxEs5YuVNRvG0gxKInFKRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-dPd4s5tpM9q4Qwbr7LGL0A-1; Wed, 08 Jan 2020 08:20:03 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D10768C238C;
 Wed,  8 Jan 2020 13:20:01 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C277B5C1B0;
 Wed,  8 Jan 2020 13:19:53 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-5.0 v11 01/20] migration: Support QLIST migration
In-Reply-To: <20191127114621.GG3016@work-vm> (David Alan Gilbert's message of
 "Wed, 27 Nov 2019 11:46:21 +0000")
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-2-eric.auger@redhat.com>
 <20191127114621.GG3016@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Wed, 08 Jan 2020 14:19:50 +0100
Message-ID: <87muaygk5l.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: dPd4s5tpM9q4Qwbr7LGL0A-1
X-Mimecast-Spam-Score: 0
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
Reply-To: quintela@redhat.com
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 qemu-devel@nongnu.org, peterx@redhat.com, armbru@redhat.com,
 Eric Auger <eric.auger@redhat.com>, bharatb.linux@gmail.com,
 qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Eric Auger (eric.auger@redhat.com) wrote:
>> Support QLIST migration using the same principle as QTAILQ:
>> 94869d5c52 ("migration: migrate QTAILQ").
>>=20
>> The VMSTATE_QLIST_V macro has the same proto as VMSTATE_QTAILQ_V.
>> The change mainly resides in QLIST RAW macros: QLIST_RAW_INSERT_HEAD
>> and QLIST_RAW_REVERSE.
>>=20
>> Tests also are provided.
>>=20
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>=20
>> +    while (qemu_get_byte(f)) {
>> +        elm =3D g_malloc(size);
>> +        ret =3D vmstate_load_state(f, vmsd, elm, version_id);
>> +        if (ret) {
>> +            error_report("%s: failed to load %s (%d)", field->name,
>> +                         vmsd->name, ret);
>> +            g_free(elm);
>> +            return ret;
>> +        }
>> +        QLIST_RAW_INSERT_HEAD(pv, elm, entry_offset);
>> +    }
>> +    QLIST_RAW_REVERSE(pv, elm, entry_offset);
>
> Can you explain why you need to do a REVERSE on the loaded list,
> rather than using doing a QLIST_INSERT_AFTER to always insert at
> the end?
>
> Other than that it looks good.

This was my fault (integrated as this is).

Old code had a "walk to the end of the list" and then insert.
I told it was way faster just to insert and the beggining and then
reverse.  I didn't noticed that we had the previous element to know
where to insert.

Eric, feel free to send a patch on top of this, or I will do it.

Later, Juan.


