Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53143DB684
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 11:58:15 +0200 (CEST)
Received: from localhost ([::1]:57592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9PHT-0001qy-0O
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 05:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m9PGY-0001AS-2N
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 05:57:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m9PGW-0001St-J0
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 05:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627639035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ng/+TXyvq2/6MlN3Ag74onamwQ1cwZ5+TNiCF3Va0dI=;
 b=VUyscHl611M+wopy22m0kjqDFyChzjp5J3hAp6r1T/1MxM2IngkxmZXW/aIUx8JMynH9O0
 acKA5KrbSTOEhEOWRMNC8XGieQia9L8602dit+idn211Luisfn87aqIOZPiU4URZbDbnqW
 ziVnx0pmrxEoZ8OLWbf5+NWqYik9MHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-F8Ca8lmkMpKCTnp2J4nIqQ-1; Fri, 30 Jul 2021 05:57:14 -0400
X-MC-Unique: F8Ca8lmkMpKCTnp2J4nIqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F2C68799E0;
 Fri, 30 Jul 2021 09:57:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61AD25D6AB;
 Fri, 30 Jul 2021 09:57:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B90D21800905; Fri, 30 Jul 2021 11:57:07 +0200 (CEST)
Date: Fri, 30 Jul 2021 11:57:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: Re: [PATCH v2 5/8] virtio-gpu: Resource UUID
Message-ID: <20210730095707.q4rjjuwjikb32xxt@sirius.home.kraxel.org>
References: <20210728134634.2142156-1-antonio.caggiano@collabora.com>
 <20210728134634.2142156-6-antonio.caggiano@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20210728134634.2142156-6-antonio.caggiano@collabora.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 28, 2021 at 03:46:31PM +0200, Antonio Caggiano wrote:
> Enable resource UUID feature and implement command resource assign UUID.
> For the moment, use the resource ID as UUID.

No, please do that properly right from start.

Needs a uuid -> resource-id table or hash in qemu.  Alternatively have
virglrenderer manage uuids too (which then probably needs some api
changes).  Not sure which is better, also depends on how you are going
to use that (i.e. who will lookup resources by uuid).

take care,
  Gerd


