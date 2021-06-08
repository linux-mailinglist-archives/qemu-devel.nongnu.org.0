Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654DD39F4BB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:14:12 +0200 (CEST)
Received: from localhost ([::1]:57380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZgR-00053Q-2a
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqZeo-0004FX-RK
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:12:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqZen-0001gQ-DX
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623150748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+FgqMeCPS2t+SHpFnxPNr4m6oN0h1ZRoT+yxfk8Qg1w=;
 b=SIA54snDe21lX24OgzjuTpHwYPSwCwh/YShc6THZ3LIRb8sp/LNGPX3pqLmD6cw20Ygut6
 91EpAwZiM7rNUs5VLT55hsjKmM19YVKXn7d+wH8aFinNnSUTkn8ut2jNjuvYoSZD7FwbYk
 nDLWZCoWDCziWmsIAuAiTnAMi0OmL1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-UsOHX-dUNBa8so2CAZovYQ-1; Tue, 08 Jun 2021 07:12:27 -0400
X-MC-Unique: UsOHX-dUNBa8so2CAZovYQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB4BE1883520;
 Tue,  8 Jun 2021 11:12:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12B8E369A;
 Tue,  8 Jun 2021 11:12:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A0EBF113865F; Tue,  8 Jun 2021 13:12:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 3/3] qapi: deprecate drive-backup
References: <20210505135803.67896-1-vsementsov@virtuozzo.com>
 <20210505135803.67896-4-vsementsov@virtuozzo.com>
Date: Tue, 08 Jun 2021 13:12:20 +0200
In-Reply-To: <20210505135803.67896-4-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 5 May 2021 16:58:03 +0300")
Message-ID: <87eedc1ugb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pkrempa@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 kchamart@redhat.com, libvir-list@redhat.com, jsnow@redhat.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, yur@virtuozzo.com,
 nshirokovskiy@virtuozzo.com, wencongyang2@huawei.com, den@openvz.org,
 eblake@redhat.com, dim@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

[...]

> TODO: We also need to deprecate drive-backup transaction action..
> But union members in QAPI doesn't support 'deprecated' feature. I tried
> to dig a bit, but failed :/ Markus, could you please help with it? At
> least by advice?

There are two closely related things in play here: the union branch and
the corresponding enum value.

So far, the QAPI schema language doesn't support tacking feature flags
to either.

If an enum value is deprecated, any union branches corresponding to it
must also be deprecated (because their use requires using the deprecated
enum value).

The converse is not true, but I can't see a use for deprecating a union
branch without also deprecating the enum member.

I think we can implement feature flags just for enum members, then
document that 'deprecated' enum value implies corresponding union
branches are also deprecated.

I have unfinished patches implementing feature flags for enum members.

Since TransactionAction is a simple union, the corresponding enum is
implicit.  We can make it explicit by converting to a flat union.
Simple unions need to die anyway.

Does this make sense?


