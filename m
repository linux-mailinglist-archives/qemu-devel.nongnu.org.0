Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2712364998A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 08:29:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4dFK-00043a-1h; Mon, 12 Dec 2022 02:29:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p4dFH-0003yt-Kk
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:29:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p4dFG-0002HQ-AE
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670830141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7nvILyfvEJaZpuEg7e/f9uEbBLHSAqwl+WT9s/Xvec=;
 b=LVOHJFzeQQwEWYp5ssYcEKYKg/zt4JdUdLkfiS/Om775eDxnRGwdDXj1l1928mCDEcaQpR
 WLxMtCwlzv2zyrOS9sQAO3meCgIAqBfSvC7Q0DmJcRfqpbnl03+xasHc9eEeKt0SIpOtjh
 n2XUe/sIJ/oVYdh2dg8J2VaiXx/Q4qk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-zI95Wo4ANFClld5bpVUmHw-1; Mon, 12 Dec 2022 02:28:55 -0500
X-MC-Unique: zI95Wo4ANFClld5bpVUmHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7329F101A52A;
 Mon, 12 Dec 2022 07:28:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EA761121333;
 Mon, 12 Dec 2022 07:28:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2BB1621E6901; Mon, 12 Dec 2022 08:28:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: <qemu-devel@nongnu.org>,  <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 3/4] include/hw/ppc: Don't include hw/pci-host/pnv_phb.h
 from pnv.h
References: <20221210112140.4057731-1-armbru@redhat.com>
 <20221210112140.4057731-4-armbru@redhat.com>
 <700aada2-5b0a-e558-0d96-e6470743c515@kaod.org>
Date: Mon, 12 Dec 2022 08:28:52 +0100
In-Reply-To: <700aada2-5b0a-e558-0d96-e6470743c515@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
 Goater"'s message of "Sun, 11 Dec 2022 08:54:25 +0100")
Message-ID: <87359l84i3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 12/10/22 12:21, Markus Armbruster wrote:
>> The next commit needs to include hw/ppc/pnv.h from
>> hw/pci-host/pnv_phb.h.  Avoid an inclusion loop.
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Thanks,
>
> C.
>
> (one comment below)
>
>> ---
>>   hw/pci-host/pnv_phb.h          | 1 +
>>   include/hw/pci-host/pnv_phb4.h | 3 ++-
>>   include/hw/ppc/pnv.h           | 3 ++-
>>   hw/ppc/pnv_psi.c               | 1 +
>>   4 files changed, 6 insertions(+), 2 deletions(-)
>> diff --git a/hw/pci-host/pnv_phb.h b/hw/pci-host/pnv_phb.h
>> index 58ebd6dd0f..202de8796c 100644
>> --- a/hw/pci-host/pnv_phb.h
>> +++ b/hw/pci-host/pnv_phb.h
>> @@ -12,6 +12,7 @@
>>     #include "hw/pci/pcie_host.h"
>>   #include "hw/pci/pcie_port.h"
>> +#include "hw/ppc/pnv.h"
>
> Now that the chip definitions have been extrated in pnv_chip.h, I find
> it curious that we need to include pnv.h since it should only contain
> machine definitions. No big deal, I will take a look later. You did
> the hard part and thanks for that.

I checked again, and it looks like an accident.  I figure I put it
there, then improved an earlier patch, which made it unneccessary.  I'll
take it out.  Thanks!


