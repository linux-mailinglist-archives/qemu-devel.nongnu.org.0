Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B8030CFB1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 00:10:02 +0100 (CET)
Received: from localhost ([::1]:50094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74o5-0001Yi-6e
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 18:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74my-00008J-1g
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 18:08:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74mw-0007Z4-Au
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 18:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612307329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=le5xj02gi2GMAfz30BU+vIKCBHSdauhZgrgjeNQ/9d4=;
 b=P4eInjhSRe6pJb4IEAYoBA+/RCuERzUWz6ntp6sm7GKlccKVbhstMaCsFqffgL8JoQJP90
 RdOsqRn9O3eZu/R7CijnvAhrvqrFkKkKgz3fkMOqqr41SVyDus7cnj19N1qKNfnaaO76DE
 70guRhdu/LNIFJUUz/4Il4GYXttTxz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-T4ZXgJpCOlCTpI3RRQg8WA-1; Tue, 02 Feb 2021 18:08:47 -0500
X-MC-Unique: T4ZXgJpCOlCTpI3RRQg8WA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E171259;
 Tue,  2 Feb 2021 23:08:45 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FE931F469;
 Tue,  2 Feb 2021 23:08:42 +0000 (UTC)
Subject: Re: [PATCH 1/1] docs: fix mistake in dirty bitmap feature description
To: "Denis V. Lunev" <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20210128171313.2210947-1-den@openvz.org>
 <a88ad335-05b1-b720-5689-1c477bd55d1f@virtuozzo.com>
 <ccc0020d-ae27-6e8a-d76e-55615c74befb@redhat.com>
 <80bb1b27-4bb3-de85-713b-a88c8019a14f@openvz.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <cbfdf78b-57ff-3482-3adc-f2eb3e65237e@redhat.com>
Date: Tue, 2 Feb 2021 17:08:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <80bb1b27-4bb3-de85-713b-a88c8019a14f@openvz.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 4:50 PM, Denis V. Lunev wrote:
> On 2/3/21 1:15 AM, Eric Blake wrote:
>> On 1/28/21 11:21 AM, Vladimir Sementsov-Ogievskiy wrote:
>>> 28.01.2021 20:13, Denis V. Lunev wrote:
>>>> Original specification says that l1 table size if 64 * l1_size, which
>>>> is obviously wrong. The size of the l1 entry is 64 _bits_, not bytes.
>>>> Thus 64 is to be replaces with 8 as specification says about bytes.
>>>>
>>>> There is also minor tweak, field name is renamed from l1 to l1_table,
>>>> which matches with the later text.
>>>>
>>>> Signed-off-by: Denis V. Lunev <den@openvz.org>
>>>> CC: Stefan Hajnoczi <stefanha@redhat.com>
>>>> CC: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>
>> I saw the subject "dirty bitmap", and assumed it would go through my
>> dirty bitmap tree.  In reality, it's unrelated to the dirty bitmap code.
>>  Would an improved subject line help?
> hmm. Actually this is about "how the dirty bitmaps are stored in the
> Parallels Image format". The section is called "dirty bitmap feature".
> 
> What I can propose? :)
> 
> "docs: fix mistake in Parallels Image "dirty bitmap" feature description"
> 
> Will this work for you?

That feels a bit long; maybe just:

docs: fix Parallels Image "dirty bitmap" section


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


