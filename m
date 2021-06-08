Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B1F39FB36
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:52:58 +0200 (CEST)
Received: from localhost ([::1]:37920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqe2D-0006QO-6M
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqdzT-00048B-BM
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:50:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqdzM-00059G-Pa
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623167399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6YzM1pWy/Ekq0Kyuv8BtDPK7VmLM0jQbEaZ+m6/gCfM=;
 b=ClrBIS2tJZjfZEkIWnwAT5Lop7NR2sYNZc2lYr2OgcfNbdrlFYgR0xUP4un6E84//QqxGs
 BlhAZC2ULDFIEwv9D9cToUVi5wemxJKi4NlSpk9r9vDfgAIVgy6wEDM0zkBo7drl0177xi
 6T0RUYqh/i3NawbKCv6lNg4+SIK34Gw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-ffhkDtviOP6eN2ziUmAlaA-1; Tue, 08 Jun 2021 11:49:52 -0400
X-MC-Unique: ffhkDtviOP6eN2ziUmAlaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0711F106BAA6;
 Tue,  8 Jun 2021 15:49:51 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDC6A5D9E3;
 Tue,  8 Jun 2021 15:49:42 +0000 (UTC)
Subject: Re: GSoC Intro - TUI interface for QMP
To: Markus Armbruster <armbru@redhat.com>
References: <CAN6ztm-J2GoQKkLb=Az0H2Q8UKK4oE3PgXg7g14=T53sQAUyDg@mail.gmail.com>
 <CAN6ztm9JKPo05_qJo1cFGq2P6f1DzB9vu+VZ054e9MdHVkRLog@mail.gmail.com>
 <YKuq242kdKxhvHAr@stefanha-x1.localdomain>
 <CAN6ztm8rpDARg786+yq2S58T2wQ7TWSQ+H_3xgfUnRTbgc0k+A@mail.gmail.com>
 <d45d686b-ca43-821c-e843-cf0f963e4e6e@redhat.com>
 <87czswxuwn.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <1577ce78-bf98-3f3d-7594-2b91d84967ec@redhat.com>
Date: Tue, 8 Jun 2021 11:49:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87czswxuwn.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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

On 6/8/21 11:01 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
> [...]
> 
>> A challenge will be where to pull the help text from. The QEMU server
>> is not capable (today) of sending help information over the QMP socket
>> itself.
>>
>> We will need to implement a QMP command inside of QEMU directly that
>> is capable of delivering this information to the client so that it can
>> render it.
>>
>> Since not all versions of QEMU will have this feature, the qmp-shell
>> will need to be able to gracefully deal with the lack of help text,
>> displaying an error indicating that this version of QEMU does not have
>> help information compiled into it.
> 
> The doc text is bulky: my bld/docs/manual/interop/qemu-qmp-ref.html is
> 1.7 MiB and growing.  Less lavish markup results in smaller data.  We
> may want to store it compressed, or load it on demand.  We might even
> have to make it compile-time optional for some use cases.
> 
> 

ACK, understood.

raw QAPI directory, including only the json files, is "only" 551.3 kB.

I assume we can compile help text to something json (or json-like) and 
then compress it. Perhaps we could compile something like 
qapi-help-introspect.json.tgz and load it on-demand from the QEMU binary 
when help text is requested.

We could prototype under the experimental QMP command x-help, and limit 
it to sending help for just one command at a time to limit data transfer.

The client could cache the information. (Against what kind of an 
identifier? Can QEMU report some kind of token that uniquely identifies 
its binary or uniquely identifies the set of QAPI commands it supports?)

This has the potential to exceed our capacity this summer, but a 
prototype experiment might be helpful to inform future work anyway.

--js


