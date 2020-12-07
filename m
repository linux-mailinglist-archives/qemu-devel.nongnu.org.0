Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A3A2D1950
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 20:20:25 +0100 (CET)
Received: from localhost ([::1]:58216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmM3d-0006S9-0C
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 14:20:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kmM1K-0005yS-Qu
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 14:18:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kmM1H-0000WT-7I
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 14:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607368677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kLzQ/tr1qBsH5MSdykl/wCN8bBwzw9IID61sAae97BQ=;
 b=G8/IwgRSPvCIoaEiOYzaSnoI0zSjfItSfiNcyrxnOT0sSek4pPKSlVP/SViHIUmNDJh9b9
 SOKexJKTilJS5Y173KFKpm6jVvgI6Bg9KbpqzSLlZ7YceyD9VM6t/voq+368utXgI7tgz9
 fbhKhnZtAtgwSknLl85v+vLlr7Xj/As=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-QdtICDKbPz-zmVZF8-XYjg-1; Mon, 07 Dec 2020 14:17:54 -0500
X-MC-Unique: QdtICDKbPz-zmVZF8-XYjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C83CD107ACE4
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 19:17:53 +0000 (UTC)
Received: from [10.10.118.33] (ovpn-118-33.rdu2.redhat.com [10.10.118.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6510919D6C;
 Mon,  7 Dec 2020 19:17:53 +0000 (UTC)
Subject: Re: [PATCH] python, tests: do not use short-form boolean options
To: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20201113152035.1459107-1-pbonzini@redhat.com>
 <87v9e49w5s.fsf@dusky.pond.sub.org>
 <a4c8c4c9-c9ed-4043-c257-993caeee29ed@redhat.com>
 <87wnyk6om5.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <f6e3c30d-59f1-0c88-7b31-b52e13bc71ce@redhat.com>
Date: Mon, 7 Dec 2020 14:17:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87wnyk6om5.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/20 9:32 AM, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 17/11/20 10:20, Markus Armbruster wrote:
>>>> -            chardev = ('socket,id=console,path=%s,server,nowait' %
>>>> +            chardev = ('socket,id=console,path=%s,server=yes,wait=no' %
>>>
>>> Let's stick to the canonical 'on' and 'off'.
>>
>> That was on purpose (for extra coverage and not just because variety is
>> the spice of life).  But I can use the canonical values as well if you
>> prefer.
> 
> I think the place for extra coverage is tests/test-qemu-opts.c.
> 
> 

Seconded; steer machine.py et al to something like a reference 
implementation for how we want people to drive QEMU.

--js


