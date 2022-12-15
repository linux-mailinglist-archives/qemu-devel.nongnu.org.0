Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE5F64D725
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 08:16:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5iST-0004sU-Sf; Thu, 15 Dec 2022 02:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5iSQ-0004q3-SS
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:15:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5iSP-0000sl-BM
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671088504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ek3FPOax5r9j20mumShSsuZuiviJ/6eeUGK8cBpaipw=;
 b=c+iAVtf5hBTeNI7PBCwD09/PZRNokeK53OHgu6dz42FzlkCWvtOCdCqjHDLQGqz4s5WbBU
 ++S/bOKsujJ+f5lclBUypnkue4ZGLXdPV8Hrrn60TcFkWQEsN40TivucmKC7IHFH9Y8n+e
 h49n59tnJmMpmGRFTmyDQjzaTcnIrY0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-arcOv_TMM7OsqDeEJclhBg-1; Thu, 15 Dec 2022 02:14:56 -0500
X-MC-Unique: arcOv_TMM7OsqDeEJclhBg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D24485C6E0;
 Thu, 15 Dec 2022 07:14:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C05E4400F5A;
 Thu, 15 Dec 2022 07:14:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AFF5A21E6900; Thu, 15 Dec 2022 08:14:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: <qemu-devel@nongnu.org>,  <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>,  <ben.widawsky@intel.com>,
 <philmd@linaro.org>
Subject: Re: [PATCH 1/5] include/hw/pci: Clean up superfluous inclusion of
 pci*/*.h cxl/*.h
References: <20221209134802.3642942-1-armbru@redhat.com>
 <20221209134802.3642942-2-armbru@redhat.com>
 <20221212104158.000072b6@Huawei.com>
Date: Thu, 15 Dec 2022 08:14:52 +0100
In-Reply-To: <20221212104158.000072b6@Huawei.com> (Jonathan Cameron's message
 of "Mon, 12 Dec 2022 10:41:58 +0000")
Message-ID: <874jtxcf4j.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Jonathan Cameron <Jonathan.Cameron@Huawei.com> writes:

> On Fri,  9 Dec 2022 14:47:58 +0100
> Markus Armbruster <armbru@redhat.com> wrote:
>
> Hi Markus,
>
> One comment on the CXL ones.  Others CXL related changes
> all looks fine to me.
>
> Thanks for cleaning these up.
>
> Jonathan
>
>
>> diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
>> index 38e0e271d5..5129557bee 100644
>> --- a/include/hw/cxl/cxl.h
>> +++ b/include/hw/cxl/cxl.h
>> @@ -13,7 +13,6 @@
>>  
>>  #include "qapi/qapi-types-machine.h"
>>  #include "qapi/qapi-visit-machine.h"
>> -#include "hw/pci/pci_bridge.h"
>
> If we drop this, we probably want a forwards def of
> struct PXBDev

Why?  Because it's used in the header?

> I should probably be using the typedef in here as well rather
> than struct PXBDev * in CXLFixed Window so we'd need
> to deal with making that visible too.

We have two typedef struct PXBDev PXBDev, one n pci_bridge.h, and one in
pci_expander_bridge.c.  Both include cxl.h.  Move it to cxl.h?

>>  #include "hw/pci/pci_host.h"
>>  #include "cxl_pci.h"
>>  #include "cxl_component.h"
>
>>  #define CXL_VENDOR_ID 0x1e98


