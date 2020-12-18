Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B3C2DE6F5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:52:58 +0100 (CET)
Received: from localhost ([::1]:56032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqI3t-0003GR-CR
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:52:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kqI26-0002MJ-DG
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:51:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kqI1y-0001oY-Uk
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608306657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4/XyA1ya/EaJMFtds9x9DEfr6nx1zRFSvosS3MnUYA=;
 b=d6lRg+9WC7Lc8+AANBq2oKvsYHy9bdv/erLbUAn2aiG8QEecSUCpWzdmXI13WscwgZP3Ks
 8R2v2rJkzVqRjgdUI7n4CyInBOrV/94N5fDaz7grpi5FM/InUBboADvqlsM1FgEmI3a9Pw
 89oDhC/123xEXDq8FWRi4skgQ9yOvxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-0RHqb4zTMtKiEvsIWCRkhw-1; Fri, 18 Dec 2020 10:50:53 -0500
X-MC-Unique: 0RHqb4zTMtKiEvsIWCRkhw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39C79192AB7A;
 Fri, 18 Dec 2020 15:50:52 +0000 (UTC)
Received: from gondolin (ovpn-113-130.ams2.redhat.com [10.36.113.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EDAE27CA3;
 Fri, 18 Dec 2020 15:50:45 +0000 (UTC)
Date: Fri, 18 Dec 2020 16:50:42 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] vfio: Fix vfio_listener_log_sync function name typo
Message-ID: <20201218165042.59b972c9.cohuck@redhat.com>
In-Reply-To: <20201204014240.772-1-yuzenghui@huawei.com>
References: <20201204014240.772-1-yuzenghui@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: wanghaibin.wang@huawei.com, alex.williamson@redhat.com,
 kwankhede@nvidia.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Dec 2020 09:42:40 +0800
Zenghui Yu <yuzenghui@huawei.com> wrote:

> There is an obvious typo in the function name of the .log_sync() callback.
> Spell it correctly.
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  hw/vfio/common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


