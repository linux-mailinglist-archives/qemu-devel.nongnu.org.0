Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D63730F4D5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:24:44 +0100 (CET)
Received: from localhost ([::1]:49620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fYp-0000va-9e
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l7fXO-00087S-A8
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:23:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l7fXM-0001Mb-2R
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612448591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5F+D4+WkjQpxsRyGcvzkKBfLRcg+tI7kmJDKFGCFJlE=;
 b=MGFelO1M20aWihQ0iO+8et/yE5lmQohdfjcGWrEkDis0o7m1YAtgJ+I4HtmGr7gNcO6sQI
 SyY5f6zv3CRAa6gtevcScHIzkDclil2Qd6lhjJMOLliiKy2Nzxf0QJIcgK9NWaF8Rw5fNZ
 k6coSiHVAf3e2grFMaSnEuLjI0fOksY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-ATq1yTaeMB2LsKo8YqPZeA-1; Thu, 04 Feb 2021 09:23:09 -0500
X-MC-Unique: ATq1yTaeMB2LsKo8YqPZeA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67CC5100F341;
 Thu,  4 Feb 2021 14:23:08 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EB6FE2EF;
 Thu,  4 Feb 2021 14:22:58 +0000 (UTC)
Subject: [RFC] Move tools sources to the tools directory (was Re: [PATCH v2]
 MAINTAINERS: Fix the location of tools manuals)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210204135425.1380280-1-wainersm@redhat.com>
 <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <0e0f9745-fe21-0bc6-2d02-431d67a6b57e@redhat.com>
Date: Thu, 4 Feb 2021 11:22:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/4/21 10:59 AM, Philippe Mathieu-Daudé wrote:
> On 2/4/21 2:54 PM, Wainer dos Santos Moschetta wrote:
>> The qemu-img.rst, qemu-nbd.rst, virtfs-proxy-helper.rst, qemu-trace-stap.rst,
>> and virtiofsd.rst manuals were moved to docs/tools, so this update MAINTAINERS
>> accordingly.
>>
>> Fixes: a08b4a9fe6c ("docs: Move tools documentation to tools manual")
>> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> ---
>> v1: was "MAINTAINERS: Fix the location of virtiofsd.rst"
>> v2: Fixed the location of all files [philmd]
>>
>>   MAINTAINERS | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 00626941f1..174425a941 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1829,7 +1829,7 @@ S: Odd Fixes
>>   F: hw/9pfs/
>>   X: hw/9pfs/xen-9p*
>>   F: fsdev/
>> -F: docs/interop/virtfs-proxy-helper.rst
>> +F: docs/tools/virtfs-proxy-helper.rst
> Unrelated, but Paolo once said helpers are not tools.

Unrelated too, but allow me to ask:

Should we move the tools (qemu-img, qemu-io, qemu-nbd...etc) to the 
tools directory (virtiofsd seems to feel alone there)?

- Wainer

>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>
>


