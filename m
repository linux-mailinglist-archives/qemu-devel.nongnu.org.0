Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7803D1DF3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 08:03:25 +0200 (CEST)
Received: from localhost ([::1]:55746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Rnn-0006dC-OA
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 02:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m6Rmt-0005uy-Lo
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 02:02:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m6Rmq-0001B7-PB
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 02:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626933741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HbhvOXgBBkAgVtfp4Wg8I9LzcI/aApWWYeEuf2+NqSs=;
 b=IgvFMz/QIrEfpXvwDZGX+ueG8rHHzXFn+BpqpM186eSgbz4eN2DYaai2T22OynPFguVqk7
 vE51JWa0vRppSSpUyakV8nwxHqFdkIfZ7XbeesKqGbrkNogJjFk7AbMCz9svpatquOpqe6
 9voWl+B6COzWAid9rNGBiHXJdhI7Mbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-jLqMq-ydOqyjGTzJYZ_ilw-1; Thu, 22 Jul 2021 02:02:20 -0400
X-MC-Unique: jLqMq-ydOqyjGTzJYZ_ilw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF2AA107ACF5;
 Thu, 22 Jul 2021 06:02:18 +0000 (UTC)
Received: from localhost (ovpn-112-132.ams2.redhat.com [10.36.112.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E6D660FB8;
 Thu, 22 Jul 2021 06:02:17 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH for-6.1 0/1] machine: Disallow specifying topology
 parameters as zero
In-Reply-To: <20210722021512.2600-1-wangyanan55@huawei.com>
Organization: Red Hat GmbH
References: <20210722021512.2600-1-wangyanan55@huawei.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Thu, 22 Jul 2021 08:02:16 +0200
Message-ID: <87y29y7uon.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Danie?= =?utf-8?Q?l_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22 2021, Yanan Wang <wangyanan55@huawei.com> wrote:

> In the SMP configuration, we should either specify a topology
> parameter with a reasonable value (equal to or greater than 1)
> or just leave it omitted and QEMU will calculate its value.
> Configurations which explicitly specify the topology parameters
> as zero like "sockets=0" are meaningless, so disallow them.
>
> However; the commit 1e63fe685804d
> (machine: pass QAPI struct to mc->smp_parse) has documented that
> '0' has the same semantics as omitting a parameter in the qapi
> comment for SMPConfiguration. So this patch fixes the doc and
> also adds the corresponding sanity check in the smp parsers.

Are we expecting any real users to have used that 'parameter=0'
behaviour? I expect that libvirt and other management software already
did the right thing; unfortunately, sometimes weird configuration lines
tend to persist in search results.

>
> This patch originly comes form [1], and it was suggested that
> this patch fixing the doc should be sent for 6.1 to avoid a
> deprecation process in the future.
>
> [1] https://lore.kernel.org/qemu-devel/YPWsThPiZa3mF+zp@redhat.com/
>
> Yanan Wang (1):
>   machine: Disallow specifying topology parameters as zero
>
>  hw/core/machine.c | 30 ++++++++++++++++++++++--------
>  hw/i386/pc.c      | 33 ++++++++++++++++++++++++---------
>  qapi/machine.json |  6 +++---
>  3 files changed; 49 insertions(+); 20 deletions(-)


