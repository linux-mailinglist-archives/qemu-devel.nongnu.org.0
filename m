Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760523F1AEE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:52:24 +0200 (CEST)
Received: from localhost ([::1]:37178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGiT1-0007NC-Ix
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mGiRJ-0006cP-Gq
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:50:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mGiRG-0004tZ-MA
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629381032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LIpi9Y77nNfaDyv+BVh4TqnotHBEYZmRf5dLJBUrE6Y=;
 b=GKIbkDq6xzDNOOeqoVa9bhR7LReKsNf4PDftYHZ4wVHtd1FqUD76iP5W/Ta6RLwvhZkAtZ
 ZtgIL1Vc+7Zyu1zbjKGKb6mq+ryK6sTNMQFvKw3PaW7yqfEJ9cMrqoPqygVGtHuHu2CO6E
 lnZmmpc3KH7ZALv/hx3+hdlkg0nszy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-cF5fd92SPsae4jr_L8Rl5A-1; Thu, 19 Aug 2021 09:50:29 -0400
X-MC-Unique: cF5fd92SPsae4jr_L8Rl5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A770C73A4;
 Thu, 19 Aug 2021 13:50:27 +0000 (UTC)
Received: from localhost (unknown [10.39.192.140])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0403E60938;
 Thu, 19 Aug 2021 13:50:22 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH,updated 1/2] docs/about/removed-features: Remove
 duplicated doc about -smp
In-Reply-To: <20210819133927.45540-1-wangyanan55@huawei.com>
Organization: Red Hat GmbH
References: <20210819031027.41104-2-wangyanan55@huawei.com>
 <20210819133927.45540-1-wangyanan55@huawei.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Thu, 19 Aug 2021 15:50:21 +0200
Message-ID: <875yw1sfvm.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

> There are two places describing the same thing about deprecation
> of invalid topologies of -smp CLI, so remove the duplicated one.
>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  docs/about/removed-features.rst | 13 -------------
>  1 file changed, 13 deletions(-)

I think we can merge this independently of the main series.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


