Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D850D277D9C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 03:26:50 +0200 (CEST)
Received: from localhost ([::1]:56950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLcVd-0002zG-Vt
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 21:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kLcHW-0003D0-0t
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 21:12:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kLcHU-0005CA-4z
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 21:12:13 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600996331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e/M9Kng8nfBMuGiYepoHE37rTaMj478TdKuorc0x9fQ=;
 b=YN3jqYnZrtae2VkYWyerBpmxf9KgScbdjD56yQGwgAz3bWcv0jyuOTn/5IEbNxERgM6sPq
 DUpq5XdN0ZeDFHc72do0QB+ccrMcc1vm4GbRf+fyTw9O/f5LnXQxxY3yyZrQTo3hyJxrUA
 rMb/ZbqoUuWWxb+lbjVwgazzEeObMxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-X6eFiezjPW-VIcLAsofCtg-1; Thu, 24 Sep 2020 21:12:09 -0400
X-MC-Unique: X6eFiezjPW-VIcLAsofCtg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A509807341;
 Fri, 25 Sep 2020 01:12:08 +0000 (UTC)
Received: from [10.10.119.140] (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 527E355761;
 Fri, 25 Sep 2020 01:12:07 +0000 (UTC)
Subject: Re: [PATCH 14/16] qapi/expr.py: Use tuples instead of lists for
 static data
To: Cleber Rosa <crosa@redhat.com>
References: <20200922211313.4082880-1-jsnow@redhat.com>
 <20200922211313.4082880-15-jsnow@redhat.com>
 <20200925010336.GG368253@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <d6d52a3e-84cd-cfe1-9dd5-c646c7b9f6ac@redhat.com>
Date: Thu, 24 Sep 2020 21:12:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200925010336.GG368253@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.214, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/20 9:03 PM, Cleber Rosa wrote:
> On Tue, Sep 22, 2020 at 05:13:11PM -0400, John Snow wrote:
>> It is -- maybe -- possibly -- three nanoseconds faster.
>>
> 
> Kevin O'Leary would clearly say here: "stop the madness!" :)
> 
>> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> 

I can explain!

When I sat down to write this series, I just "cleaned" in general 
without regard to what was strictly necessary and what wasn't.

Once I had to split them out, brick-by-brick, some things looked much 
more frivolous than others, but I had already written and tested them, so...

Well. There are definitely a few unimportant patches here.

--js


