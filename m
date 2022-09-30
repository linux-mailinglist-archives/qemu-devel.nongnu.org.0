Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B806B5F0EDF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 17:32:29 +0200 (CEST)
Received: from localhost ([::1]:54984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeI04-0004UM-Q3
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 11:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oeHxN-0002hJ-1E
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:29:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oeHxK-0000ll-E2
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664551777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5qtCw+dxLHsXpEctVr2Dzl4tYu6On1JxDJ+Vf7nSkl8=;
 b=D/RaiabMonEapMvFnxWrUZZiy6oXV7x4cCM7LYhCAMaty67G36W/CDkpkjFul07UTNfpcW
 MikwjOxiWrgI5+8CUAM38sQAeN+N9RNlON5UWpK9ReyNlaz49RZTIbcvi6bEae9Uww1ol3
 PJZWWm10e3CGlZ5MAXaN8oFSE3y+Hvc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-sKCIkUN2N9ibUWxrRld45g-1; Fri, 30 Sep 2022 11:29:35 -0400
X-MC-Unique: sKCIkUN2N9ibUWxrRld45g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49B2B3826A54
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 15:29:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12BEB207B34D;
 Fri, 30 Sep 2022 15:29:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F274421E691D; Fri, 30 Sep 2022 17:29:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: victortoso@redhat.com
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [PULL 00/10] QAPI patches patches for 2022-09-07
References: <20220907150327.538464-1-armbru@redhat.com>
 <YxnK7jFo+g2Ahvf4@redhat.com> <87illydrta.fsf@pond.sub.org>
 <87czc6dria.fsf@pond.sub.org> <877d1z7fvg.fsf@pond.sub.org>
Date: Fri, 30 Sep 2022 17:29:31 +0200
In-Reply-To: <877d1z7fvg.fsf@pond.sub.org> (Markus Armbruster's message of
 "Mon, 19 Sep 2022 13:39:15 +0200")
Message-ID: <877d1k519g.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

> Gentle reminder, Victor :)
>
> Markus Armbruster <armbru@redhat.com> writes:
>
>> Markus Armbruster <armbru@redhat.com> writes:
>>
>>> Kevin Wolf <kwolf@redhat.com> writes:
>>>
>>>> Am 07.09.2022 um 17:03 hat Markus Armbruster geschrieben:
>>>>> The following changes since commit 946e9bccf12f2bcc3ca471b820738fb22d14fc80:

[...]

>>>>>       qapi: fix examples of blockdev-add with qcow2
>>>>
>>>> NACK, this patch is wrong.
>>>>
>>>> 'file' is a required member (defined in BlockdevOptionsGenericFormat),
>>>> removing it makes the example invalid. 'data-file' is only an additional
>>>> optional member to be used for external data files (i.e. when the guest
>>>> data is kept separate from the metadata in the .qcow2 file).
>>>
>>> I'll respin with #8 dropped.  Thank you!
>>
>> Too late, it's already merged.
>>
>> Victor, could you fix on top?  Or would you like me to revert the patch?

Revert posted: 

    Subject: [PATCH] Revert "qapi: fix examples of blockdev-add with qcow2"
    Date: Fri, 30 Sep 2022 17:26:34 +0200
    Message-Id: <20220930152634.774907-1-armbru@redhat.com>


