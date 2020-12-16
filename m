Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CE42DC073
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 13:45:33 +0100 (CET)
Received: from localhost ([::1]:42092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpWBQ-0004KG-FH
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 07:45:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpWAQ-0003vS-6v
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 07:44:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpWAO-0001lm-Ku
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 07:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608122667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7QuSNSg6IbugHNQ9DjCRg2mRiNsf75Ci0eTlSdoVG+8=;
 b=NMXFb1K4LU11ldhpYx0ilmj5Fvh305dZ2gHXiBh7yIO61Zs3YzKTSNJ5+imIqiGvn5RLmH
 GMUsmrG5rHT9aIaCwa9kUB/29KjYd9J/McaSa5bOoH9MRD6SRs1D+0vEpDcjSTsPv97Rof
 vDnFhZsdPHDAyj5tZ2tnyYSaPbBwZWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-34twJofbPPC-Q0OAe9lNIg-1; Wed, 16 Dec 2020 07:44:23 -0500
X-MC-Unique: 34twJofbPPC-Q0OAe9lNIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EB1359;
 Wed, 16 Dec 2020 12:44:21 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-7.ams2.redhat.com [10.36.113.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E1C460C47;
 Wed, 16 Dec 2020 12:44:20 +0000 (UTC)
Subject: Re: [PATCH for-6.0] qga/commands-posix: Send CCW address on s390x
 with the fsinfo data
To: Cornelia Huck <cohuck@redhat.com>
References: <20201125105417.380317-1-thuth@redhat.com>
 <19721a4f-d566-44d5-6eb6-ff892e5cb502@redhat.com>
 <20201216134039.41655931.cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c7a97927-3108-2806-e941-6e423c0c249b@redhat.com>
Date: Wed, 16 Dec 2020 13:44:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201216134039.41655931.cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/12/2020 13.40, Cornelia Huck wrote:
> On Mon, 14 Dec 2020 09:53:21 +0100
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> On 25/11/2020 11.54, Thomas Huth wrote:
>>> We need the CCW address on the libvirt side to correctly identify
>>> the disk, so add this information to the GuestDiskAddress on s390x.
>>>
>>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1755075
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  qga/commands-posix.c | 34 ++++++++++++++++++++++++++++++++++
>>>  qga/qapi-schema.json | 19 ++++++++++++++++++-
>>>  2 files changed, 52 insertions(+), 1 deletion(-)
> 
>> Ping!
>>
>> Michael, any comments on this, or do you think that it ready to go?
> 
> If nobody objects, I can also merge this (or rather the v2 of this
> patch) through the s390x tree.

Oh, right, I pinged on the wrong version, sorry! So, Cornelia, if you could
pick up v2, that would be great! I think the patch should not have any
effects on non-s390x architectures, so it should be ok if it goes via the
s390x tree.

 Thanks,
  Thomas


