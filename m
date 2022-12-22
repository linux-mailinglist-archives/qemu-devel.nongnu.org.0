Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D541653C64
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 08:04:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8Fbc-00041d-18; Thu, 22 Dec 2022 02:03:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8FbW-000410-Vj
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 02:03:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8FbU-0002sr-ID
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 02:02:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671692575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3/y1BB0XW/itIgRSb+jFGmPNulg8BueVthh0Gh7g2EY=;
 b=XYKm4Udg41Gr55BQZ7PMI9MLCt0R1JFpuAxC7aZpg0JyFUeEWKwcBBDdTqgHkxDBTWTxEe
 gpua3WdXqqUxRLOhcY4Iz2tcOz7dJ89YPqrUvHOXiol4DqzJatClGdyTefGvb+ugOY3nH/
 1LBqobPy2UNc4uY6bPnOZ1i5d5CIfHg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-detd1W31OB2_DWIXFRhMvw-1; Thu, 22 Dec 2022 02:02:50 -0500
X-MC-Unique: detd1W31OB2_DWIXFRhMvw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B286180D0E9;
 Thu, 22 Dec 2022 07:02:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B00551EF;
 Thu, 22 Dec 2022 07:02:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5822221E691D; Thu, 22 Dec 2022 08:02:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org,  marcel.apfelbaum@gmail.com,
 ben.widawsky@intel.com,  jonathan.cameron@huawei.com,  philmd@linaro.org
Subject: Re: [PATCH 0/5] include/hw/pci include/hw/cxl: Clean up includes
References: <20221209134802.3642942-1-armbru@redhat.com>
 <20221221063353-mutt-send-email-mst@kernel.org>
Date: Thu, 22 Dec 2022 08:02:48 +0100
In-Reply-To: <20221221063353-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Wed, 21 Dec 2022 06:34:10 -0500")
Message-ID: <873597hqef.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Fri, Dec 09, 2022 at 02:47:57PM +0100, Markus Armbruster wrote:
>> Back in 2016, we discussed[1] rules for headers, and these were
>> generally liked:
>> 
>> 1. Have a carefully curated header that's included everywhere first.  We
>>    got that already thanks to Peter: osdep.h.
>> 
>> 2. Headers should normally include everything they need beyond osdep.h.
>>    If exceptions are needed for some reason, they must be documented in
>>    the header.  If all that's needed from a header is typedefs, put
>>    those into qemu/typedefs.h instead of including the header.
>> 
>> 3. Cyclic inclusion is forbidden.
>
> Looks like this breaks fuzzer build:
>
> https://gitlab.com/mstredhat/qemu/-/jobs/3506121308

Will be fixed in v2, thanks!


