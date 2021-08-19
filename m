Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D053F186D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 13:44:19 +0200 (CEST)
Received: from localhost ([::1]:42010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGgT3-0002hN-VA
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 07:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mGgRC-0001dG-Tj
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 07:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mGgR9-0000SQ-C8
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 07:42:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629373336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MZJHGyFLvm2zDEtbwtJH15qYj71owf9ebjWX0aiUsKk=;
 b=dvE69dJdwDOgvQsBHERAd1UNs1xcM8DCwMnUhMUjYa3PLBLd6NtBbVu5igzhDHdeGzyJcD
 ow1S7YXYAdyRVSSz8hSKlgQvghh7nFcWTQ4nNZocuOfq8L8B3JXn7tZRtJ3tw2+qa3j48N
 7QSRJ5KaBNsc9scf+z7NJlluulp0kb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-9iPo_ZP-Mrasmj0AQjjLIQ-1; Thu, 19 Aug 2021 07:42:15 -0400
X-MC-Unique: 9iPo_ZP-Mrasmj0AQjjLIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 891A9100A608;
 Thu, 19 Aug 2021 11:42:13 +0000 (UTC)
Received: from localhost (unknown [10.39.192.140])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6327510016FB;
 Thu, 19 Aug 2021 11:42:07 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 02/16] machine: Deprecate "parameter=0" SMP
 configurations
In-Reply-To: <20210819031027.41104-3-wangyanan55@huawei.com>
Organization: Red Hat GmbH
References: <20210819031027.41104-1-wangyanan55@huawei.com>
 <20210819031027.41104-3-wangyanan55@huawei.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Thu, 19 Aug 2021 13:42:06 +0200
Message-ID: <878s0xsltd.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 19 2021, Yanan Wang <wangyanan55@huawei.com> wrote:

> In the SMP configuration, we should either provide a topology
> parameter with a reasonable value (greater than zero) or just
> omit it and QEMU will compute the missing value.
>
> The users shouldn't provide a configuration with any parameter
> of it specified as zero (e.g. -smp 8,sockets=0) which could
> possibly cause unexpected results in the -smp parsing. So we
> deprecate this kind of configurations since 6.2 by adding the
> explicit sanity check.
>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  docs/about/deprecated.rst | 15 +++++++++++++++
>  hw/core/machine.c         | 14 ++++++++++++++
>  qapi/machine.json         |  2 +-
>  qemu-options.hx           | 12 +++++++-----
>  4 files changed, 37 insertions(+), 6 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


