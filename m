Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3018934AC94
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 17:33:30 +0100 (CET)
Received: from localhost ([::1]:33360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPpOq-0006MF-N1
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 12:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPpMM-0005cB-5Z
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 12:30:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPpME-0000gZ-JP
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 12:30:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616776244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8paQmiYPW5C1TiFeMmqBjq0XafRDdRpEgcPaHZJqAmo=;
 b=Sstmt1zwgO6jX+NBo5GkYuL0DjgYNMOxNZgjBu98OwI8NZ6rvZR1ICOuP+dUPxrnvKiFG+
 tfvRo5IHOzGa4p6/qE1pSVGHyzXXtqn6i4qk2a/im23q3mBKcLJVGpNUSmE/UiZFJ8izbA
 ddzVtMjM47YIsSNJ3Dko6nXxLw3dz2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276--kwb2XUcONKxbu9MlOE6vg-1; Fri, 26 Mar 2021 12:30:39 -0400
X-MC-Unique: -kwb2XUcONKxbu9MlOE6vg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E742F190A7B0;
 Fri, 26 Mar 2021 16:30:38 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DDA32B16D;
 Fri, 26 Mar 2021 16:30:38 +0000 (UTC)
Subject: Re: [PATCH v4 02/19] flake8: Enforce shorter line length for comments
 and docstrings
To: Markus Armbruster <armbru@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-3-jsnow@redhat.com>
 <877dlvs1gp.fsf@dusky.pond.sub.org>
 <ed5134b3-bff9-947e-f370-239e5c31a512@redhat.com>
 <871rc277mm.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <33866c5d-1eab-739c-f2e8-a35f4a0b0f55@redhat.com>
Date: Fri, 26 Mar 2021 12:30:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <871rc277mm.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 2:26 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 3/25/21 11:21 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> PEP8's BDFL writes: "For flowing long blocks of text with fewer
>>>> structural restrictions (docstrings or comments), the line length should
>>>> be limited to 72 characters."
>>>>
>>>> I do not like this patch. I have included it explicitly to recommend we
>>>> do not pay any further heed to the 72 column limit.
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>
>>> I'd like to get the remainder of this series moving again before digging
>>> into this patch.
>>
>> I am dropping it, then -- I have no interest in bringing a patch I
>> dislike along for another respin.
> 
> Despite your dislike, there might be good parts, and if there are, I'd
> like to mine them.  I don't need you to track the patch for that,
> though.  Feel free to drop it.
> 
> Thank you for exploring the max-doc-length option.
> 

Being less terse about it: Mostly, I don't like how it enforces this 
column width even for indented structures. Generally, we claim that 72 
columns is "comfortable to read" and I agree.

                                    However, when we start in a margin, I
                                    am not convinced that this is
                                    actually more readable than the
                                    alternative. We aren't using our full
                                    72 characters here.

For personal projects I tend to relax the column limit to about 100 
chars, which gives nice breathing room and generally reduces the edge 
cases for error strings and so on. (Not suggesting we do that here so 
long as we remain on a mailing-list based workflow.)

I can't say I am a fan of the limit; I don't think it's something I can 
reasonably enforce for python/* so I have some concerns over 
consistency, so I think it'd be easier to just not.

I *did* try, though; I just think it brought up too many judgment calls 
for how to make single-line comments not look super awkward. I imagine 
it'll cause similar delays for other authors, and exasperated sighs when 
the CI fails due to a 73-column comment.


