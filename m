Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F95372DD0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:14:13 +0200 (CEST)
Received: from localhost ([::1]:47998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldxga-0004ir-1o
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ldxZY-00074R-9B
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:07:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ldxZT-00026U-LG
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620144410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GVIxTT9uSFfUO3j3YO7sGQ1PTKDOjdIH+lYA0YgyIyA=;
 b=BxnBGHu9OwRFEI4sp+1zLHZfWkNG3kMjJY4DdkCrDEl5RCpxFBdZsVWXrQwY2MWlad1JFo
 B8m+yawYeniPPCK0A2rz3cIK4rq1luPQKR09vsUshr7gdgxJck+aBcNqSqf0yWxxLkDrn6
 aUNcahRDmwxPFoK7UXkAm/1xx869NL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-I7M62cUEMh-U8VfpQ2FvKw-1; Tue, 04 May 2021 12:06:46 -0400
X-MC-Unique: I7M62cUEMh-U8VfpQ2FvKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF23E107ACCA;
 Tue,  4 May 2021 16:06:44 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-126.ams2.redhat.com
 [10.36.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C81219C71;
 Tue,  4 May 2021 16:06:39 +0000 (UTC)
Date: Tue, 4 May 2021 18:06:36 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] vfio/pci: Revert nvlink removal uAPI breakage
Message-ID: <20210504180636.6251eaf1.cohuck@redhat.com>
In-Reply-To: <162014341432.3807030.11054087109120670135.stgit@omen>
References: <162014341432.3807030.11054087109120670135.stgit@omen>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, groug@kaod.org, qemu-ppc@nongnu.org,
 daniel@ffwll.ch, linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 04 May 2021 09:52:02 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> Revert the uAPI changes from the below commit with notice that these
> regions and capabilities are no longer provided.
> 
> Fixes: b392a1989170 ("vfio/pci: remove vfio_pci_nvlink2")
> Reported-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
> 
> Greg (Kurz), please double check this resolves the issue.  Thanks!
> 
>  include/uapi/linux/vfio.h |   46 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 4 deletions(-)

I had already hacked up a QEMU patch that moved the definitions into
local headers, but this one is less of a hassle. (Code compiles fine
after doing a headers update.)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


