Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE154673589
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:32:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pISCk-0007cW-1P; Thu, 19 Jan 2023 05:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pISCi-0007be-F8
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:31:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pISCh-0002Sq-24
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674124290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5cAMniY4Sq/aNzeHFopx54x1dJ12LrHPcsyRVFVEa6s=;
 b=i1oeRwuxf2D9wKUDd7O40vvFrjVQTIwUq6ZC3izPuK+PLJhZ9uARmEOHkzosCRWaKsdUmF
 4AVd20tK583Q48nwjWoYnUDqScPoLf2+xQq46sz5ly5buWz/sD9+8xjUfris9oOShgveBM
 U/Szit4daTjBit32o5joUJNi8EaYZcE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-cqcVJtFFOna291hUw2wHXg-1; Thu, 19 Jan 2023 05:31:26 -0500
X-MC-Unique: cqcVJtFFOna291hUw2wHXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A9C91C068E3;
 Thu, 19 Jan 2023 10:31:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7921540C6EC4;
 Thu, 19 Jan 2023 10:31:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D2E8B21E6A28; Thu, 19 Jan 2023 11:31:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 philmd@linaro.org,  peter.maydell@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  quintela@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 10/19] migration: Clean up includes
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-11-armbru@redhat.com>
 <Y8kOj6m4jhtUVg+A@work-vm>
Date: Thu, 19 Jan 2023 11:31:17 +0100
In-Reply-To: <Y8kOj6m4jhtUVg+A@work-vm> (David Alan Gilbert's message of "Thu, 
 19 Jan 2023 09:34:07 +0000")
Message-ID: <87wn5ivmru.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> Clean up includes so that osdep.h is included first and headers
>> which it implies are not included manually.
>
> That change doesn't seem to match the message; the patch is removing the
> osdep.h include.

It's the commit message scripts/clean-includes creates :)

I can throw in another patch to the script so it mentions it also
removes qemu/osdep.h from headers.

>> This commit was created with scripts/clean-includes.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  include/qemu/userfaultfd.h | 1 -
>>  1 file changed, 1 deletion(-)
>> 
>> diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
>> index 6b74f92792..55c95998e8 100644
>> --- a/include/qemu/userfaultfd.h
>> +++ b/include/qemu/userfaultfd.h
>> @@ -13,7 +13,6 @@
>>  #ifndef USERFAULTFD_H
>>  #define USERFAULTFD_H
>>  
>> -#include "qemu/osdep.h"
>>  #include "exec/hwaddr.h"
>>  #include <linux/userfaultfd.h>
>>  
>> -- 
>> 2.39.0
>> 


