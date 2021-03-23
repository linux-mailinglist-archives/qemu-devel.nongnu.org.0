Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083A7346170
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:27:52 +0100 (CET)
Received: from localhost ([::1]:35390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOi0c-0006PS-OT
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOhyU-0005In-Lv
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:25:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOhyR-0006OY-6w
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616509534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icJ59aPfkKQ2GxKQ4Y3GgN9FU23vhTSdXJ/NLWewbck=;
 b=K1yPIzmNnDbTc8tVv27ebG4+TBDtpMPbfEyTGDabB4oczmoKgwDL11RjGD7nvIgXHUBJ/W
 SHJCN1fFcPq+nYQFvZbr6XXFd+jon/QFQZGBYaYezM5ZtslRm1KF2BWOXHIzxIuS91UNrO
 ky62Zfz2XR7Ex3qQGfuyJVY8cOKBOn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-GiRtXC_WP3OJ6y1rvlNJcA-1; Tue, 23 Mar 2021 10:25:31 -0400
X-MC-Unique: GiRtXC_WP3OJ6y1rvlNJcA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D70F107B7D2;
 Tue, 23 Mar 2021 14:25:30 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E5055C1CF;
 Tue, 23 Mar 2021 14:25:26 +0000 (UTC)
Subject: Re: [PATCH 03/28] tests/qapi-schema: Rework comments on longhand
 member definitions
To: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-4-armbru@redhat.com>
 <323d8fd2-56e0-db29-e2c8-0d71bea9d81d@redhat.com>
 <914fd5f6-9369-8bea-758d-be134f4a3f4a@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <5e344e69-d167-082d-6c59-122c85f57fa7@redhat.com>
Date: Tue, 23 Mar 2021 10:25:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <914fd5f6-9369-8bea-758d-be134f4a3f4a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:58 AM, Eric Blake wrote:
> On 3/23/21 8:00 AM, John Snow wrote:
>> On 3/23/21 5:40 AM, Markus Armbruster wrote:
>>> +# event 'data' member with dict value is (longhand) argument
>>> +# definition, not inline complex type
>>
>> I have to be a weenie and say I don't know exactly what this comment is
>> telling me.
>>
>> (1) What's a longhand argument?
> 
> Writing { 'type':'str', 'name':'foo' } is longhand for the corresponding
> 'foo':'str' shorthand.
> 

Ah, okay. The canonical object/dict form of a member definition.

>> (2) What's an inline complex type?
> 
> Writing { 'command':'Foo', 'returns': { 'foo':'str' } }
> or { 'union':'U', 'base': { 'foo':'Enum' } ... }
> 
> are inline complex types; they are shorthand for:
> 
> { 'struct':'FooReturn', 'data': { 'foo':'str' } }
> { 'struct':'UBase', 'data': { 'foo':'Enum' } }
> { 'command':'Foo', 'returns':'FooReturn'  }
> { 'union':'U', 'base':'UBase' }
> 
> At one point, I had the idea that we might want to write:
> 
> { 'union':'U', ...
>    'data': { 'branch': { inline type } } }
> 
> instead of having to pre-declare the type for the branch; but that idea
> is no longer feasible, since it would be awkward to distinguish from
> what we DO have of:
> 
> { 'union':'U', ...
>    'data': { 'branch': { 'type':'Branch', 'if': 'COND' } } }
> 
> and where I don't really see us wanting:
> 
> { 'union':U', ...
>    'data': { 'branch': { 'type': { inline type }, 'if': 'COND' } } }
> 
> (If the situation changes and we do want anonymous inline types anywhere
> a name can appear now, we'll have more work to do)
> 

I see, ok, thanks!


