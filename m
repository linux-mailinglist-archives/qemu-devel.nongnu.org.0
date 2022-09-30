Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875E65F10B0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:23:23 +0200 (CEST)
Received: from localhost ([::1]:37240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJjN-0001VG-N4
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oeJgr-0007Wn-JL
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 13:20:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oeJgo-0002XR-Sf
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 13:20:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664558440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HXzSUP9flxPrvENbTy69yIEfTFTaf2+ox2f1dtDFR+c=;
 b=MzbfATT/uoi0MJmeZwo3WI3K7IN8kloPu/g7MaqcssvmAr8HVfcP7qyywlhH6P0pevW+VW
 IG+t2jYZzHYtCcEM+ATWfrKyBFL5AgXoEsfradoBlRH0qfoelo7TMGF7DuM+fKIDH17vOy
 gZSWFvF4Rs3z2GZQGfxt/UnEv5NpWPs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-JsSteALjNVyd3k0aQRcMsQ-1; Fri, 30 Sep 2022 13:20:39 -0400
X-MC-Unique: JsSteALjNVyd3k0aQRcMsQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B15AF101A52A
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 17:20:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E1222166B26;
 Fri, 30 Sep 2022 17:20:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 792CC21E691D; Fri, 30 Sep 2022 19:20:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: victortoso@redhat.com, Kevin Wolf <kwolf@redhat.com>, stefanha@redhat.com
Subject: Re: [PULL 00/10] QAPI patches patches for 2022-09-07
References: <20220907150327.538464-1-armbru@redhat.com>
 <YxnK7jFo+g2Ahvf4@redhat.com> <87illydrta.fsf@pond.sub.org>
 <87czc6dria.fsf@pond.sub.org> <877d1z7fvg.fsf@pond.sub.org>
 <877d1k519g.fsf@pond.sub.org>
Date: Fri, 30 Sep 2022 19:20:37 +0200
In-Reply-To: <877d1k519g.fsf@pond.sub.org> (Markus Armbruster's message of
 "Fri, 30 Sep 2022 17:29:31 +0200")
Message-ID: <87v8p43hju.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Markus Armbruster <armbru@redhat.com> writes:
>
>> Gentle reminder, Victor :)
>>
>> Markus Armbruster <armbru@redhat.com> writes:
>>
>>> Markus Armbruster <armbru@redhat.com> writes:
>>>
>>>> Kevin Wolf <kwolf@redhat.com> writes:
>>>>
>>>>> Am 07.09.2022 um 17:03 hat Markus Armbruster geschrieben:
>>>>>> The following changes since commit 946e9bccf12f2bcc3ca471b820738fb22d14fc80:
>
> [...]
>
>>>>>>       qapi: fix examples of blockdev-add with qcow2
>>>>>
>>>>> NACK, this patch is wrong.
>>>>>
>>>>> 'file' is a required member (defined in BlockdevOptionsGenericFormat),
>>>>> removing it makes the example invalid. 'data-file' is only an additional
>>>>> optional member to be used for external data files (i.e. when the guest
>>>>> data is kept separate from the metadata in the .qcow2 file).
>>>>
>>>> I'll respin with #8 dropped.  Thank you!
>>>
>>> Too late, it's already merged.
>>>
>>> Victor, could you fix on top?  Or would you like me to revert the patch?
>
> Revert posted: 
>
>     Subject: [PATCH] Revert "qapi: fix examples of blockdev-add with qcow2"
>     Date: Fri, 30 Sep 2022 17:26:34 +0200
>     Message-Id: <20220930152634.774907-1-armbru@redhat.com>

I messed up the send.  Correction is
Message-Id: <20220930171908.846769-1-armbru@redhat.com>


