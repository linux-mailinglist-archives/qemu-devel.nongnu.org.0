Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D46C22B83E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 22:55:39 +0200 (CEST)
Received: from localhost ([::1]:41074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyiFe-0007gW-5m
	for lists+qemu-devel@lfdr.de; Thu, 23 Jul 2020 16:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jyiEr-0007Cd-45
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 16:54:49 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29938
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jyiEn-0004km-6b
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 16:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595537684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GoVcZqViAspsCwdxyd5ZBOt1/Klo6VDtV3Js4NsmhIg=;
 b=P1h2WcmR+k90HVCy60iajNYQuoQCh8BhQ4WiG3J2T92NBhdjwPYA7/rZjXQrEGzq6tvKHw
 MjuHaQZlPYAIdsIDVREtAbD5FPfXQMhp0myeSnJh351LmqZxVHCvMAmq7yELBPolg+7VQl
 hXwrQuYHotcPnmHRMlmWp3tZpiBJkDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-rNcCw0MNNgqjb5vlHNWP4A-1; Thu, 23 Jul 2020 16:54:37 -0400
X-MC-Unique: rNcCw0MNNgqjb5vlHNWP4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA15B80183C;
 Thu, 23 Jul 2020 20:54:35 +0000 (UTC)
Received: from [10.3.112.189] (ovpn-112-189.phx2.redhat.com [10.3.112.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D31210013C4;
 Thu, 23 Jul 2020 20:54:32 +0000 (UTC)
Subject: Re: [PATCH v2 03/22] migration/block-dirty-bitmap: rename
 dirty_bitmap_mig_cleanup
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>, qemu-devel@nongnu.org
References: <20200217150246.29180-1-vsementsov@virtuozzo.com>
 <20200217150246.29180-4-vsementsov@virtuozzo.com>
 <bbdc4dc6-d220-1b97-50e9-31dcc3459bc1@virtuozzo.com>
 <ca63f745-d16b-1f51-56dc-e4e3a456864e@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5500e343-ec37-bec4-2deb-dab8a2bc47b7@redhat.com>
Date: Thu, 23 Jul 2020 15:54:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ca63f745-d16b-1f51-56dc-e4e3a456864e@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/23 02:26:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 dgilbert@redhat.com, qemu-block@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/20 8:20 AM, Vladimir Sementsov-Ogievskiy wrote:
> 18.02.2020 14:00, Andrey Shinkevich wrote:
>> On 17/02/2020 18:02, Vladimir Sementsov-Ogievskiy wrote:
>>> Rename dirty_bitmap_mig_cleanup to dirty_bitmap_do_save_cleanup, to
>>> stress that it is on save part.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   migration/block-dirty-bitmap.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)

>>
>> At the next opportunity, I would suggest the name like
>> "dirty_bitmap_do_clean_after_saving()"
>> and similar for dirty_bitmap_save_cleanup()
>> "dirty_bitmap_clean_after_saving()".
> 
> I'd keep my naming, it corresponds to .save_cleanup handler name.

I'm fine with that explanation, so no need to rename again.

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
>>
>> Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


