Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5240C323E4A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:34:32 +0100 (CET)
Received: from localhost ([::1]:32908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEuJD-0002W2-8r
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:34:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lErsr-0001UB-Ax
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:59:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lErsp-00044C-QH
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:59:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614164346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=htESETlwmtASm15hT05r8wH8PFgIxJqbtH1OWupTNiU=;
 b=Y9x0wU6eaOqkO0OB7vG81qF3gve8yAotpUS3wL0SQJVziPhJeQ1G0as9pTUuoKNPAas8IE
 ZHzk0N99dXc1gXcsDCvj6C1bLRUzU3TAv+8YX+PKZOJbyzDfFDTnMMYlRezmTsGR8sTO/N
 CgBwbAfHrCWpLRp01H8q7I1TxuB3CgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-rTI9JPvDMF2LmQmL59nwZw-1; Wed, 24 Feb 2021 05:59:04 -0500
X-MC-Unique: rTI9JPvDMF2LmQmL59nwZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12860193579B
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:59:04 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-99.ams2.redhat.com
 [10.36.113.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 083E26F929;
 Wed, 24 Feb 2021 10:59:02 +0000 (UTC)
Subject: Re: [PATCH] libqos/qgraph: format qgraph comments for sphinx
 documentation
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210224101810.52851-1-eesposit@redhat.com>
 <ec53c449-b719-07cf-0993-352bdbd32725@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <919d2c24-92f8-53e8-5598-97166add3083@redhat.com>
Date: Wed, 24 Feb 2021 11:59:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ec53c449-b719-07cf-0993-352bdbd32725@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 24 Feb 2021 08:17:37 -0500
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 24/02/2021 11:49, Paolo Bonzini wrote:
> On 24/02/21 11:18, Emanuele Giuseppe Esposito wrote:
>>     qtest
>> +   qgraph
> 
> It may make sense to add instead a "toctree" directive in qtest.rst.  I 
> haven't checked what the result looks like, though.

Current result is

- QTest Device Emulation Testing Framework
- Qtest Driver Framework

but I agree, maybe with an internal toctree in qtest.rst it will be 
clearer. I'll try.

> 
>> + * DOC: Qtest Driver Framework
> 
> Is this needed since you have the heading already in qgraph.rst?

No, sorry I was experimenting and looking at qtest.rst
I forgot to remove it

> 
> (Also, the whole section could move to qgraph.rst.  This is what was 
> done with qom.rst for example).

Ok makes sense.

> 
>> + * More specifically:
>> + *
>> + * .. code::
>> + *
>> + *   x86_64/pc -->contains--> other_node <--consumes-- my_driver
>> + *                                                         |
> 
> You can end a paragraph with "::", and the following block will 
> automatically become monospaced.
> 
> Also "-->contains-->" has an extra ">" sign.
> 
>> + * ``"-netdev something -device my_node,addr=04.0 -device other"``
> 
> Maybe the quotes can be removed since you have monospaced text.
> 
> The main issue with the text overall is that it was written before 
> having experience with developing QGraph drivers and interfaces.  It's 
> already a good thing to have it in the manual, so the smallest possible 
> change (as you did in this patch) is already an improvement.
> 
> However, it would also be nice to replace the examples with something 
> more "real world", based on the code in tests/qtest.

I will try to use better examples and post v2, thank you for the feedback.

Emanuele
> 
> Thanks!
> 
> Paolo
> 


