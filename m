Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5107542C694
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 18:42:33 +0200 (CEST)
Received: from localhost ([::1]:52010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mahKq-0006gt-FU
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 12:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mahJV-0005O6-Oj
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:41:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mahJS-0000aY-N1
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634143265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L74XVZ6EsqEVw7pwre2Z22fwnaN4LOFqkEjNsy242Hs=;
 b=Ow4su7/xsf/ekgbZlvc5iMng920C2Elc4esrFhwf7Fg/vGWrB5RSGU7Ps9bm1z53hPd6Kr
 1JHOc6PN1R5zrulOpb4yzJbLLnpn8X4j1fsUJA62bOgmMIgrFnYQ7UMjaw6+MNvU3/lv3n
 sM/V7z3p6p0a6a13/e5RuJGIvRtTvGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-YbMOklTcP7evF0ktRAPSYA-1; Wed, 13 Oct 2021 12:41:02 -0400
X-MC-Unique: YbMOklTcP7evF0ktRAPSYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC3AF18125C5;
 Wed, 13 Oct 2021 16:41:00 +0000 (UTC)
Received: from localhost (unknown [10.39.193.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7B7419D9B;
 Wed, 13 Oct 2021 16:40:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 mst@redhat.com, peter.maydell@linaro.org
Subject: Re: [PATCH v2 2/2] virtio-iommu: Drop base_name and change
 generic_name
In-Reply-To: <20211013152827.764566-3-eric.auger@redhat.com>
Organization: Red Hat GmbH
References: <20211013152827.764566-1-eric.auger@redhat.com>
 <20211013152827.764566-3-eric.auger@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 13 Oct 2021 18:40:29 +0200
Message-ID: <87tuhkvpxe.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: jean-philippe@linaro.org, abologna@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13 2021, Eric Auger <eric.auger@redhat.com> wrote:

> Drop base_name and turn generic_name into
> "virtio-iommu-pci". This is more in line with
> more in line with other modern-only devices

Duplicate "more in line with".

>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/virtio/virtio-iommu-pci.c     | 3 +--
>  include/hw/virtio/virtio-iommu.h | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


