Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED793A1B85
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 19:08:01 +0200 (CEST)
Received: from localhost ([::1]:57248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr1gO-0006jP-4m
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 13:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lr1f6-0005xh-R4
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:06:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lr1f3-00012V-3q
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623258394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8tQPzLboVf75t+TYAgIbiUWqgwTaqo/1n1wUFzxHFo=;
 b=cSkQE4QSQhsVJAjb5uzSB3LQ2BT04dQ76D1Jqg/s4mwOiUqNU1x6vuYXsDE3ddQLTlI/E8
 nYLBOn4D4ja/xeGun1u2hcAQnR3EvR09gTTMhT/PS0shsYz6wWZ5UvLB8NgyD0EGXG8OWt
 AmtlCKZR4zri8DnIOfDMvtukySou9LU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-fQJpXv9AMTun80StexuPFQ-1; Wed, 09 Jun 2021 13:06:30 -0400
X-MC-Unique: fQJpXv9AMTun80StexuPFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4A7A80ED8E;
 Wed,  9 Jun 2021 17:06:28 +0000 (UTC)
Received: from [10.10.116.110] (ovpn-116-110.rdu2.redhat.com [10.10.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE06860E3A;
 Wed,  9 Jun 2021 17:06:21 +0000 (UTC)
Subject: Re: GSoC Intro - TUI interface for QMP
To: Markus Armbruster <armbru@redhat.com>
References: <CAN6ztm-J2GoQKkLb=Az0H2Q8UKK4oE3PgXg7g14=T53sQAUyDg@mail.gmail.com>
 <CAN6ztm9JKPo05_qJo1cFGq2P6f1DzB9vu+VZ054e9MdHVkRLog@mail.gmail.com>
 <YKuq242kdKxhvHAr@stefanha-x1.localdomain>
 <CAN6ztm8rpDARg786+yq2S58T2wQ7TWSQ+H_3xgfUnRTbgc0k+A@mail.gmail.com>
 <d45d686b-ca43-821c-e843-cf0f963e4e6e@redhat.com>
 <87czswxuwn.fsf@dusky.pond.sub.org>
 <1577ce78-bf98-3f3d-7594-2b91d84967ec@redhat.com>
 <87sg1rp7yg.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <879a774d-4aa2-9333-b413-bb59ef035525@redhat.com>
Date: Wed, 9 Jun 2021 13:06:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87sg1rp7yg.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 wainersm@redhat.com, "Niteesh G. S." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 7:56 AM, Markus Armbruster wrote:
>> The client could cache the information. (Against what kind of an
>> identifier? Can QEMU report some kind of token that uniquely
>> identifies its binary or uniquely identifies the set of QAPI commands
>> it supports?)

> I proposed something like it to permit QMP clients cache
> query-qmp-schema output.  Libvirt didn't want it, so it never got beyond
> the idea stage.
> 

What ideas did you have for a cache key? We don't need to uniquely 
identify every instance or even every binary.

I suppose we could use an md5/sha1 checksum of the QMP introspection output?

>> This has the potential to exceed our capacity this summer, but a
>> prototype experiment might be helpful to inform future work anyway.
> Beware of the risk that comes with shiny stretch goals: loss of focus.
> I believe this is actually this GSoC project's main risk.

It is and I agree. I have been pushing Niteesh to complete the simplest 
possible prototype imaginable, but I believe he's identified having help 
text as something he'd really like to see, so I am investigating those 
concerns.

I do not think we'll actually be able to fully implement it start to 
finish, but it may be possible that we can implement a kind of "mockup" 
x-help command that has a few hardcoded things we can use to prototype 
the feature in the TUI.

I will keep scope creep in mind, we will pick and choose our battles. I 
am hell-bent on having *anything* checked into the tree by August, and I 
know that can be a longer process than we expect sometimes. I know this 
means keeping it small.

--js


