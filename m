Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DE035889F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 17:36:12 +0200 (CEST)
Received: from localhost ([::1]:59096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUWhX-0003Lu-5t
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 11:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lUWd6-00005e-AF
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:31:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lUWd4-0006rL-01
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:31:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617895892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XD3OEg4hj75+clUN6h1z7236npKsJhcPrmKUhVKf3Hc=;
 b=i0XUfWqz3BZcy2J3a3lvBWplw0f4lfDwkojtvaVRKyIFCFgjbEYn2yIZeT5eIt5y0YFYNu
 yaoe3YJHqaOOS+thRqAyLFQzAsczMr5WdYOAjTwaJFCT2jQf1s4GizoEHmXbWbhs8d0Ec4
 TA67vGYwBzJcs9209FcW6cFHoHK/YHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-A3BS8PsKPseCqy5LKgdN0g-1; Thu, 08 Apr 2021 11:31:27 -0400
X-MC-Unique: A3BS8PsKPseCqy5LKgdN0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A128B18C35C1;
 Thu,  8 Apr 2021 15:31:26 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0A505D6AC;
 Thu,  8 Apr 2021 15:31:25 +0000 (UTC)
Subject: Re: [PATCH v2 4/8] qapi/error: Change assertion
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20210330171844.1197918-1-jsnow@redhat.com>
 <20210330171844.1197918-5-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <e760661b-0c3f-bb9b-0b4d-6c5ff77cfd70@redhat.com>
Date: Thu, 8 Apr 2021 11:31:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210330171844.1197918-5-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Michael Roth <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/21 1:18 PM, John Snow wrote:

Realizing now that this commit topic is wrong :)

A prior version modified the assertion, I decided it was less churn to 
simply add one.

I think ideally we'd have no assertions here and we'd rely on the type 
hints, but I don't think I can prove that this is safe until after part 
6, so I did this for now instead.

> Eventually, we'll be able to prove that 'info.line' must be an int and
> is never None at static analysis time, and this assert can go
> away. Until then, it's a type error to assume that self.info is not
> None.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   scripts/qapi/error.py | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
> index d179a3bd0c..d0bc7af6e7 100644
> --- a/scripts/qapi/error.py
> +++ b/scripts/qapi/error.py
> @@ -25,6 +25,7 @@ def __init__(self, info, msg, col=None):
>           self.col = col
>   
>       def __str__(self):
> +        assert self.info is not None
>           loc = str(self.info)
>           if self.col is not None:
>               assert self.info.line is not None
> 


