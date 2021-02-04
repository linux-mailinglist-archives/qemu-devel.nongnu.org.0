Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515E630FEEE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 21:59:16 +0100 (CET)
Received: from localhost ([::1]:37384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7lic-0003RA-Rs
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 15:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7lhj-0002mp-FD
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:58:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7lhe-0007ER-BH
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:58:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612472292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YlpHL+Nw5eKsHaglZGWf3eCbijyedTDU84n+AGnvq18=;
 b=EnrwJMbmTkVFJ5OJSYVTHbc9Zkw+TJpBl9W1hXDmOhBHoBosfYpj04F/azOKjGHzfw+XPc
 Tw1iz4gAqN7R7zOf6EB/spe0A3tBqr15jab+ZJHqZJIQji609ZSMZL3M0nCp6X3LoVgLq9
 m3/8pdyIVssneqo++5//s488Q/6Wz8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-a1zlrGSHPsqCTxWw6A6gYw-1; Thu, 04 Feb 2021 15:58:08 -0500
X-MC-Unique: a1zlrGSHPsqCTxWw6A6gYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB762801965;
 Thu,  4 Feb 2021 20:58:07 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81E605C3FD;
 Thu,  4 Feb 2021 20:57:59 +0000 (UTC)
Subject: Re: [RFC] Move tools sources to the tools directory (was Re: [PATCH
 v2] MAINTAINERS: Fix the location of tools manuals)
To: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210204135425.1380280-1-wainersm@redhat.com>
 <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
 <0e0f9745-fe21-0bc6-2d02-431d67a6b57e@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <20baa37e-a6af-9732-b7fb-ad469f3907e0@redhat.com>
Date: Thu, 4 Feb 2021 15:57:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0e0f9745-fe21-0bc6-2d02-431d67a6b57e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 9:22 AM, Wainer dos Santos Moschetta wrote:
> 
> On 2/4/21 10:59 AM, Philippe Mathieu-Daudé wrote:
>> On 2/4/21 2:54 PM, Wainer dos Santos Moschetta wrote:
>>> The qemu-img.rst, qemu-nbd.rst, virtfs-proxy-helper.rst, 
>>> qemu-trace-stap.rst,
>>> and virtiofsd.rst manuals were moved to docs/tools, so this update 
>>> MAINTAINERS
>>> accordingly.
>>>
>>> Fixes: a08b4a9fe6c ("docs: Move tools documentation to tools manual")
>>> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>> ---
>>> v1: was "MAINTAINERS: Fix the location of virtiofsd.rst"
>>> v2: Fixed the location of all files [philmd]
>>>
>>>   MAINTAINERS | 10 +++++-----
>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 00626941f1..174425a941 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1829,7 +1829,7 @@ S: Odd Fixes
>>>   F: hw/9pfs/
>>>   X: hw/9pfs/xen-9p*
>>>   F: fsdev/
>>> -F: docs/interop/virtfs-proxy-helper.rst
>>> +F: docs/tools/virtfs-proxy-helper.rst
>> Unrelated, but Paolo once said helpers are not tools.
> 
> Unrelated too, but allow me to ask:
> 
> Should we move the tools (qemu-img, qemu-io, qemu-nbd...etc) to the 
> tools directory (virtiofsd seems to feel alone there)?
> 

Only smiles and cheers from me. I recommend a README.rst that can go in 
the tools/ directory that explains the purpose of the directory and 
standards for inclusion, etc.

Very small blurbs explaining what, broadly, the tools are, could be nice 
for passers-by on gitlab while browsing the source structure.

This would allow us to codify much of what happened later in this thread 
(what goes here, why? do we support it? etc.)

--js


