Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C5222A957
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 09:07:23 +0200 (CEST)
Received: from localhost ([::1]:45554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyVK6-0007UJ-8M
	for lists+qemu-devel@lfdr.de; Thu, 23 Jul 2020 03:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jyVJO-00073L-Eg
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 03:06:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49936
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jyVJM-0004xw-LA
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 03:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595487995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AwCLTDz9zClWoSY7z987kzcnnvdlwO70KYjMLoA0TWE=;
 b=WkCCm5t9QpWPp3ZBrvU5yg0xaWXnJ5Nr8dlXYq7eh6ivzfu3rxo6B2asvWDoblLX16L3Qb
 oxtXUW9hi/EYR/qadznaowvtxhlbsEyAEAdME+tkgxQAIcx54q8d15r+tvLdvn5thl2mbk
 pCASQd8lxJSYmd3E7DhOG+U/vM7fiZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-ZHjeGevCPEqUGw7Ta2B-YQ-1; Thu, 23 Jul 2020 03:06:31 -0400
X-MC-Unique: ZHjeGevCPEqUGw7Ta2B-YQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C15E819057A0;
 Thu, 23 Jul 2020 07:06:30 +0000 (UTC)
Received: from gondolin (ovpn-112-228.ams2.redhat.com [10.36.112.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12B0B71D28;
 Thu, 23 Jul 2020 07:06:25 +0000 (UTC)
Date: Thu, 23 Jul 2020 09:06:23 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] virtio: Drop broken and superfluous
 object_property_set_link()
Message-ID: <20200723090623.111d0175.cohuck@redhat.com>
In-Reply-To: <20200721121153.1128844-1-armbru@redhat.com>
References: <20200721121153.1128844-1-armbru@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/23 02:33:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, frederic.konrad@adacore.com,
 arei.gonglei@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Jul 2020 14:11:53 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> virtio_crypto_pci_realize() and copies the value of vcrypto->vdev's
> property "cryptodev" to vcrypto's property:
> 
>     object_property_set_link(OBJECT(vrng), "rng", OBJECT(vrng->vdev.conf.rng),
>                              NULL);
> 
> Since it does so only after realize, this always fails, but the error
> is ignored.
> 
> It's actually superfluous: vcrypto's property is an alias of
> vcrypto->vdev's property, created by virtio_instance_init_common().
> 
> Drop the call.
> 
> Same for virtio_ccw_crypto_realize(), virtio_rng_pci_realize(),
> virtio_ccw_rng_realize().
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/s390x/virtio-ccw-crypto.c  | 3 ---
>  hw/s390x/virtio-ccw-rng.c     | 3 ---
>  hw/virtio/virtio-crypto-pci.c | 2 --
>  hw/virtio/virtio-rng-pci.c    | 3 ---
>  4 files changed, 11 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


