Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ACA3D2FD0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 00:26:31 +0200 (CEST)
Received: from localhost ([::1]:57068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6h9C-0000LN-8S
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 18:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m6h81-0007rm-NI
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 18:25:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m6h7y-0007Lg-5M
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 18:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626992712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HeMzknASkr8oBUVFcEA6sdKfPv/8/FwTZpec4GIrEbs=;
 b=WJ0KK5Vwhs1DsuKcTn358qpIGDvhor0H86NbIMzURzns0PWziuPLgSIquNQ3ful5ryk2yN
 PtDH5SGo/s98JsU3Kp20z5YPE7zdggLd6WVdb68MjmAtLk/JBmsdzmHqDQh3nNMDhSlku8
 URFTX+a7MuXLBiFwGu4Mwn03nWpoeAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-877W0cDFOfuPzFJfv9dPUg-1; Thu, 22 Jul 2021 18:25:10 -0400
X-MC-Unique: 877W0cDFOfuPzFJfv9dPUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B880D1005D57;
 Thu, 22 Jul 2021 22:25:08 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org
 (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB84510016F2;
 Thu, 22 Jul 2021 22:25:03 +0000 (UTC)
References: <20210722154326.1464-1-wangyanan55@huawei.com>
 <20210722154326.1464-2-wangyanan55@huawei.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.1 v2] machine: Disallow specifying topology
 parameters as zero
In-reply-to: <20210722154326.1464-2-wangyanan55@huawei.com>
Date: Thu, 22 Jul 2021 18:25:02 -0400
Message-ID: <874kcm0ywx.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Yanan Wang writes:

> In the SMP configuration, we should either specify a topology
> parameter with a reasonable value (equal to or greater than 1)
> or just leave it omitted and QEMU will calculate its value.
> Configurations which explicitly specify the topology parameters
> as zero like "sockets=0" are meaningless, so disallow them.
>
> However, the commit 1e63fe685804d
> (machine: pass QAPI struct to mc->smp_parse) has documented that
> '0' has the same semantics as omitting a parameter in the qapi
> comment for SMPConfiguration. So this patch fixes the doc and
> also adds the corresponding sanity check in the smp parsers.
>
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 14 ++++++++++++++
>  qapi/machine.json |  6 +++---
>  qemu-options.hx   | 12 +++++++-----
>  3 files changed, 24 insertions(+), 8 deletions(-)

Hi Yanan,

This looks somewhat similar to this very old patch of mine:

   https://mail.gnu.org/archive/html/qemu-devel/2020-10/msg03039.html

I'm putting a reference here because I believe the test can be salvaged
and slightly adapted for this patch of yours.

Let me know if I can help anyhow.

Thanks,
- Cleber.


