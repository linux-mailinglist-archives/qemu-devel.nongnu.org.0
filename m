Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FCF36B900
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 20:33:55 +0200 (CEST)
Received: from localhost ([::1]:36780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb63O-0007o2-Ig
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 14:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lb60Y-000773-S7
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 14:31:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lb60R-0002kg-7K
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 14:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619461850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+yCpsoLBaEeWaUW/+tfcYDmOtjg41TIAs6u+EuVIC3o=;
 b=GWfFK8xHply3/Nx+LcQgK3k7xcqSk9108GkRjf5qpLjVTPDJwr10GWPgW4319E/7ajblKf
 LfBkscQd5ULHKVL4N2Qh746MDh/Rizg5du2tRuohPMhFqcztTvNUpUr5q0yetS1rl7D0Pf
 wQZBE5cawEzlspcb+Y9qySnVfeDlr5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-iFDSj2BcPVaufaf7jbkgNg-1; Mon, 26 Apr 2021 14:30:46 -0400
X-MC-Unique: iFDSj2BcPVaufaf7jbkgNg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF31E8030BB;
 Mon, 26 Apr 2021 18:30:45 +0000 (UTC)
Received: from [10.10.120.13] (ovpn-120-13.rdu2.redhat.com [10.10.120.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF1935C649;
 Mon, 26 Apr 2021 18:30:37 +0000 (UTC)
Subject: Re: [PATCH] qapi: deprecate drive-backup
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20210423125900.3640-1-vsementsov@virtuozzo.com>
 <9a0e7805-c6ae-b55f-431c-4c61a1ab746e@redhat.com>
 <cc17a05f-c563-03cc-4e32-91b41fa87b46@virtuozzo.com>
 <YIcA9WSSk+mATNbC@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <03c2bb38-561d-df2f-80cb-61838fa10d4f@redhat.com>
Date: Mon, 26 Apr 2021 14:30:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIcA9WSSk+mATNbC@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 kchamart@redhat.com, libvir-list@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, nshirokovskiy@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/21 2:05 PM, Daniel P. Berrangé wrote:
> On Mon, Apr 26, 2021 at 09:00:36PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 26.04.2021 20:34, John Snow wrote:
>>> On 4/23/21 8:59 AM, Vladimir Sementsov-Ogievskiy wrote:
>>>> Modern way is using blockdev-add + blockdev-backup, which provides a
>>>> lot more control on how target is opened.
>>>>
>>>> As example of drive-backup problems consider the following:
>>>>
>>>> User of drive-backup expects that target will be opened in the same
>>>> cache and aio mode as source. Corresponding logic is in
>>>> drive_backup_prepare(), where we take bs->open_flags of source.
>>>>
>>>> It works rather bad if source was added by blockdev-add. Assume source
>>>> is qcow2 image. On blockdev-add we should specify aio and cache options
>>>> for file child of qcow2 node. What happens next:
>>>>
>>>> drive_backup_prepare() looks at bs->open_flags of qcow2 source node.
>>>> But there no BDRV_O_NOCAHE neither BDRV_O_NATIVE_AIO: BDRV_O_NOCAHE is
>>>> places in bs->file->bs->open_flags, and BDRV_O_NATIVE_AIO is nowhere,
>>>> as file-posix parse options and simply set s->use_linux_aio.
>>>>
>>>
>>> No complaints from me, especially if Virtuozzo is on board. I would like to see some documentation changes alongside this deprecation, though.
>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>
>>>> Hi all! I remember, I suggested to deprecate drive-backup some time ago,
>>>> and nobody complain.. But that old patch was inside the series with
>>>> other more questionable deprecations and it did not landed.
>>>>
>>>> Let's finally deprecate what should be deprecated long ago.
>>>>
>>>> We now faced a problem in our downstream, described in commit message.
>>>> In downstream I've fixed it by simply enabling O_DIRECT and linux_aio
>>>> unconditionally for drive_backup target. But actually this just shows
>>>> that using drive-backup in blockdev era is a bad idea. So let's motivate
>>>> everyone (including Virtuozzo of course) to move to new interfaces and
>>>> avoid problems with all that outdated option inheritance.
>>>>
>>>>    docs/system/deprecated.rst | 5 +++++
>>>>    qapi/block-core.json       | 5 ++++-
>>>>    2 files changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
>>>> index 80cae86252..b6f5766e17 100644
>>>> --- a/docs/system/deprecated.rst
>>>> +++ b/docs/system/deprecated.rst
>>>> @@ -186,6 +186,11 @@ Use the more generic commands ``block-export-add`` and ``block-export-del``
>>>>    instead.  As part of this deprecation, where ``nbd-server-add`` used a
>>>>    single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
>>>> +``drive-backup`` (since 6.0)
>>>> +''''''''''''''''''''''''''''
>>>> +
>>>> +Use ``blockdev-backup`` in pair with ``blockdev-add`` instead.
>>>> +
>>>
>>> 1) Let's add a sphinx reference to https://qemu-project.gitlab.io/qemu/interop/live-block-operations.html#live-disk-backup-drive-backup-and-blockdev-backup
>>>
>>>
>>> 2) Just a thought, not a request: We also may wish to update https://qemu-project.gitlab.io/qemu/interop/bitmaps.html to use the new, preferred method. However, this doc is a bit old and is in need of an overhaul anyway (Especially to add the NBD pull workflow.) Since the doc is in need of an overhaul anyway, can we ask Kashyap to help us here, if he has time?
>>>
>>>
>>> 3) Let's add a small explanation here that outlines the differences in using these two commands. Here's a suggestion:
>>>
>>> This change primarily separates the creation/opening process of the backup target with explicit, separate steps. BlockdevBackup uses mostly the same arguments as DriveBackup, except the "format" and "mode" options are removed in favor of using explicit "blockdev-create" and "blockdev-add" calls.
>>>
>>> The "target" argument changes semantics. It no longer accepts filenames, and will now additionally accept arbitrary node names in addition to device names.
>>>
>>>
>>> 4) Also not a request: If we want to go above and beyond, it might be nice to spell out the exact steps required to transition from the old interface to the new one. Here's a (hasty) suggestion for how that might look:
>>>
>>> - The MODE argument is deprecated.
>>>    - "existing" is replaced by using "blockdev-add" commands.
>>>    - "absolute-paths" is replaced by using "blockdev-add" and
>>>      "blockdev-create" commands.
>>>
>>> - The FORMAT argument is deprecated.
>>>    - Format information is given to "blockdev-add"/"blockdev-create".
>>>
>>> - The TARGET argument has new semantics:
>>>    - Filenames are no longer supported, use blockdev-add/blockdev-create
>>>      as necessary instead.
>>>    - Device targets remain supported.
>>>
>>>
>>> Example:
>>>
>>> drive-backup $ARGS format=$FORMAT mode=$MODE target=$FILENAME becomes:
>>>
>>> (taking some liberties with syntax to just illustrate the idea ...)
>>>
>>> blockdev-create options={
>>>      "driver": "file",
>>>      "filename": $FILENAME,
>>>      "size": 0,
>>> }
>>>
>>> blockdev-add arguments={
>>>      "driver": "file",
>>>      "filename": $FILENAME,
>>>      "node-name": "Example_Filenode0"
>>> }
>>>
>>> blockdev-create options={
>>>      "driver": $FORMAT,
>>>      "file": "Example_Filenode0",
>>>      "size": $SIZE,
>>> }
>>>
>>> blockdev-add arguments={
>>>      "driver": $FORMAT,
>>>      "file": "Example_Filenode0",
>>>      "node-name": "Example_Formatnode0",
>>> }
>>>
>>> blockdev-backup arguments={
>>>      $ARGS ...,
>>>      "target": "Example_Formatnode0",
>>> }
>>>
>>
>> Good ideas. Hmm. Do you think that the whole explanation with examples should be here, in docs/system/deprecated.rst ? Seems too big in comparison with other deprecations
> 
> No, the deprecations entry should be short.
> 
> If the replacement is so complex that it requires us to provide examples,
> that's a sign that the replacement is insufficiently documented in its
> own right. IOW, add all this docs info to a suitable place in the main
> QEMU documentation, and just link to that from the deprecations page.
> 

Agree with Dan, keep the deprec section short.

Perhaps we can add an example to the live block ops doc that shows an 
example of how to transition and link to that example from here.

--js

> 
> Regards,
> Daniel
> 


