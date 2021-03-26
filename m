Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD4834A351
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 09:42:22 +0100 (CET)
Received: from localhost ([::1]:37496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPi2v-00027J-E9
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 04:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPi1Y-0001aA-Qh
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:40:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPi1X-0000Kj-C6
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:40:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616748054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KX1Qdj6lfV9f0j5LS7skj6XEqwUpAgxbonb4TjBUkmY=;
 b=JnawWdVq4bOklUlDAZRti28B6/jOgt55DUQxEzoSNSRQEifDBG602sXFLVJfwl+lQcfLjX
 g/RGI1oBgU2vhdRENyTxu/If/jrZUHZNGVCRht4jcm9/S61C+KorqSh6R4Lisq+Uov7KTC
 Ox1hZB/Inykm7+MVxSzo1v4Ynwi+sK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-BHtet9UsOfKPJtCbyDfliw-1; Fri, 26 Mar 2021 04:40:52 -0400
X-MC-Unique: BHtet9UsOfKPJtCbyDfliw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8F9318C43C1;
 Fri, 26 Mar 2021 08:40:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-102.ams2.redhat.com
 [10.36.112.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32A6763632;
 Fri, 26 Mar 2021 08:40:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 943D51800385; Fri, 26 Mar 2021 09:40:42 +0100 (CET)
Date: Fri, 26 Mar 2021 09:40:42 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 0/3] s390x: modularize virtio-gpu-ccw
Message-ID: <20210326084042.3kxm5pdwjedkq4yx@sirius.home.kraxel.org>
References: <20210317095622.2839895-1-kraxel@redhat.com>
 <20210322141248.031f7538.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210322141248.031f7538.pasic@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Compared to Daniels suggestion, I find that one conceptually clearer,
> and even more flexible. Implementation-wise I find this patch-set
> simpler.

Given we are in fixes-only mode I think we should go for the simple
solution.  Should be easy enough to revert in case we want replace
this with something else after the 6.0 release.

> Reviewed-by: Halil Pasic <pasic@linux.ibm.com>
> Tested-by: Halil Pasic <pasic@linux.ibm.com>

Added & queued.
CI running, pull req later today when all goes well.

thanks,
  Gerd


