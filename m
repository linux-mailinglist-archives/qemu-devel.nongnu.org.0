Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C8C23ABD6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Aug 2020 19:52:19 +0200 (CEST)
Received: from localhost ([::1]:54862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2edF-0008WK-Q7
	for lists+qemu-devel@lfdr.de; Mon, 03 Aug 2020 13:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1k2ecU-0007tN-5z
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 13:51:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46958
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1k2ecR-0007wU-Dz
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 13:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596477085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kIcj/+um4kdCmMHhXDLEtVNHIr7d9VQD0aIm8GOS954=;
 b=HVWv91dSdnZESdxdkJFnAvmPiusAIc+emYfB/O4L2KYW/qj5oZf/1QcMYmg914G60LEACl
 DibL8VLPUiZRzBRQBD25yEeK+juAz2vabAC+bTVrlrPeeb2DXXgsHQZNNuLYb+SmygbYWI
 nwmM1LXPl49EerbYwXLO+v9wV9goYS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-_rKESueYNK6EUM-_3hTE9Q-1; Mon, 03 Aug 2020 13:51:15 -0400
X-MC-Unique: _rKESueYNK6EUM-_3hTE9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 420B81902EA8
 for <qemu-devel@nongnu.org>; Mon,  3 Aug 2020 17:51:14 +0000 (UTC)
Received: from ibm-p8-OVS-01-fsp.mgmt.pnr.lab.eng.rdu2.redhat.com (unknown
 [10.10.115.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76E4310098AD;
 Mon,  3 Aug 2020 17:51:11 +0000 (UTC)
Subject: Re: qapi-schema esotera
To: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <5bfa3895-304d-8372-c0db-fda4c1a1ba59@redhat.com>
 <dc0a16e2-365f-a9e6-03df-b70f97dd7407@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <64792de9-6719-3987-a66b-aed8cca61572@redhat.com>
Date: Mon, 3 Aug 2020 13:51:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dc0a16e2-365f-a9e6-03df-b70f97dd7407@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jsnow@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/03 13:51:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/20 1:25 PM, Eric Blake wrote:
> On 8/3/20 11:49 AM, John Snow wrote:
>> UNION is split into two primary forms:
>>
>> 1. Simple (No discriminator nor base)
>> 2. Flat (Discriminator and base)
>>
>> In expr.py, I notice that we modify the perceived type of the 'type' 
>> expression based on the two union forms.
>>
>> 1a. Simple unions allow Array[T]
>> 1b. Flat unions disallow Array[T]
> 
> Rather, branches in a simple unions are syntactic sugar for a wrapper 
> struct that contains a single member 'data'; because of that extra 
> nesting, the type of that single member is unconstrained.  In flat 
> unionw, the type MUST be a QAPI struct, because its members will be used 
> inline; as currently coded, this prevents the use of an intrinsic type 
> ('int', 'str') or an array type.
> 

I meant syntactically here, to be clear. I'm looking at expr.py -- if 
there are deeper constraints on the semantics of the information 
provided, that happens later.

Specifically, check_union's use of check_type() changes depending on the 
form of the union. One allows a string, the other allows a List of 
strings, provided the list is precisely one element long.

> If you need to use an array type in a flat union, you can't do:
> 
> { 'union' ...
>    'data': { 'foo': [ 'MyBranch' ] } }
> 
> but you can provide a wrapper type yourself:
> 
> { 'struct': 'MyBranch', 'data': { 'array': [ 'MyType' ] } }
> { 'union' ...
>    'data': { 'foo': 'MyBranch' } }
> 
>>
>>  From the docs:
>>
>> Syntax:
>>      UNION = { 'union': STRING,
>>                'data': BRANCHES,
>>                '*if': COND,
>>                '*features': FEATURES }
>>            | { 'union': STRING,
>>                'data': BRANCHES,
>>                'base': ( MEMBERS | STRING ),
>>                'discriminator': STRING,
>>                '*if': COND,
>>                '*features': FEATURES }
>>      BRANCHES = { BRANCH, ... }
>>      BRANCH = STRING : TYPE-REF
>>             | STRING : { 'type': TYPE-REF, '*if': COND }
>>
>> Both arms use the same "BRANCHES" grammar production, which both use 
>> TYPE-REF.
>>
>>      TYPE-REF = STRING | ARRAY-TYPE
>>      ARRAY-TYPE = [ STRING ]
>>
>> Implying that List[T] should be allowed for both productions.
>> Can I ask for a ruling from the judges?
> 
> As you found, the docs are a bit misleading; the semantic constraint on 
> flat union branches being a struct (because they will be inlined) 
> prevents the use of type-refs that are valid in simple unions (where 
> those simple types will be wrapped in an implicit struct).  A patch to 
> improve the docs would be a reasonable idea.
> 

Yes. I was working on a YAML prototype and I am trying to follow the 
existing parser as closely as possible. In some cases, this highlights 
differences between the grammar as advertised and what the parser 
actually does.

If we are to keep the current state of things, splitting UNION into two 
separate productions might be nice.

--js


